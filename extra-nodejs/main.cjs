console.log('hello world')
const MongoClient = require('mongodb').MongoClient;
const url = "mongodb://arex:iLoveArex@10.5.153.1:27017/arex_storage_db";
const appId = 'community-test-0905'
const targetHost = 'http://10.5.153.1:18080'

const client = new MongoClient(url);


async function main() {
  await client.connect();
  const db = client.db();
  console.log('Connected successfully to server');

  // query auto pin cases
  const pinedCases = await db.collection('PinnedServletMocker').find({appId: appId}).project({_id: 1, operationName: 1}).toArray();
  const caseGroupByOp = new Map();
  pinedCases.forEach(item => {
    if (!caseGroupByOp.has(item.operationName)) caseGroupByOp.set(item.operationName, [])
    caseGroupByOp.get(item.operationName).push(item._id)
  })

  // query service operations
  const operations = await db.collection('ServiceOperation').find({appId: appId, operationName: {$in: [...new Set(pinedCases.map((item) => item.operationName))]}}).toArray()
  // console.log(operations);

  const createPlanReq = {
    "appId": "community-test-0905",
    "replayPlanType": 2,
    "targetEnv": targetHost,
    "operator": "AREX",
    "operationCaseInfoList": operations.map(op => ({
        "operationId": op._id.toString(),
        "replayIdList": caseGroupByOp.get(op.operationName)
    }))
  }

  console.log(JSON.stringify(createPlanReq, null, 4))
  return 'done.';
}

main()
  .then(console.log)
  .catch(console.error)
  .finally(() => client.close());