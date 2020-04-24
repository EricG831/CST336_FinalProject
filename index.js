/* App Configuration */
var express = require('express');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');
var mysql = require('mysql');
var app = express();
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: true}));
app.use(methodOverride('_method'));
app.set('view engine', 'ejs');

/* Configure MySQL DBMS */
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'ericg',
    password: 'ericg',
    database: 'library_db'
});
connection.connect();

/* The handler for the DEFAULT route */
app.get('/', function(req, res){
    var stmt = 'SELECT * FROM FP_books;';
    console.log(stmt);
    var books = null;
    connection.query(stmt, function(error, results){
        if(error) throw error;
        if(results.length) books = results;
        // console.log(books)
        res.render('home', {books: books});
    });
});

// /* The handler for undefined routes */
// app.get('*', function(req, res){
//   console.log("error");
// });



/* Start the application server */
app.listen(process.env.PORT || 3000, function(){
    console.log('Server has been started');
})
