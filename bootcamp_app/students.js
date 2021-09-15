const { Pool } = require("pg");

//Pool is a preferred way than Client
const pool = new Pool({
  user: "sharonlee",
  // password: '123',
  host: "localhost",
  database: "bootcampx",
});

// $2 => parameterized query to prevent sql injection.
const queryString = `
SELECT st.id, st.name, c.name as cohort_name
FROM students st
JOIN cohorts c ON st.cohort_id = c.id
WHERE c.name LIKE $1
LIMIT $2; 
`;

//user input from terminal
const input = process.argv.splice(2);
const cohortName = input[0];
const limit = input[1] || 5;
// Store all potentially malicious values in an array.
const values = [`%${cohortName}%`, limit];

pool
  .query(queryString, values)
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(
        `${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`
      );
    });
  })
  .catch((err) => console.error("query error", err.stack));

//INPUT:
//node students.js FEB 2
