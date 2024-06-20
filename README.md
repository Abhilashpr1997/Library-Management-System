# Library Management System

## Overview
The Library Management System (LMS) is developed to manage and keep track of the library's books, branches, employees, and customers. It efficiently handles book issuances and returns, ensuring smooth library operations.

## Database Design

### Tables

- **Branch**: Stores information about different library branches.
- **Employee**: Contains details about the employees working in the library.
- **Books**: Keeps track of all the books available in the library.
- **Customer**: Stores customer information.
- **IssueStatus**: Records the details of issued books.
- **ReturnStatus**: Maintains records of returned books.

### Relationships

- Each employee belongs to a branch.
- Books can be issued to customers and returned.

## Queries

1. Retrieve details of available books.
2. List employees by salary.
3. Find which customers have issued which books.
4. Count books by category.
5. List employees with high salaries.
6. Find customers who registered before a certain date and have not issued books.
7. Count employees in each branch.
8. List customers who issued books in June 2023.
9. Find books with "history" in their title.
10. Find branches with more than 5 employees.
11. List employees who manage branches.
12. Find customers who issued books with high rental prices.

## How to Use

1. **Database Setup**:
   - Create a database named `library`.
   - Create the tables using the provided SQL schema.

2. **Running Queries**:
   - Use the provided SQL queries to retrieve specific information from the database.

## Contact
For any queries, please contact rajmannara@gmail.com.


