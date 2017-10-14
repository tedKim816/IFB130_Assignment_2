/* Ji Su Choi - n9678166 */
/* Min Ho Kim - n8051381   */
/* Task1 - Oktomook Book Store Database */

create database if not exists Oktomook;
use Oktomook;

create table Branch (
	branchNumber int not null,
    branchName varchar(60),
    streetNo smallint,
    streetName varchar(50),
    branchCity varchar(60),
    branchState varchar(60),
    numberEmployees int,
    primary key (branchNumber)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table Publisher(
	publisherCode int not null,
    publisherName varchar(60) not null,
    publisherCity varchar(60),
    publisherState enum('QLD', 'VIC', 'NSW', 'WA', 'TAS', 'NT', 'SA'),
    primary key (publisherCode)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table Author(
	authorID int auto_increment,
    firstName varchar(60) not null,
    lastName varchar(60) not null,
    primary key (authorID)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table Book(
	ISBN int not null,
    title varchar(60) not null,
    publisherCode int,
    genre enum('Non-Fiction', 'Science Fiction', 'Fantasy', 'Crime', 'Mystery', 'Young Adult', 'Romance', 'General Fiction'),
    retailPrice double,
    paperback bool,
    constraint checkISBN check(ISBN <= 9999999999999),
    primary key (ISBN),
    foreign key (publisherCode) references Publisher(publisherCode)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table Wrote(
	ISBN int not null,
    authorID int not null,
    sequenceNumber int,
    foreign key (ISBN) references Book(ISBN),
    foreign key (authorID) references Author(authorID)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table Inventory(
	ISBN int not null,
    branchNumber int not null,
    quantityInStock int default 0,
    foreign key (branchNumber) references Branch(branchNumber),
    foreign key (ISBN) references Book(ISBN)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;
