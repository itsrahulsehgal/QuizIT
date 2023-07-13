const express = require('express');
const dotenv = require('dotenv');
dotenv.config();
const cors = require('cors');
const connectDB = require('./configure/db');
const path = require('path');

const app = express();

// Init middleware
app.use(express.json({ limit: '30mb', extended: true }));
app.use(express.urlencoded({ limit: '30mb', extended: true }));
app.use(cors());

// connect database
connectDB();

app.get('/api', (req, res) => {
  res.send('Welcome To mantha');
});

//// define routes
app.use('/api/users', require('./routes/api/users'));
app.use('/api/auth', require('./routes/api/auth'));
app.use('/api/classrooms', require('./routes/api/classrooms'));
app.use('/api/tests', require('./routes/api/tests'));

if (process.env.NODE_ENV === 'production') {
  // Set static folder
  app.use(express.static('client/build'));

  app.get('*', (req, res) => {
    res.sendFile(path.resolve(__dirname, 'client', 'build', 'index.html'));
  });
}

//
const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server is running at ${port}`));