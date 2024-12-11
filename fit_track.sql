create database Fit_Track;
use Fit_Track;

create table members(
memberId int(11) primary key,
fisrtName varchar(50),
lastName varchar(50),
gender enum ('Male', 'Female', 'Other'),
dateOfBirth date,
phoneNumber varchar(15),
email varchar(100),
appointmentId int(11)
);

create table memberships(
membershipId int(11) primary key,
roomId int(11),
startDate date,
memberId int(11)
);

create table rooms(
roomId int primary key,
roomNumber varchar(10),
roomType enum ('Cardio', 'Weigts', 'Studio'),
capacity int(11),
membershipId int(11)
);

create table appointments(
appointmentId int (11) primary key,
appointmentDate date,
appointementtime time,
trainerId int(11),
memberId int(11)
);

create table workout_plans(
planId int (11) primary key,
memberId int(11),
trainerId int(11),
instructions varchar(255)
);

create table trainers(
trainerId int(11) primary key,
fisrtName varchar(50),
lastName varchar(50),
specialization varchar(50),
departmentId int(11),
appointmentId int(11)
);

create table departments(
departmentId int(11) primary key,
departmentName varchar(50),
location varchar(100),
trainerId int(11)
);

alter table members
modify column memberId int(11) DEFAULT 1;

alter table members
modify column memberId int(11) auto_increment;

insert into members (firstName, lastName, gender, dateOfBirth, phoneNumber)
values ("Alex", "Johnson", 1, "1990-07-15", "1234567890");


select * from members;
select * from appointments;
select * from departments;
select * from memberships;
select * from rooms;
select * from trainers;
select * from workout_plans;

alter table departments
modify column departmentId int(11) DEFAULT 1;

alter table departments
modify column departmentId int(11) auto_increment;

insert into departments (departmentName, location)
values ("Cardio", "2er etage");

select departmentName, location from departments;

alter table appointments
modify column appointmentId int(11) DEFAULT 1;

alter table appointments
modify column appointmentId int(11) auto_increment;


alter table memberships
modify column membershipId int(11) DEFAULT 1;


alter table trainers
modify column trainerId int(11) DEFAULT 1;

alter table trainers
modify column trainerId int(11) auto_increment;

alter table workout_plans
modify column planId int(11) DEFAULT 1;

alter table workout_plans
modify column planId int(11) auto_increment;

alter table members
add unique (phoneNumber);

alter table members
add unique (email);

insert into members (firstName, lastName, gender, dateOfBirth, phoneNumber, email)
values ('Alice', 'Smith', 'Female', '1990-05-15', '0612345678', 'alice.smith@example.com'),
		('John', 'Doe', 'Male', '1985-08-20', '0698765432', 'john.doe@example.com'),
        ('Sam', 'Taylor', 'Other', '1992-12-01', '0600500000', 'sam.taylor@example.com'),
        ('Sam', 'John', 'Male', '1999-12-01', '0677000000', 'sam.john@example.com'),
        ('Samir', 'Abassi', 'Male', '2005-12-01', '0600000045', 'samir@example.com'),
        ('Samira', 'Abassi', 'Female', '2010-12-01', '0654857896', 'samira.@example.com');

select * from members;

insert into members (firstName, lastName, gender, dateOfBirth, phoneNumber, email)
values ('Alice', 'Smith', 'Female', '1990-05-15', '0612345678', 'alice.smith@example.com'); -- testing unique constraint: working fine

alter table memberships
add constraint FK_memberid
foreign key (memberId)
references members(memberId);

alter table memberships
add constraint FK_roomId
foreign key (roomId)
references rooms(roomId);

alter table appointments
add constraint FK_appt_memberid
foreign key (memberId)
references members(memberId);

alter table appointments
add constraint FK_appt_trainerid
foreign key (trainerId)
references trainers(trainerId);

alter table departments
add constraint FK_dept_trainerid
foreign key (trainerId)
references trainers(trainerId);

alter table trainers
add constraint FK_trn_departmentid
foreign key (departmentId)
references departments(departmentId);

alter table trainers
add constraint FK_trn_appointmentid
foreign key (appointmentId)
references appointments(appointmentId);

alter table workout_plans
add constraint FK_wrkout_memberid
foreign key (memberId)
references members(memberId);

alter table workout_plans
add constraint FK_wrkout_trainerid
foreign key (trainerId)
references trainers(trainerId);

alter table rooms
add constraint FK_rom_membershipIdid
foreign key (membershipId)
references memberships(membershipId);

