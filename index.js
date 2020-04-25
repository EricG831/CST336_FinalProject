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
        console.log(books)
        res.render('home', {books: books});
    });
});

app.get('/author', function(req, res){
    console.log(req.query.firstname, req.query.lastname);
     var stmt = 'select * from FP_author where firstName=\'' 
                + req.query.firstname + '\' and lastName=\'' 
                + req.query.lastname + '\';';
    console.log(stmt);
    var author = null;
    connection.query(stmt, function(error, results){
        if(error){
            throw error;
        } else if(results.length){      //author is in db
            author = results[0];
            console.log(author);
            res.render('author', {author: author});
        } else {                        //author is not in db - do this as a pop up later
            console.log("Author not found");
            res.render("error");
        }
    });
});

/* The handler for the /author/name/id route */
app.get('/author/:aid', function(req, res){
    var stmt = 'select * from FP_books, FP_author ' +
               'where FP_books.authorId=FP_author.authorId ' + 
               'and FP_books.authorId=' + req.params.aid + ';'
    connection.query(stmt, function(error, results){
        // if(error) throw error;
        // var name = results[0].firstName + ' ' + results[0].lastName;
        // res.render('booksByAuthor', {name: name, books: results});     
        
        if(error){
            throw error;
        } else if(results.length){      //books by author is in db
            var name = results[0].firstName + ' ' + results[0].lastName;
            res.render('booksByAuthor', {name: name, books: results});     
        } else {                        //books by author is not in db - do this as a pop up later
            console.log("No books by author found");
            res.render("error");
        }
    });
});

/* The handler for undefined routes */
app.get('*', function(req, res){
  res.render('error');
});



/* Start the application server */
app.listen(process.env.PORT || 3000, function(){
    console.log('Server has been started');
})
