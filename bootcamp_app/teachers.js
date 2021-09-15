const { Pool } = require("pg");

const pool = new Pool({
  user: "sharonlee",
  // password: '123',
  host: "localhost",
  database: "bootcampx",
});

const queryString = `
SELECT DISTINCT t.name as teacher, c.name as cohort
FROM assistance_requests ar
JOIN teachers t ON ar.teacher_id = t.id
JOIN students st ON ar.student_id = st.id
JOIN cohorts c ON st.cohort_id = c.id
WHERE c.name = $1
ORDER BY t.name
`;

//user input from terminal
const input = process.argv.splice(2);
const cohortName = input[0];
const values = [`${cohortName || "JUL02"}`];

pool
  .query(queryString, values)
  .then((res) => {
    res.rows.forEach((row) => {
      console.log(`${row.cohort}: ${row.teacher}`);
    });
  })
  .catch((err) => console.error("query error", err.stack));

// $ node teachers.js JUL02
// connected
// JUL02: Cheyanne Powlowski
// JUL02: Georgiana Fahey
// JUL02: Helmer Rodriguez
// JUL02: Jadyn Bosco
// JUL02: Roberto Towne
// JUL02: Rosalyn Raynor
// JUL02: Talon Gottlieb
// JUL02: Waylon Boehm
