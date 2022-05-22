CREATE TABLE users(
    username VARCHAR(100),
    age INT
);

INSERT INTO users(username, age)
    -> VALUES("bobby", 23);
    
    
    # Triggers
    DELIMITER $$ 
    CREATE TRIGGER must_be_adult
        BEFORE INSERT ON people FOR EACH ROW
        BEGIN
            IF NEW.age < 18
            THEN    
                SIGNAL SQLSTATE '4500'
                    SET MESSAGE_TEXT = 'Must be an adult!';
            END IF;
        END;
    $$
    DELIMITER ;