insert into memberships (membershipId, startDate, memberId)
values (1, "2024-01-01", 1),
		(2, "2024-01-05", 2),
		(3, "2024-01-10", 3),
		(4, "2024-02-04", 4),
		(5, "2024-02-25", 5),
		(6, "2024-05-6", 6),
		(7, "2024-06-11", 7);

select * from memberships;
select * from members;


alter table rooms
add constraint chk_rom_capacity check (capacity >= 0 and capacity <= 50);


insert into rooms (roomId, roomNumber, roomType, capacity, membershipId)
values
(101, 'A101', 1, 20, 1),
(102, 'B202', 2, 15, 2),
(103, 'C303', 3, 50, 3);

insert into rooms (roomId, roomNumber, roomType, capacity, membershipId)
values
(104, 'A101', 1, 200, 1);		-- check if constraint chk_rom_capacity check (capacity >= 0 and capacity <= 50) works: works fine

select * from rooms;

alter table trainers
rename column fisrtName to firstName;

insert into trainers (trainerId, firstName, lastName, specialization, departmentId)
values (1, 'Michael', 'Johnson', 'Cardio', 1),
		(2, 'Sarah', 'Williams', 'Weights', 2),
		(3, 'Mohamed', 'Salah', 'Studio', 1);

select * from trainers;


insert into appointments (appointmentId, appointmentDate, appointementtime, trainerId, memberId)
values (1, '2024-01-05', '10:00:00', 1, 1),
		(2, '2024-01-10', '14:00:00', 2, 2),
		(3, '2024-01-15', '09:00:00', 3, 3);

select * from appointments;

insert into departments
values (3, "Yoga", "3eme etage", 2);

update departments
set trainerId = 1
where departmentId = 1;

update departments
set trainerId = 2
where departmentId = 2;
select * from departments;




select * from members
order by dateOfBirth asc;
 

select distinct gender from members;


insert into trainers (trainerId, firstName, lastName, specialization, departmentId)
values (4, 'Kylian', 'Mbappe', 'Cardio', 1),
		(5, 'Cris', 'Ronaldo', 'Weights', 2),
		(6, 'Karim', 'Benzema', 'Studio', 1);

select * from trainers
limit 3;				-- select first 3 trainers

select * from trainers
limit 3, 2;				-- select first 2 trainers aftrer thhird trainer

select * from members
where dateOfBirth > '2000-12-31';

select * from memberships
where startDate between '2024-01-01' and '2024-03-31';


alter table members 
add ageCategory enum('Junior', 'Adulte', 'Senior');

select * from members;

update members
set ageCategory = case
    when timestampdiff(YEAR, dateOfBirth, CURDATE()) <= 18 then 'Junior'
    when timestampdiff(YEAR, dateOfBirth, CURDATE()) between 19 and 60 then 'Adulte'
    else 'Senior'
end;
select * from members;

select * from appointments;

select count(*) as totalAppointments
from appointments;

select departmentId, COUNT(*) as numberOfTrainers
from trainers
group by departmentId;

select avg(timestampdiff(year, dateOfBirth, CURDATE())) as averageAge
from members;

select * from appointments;

select max(appointmentDate) as last_appointment_date,
       max(appointementtime) as last_appointment_time
from appointments;

select roomId, count(membershipId) as total_memberships
from memberships
group by roomId;

select * from members 
where email is null or email = '';

select appointments.appointmentId, appointments.appointmentDate, appointments.appointementtime,
       trainers.firstName as trainer_firstName, trainers.lastName as trainer_lastName,
       members.firstName as member_firstName, members.lastName as member_lastName
from appointments
join trainers on appointments.trainerId = trainers.trainerId
join members on appointments.memberId = members.memberId;

select * from appointments;

delete from appointments
where appointmentDate < '2024-01-10';

update departments
set departmentName = 'Force et Conditionnement'
where departmentName = 'Musculation';
select * from departments;


select gender, count(*)
from members
group by gender
having count(*) >= 2;


alter table memberships
add column endDate date;

update memberships
set endDate = date_add(startDate, interval 6 month);

select * from memberships;

create view active_subscriptions1 as
select memberships.membershipId, memberships.memberId, members.firstName, members.lastName, memberships.startDate, memberships.endDate
from memberships
join members on memberships.memberId = members.memberId
where datediff(current_date, memberships.startdate) >= 0 
and datediff(memberships.endDate, current_date) > 0;










