CREATE DATABASE Library;
USE Library;

CREATE TABLE Branch(
Branch_no int primary key not null,
Manager_id int,
Branch_Address varchar(100),
Contact_no varchar(15)
);
INSERT INTO Branch VALUES 
(1, 101, '123 Main St', '555-1234'),
(2, 102, '456 Oak St', '555-5678');

select * from Branch;

CREATE TABLE Employee(
Emp_id int primary key not null,
Emp_name varchar(50),
Position varchar(50),
Salary int,
Branch_no int,
foreign key(Branch_no) references Branch(Branch_no)
);

INSERT INTO Employee VALUES 
(1, 'Ashwin', 'Manager', 60000, 1),
(2, 'Sara', 'Clerk', 45000, 1),
(3, 'Lilly', 'Manager', 70000, 2),
(4, 'Zackeriya', 'Clerk', 47000, 2);
select * from Employee;


CREATE TABLE Books(
ISBN varchar(20) primary key,
Book_title varchar(100),
Category varchar(50),
Rental_price float,
Status varchar(3) CHECK (Status IN ('yes', 'no')),
Author varchar(50),
Publisher varchar(50)
);

INSERT INTO Books VALUES 
('978-3-16-148410-0', 'Book A', 'Fiction', 20.00, 'yes', 'Author A', 'Publisher A'),
('978-1-23-456789-7', 'Book B', 'History', 15.00, 'no', 'Author B', 'Publisher B'),
('978-0-12-345678-9', 'Book C', 'Science', 25.00, 'yes', 'Author C', 'Publisher C');
select * from Books;


CREATE TABLE Customer(
Customer_id int primary key,
Customer_name varchar (50),
Customer_address varchar(100),
Reg_date datetime
);

INSERT INTO Customer VALUES 
(1, 'Alice Green', '789 Pine St', '2021-12-31'),
(2, 'Bob White', '321 Cedar St', '2022-01-15'),
(3, 'Charlie Black', '654 Elm St', '2023-05-20');

select * from Customer;



CREATE TABLE IssueStatus(
Issue_id int primary key,
Issued_cust int,
Issue_date date,
ISBN_book varchar(20),
foreign key(Issued_cust) references Customer(Customer_id),
foreign key(ISBN_book) references Books(ISBN)
);

INSERT INTO IssueStatus VALUES 
(1, 1, '2023-06-05', '978-3-16-148410-0'),
(2, 3, '2023-06-10', '978-1-23-456789-7');
select * from IssueStatus; 




CREATE TABLE ReturnStatus(
Return_id int primary key,
Return_cust int,
Return_book_name varchar(100),
Return_date date,
ISBN_book2 varchar(20),
foreign key(ISBN_book2) references Books(ISBN)
);
INSERT INTO ReturnStatus VALUES (1, 1, 'Book A', '2023-06-15', '978-3-16-148410-0');
select * from ReturnStatus;


-- 1. Retrieve the book title, category, and rental price of all available books. 

select book_title,Category,rental_price from Books where status='yes';

-- 2. List the employee names and their respective salaries in descending order of salary. 

select Emp_name,Salary from employee order by Salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books. 

select Books.Book_title as Books , Customer.Customer_name as Issued_Customer from Books inner join Customer,IssueStatus 
where IssueStatus.ISBN_book = Books.ISBN and IssueStatus.Issued_cust=customer.Customer_id;

-- 4. Display the total count of books in each category. 

select Category,count(*) as No_of_Books from Books group by category order by category desc;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

select Emp_name as Employee_Name , Position from Employee where Salary>50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

select customer_name from Customer left join IssueStatus on IssueStatus.Issued_cust = Customer.Customer_id
 where Customer.reg_date < '2022-01-01' and IssueStatus.issued_cust is Null;
 
 -- 7. Display the branch numbers and the total count of employees in each branch. 
 
 select Branch_no ,count(Branch_no) as Total_Number_of_Employee from Employee group by Branch_no ;
 
 
-- 8. Display the names of customers who have issued books in the month of June 2023.

select customer_name from customer left join IssueStatus on IssueStatus.Issued_cust = Customer.Customer_id
where IssueStatus.Issue_date between '2023-06-01' and '2023-06-30';

-- 9. Retrieve book_title from book table containing history. 

select book_title from Books where Category='History';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

select Branch_no ,count(Branch_no) as Total_Number_of_Employee from Employee group by Branch_no having count(Branch_no)>5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.

select Emp_name , Branch.Branch_address from Employee right join Branch on
 Employee.Branch_no=Branch.Branch_no where Employee.position='Manager';

-- 12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.

select customer.customer_name from customer join Issuestatus on IssueStatus.Issued_cust=customer.Customer_id 
join Books on  Books.ISBN = IssueStatus.ISBN_book where Books.Rental_price > 25;
 

 