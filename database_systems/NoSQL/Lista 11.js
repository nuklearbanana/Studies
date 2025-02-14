// Zadanie 2
db.restaurants.find({
    grades: {
      $elemMatch: {
        grade: "A",
        score: 9,
        date: ISODate("2014-08-11T00:00:00Z")
      }
    },
  },
  {
    _id: 1,
    "grades.$": 1
  });
  
// Zadanie 3
db.restaurants.find({},{ _id : 0, name: 1}).sort({ name: 1 });

// Zadanie 4
db.restaurants.find({
    "address.building": { $exists: false }
  },{_id: 1, name : 1});

db.restaurants.find({ "address.building": "" },{_id: 1, name : 1, "address.building": ""})

// Zadanie 5

db.restaurants.find({ name: { $regex: /^Shop/i }},{ name : 1, _id : 0});

// Zadanie 6 
db.restaurants.find({
    name: { $regex: /Shop/i },
    name: { $regex: /Pizza/i }
  },{_id: 0 , name : 1});
  

  
  