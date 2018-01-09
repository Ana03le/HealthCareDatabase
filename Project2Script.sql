/********************************************************
* This script creates the database named HealthCare Database 
*********************************************************/


/*Creating database HealthCare*/
create database HealthCare;
go

/*Use Database HaelthCare*/
use HealthCare;
 go

 /*Creating Table Person*/
create table Person(PersonId int not Null primary key,FirstName varchar(100),
Phone  varchar(10),
Email varchar(100),SSN varchar(10),
Gender varchar(50),Street varchar(50),City varchar(50)
,State varchar(50),ZipCode varchar(10));
alter table Person add  Age int;
alter table Person add  LastName varchar(100);

 /*Adding Table level constraint on Table Person*/
alter table Person with nocheck add check(SSN is not null);

 /*Creating Table Person*/
create table Contract(ContractId int not null primary key,ContractType varchar(100),ContractTerms varchar(100),
Benefits varchar(100),Reviews varchar(100));

 /*Creating Table Job*/
create table Job(JobId int not null primary key,JobTitle varchar(50)
,Salary money,ContractId int);

 /*Adding foreign key constraint on Table Job*/
alter table Job with check add foreign key (ContractId) 
references Contract(ContractId);

 /*Creating Table Department*/
create table Department(DepartmentId int not null primary key,DepartmentName varchar(100));

 /*Creating Table Office*/
create table Office(OfficeId int not null primary key,Building varchar(100),Floor int ,
Phone varchar(10),DepartmentId int not null foreign key references Department(DepartmentId));

 /*Creating Table Employee*/
create table Employee(EmployeeId int not null primary key,
PersonId int not null references Person(PersonId) ,JobId int not null references Job(JobId)
,OfficeId int not null references Office(OfficeId));

 /*Creating Table Medical Device*/
create table MedicalDevice(MedicalDeviceId int not null primary key,
MedicalDeviceName varchar(100));

 /*Creating Table PatientRoomType*/
create table PatientRoomType(RoomTypeId int not null primary key,
Type varchar(100),NumberOfBed int);

 /*Creating Table PatientRoomLocation*/
create table PatientRoomLocation(RoomLocationId int not null primary key,
RoomNumber int,Floor int,Building varchar(100));


/*Creating Table PatientRoom*/
create table PatientRoom(PatientRoomId int not null primary key,
RoomTypeId int not null references PatientRoomType(RoomTypeId),
RoomLocationId int not null references PatientRoomLocation(RoomLocationId),
Status varchar(100),
MedicalDeviceId int not null references MedicalDevice(MedicalDeviceId));


/*Creating Table HealthInsurance*/
create table HealthInsurance(HealthInsuranceId int not null primary key,HealthInsuranceName varchar(100),
InsuranceCompany varchar(100),Phone varchar(10),Coverage money);

/*Creating Table Specialisation*/
create table Specialisation(SpecialisationId int not null primary key,
 SpecialisationName varchar(150));

 /*Creating Table Doctor*/
 create table Doctor(DoctorId int not null primary key, EmployeeId int not null 
 references Employee(EmployeeId),SpecialisationId int not null references Specialisation(SpecialisationId) );

 /*Creating Table Patient*/
create table Patient(PatientId int not null primary key,
PersonId int not null references Person(PersonId),
DoctorId int not null references Doctor(DoctorId),
NurseId int not null references Employee(EmployeeId)
,SpouseName varchar(100),SpousePhone varchar(10),SpouseEmail varchar(100),
PatientRoomId int not null references PatientRoom(PatientRoomId),
HealthInsuranceId int default 0 references HealthInsurance(HealthInsuranceId),
InsuranceStartDate date,InsuranceEndDate date,Admitted datetime not null,
Discharged datetime not null);

/*Creating Table Bill*/
create table Bill(BillId int not null primary key,
PatientId int not null references Patient(PatientId),
Visit int,Items varchar(100),Payer varchar(100),
AmountPaidByPatient money,AmountCoveredInsurance money,
TotalAmount money,PaymentMode varchar(50));

/*Creating Table PatientHealthHistory*/
create table PatientHealthHistory(PatientHealthHistoryId int not null primary key
,PatientId int references Patient(PatientId),Weight int,HeightIncm int,
HeartRate int,BloodPressure int,
Symptoms varchar(500),Diagnostics varchar(500),
ReferralDoctor varchar(50),MedicationInfo varchar(500));


/*Creating Table Visitors*/
create table Visitors(VisitorId int not null primary key,VisitorName varchar(50) ,
Phone varchar(10), ExistTime datetime,EntryTime datetime,
PatientId int not null references Patient(PatientId),SSN varchar(10),check(SSN is not null));


