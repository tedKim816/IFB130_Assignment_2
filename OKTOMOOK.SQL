
DROP TABLE IF EXISTS `Branch`;
create table Branch (
	branchNumber int not null,
    branchName varchar(60),
    streetNo int,
    streetName varchar(50),
    branchCity varchar(100),
    branchState varchar(100),
    numberEmployees int,
    primary key (branchNumber)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `Publisher`;
create table Publisher(
	publisherCode int not null,
    publisherName varchar(60) not null,
    publisherCity varchar(60),
    publisherState enum('QLD', 'VIC', 'NSW', 'WA', 'TAS', 'NT', 'SA'),
    primary key (publisherCode)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `Author`;
create table Author(
	authorID int auto_increment,
    firstName varchar(60),
    lastName varchar(60),
    primary key (authorID)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `Book`;
create table Book(
	ISBN int not null,
    title varchar(60) not null,
    publisherCode int not null,
    genre enum('Non-Fiction', 'Science Fiction', 'Fantasy', 'Crime', 'Mystery', 'Young Adult', 'Romance', 'General Fiction'),
    retailPrice int,
    paperback enum('True', 'False'),
    primary key (ISBN),
    foreign key (publisherCode) references Publisher(publisherCode),
    check (ISBN=13)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `Wrote`;
create table Wrote(
	ISBN int not null,
    authorID int,
    sequenceNumber int,
    foreign key (ISBN) references Book(ISBN),
    foreign key (authorID) references Author(authorID),
    check (ISBN=13)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `Inventory`;
create table Inventory(
	ISBN int not null,
    branchNumber int not null,
    quantityInStock int,
    foreign key (branchNumber) references Branch(branchNumber),
    foreign key (ISBN) references Book(ISBN),
	check (ISBN=13)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;
