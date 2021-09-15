const { Pool } = require("pg");

const pool = new Pool({
  user: "sharonlee",
  // password: '123',
  host: "localhost",
  database: "bootcampx",
});

const input = process.argv.splice(2); //user input from terminal
const cohort_name = input[0];

pool
  .query(
    `
  SELECT DISTINCT t.name as teacher, c.name as cohort
  FROM assistance_requests ar
  JOIN teachers t ON ar.teacher_id = t.id
  JOIN students st ON ar.student_id = st.id
  JOIN cohorts c ON st.cohort_id = c.id
  WHERE c.name = '${cohort_name || "JUL02"}'
  ORDER BY t.name
  `
  )
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