/*Inserting data into table Person*/
insert into Person values 
('1','Ana','3159019084','anagha@gmail,com','7789901342','Female','Columbus','Syracuse','NY','13210',27,'Fatale'),
('2','Ezekiel','3159899084','ezekiel@chui.com','8789901342','Male','Columbus','Syracuse','NY','14210',46,'Chui'),
('3','Willow','3159159084','wkusko@yahoo.com','5589901342','Male','Minto','Rochester','NY','13210',68,'Kusko'),
('4','Bernardo','3159229084','bfigeroa@aol.com','4489961342','Male','Columbus','Syracuse','NY','13210',55,'Figeroa'),
('5','Ammie','3159014584','ammie@corrio.com','7789966712','Female','Columbus','Syracuse','NY','13210',24,'Corrio'),
('6','Francine','3156799084','francine_vocelka@vocelka.com','7784661342','Female','Columbus','Syracuse','NY','13210',27,'Vocelka'),
('7','Ernie','3153679084','ernie_stenseth@aol.com','7781234542','Male','Lancaster','Syracuse','NY','13210',39,'Stenseth'),
('8','Albina','2289019778','albina@glick.com','3322901342','Female','Rosewood','Syracuse','NY','13440',37,'Glick'),
('9','Alishia','3948738684','asergi@gmail.com','6874961342','Female','Columbus','Syracuse','NY','13210',16,'Sergi'),
('10','Solange','3159018800','solange@shinko.com','7785361342','Male','BeechSt','Syracuse','NY','13210',27,'Shinko'),
('11','Jose','3159012847','jose@yahoo.com','6875551342','Male','Marshall','Syracuse','NY','13210',27,'Stockham'),
('12','Rozella','3159012567','rozella.ostrosky@ostrosky.com','2389161342','Female','Clarke','Syracuse','NY','12210',33,'Ostrosky'),
('13','Valentine','3159019084','valentine_gillian@gmail.com','9934761342','Female','Columbus','Syracuse','NY','44210',40,'Gillian'),
('14','Kati','5681919084','kati.rulapaugh@hotmail.com','5874961342','Female','Clarendon','Syracuse','NY','13210',71,'Rulapaugh'),
('15','Youlanda','3159019084','youlanda@aol.com','6874933342','Female','Downtown','Syracuse','NY','15580',50,'Schemmer'),
('16','Dyan','3159017788','doldroyd@aol.com','5794961342','Male','Columbus','waterloo','NY','45610',65,'Oldroyd'),
('17','Roxane','9347389084','roxane@hotmail.com','4314961342','Male','Columbus','Syracuse','NY','17680',27,'Campain'),
('18','Lavera','9959019074','lperin@perin.org','1122901342','Female','WallStreet','NewYorkCity','NY','78210',25,'Perin'),
('19','Erick','5559019084','erick.ferencz@aol.com','3322789342','Male','Arkerman','Syracuse','NY','13210',35,'Ferencz'),
('20','Fatima','1159019784','fsaylors@saylors.org','3321901342','Female','Westcott','Syracuse','NY','13210',40,'Saylors'),
('21','Anky','8959019084','anky@gmail,com','Female','6655901342','HappyMade','San Francisco','CA','42137',21,'Phatale');


/*Inserting data into table Contract*/
insert into Contract values
('1','Fulltime','Must complete atleast 40 hrs per week','Quaterly bonus of 10% of CTC','Execellent'),
('2','Part_time','Must complete atleast 20 hrs per week','Quaterly bonus of 10% of CTC','Good'),
('3','Intern','Must complete atleast 20 hrs per week','NA','Good'),
('4','Visting','Must complete atleast 10 hrs per week','Quaterly bonus of 5% of CTC','Good'),
('5','Progression','Must complete atleast 40 hrs per week','NA','Good');


/*Inserting data into table Specialisation*/
insert into Specialisation values(1,'Anesthesiologist'),
(2,'Dermatologist'),(3,'Gynecologist'),
(4,'Opthalmologists');

/*Inserting data into table Job*/
insert into Job values (1,'Doctor',230000,1),(2,'Doctor',200000,2),(3,'Doctor',130000,3),(4,'Doctor',190000,4),(5,'Doctor',170000,5), 
(6,'Nurse',100000,1),(7,'Nurse',95000,3),(8,'Nurse',850000,4),(9,'Nurse',70000,5),
(10,'Ward',45000,1),(11,'Ward',41000,2),(12,'Clerk',55000,1),(13,'Receptionist',65000,1);

/*Inserting data into table Department*/
insert into Department values(1,'Anaesthetics'),
(2,'Dermatology'),(3,'Gynaecology'),
(4,'Opthalmology');


/*Inserting data into table MedicalDevice*/
 insert into MedicalDevice values
(1,'InfusionPump'),
(2,'MRIMachine'),
(3,'ECG'),
(4,'X-RayMachine'),
(5,'EEG');

