print('Start #################################################################');

db = db.getSiblingDB('arex_storage_db');
db.createUser({
  user: "arex",
  pwd: "iLoveArex",
  roles: [
    { role: 'readWrite', db: 'arex_storage_db'}    
   ]
})

db = db.getSiblingDB('fltarexmongodb');
db.createUser({
  user: "arex",
  pwd: "iLoveArex",
  roles: [
    { role: 'readWrite', db: 'fltarexmongodb' }    
   ]
})
