SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `FP_author`
--
DROP TABLE IF EXISTS `FP_author`;
CREATE TABLE `FP_author` (
  `authorId` mediumint(9) NOT NULL,
  `firstName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `portrait` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `biography` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FP_author`
--

INSERT INTO `FP_author` (`authorId`, `firstName`, `lastName`, `portrait`, `biography`) VALUES
(1, 'Charles', 'Dickens', 'https://cdn.britannica.com/52/75052-050-777F7105/Charles-Dickens.jpg', 'Charles John Huffam Dickens FRSA was an English writer and social critic. He created some of the world best-known fictional characters and is regarded by many as the greatest novelist of the Victorian era.'),
(2, 'J. R. R.', 'Tolkien', 'https://vignette.wikia.nocookie.net/narnia/images/9/93/Tolkien_2.jpg/revision/latest/top-crop/width/360/height/450?cb=20120611180603', 'John Ronald Reuel Tolkien CBE FRSL was an English writer, poet, philologist, and academic. He was the author of the classic high fantasy works The Hobbit and The Lord of the Rings.'),
(3, 'Antoine', 'de Saint-Exupéry', 'https://images.gr-assets.com/authors/1330853515p8/1020792.jpg', 'Antoine Marie Jean-Baptiste Roger, comte de Saint-Exupéry, simply known as de Saint-Exupéry, was a French writer, poet, aristocrat, journalist and pioneering aviator. He became a laureate of several of France highest literary awards and also won the United States National Book Award.'),
(4, 'J. K.', 'Rowling', 'https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5d24fd0d142c500008c8a9c9%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D506%26cropX2%3D1806%26cropY1%3D69%26cropY2%3D1369', 'Joanne Rowling CH, OBE, HonFRSE, FRCPE, FRSL, better known by her pen name J. K. Rowling, is a British author, film producer, television producer, screenwriter, and philanthropist.'),
(5, 'Lewis', 'Carroll', 'https://cdn.britannica.com/s:290x800/34/19534-004-FB384A32/Lewis-Carroll-1863.jpg', 'Charles Lutwidge Dodgson, better known by his pen name Lewis Carroll, was an English writer of childrens fiction, notably Alices Adventures in Wonderland and its sequel Through the Looking-Glass. He was noted for his facility at word play, logic, and fantasy.'),
(6, 'Cao', 'Xueqin', 'https://iztok-zapad.eu/image/cache/catalog/authors/picture_937-200x200.jpg', 'Cáo Xuěqín; was a Chinese writer during the Qing dynasty. He is best known as the author of Dream of the Red Chamber, one of the Four Great Classical Novels of Chinese literature. His given name was Cáo Zhān and his courtesy name was Mèngruǎn.'),
(7, 'Agatha', 'Christie', 'https://www.gstatic.com/tv/thumb/persons/323/323_v9_ba.jpg', 'Dame Agatha Mary Clarissa Christie, Lady Mallowan, DBE was an English writer known for her sixty-six detective novels and fourteen short story collections, particularly those revolving around fictional detectives Hercule Poirot and Miss Marple.'),
(8, 'C. S.', 'Lewis', 'https://upload.wikimedia.org/wikipedia/en/thumb/1/1e/C.s.lewis3.JPG/220px-C.s.lewis3.JPG', 'Clive Staples Lewis was a British writer and lay theologian. He held academic positions in English literature at both Oxford University and Cambridge University.'),
(9, 'Dan', 'Brown', 'https://danbrown.com/wp-content/themes/danbrown/images/db/slideshow/author/db.courter.02.jpg', 'Daniel Gerhard Brown is an American author best known for his thriller novels, including the Robert Langdon novels Angels & Demons, The Da Vinci Code, The Lost Symbol, Inferno and Origin. His novels are treasure hunts that usually take place over a period of 24 hours.' ),
(10, 'Carlo', 'Collodi', 'https://images.gr-assets.com/authors/1259046834p5/15123.jpg', 'Carlo Lorenzini, better known by the pen name Carlo Collodi, was an Italian author, humorist, and journalist, widely known for his fairy tale novel The Adventures of Pinocchio.'),
(11, 'George', 'Orwell', 'https://images.gr-assets.com/authors/1450573063p5/3706.jpg', 'Eric Arthur Blair, better known by his pen name George Orwell, was an English author and journalist.'),
(12, 'Neil', 'Gaiman', 'https://images.gr-assets.com/authors/1234150163p5/1221698.jpg', 'Neil Richard MacKinnon Gaiman is an English author of short fiction, novels, comic books, graphic novels, nonfiction, audio theatre, and films.'),
(13, 'James', 'Patterson', 'https://images.gr-assets.com/authors/1468347205p5/3780.jpg', 'James Patterson is the worlds bestselling author and most trusted storyteller.'),
(14, 'Ray', 'Bradbury', 'https://images.gr-assets.com/authors/1445955959p5/1630.jpg', 'Ray Douglas Bradbury, American novelist, short story writer, essayist, playwright, screenwriter and poet, was born August 22, 1920 in Waukegan, Illinois.'),
(15, 'Harper', 'Lee', 'https://images.gr-assets.com/authors/1188820730p5/1825.jpg', 'Harper Lee, known as Nelle, was born in the Alabama town of Monroeville, the youngest of four children of Amasa Coleman Lee and Frances Cunningham Finch Lee.'),
(16, 'Franz', 'Kafka', 'https://images.gr-assets.com/authors/1569196898p5/5223.jpg', 'Franz Kafka was one of the major fiction writers of the 20th century. '),
(17, 'E.B.', 'White', 'https://images.gr-assets.com/authors/1198519412p5/988142.jpg', 'Elwyn Brooks White was a leading American essayist, author, humorist, poet and literary stylist and author of such beloved childrens classics as Charlottes Web, Stuart Little, and The Trumpet of the Swan.'),
(18, 'William', 'Shakespeare', 'https://images.gr-assets.com/authors/1586700347p5/947.jpg', 'William Shakespeare (baptised 26 April 1564) was an English poet and playwright, widely regarded as the greatest writer in the English language and the worlds pre-eminent dramatist.'),
(19, 'Suzanne', 'Collins', 'https://images.gr-assets.com/authors/1530308375p5/153394.jpg', 'Since 1991, Suzanne Collins has been busy writing for childrens television.'),
(20, 'John', 'Green', 'https://images.gr-assets.com/authors/1353452301p5/1406384.jpg', 'John Greens first novel, Looking for Alaska, won the 2006 Michael L. Printz Award presented by the American Library Association.');

-- --------------------------------------------------------

--
-- Table structure for table `FP_user`
--
DROP TABLE IF EXISTS `FP_user`;
CREATE TABLE `FP_user` (
  `userId` mediumint(9) NOT NULL,
  `userName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(72) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FP_user`
--

INSERT INTO `FP_user` (`userId`, `userName`, `password`) VALUES
(1, 'admin', '$2b$10$w8ZRlYCzT0j74bWWZ9sBr.ZZm3q1pItcJEij6K3qdgm4TZCljUXFq'),
(2, 'jane', '$2b$10$QFZ0UjxfTOs41Y4xxCHz6.0WmVEQR0/.2Nv/ypCJQr1Bq0bfd.Vsi'),
(3, 'alice', '$2b$10$Ko66WFnA059MYODO/HMwneq9N3geB2nBZpu5HsDXX5REWvAer7lTm'),
(4, 'bob', '$2b$10$WatkK8uLiaWQPxtqUaqRs.02IY4xavY9E60NthOeqMv0IRSkMHlgi'),
(5, 'jojo', '$2b$10$7/7wxR5wB8WhqidnwvnC6OGiOTOe0uSKb5ZBAJBTzp2cNPVSQkQJy'),
(6, 'koda', '$2b$10$k3rNlPMwrYOKVHEvWZpZI.F6fnpQnPEK8b5eW7dQlcIWvNVgAjWwq'),
(7, 'mac360', '$2b$10$8LjQVIWt9joCh6dzF/uYAuVeP35S4KF5XFXBXoOv4H0Tk9mp01CLi'),
(8, 'Thor', '$2b$10$JhL/3kA5Zhr8IsvVzanifeK3TTpNhovRtn4Ex/IMscmIL3/eisV9u'),
(9, 'User23', '$2b$10$JhL/3kA5Zhr8IsvVzanifeK3TTpNhovRtn4Ex/IMscmIL3/eisV9u'),
(10, 'ericg', '$2b$10$WTRQpIA3drkNno7L4v2okOJ2k4Cjsn7PzfCODR.DwWQtMD5JcaJa.'),
(11, 'yvcruz', '$2b$10$SEGC0AgG/m758/IiTFG9yOorcj5i3HoZvmF/SRDrAOM1ubHNqgVHW'),
(12, 'oliver', '$2b$10$5/YVOZbTLfXjXYexEkZ6rOgapWS.lu.n6KLIYQqjhPG8UAggC2TTi'),
(13, 'liz', '$2b$10$Q69YK5HHbz8zZTBoNNT8eeLepHMdin8wBADPFgEcWPQG/3ukIcPZ2'),
(14, 'dan', '$2b$10$TKctVYHcVznQvpEtuH53p..0sr7RAeMAeleA44fDBjprMx27vr/JW'),
(15, 'sam', '$2b$10$HzHsg6ImKeLN3krAP9Q6AempIEcDB8SCXwqnvLeqkqiZz7BpNM9Dq'),
(16, 'luke', '$2b$10$iwOkxnil0O9txjB/3Hc37uiLAdq80BzJTKuFMg.MZrXty4NwUBsEK'),
(17, 'jbl', '$2b$10$T7MX6HrleJsNRfi6BXohr.INaF3TjuzJMISJ.2ntkWd62sF1Wvy7.'),
(18, 'jake', '$2b$10$s.jqPfu5m2kYI3G2.3c7vOsyNe2BMtyfV1J4izwtpzZOTm1Io3E3u'),
(19, 'usr', '$2b$10$dqzhJGwikcv5VvUzNmKiw.DG.y4te173IEFinULXy5p.odDumRTIe'),
(20, 'abc', '$2b$10$Orb9/J//8bqGRY10OoopBet96aNwA.hAiYFgDat/VpRK7VPB7kN5S');
--
-- passwords for first 20 accounts
-- 1 admin
-- 2 doe
-- 3 alice
-- 4 bob
-- 5 123
-- 6 k@k
-- 7 mc 
-- 8 hammer 
-- 9 llk 
-- 10 ericg
-- 11 yvcruz
-- 12 321
-- 13 turttle
-- 14 iel
-- 15 smith 
-- 16 cage
-- 17 !!!
-- 18 jake
-- 19 pwd
-- 20 123
-- --------------------------------------------------------

--
-- Table structure for table `FP_books`
--

DROP TABLE IF EXISTS `FP_books`;

CREATE TABLE `FP_books` (
  `bookId` mediumint(9) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `authorId` smallint(6) NULL,
  `cover` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(6) DEFAULT NULL,
  `inStock` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FP_books`
--

INSERT INTO `FP_books` (`bookId`, `title`, `authorId`, `cover`, `year`, `inStock`) VALUES
(1, 'A Tale of Two Cities', 1, 
'https://imgix.ranker.com/user_node_img/27/526685/original/a-tale-of-two-cities-books-photo-u2?w=125&h=125&fit=crop&crop=faces&q=60&fm=pjpg', 
1859, 12),
(2, 'The Lord of the Rings', 2, 
'https://imgix.ranker.com/user_node_img/111/2204773/original/the-lord-of-the-rings-books-photo-u2?w=125&h=125&fit=crop&crop=faces&q=60&fm=pjpg', 
1954, 20),
(3, 'Harry Potter and the Philosophers Stone', 4, 
'https://imgix.ranker.com/user_node_img/124/2474553/original/harry-potter-and-the-philosopher-s-stone-books-photo-u1?w=125&h=125&fit=crop&crop=faces&q=60&fm=pjpg', 
1997, 10),
(4, 'The Hobbit', 2, 
'https://imgix.ranker.com/user_node_img/110/2198358/original/the-hobbit-books-photo-u5?w=125&h=125&fit=crop&crop=faces&q=60&fm=pjpg', 
1937, 5),
(5, 'Alices Adventures in Wonderland', 5, 
'https://imgix.ranker.com/user_node_img/980/19593805/original/alice-in-wonderland-photo-u7?w=120&h=120&q=60&fm=pjpg&fit=crop&crop=faces', 
1865, 9),
(6, 'The Little Prince', 3, 
'https://imgix.ranker.com/user_node_img/111/2204218/original/the-little-prince-books-photo-u2?w=125&h=125&fit=crop&crop=faces&q=60&fm=pjpg', 
1943, 13),
(7, 'Dream of the Red Chamber', 6, 
'https://imgix.ranker.com/node_img/45/888783/original/dream-of-the-red-chamber-books-photo-1?w=125&h=125&fit=crop&crop=faces&q=60&fm=pjpg', 
1791, 5),
(8, 'And Then There Were None', 7, 
'https://imgix.ranker.com/user_node_img/3098/61943140/original/61943140-photo-u1?w=120&h=120&q=60&fm=pjpg&fit=crop&crop=faces', 
1939, 3),
(9, 'The Lion, the Witch and the Wardrobe', 8, 
'https://imgix.ranker.com/user_node_img/111/2204085/original/the-lion-the-witch-and-the-wardrobe-books-photo-u1?w=120&h=120&q=60&fm=pjpg&fit=crop&crop=faces', 
1950, 25),
(10, 'The Da Vinci Code', 9, 
'https://imgix.ranker.com/user_node_img/110/2186945/original/the-da-vinci-code-books-photo-u2?w=120&h=120&q=60&fm=pjpg&fit=crop&crop=faces', 
2003, 2),
(11, '1984', 11,
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1532714506l/40961427._SX318_.jpg', 
1949, 1),
(12, 'Norse Mythology', 12,
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1516128292l/37903770._SX318_.jpg', 
2017, 3),
(13, 'Along Came a Spider', 13,
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388272560l/13145.jpg', 
1993, 7),
(14, 'To Kill a Mockingbird', 15,
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1553383690l/2657.jpg', 
1960, 10),
(15, 'Fahrenheit 451', 14,
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1383718290l/13079982.jpg', 
1954, 3),
(16, 'The Metamorphosis', 16,
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1359061917l/485894.jpg', 
1912, 1),
(17, 'Stuart Little', 17,
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1429969863l/24916068.jpg', 
1945, 20),
(18, 'Romeo and Juliet', 18,
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1572098085l/18135._SY475_.jpg', 
1595, 5),
(19, 'The Hunger Games', 19,
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1586722975l/2767052.jpg', 
2008, 11),
(20, 'The Fault in Our Stars', 20,
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1360206420l/11870085.jpg', 
2012, 1);

-- --------------------------------------------------------

--
-- Table structure for table `FP_rental`
--
DROP TABLE IF EXISTS `FP_rental`;
CREATE TABLE `FP_rental` (
  `rentalId` mediumint(9) NOT NULL,
  `userId` mediumint(9) NOT NULL,
  `bookId`  mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- --------------------------------------------------------
-- Indexes for dumped tables
-- --------------------------------------------------------

--
-- Indexes for table `FP_author`
--
ALTER TABLE `FP_author`
  ADD PRIMARY KEY (`authorId`);

--
-- Indexes for table `FP_user`
--
ALTER TABLE `FP_user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `FP_books`
--
ALTER TABLE `FP_books`
  ADD PRIMARY KEY (`bookId`);
  
--
-- Indexes for table `FP_rental`
--
ALTER TABLE `FP_rental`
  ADD PRIMARY KEY (`rentalId`);

---- --------------------------------------------------------
-- AUTO_INCREMENT for dumped tables -------------------------
---- --------------------------------------------------------

--
-- AUTO_INCREMENT for table `FP_author`
--
ALTER TABLE `FP_author`
  MODIFY `authorId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `FP_user`
--
ALTER TABLE `FP_user`
  MODIFY `userId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
  
--
-- AUTO_INCREMENT for table `FP_books`
--
ALTER TABLE `FP_books`
  MODIFY `bookId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
  
--
-- AUTO_INCREMENT for table `FP_rental`
--
ALTER TABLE `FP_rental`
  MODIFY `rentalId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

COMMIT;
