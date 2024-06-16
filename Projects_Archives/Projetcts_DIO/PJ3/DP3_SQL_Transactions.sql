# Part 1 - Transactions

-- Disable autocommit
SET autocommit = 0;

-- Start the transaction
START TRANSACTION;

-- Perform your SQL statements (e.g., INSERT, UPDATE, DELETE)
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
UPDATE table_name SET column1 = value1 WHERE condition;
DELETE FROM table_name WHERE condition;

-- Commit the transaction to save changes
COMMIT;

-- Enable autocommit again if desired
SET autocommit = 1;

 # Part 2 - Transaction with Procedure
 
 DELIMITER //

CREATE PROCEDURE TransactionProcedure()
BEGIN
    -- Start transaction
    START TRANSACTION;
    
    -- Statements with error checking and possible rollback
    DECLARE exit handler for sqlexception
    BEGIN
        -- Rollback changes on error
        ROLLBACK;
    END;

    -- Your SQL statements here
    INSERT INTO table_name (column1) VALUES (value1);
    
    -- Savepoint example
    SAVEPOINT SavepointName;
    
    -- More SQL statements
    UPDATE table_name SET column1 = value2 WHERE condition;
    
    -- Commit the transaction to save changes
    COMMIT;
END //

DELIMITER ;

# For Part 3 - Backup and Recovery, use mysqldump to backup the database:

# Backup the e-commerce database to a file
mysqldump -u [username] -p e-commerce > e-commerce_backup.sql

# Recovery from the backup file
mysql -u [username] -p e-commerce < e-commerce_backup.sql

/*
Is necessary Remember to replace [username] with your actual MySQL username and include any additional options you need for the backup.

Lastly, you can add the backup file and any related scripts to your GitHub repository by using git commands:
*/

# Add the backup file to your repository
git add e-commerce_backup.sql

# Commit the changes with a message
git commit -m "Add database backup file"

# Push the changes to GitHub
git push origin main

