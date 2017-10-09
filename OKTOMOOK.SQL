create table Branch (
	branchNumber int not null,
    branchName varchar(60),
    streetNo int,
    streetName varchar(50),
    branchCity varchar(100),
    branchState varchar(100),
    numberEmployees int,
    primary key (branchNumber)
	);

create table Publisher(
	publishCode int not null,
    publisherName varchar(60) not null,
    publisherCity varchar(60),
    publisherState enum('QLD', 'VIC', 'NSW', 'WA', 'TAS', 'NT', 'SA'),
    primary key (publishCode)
	);

create table Author(
	authorID int auto_increment,
    firstName varchar(60),
    lastName varchar(60),
    primary key (authorID)
	);

create table Book(
	ISBN int(13),
    title varchar(60) not null,
    publisherCode int not null,
    genre enum('Non-Fiction', 'Science Fiction', 'Fantasy', 'Crime', 'Mystery', 'Young Adult', 'Romance', 'General Fiction'),
    retailPrice,
    paperback,
    foreign key (publisherCode) references Publisher(publisherCode)
	);

create table Wrote(
	ISBN int(13) not null,
    authorID int auto_increment,
    sequenceNumber int,
    foreign key (ISBN) references Book(ISBN),
    foreign key (authorID) references Author(authorID)
	);

create table Inventory(
	ISBN int(13),
    branchNumber int not null,
    quantityInStock,
    foreign key branchNumber references Branch(branchNumber),
    foreign key ISBN references Book(ISBN)
	);
