const { Pool } = require("pg");

//Pool is a preferred way than Client
const pool = new Pool({
  user: "sharonlee",
  // password: '123',
  host: "localhost",
  database: "bootcampx",
});

const input = process.argv.splice(2); //user input from terminal
const cohort_name = input[0];
const limit = Number(input[1]);

pool
  .query(
    `
    SELECT st.id, st.name, c.name as cohort_name
    FROM students st
    JOIN cohorts c ON st.cohort_id = c.id
    WHERE c.name LIKE '%${cohort_name}%'
    LIMIT ${limit || 5};
    `
  )
  .then((res) => {
    //console.log(res.rows); // res.rows return an array of objects(row) in the table.

    res.rows.forEach((user) => {
      console.log(
        `${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`
      );
    });
  })
  .catch((err) => console.error("query error", err.stack));

//INPUT:
//node students.js FEB 2
