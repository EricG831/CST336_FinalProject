if (process.env.NODE_ENV !== 'production') {
  require('dotenv').config();
}

/* App Configuration */
var express = require('express');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');
var mysql = require('mysql');
var app = express();
var passport = require('passport');
var flash = require('express-flash');
var session = require('express-session');



app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(methodOverride('_method'));
app.set('view engine', 'ejs');
app.use(flash());
app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: true,
  saveUninitialized: true
}));
app.use(passport.initialize());
app.use(passport.session());



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


/* The handler for the /bookByTitle route */
app.get('/title', function(req, res){
    console.log(req.query.title);
     var stmt = 'select * from FP_books where title=\'' 
                + req.query.title + '\';';
    console.log(stmt);
    var book = null;
    connection.query(stmt, function(error, results){
        if(error){
            throw error;
        } else if(results.length){      //book is in db
            book = results[0];
            console.log(book);
            res.render('book', {book: book});
        } else {                        //book is not in db - do this as a pop up later
            console.log("Book not found");
            res.render("error");
        }
    });
});

/* The handler for the /bookByYear route */
app.get('/year', function(req, res){
    console.log(req.query.title);
     var stmt = 'select * from FP_books where year=\'' 
                + req.query.year + '\';';
    console.log(stmt);
    var book = null;
    connection.query(stmt, function(error, results){
        if(error){
            throw error;
        } else if(results.length){      //book is in db
            book = results[0];
            console.log(book);
            res.render('book', {book: book});
        } else {                        //book is not in db - do this as a pop up later
            console.log("Book not found");
            res.render("error");
        }
    });
});


/* The handler for the /author route */
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

/* The handler for the /author/authorId route */
app.get('/author/:aid', function(req, res){
    var stmt = 'select * from FP_books, FP_author ' +
               'where FP_books.authorId=FP_author.authorId ' + 
               'and FP_books.authorId=' + req.params.aid + ';'
    connection.query(stmt, function(error, results){
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

/* The handler for the /checkout//bookId route */
app.get('/checkout/:aid', function(req, res){
    var stmt = 'select * from FP_books, FP_author ' +
               'where FP_books.authorId=FP_author.authorId ' + 
               'and FP_books.bookId=' + req.params.aid + ';'
    connection.query(stmt, function(error, results){
        if(error){
            throw error;
        } else if(results.length){ 
            var name = results[0].firstName + ' ' + results[0].lastName;
            res.render('checkout', {name: name, books: results});     
        } else {                        
            console.log("No books by author found");
            res.render("error");
        }
    });
});

/* The handlers for the login routes */
app.get('/login', function(req, res){
  res.render('login');
});

app.post('/login', function(req, res){

     var stmt = 'select * from FP_books, FP_user where userName=\'' 
                + req.body.username + '\' and password=\'' 
                + req.body.password + '\';';
    console.log(stmt);
    var user = null;
    var books = null;
    connection.query(stmt, function(error, results){
        if(error){
            throw error;
        } else if(results.length){      //user is in db
            // console.log(results);
            user = results[results.length - 1].userName;
            books = results; 
            console.log("USER: " + user);
            console.log("BOOKS: " + books);
            res.render('home',{user: user, books: books});
        } else {                        //user is not in db - do this as a pop up later
            console.log("User not found");
            res.render("error");
        }
    });
});

/* The handlers for the Register routes */
app.get('/register', function(req, res){
  res.render('register');
});

app.post('/register', function(req, res){
  console.log('post register');
});


/* The handler for undefined routes */
app.get('*', function(req, res){
  res.render('error');
});



/* Start the application server */
app.listen(process.env.PORT || 3000, function(){
    console.log('Server has been started');
})
