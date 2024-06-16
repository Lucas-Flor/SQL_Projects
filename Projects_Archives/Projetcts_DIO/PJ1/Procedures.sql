# Part 1 - DB Index

#Employees table:
CREATE INDEX idx_num_employees ON employees (department_id, employee_id);

# Script to find the department with the most people:

SELECT department_id, COUNT(*) as employee_count
FROM employees
GROUP BY department_id
ORDER BY employee_count DESC
LIMIT 1;

# To list departments by city:

SELECT d.department_name, l.city
FROM departments d
JOIN locations l ON d.location_id = l.location_id;

# To get employees by department:

SELECT department_id, COUNT(employee_id) as employee_count
FROM employees
GROUP BY department_id;


/*
Part 1 Justification:
A composite index was created based on the department_id and employee_id column to optimize the query that searches for the department with the largest number of people. 
Indexing these columns will make the operation of counting employees by department more efficient.
*/

#Part 2 - the procedure to manipulate the data

#SQL script with the procedure to manipulate the data:

DELIMITER $$

CREATE PROCEDURE manage_data(IN table_name VARCHAR(255), IN action INT, IN id INT, IN name VARCHAR(255), IN city VARCHAR(255))
BEGIN
    CASE action
        WHEN 1 THEN
            SELECT * FROM table_name WHERE id = id;
        WHEN 2 THEN
            UPDATE table_name SET name = name, city = city WHERE id = id;
        WHEN 3 THEN
            DELETE FROM table_name WHERE id = id;
        ELSE
            SELECT 'Invalid action';
    END CASE;
END$$

DELIMITER ;

# Procedure call to manipulate data from the universities table:

CALL manage_data('universities', 1, 1, '', '');
CALL manage_data('universities', 2, 1, 'New Name', 'New City');
CALL manage_data('universities', 3, 1, '', '');

# Procedure call to manipulate data from the e-commerce table:

CALL manage_data('e-commerce', 1, 1, '', '');
CALL manage_data('e-commerce', 2, 1, 'New Name', 'New City');
CALL manage_data('e-commerce', 3, 1, '');

/*In this example, the manage_data procedure was created to perform data selection, update and delete operations in different tables. 
Input parameters include the name of the table, the action to be performed (1 for select, 2 for update, 3 for delete), the ID of the record to be manipulated, the new name and the new city (in case of update).
When using the CASE conditional structure, the procedure determines the action to be performed based on the provided action parameter. The procedure call is performed with examples for the "universities" and "e-commerce" tables.
*/

# Main Procedure

CREATE PROCEDURE ManageData(
    IN action INT,
    IN emp_id INT,
    IN emp_name VARCHAR(255),
    IN emp_department VARCHAR(255)
)
BEGIN
    CASE action
        WHEN 1 THEN 
            SELECT * FROM employees WHERE employee_id = emp_id;
        WHEN 2 THEN 
            UPDATE employees SET name = emp_name WHERE employee_id = emp_id;
        WHEN 3 THEN 
            DELETE FROM employees WHERE employee_id = emp_id;
        ELSE 
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid action';
    END CASE;
END;
