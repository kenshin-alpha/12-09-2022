create database task;
use task;
CREATE TABLE Department (
    department_id int NOT NULL,
    department_name varchar(30) NOT NULL,
    department_block_number int,
    PRIMARY KEY (department_id)
);

CREATE TABLE Student (
    student_id int NOT NULL,
    student_name varchar(30) NOT NULL,
    address varchar(40) NOT NULL,
    city varchar(30),
    department_id int,
    PRIMARY KEY (student_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Staff (
    staff_id int NOT NULL,
    staff_name varchar(30) NOT NULL,
    department_id int,
    PRIMARY KEY (staff_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Subject (
    subject_id int NOT NULL,
    subject_name varchar(30) NOT NULL,
    subject_code varchar(10) NOT NULL,
    staff_id int,
    PRIMARY KEY (subject_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

CREATE TABLE Mark (
    value int NOT NULL,
    subject_id int,
    student_id int,
     PRIMARY KEY (student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id),
    foreign key (student_id) References Student(student_id)
);

select * from Department;
insert into Department values(1,"HR",3);
insert into Department values(2,"Manufacturing",4);
insert into Department values(3,"Music",10);

select * from Student;
insert into Student values(001,"kenshin","China","Asia",1);
insert into Student values(010,"Himura","Japan","Asia",2);
insert into Student values(020,"Ninja","LA","America",2);

select * from Staff;
insert into Staff values(30,"Tulasi",3);
insert into Staff values(40,"Ramu",2);
insert into Staff values(50,"Raju",2);

select * from Subject;
insert into Subject values(040,"Hindi",110,30);
insert into Subject values(050,"Telugu",130,40);
insert into Subject values(010,"Tamil",110,50);

select * from Mark;
insert into Mark values(70,040,010);
insert into Mark values(80,050,001);
insert into Mark values(65,010,020);

create database task2;
use task2;

CREATE TABLE owners (
    owner_id varchar(10) NOT NULL,
    owner_name varchar(20) NULL,
    address varchar(20) NULL,
    phone_no bigint Null,
    email_id varchar(20) Null,
    PRIMARY KEY (owner_id)
);

CREATE TABLE cars (
    car_id varchar(10) NOT NULL,
    car_name varchar(20) NULL,
    car_type varchar(20) NULL,
    owner_id varchar(10),
    PRIMARY KEY (car_id),
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

CREATE TABLE customers (
    customer_id varchar(10) NOT NULL,
    customer_name varchar(20) NULL,
    address varchar(20) NULL,
    phone_no bigint,
    email_id varchar(20),
    PRIMARY KEY (customer_id)
    
);

CREATE TABLE rentals (
    rental_id varchar(10) NOT NULL,
    customer_id varchar(10) NULL,
    car_id varchar(10) NULL,
    pickup_date Date,
    return_date Date,
    km_driven int,
    fare_amount double(10,2),
    PRIMARY KEY (rental_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    foreign key (car_id) references cars(car_id)
);

select * from owners;
insert into owners values("21","kenshin","Jubliee",8849948849,"xyz@gmail.com");
insert into owners values("22","himura","Maria",7349248874,"abc@gmail.com");
insert into owners values("23","zinga","beach",9049348853,"fru@gmail.com");

select * from cars;
insert into cars values("001","Hyundai","sedan","21");
insert into cars values("002","Tata","suv","22");
insert into cars values("003","Maruthi","nano","23");

select * from customers;
insert into customers values("100","quoria","Mumbai",7836663783,"jor@gmail.com");
insert into customers values("101","tetagane","Tokyo",9876663643,"miu@gmail.com");
insert into customers values("102","Hyeni","Japan",8838963654,"kfu@gmail.com");

select * from rentals;
insert into rentals values("321","100","001","2022/12/18","2022/12/22",32,300.32);
insert into rentals values("322","101","002","2022/11/08","2022/11/15",102,1200.42);
insert into rentals values("323","102","001","2022/07/20","2022/08/22",302,5000.57);
