create database ProjectISAD
go

use ProjectISAD
go

--Authors table (tác giả)
create table Authors(
	authorID int IDENTITY(1,1) PRIMARY KEY,
	authorName nvarchar(100),
	birthday date
);
go

--Publisher table(nhà xuất bản)
create table Publishers(
	publisherID int IDENTITY(1,1) PRIMARY KEY,
	publisherName nvarchar(100),
	numPhone int,
	email varchar(100),
	addresses nvarchar(200)
);
go

--Locations table(vị trị trong thư viện)
create table Locations(
	locationID int IDENTITY(1,1) PRIMARY KEY,
	shelf nvarchar(20),
	[description] nvarchar(100)
);
go

create table Books(
	bookID int IDENTITY(1,1) PRIMARY KEY,
	bookName nvarchar(200),
	decrisption nvarchar(2024),
	authorID int,
	quantity int,
	price int,
	publisherID int,
	genre nvarchar(100),
	major nvarchar(100),
	locationID int,
	FOREIGN KEY (authorID) REFERENCES Authors(authorID),
	FOREIGN KEY (publisherID) REFERENCES Publishers(publisherID),
	FOREIGN KEY (locationID) REFERENCES Locations(locationID)
);
go

--Users table
create table Users(
	userID int IDENTITY(1,1) PRIMARY KEY,
	fullName nvarchar(100),
	sex bit,
	birthday date,
	numPhone int,
	email nvarchar(100),
	[address] nvarchar(200),
	isStudent bit, -- Giá trị 1 nếu là sinh viên, 0 nếu là nhân viên
    major nvarchar(100) NULL,
    expiry date NULL,
    isStaff bit, -- Giá trị 1 nếu là nhân viên, 0 nếu là sinh viên
    username nvarchar(50) NULL,
    [password] nvarchar(50) NULL,
    CONSTRAINT chk_isStudent_isStaff CHECK (isStudent + isStaff = 1) -- Đảm bảo chỉ có một giá trị trong isStudent và isStaff
);
go

