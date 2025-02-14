// Zadanie 2
db.restaurants.insertOne(
    {
        address: {
            building: "8293",
            coord: [ -73.856077, 40.848447 ],
            street: "Wroclaw University of Science and Technology",
            zipcode: "38716"
        },
        borough: "Wroclaw",
        cuisine: "Polish",
        grades: [
        { "date": { "$date": 1393804800000 }, "grade": "A", "score": 2 },
        { "date": { "$date": 1378857600000 }, "grade": "B", "score": 4 },
        ],
        name: "Student Culture Zone",
        restaurant_id: "0000000"
        }
)
// Zadanie 3
db.restaurants.updateOne({ name: 'Student Culture Zone' },{ $set: {name: 'Student Culture Zone PWR'}})
db.restaurants.find({ name: 'Student Culture Zone PWR'},{name: 1})

//Zadanie 4
db.restaurants.deleteOne({name: 'Student Culture Zone PWR'})

//Zadanie 5
db.restaurants.updateMany({},{ $rename: {name: 'restaurant_name'}})

//Zadanie 6

db.restaurants.updateMany({},
  [
    {
      $set: {
        A_class: {
          $cond: {
            if: { 
              $in: ["A", { $map: { input: "$grades", as: "grade", in: "$$grade.grade" } }] 
            },
            then: true,
            else: false
          }
        }
      }
    }
])

db.restaurants.find({A_class: false},{A_class: 1, grades: 1, _id: 0})
