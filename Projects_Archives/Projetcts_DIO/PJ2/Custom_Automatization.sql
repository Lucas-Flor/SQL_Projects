# Part 1 – Customizing access with views

# 1. Number of Employees by Department and Location:

#Instruction to create the main visualizartion table of employees

CREATE VIEW EmployeesByDeptLoc AS
SELECT d.department_name, l.city, COUNT(e.employee_id) as employee_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY d.department_name, l.city;

# 2. List of Departments and Their Managers:

CREATE VIEW DepartmentsAndManagers AS
SELECT d.department_name, m.manager_name
FROM departments d
JOIN managers m ON d.manager_id = m.manager_id;

# 3. Projects with Most Employees:

CREATE VIEW ProjectsMostEmployees AS
SELECT p.project_name, COUNT(ep.employee_id) as employee_count
FROM employee_projects ep
JOIN projects p ON ep.project_id = p.project_id
GROUP BY p.project_name
ORDER BY employee_count DESC;

# 4. List of Projects, Departments, and Managers:

CREATE VIEW ProjectsDeptsManagers AS
SELECT p.project_name, d.department_name, m.manager_name
FROM projects p
JOIN departments d ON p.department_id = d.department_id
JOIN managers m ON d.manager_id = m.manager_id;

# 5. Employees with Dependents and Manager Status

CREATE VIEW EmployeesDependentsManagers AS
SELECT e.employee_name, IF(e.is_manager, 'Yes', 'No') as is_manager, COUNT(d.dependent_id) as dependent_count
FROM employees e
LEFT JOIN dependents d ON e.employee_id = d.employee_id
GROUP BY e.employee_name;

/*
For permissions:

Grant manager access to employee and department information.
Restrict employee access to department or manager information.
*/

# Example for user creation and permission setting:

CREATE USER 'manager'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON database.employees TO 'manager'@'localhost';
GRANT SELECT ON database.departments TO 'manager'@'localhost';

# Part 2 – Creating triggers for the e-commerce scenario

/*
For Part 2, here are examples of triggers for the e-commerce scenario:
*/

#Before Delete Trigger (for user account removal):
CREATE TRIGGER BeforeUserDelete BEFORE DELETE ON users FOR EACH ROW 
BEGIN 
    INSERT INTO deleted_users_archive (user_id, username, email) VALUES (OLD.user_id, OLD.username, OLD.email);
END;

#Before Update Trigger (for new employees and salary updates):
CREATE TRIGGER BeforeEmployeeUpdate BEFORE UPDATE ON employees FOR EACH ROW 
BEGIN 
    IF NEW.hire_date IS NOT NULL THEN 
        INSERT INTO employee_audit (employee_id, action_taken) VALUES (OLD.employee_id, 'New Hire');
    END IF;
    IF NEW.salary <> OLD.salary THEN 
        INSERT INTO salary_changes (employee_id, old_salary, new_salary) VALUES (OLD.employee_id, OLD.salary, NEW.salary);
    END IF;
END;