/*Inserting data into table HealthInsurance*/
insert into HealthInsurance values
(1,'AetnaHealthInsurance','Aetna','3129044325',1000000),
(2,'CignaHealthInsurance','Cigna','3113467321',900000),
(3,'CareSourceHealthInsurance','CareSource','3092855911',1300000),
(4,'HCSCInsurance','HCSC','3129044325',800000),
(5,'WellPointInsurance','WellPoint','3129044325',1000000);

/*Inserting data into table PatientRoomType*/
insert into PatientRoomType values
(1,'SpecialRoom',1),
(2,'SemiSpecialRoom',4),
(3,'General',12),
(4,'VIPSuite',1);

/*Inserting data into table Office*/
insert into Office values
(1,'Athena',1,'3312454571',1),
(2,'Athena',2,'3310454572',1),
(3,'Athena',3,'3352454573',2),
(4,'Apollo',1,'3012423474',3),
(5,'Apollo',2,'3312489575',4),
(6,'Apollo',2,'3312404576',4);

/*Inserting data into table PatientRoom*/
insert into PatientRoom values
(1,2,5,'Vacant',1),
(2,1,3,'Occupied',3),
(3,4,2,'Occupied',4),
(4,2,1,'Vacant',5),
(5,3,4,'Vacant',2);

/*Inserting data into table Employee*/
insert into Employee values
(1,4,1,3),
(2,8,2,2),
(3,6,7,4),
(4,1,3,2),
(5,2,8,5),
(6,3,11,2);

/*inserting data into Doctor table*/

insert into Doctor values (1,1,3),(2,4,1),(3,2,2);

/*Inserting data into table PatientRoomLocation*/
insert into PatientRoomLocation values
(1,101,1,'Athena'),
(2,102,1,'Athena'),
(3,103,2,'Athena'),
(4,104,2,'Athena'),
(5,105,3,'Athena'),
(6,201,1,'Apollo'),
(7,202,1,'Apollo'),
(8,203,1,'Apollo'),
(9,204,2,'Apollo'),
(10,205,2,'Apollo');


/*Inserting data into table Patient*/
insert into Patient values
(1,5,1,3,'Sheldon','3114273344','sheldonh@gmail.com',3,5,'2014-02-11','2024-02-11','2017-10-29 14:56:59','2017-10-31 10:35:59'),
(2,7,3,5,'Rosie','9804273344','rossie15@gmail.com',2,2,'2015-02-11','2020-02-11','2017-10-29 14:56:59','2017-10-30 10:35:59'),
(3,9,1,3,'Oliver','9674203344','oliverqueen@gmail.com',2,1,'2010-10-11','2022-10-11','2017-11-02 11:56:59','2017-11-04 1:35:59'),
(4,15,2,3,'Austin','7384273344','austin22@gmail.com',3,3,'2014-02-11','2024-02-11','2017-11-12 09:56:59','2017-11-15 12:51:59'),
(5,12,3,5,'Mike','5536273344','bluemike@gmail.com',2,4,'2016-04-11','2026-04-11','2017-12-02 14:56:59','2017-12-06 10:35:59');


/*Inserting data into table PatientHealthHistory*/
insert into PatientHealthHistory values
(1,1,63,163,72,126,'AbdominalPain','MRI',1,'Prozac20mg,Aspirin 81mg'), 
(2,2,73,172,62,128,'Hypertension','EEG',2,' Metoprolol100mg'),
(3,3,60,161,70,120,'SwellingOfTongue','ENT',3,'Xoperex25mg'),
(4,4,67,165,72,126,' BilateralkneePain ','MRI',4,'FolicAcid5mg ');


/*Inserting data into table Bill*/
insert into Bill values
(1,1,1,'MRI,Prozac20mg,Aspirin 81mg','Sheldon',2800,4000,6800,'CreditCard'),
(2,2,3,'EEG,Metoprolol100mg','Rossie',1500,2000,3500,'CreditCard'),
(3,3,1,'ENT,Xoperex25mg','Oliver',2800,5000,7800,'VisaCard'),
(4,4,2,'MRI,FolicAcid5mg','Mike',2000,3000,5000,'DebitCard');


/*Inserting data into table Visitors*/
insert into Visitors values 
(1,'Anabel','3155019084','2017-10-29 19:56:59','2017-10-29 17:56:59',1,'7789901342'),
(2,'Ezekiella','3159809084','2017-10-30 20:56:59','2017-10-30 218:56:59',1,'8789901342'),
(3,'Will','3153159084','2017-10-29 17:56:59','2017-10-29 19:56:59',2,'5589901342'),
(4,'Berdo','3109229084','2017-11-13 12:56:59','20017-11-13 10:51:59',3,'4489961342');

