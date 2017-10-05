--
-- Catagory Table
--

INSERT INTO Catagory (name) VALUES ('college'),('library'),('industry'),('hotel'),('zoo'),('museum'),('restaurant'),('mall'),('park');

--
-- State Table
--

INSERT INTO State(name) VALUES ('Queensland'),('New South Wales'),('Victoria'),('Western Australia');

--
-- City Table
--

INSERT INTO City(name, state) VALUES ('Brisbane','Queensland'),('Sydney','New South Wales'),('Melbourne','Victoria'),('Perth','Western Australia');

--
-- Industry Table
--

INSERT INTO Industry(name) VALUES ('Automotive'),('Plastic injection moulding'),('Industrial services'),('Electric doors');

--
-- Department Table
--

INSERT INTO Department(name) VALUES ('Engineering'),('Science'),('Arts'),('Technology');

--
-- Place Table
--

INSERT INTO Place(name, address, email, postcode, phone_number, city_id, catagory_id, industry, department, date) VALUES ('QUT Gardens Point Campus','2 George St, Brisbane','askqut@qut.edu.au',4000,'','Brisbane','college','','Technology','2017-10-05 10:15:43.000000'),('Magic Door Industries Pty LTD','4 Devlan St, Mansfield','sales.qld@mdi.com.au',4122,040983874,'Brisbane','industry','Electric doors','','2017-10-05 10:24:30.000000')

--
-- User Table
--

INSERT INTO user(username, password, first_name, last_name, email) VALUES ('admin','password','Dave','Chow','example@example.com');
--
-- User Profile Table
--

INSERT INTO UserProfile(user, phone_number, address, postcode, role) VALUES ('admin',040637827,'73 Some Rd',4000,'BUSINESSMAN');