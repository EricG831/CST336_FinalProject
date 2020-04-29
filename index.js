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
var async = require('async');

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
    var stmt = 'SELECT * FROM FP_books, FP_author where FP_books.authorId=FP_author.authorId;';
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
app.get('/checkout/:aid', check_auth, function(req, res){
    var stmt = 'select * from FP_books, FP_author ' +
               'where FP_books.authorId=FP_author.authorId ' + 
               'and FP_books.bookId=' + req.params.aid + ';'
    connection.query(stmt, function(error, results){
        if(error){
            throw error;
        } else if(results.length){ 
            var name = results[0].firstName + ' ' + results[0].lastName;
            res.render('checkout', {name: name, books: results, bookId: req.params.aid});     
        } else {                        
            console.log("No books by author found");
            res.render("error");
        }
    });
});

/* The handlers for the login routes */
app.get('/login', function(req, res){
    var loginError = false;
    res.render('login', {loginError: loginError});
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
            user = results[results.length - 1].userName;
            books = results; 
            req.session.login = user;
            res.render('home',{user: user, books: books});
        } else {                        //user is not in db - do this as a pop up later
            console.log("User not found");
            var loginError = true;
            res.render("login", {loginError: loginError});
        }
    });
});

/* The handlers for the Register routes */
app.get('/register', function(req, res){
  res.render('register');
});

// need to implement a way to avoid username duplicates
app.post('/register', function(req, res){
  console.log(req.body);
  connection.query('SELECT COUNT(*) FROM FP_user;', function(error, result){
      if(error) throw error;
      if(result.length){
            var userId = result[0]['COUNT(*)'] + 1;
            var stmt = 'INSERT INTO FP_user ' +
                      '(userId, userName, password) '+
                      'VALUES ' +
                      '(' + 
                      userId + ',"' +
                      req.body.username + '","' +
                      req.body.password + '"' +
                      ');';
            console.log(stmt);
            connection.query(stmt, function(error, result){
                if(error) throw error;
                res.redirect('/login');
            })
      }
  });
});

/* The handlers for the Rental Confirmation routes */
app.post('/rentalConfirmation/:aid', function(req, res){
    var stmt = 'select * from FP_user where userName =\''
                + req.session.login + '\';';
                
    console.log(stmt);
    connection.query(stmt, function(error, results){
        if(error){
            throw error;
        } else if(results.length){      //user is in db
           console.log(results[0].userId);
           var userId = results[0].userId;
           var bookId = req.params.aid;
           console.log(bookId);
           
           connection.query('SELECT COUNT(*) FROM FP_rental;', function(error, result){
              if(error) throw error;
              if(result.length){
                    var rentalId = result[0]['COUNT(*)'] + 1;
                    var stmt = 'INSERT INTO FP_rental ' +
                              '(rentalId, userID, bookId) '+
                              'VALUES ' +
                              '(' + 
                              rentalId + ',"' +
                              userId + '","' +
                              bookId + '"' +
                              ');';
                              
                    //update the stock for the rented book 
                    var updateStock = 'UPDATE FP_books SET inStock=inStock-1  WHERE bookId=\''+ bookId + '\';';
                    connection.query(updateStock, function(error, result){
                        if(error) throw error;
                        if(result.length){
                              console.log("Updated stock");
                        }
                    });
                    
                    //enter the info into to the rentals table
                    console.log(stmt);
                    connection.query(stmt, function(error, result){
                        if(error) throw error;
                        console.log("Rental Success");
                        res.redirect('/');
                    });
              }
            });
        } else {                        //user is not in db - do this as a pop up later
            console.log("User not found");
            var loginError = true;
            res.render("login", {loginError: loginError});
        }
    });
});

/* The handlers for the rentals routes */
app.get('/myRentals', check_auth, function(req, res){
    //pass on the username and all the books that user has rented 
    var username = req.session.login;
    
    //1)retrieve the userId
        //search in db for users with the userID;
    var getUser = 'select * from FP_user where userName =\''
                + username + '\';';
    connection.query(getUser, function(error, result){
      if(error) throw error;
      if(result.length){
            var user = result;
            console.log(user);
            console.log(user[0].userId);
            var userId = user[0].userId;
            //retrieve all bookId's from the rentals table that the user has rented
            var getRentalsFromUser = 'select * from FP_rental where userId =\''
                                   + userId + '\';';
                                   
            console.log(getRentalsFromUser);
            
            var rentedBooks = [];
            
            connection.query(getRentalsFromUser, function(error, result){
                if(error) throw error;
                    
                // make this a function
                // for(let i = 0; i < rentals.length; i++){
                    //     var getRentedBooks = 'select * from FP_books where bookId =\''
                    //                       + rentals[i].bookId + '\';';
                    //     console.log(getRentedBooks);
                    //     connection.query(getRentedBooks, function(error, result){
                    //         if(error) throw error;
                    //         if(result.length){
                    //             console.log(result[0]);
                    //             console.log(result[0].title);
                    //             console.log("Pushing.....");
                    //             rentedBooks.push(result[0]);
                    //             console.log(rentedBooks);
                    //             console.log("pushed");
                    //         }
                    //     });
                    // }
            
                console.log("done");
                res.render('myRentals', {books: rentedBooks, username: username});
            });
      }
    });
   
});


/* Middleware for authentication */
function check_auth(req, res, next) {

  //  if the user isn't logged in, redirect them to a login page
  if(!req.session.login) {
    res.redirect("/login");
    return; 
  }

  //  the user is logged in, so call next()
  next();
}


/* Start the application server */
app.listen(process.env.PORT || 3000, function(){
    console.log('Server has been started');
});
