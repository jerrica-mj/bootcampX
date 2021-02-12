

// When we're using terminal to execute SQL queries, we first have to connect to the database using a client app like psql.
// If we wanted to connect to the bootcampx database, we could enter psql bootcampx into terminal.
// This will connect us to a PostgreSQL database running on localhost port 5432 with the user vagrant.
// We haven't explicitly stated any of those options, but we could:
// psql -h localhost -p 5432 -U vagrant bootcampx


// we can connect to our database without specifying any options:
// const { Pool } = require('pg');

// const pool = new Pool();


// Or we can specify different connection options:
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


// --------------------
// Querying The Database

// SELECT id, name, cohort_id
// FROM students
// LIMIT 5;

// pool.query(`
// SELECT id, name, cohort_id
// FROM students
// LIMIT 5;
// `)
// .then(res => {
//   console.log(res.rows);
// })
// .catch(err => console.error('query error', err.stack));

// Entering this query into psql would give us a small table of results. Our output here is an object that has much more information. If we look through the data for a moment, we can see that the rows property contains an array of the expected results.
// // > Update the query result to log the rows console.log(res.rows);

// It's the same data, the same SQL query, but with one very important difference. When we make the query from our JavaScript application, the results come back as JavaScript objects. That means that once the .then(res => {}) gets executed, we're not dealing with SQL or the database any more, we're just dealing with JavaScript objects.
// // ==> The result is just an array of JavaScript objects.


// Before continuing, add a join to this query to get the cohort name instead of cohort_id.
// pool.query(`
// SELECT students.id as student_id, students.name as name, cohorts.name as cohort
// FROM students
// JOIN cohorts ON cohorts.id = cohort_id
// LIMIT 5;
// `)
// .then(res => {
//   res.rows.forEach(user => {
//     console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
//   })
// });


// ------------------
// Query Parameters

// Let's make our application a little bit more dynamic. We will allow a user to specify a cohort name and the limit. So someone should be able to run the application with the following command:

// node students.js FEB 2

// Adjust your code to implement this new feature.
pool.query(`
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE '%${process.argv[2]}%'
LIMIT ${process.argv[3] || 5};
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
}).catch(err => console.error('query error', err.stack));