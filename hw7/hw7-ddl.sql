# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the people_skills and people_roles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people_skills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS people_roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills(
    skills_id int AUTO_INCREMENT NOT NULL,
    skills_name varchar(256) NOT NULL,
    description varchar(256) NOT NULL,
    tag varchar(256) NOT NULL,
    url varchar(256),
    time_commitment varchar(256),
    PRIMARY KEY (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(skills_id, skills_name, description, tag, url, time_commitment) VALUES 
    (1, 'saxaphonist','a professional level saxaphonist', 'Skill 1', 'https://random_url1', '8 years');


INSERT INTO skills(skills_name, description, tag, url, time_commitment) VALUES 
    ('pianist', 'a professional level pianist', 'Skill 2', 'https://random_url2', '8 years'),
    ('drummer', 'a professional level drummer', 'Skill 3', 'https://random_url3', '10 years'),
    ('barber', 'a professional level barber', 'Skill 3', 'https://random_url3', '1 year'),
    ('gamer', 'an elite level gamer', 'Skill 4', 'https://random_url4', '5 months'),
    ('cook', 'an amazing home cook', 'Skill 5', 'https://random_url5', '3 months'),
    ('teacher', 'someone with the ability to teach others', 'Skill 6' , 'https://random_url6', '4 years'),
    ('boxer', 'a professional fighter who plays in the sport of boxing', 'Skill 7', 'https://random_url7', '2 years'),
    ('zooligist', 'someone who works with animals', 'Skill 8', 'https://random_url8', '4 years');





# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int AUTO_INCREMENT,
    people_last_name varchar(256) NOT NULL,
    people_first_name varchar(256) NOT NULL,
    email varchar(256),
    linkedin_url varchar(256),
    headshot_url varchar(256),
    discord_handle varchar(256),
    brief_bio varchar(256),
    date_joined DATE NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_last_name, people_first_name, email, linkedin_url, headshot_url,discord_handle, brief_bio, date_joined ) VALUES
    (1, 'Smith', 'John', 'john.smith@email.com', 'https://www.linkedin.com/in/johnsmith', 'https://example.com/johnsmith.jpg', 'johnsmith#1234', 'Passionate software engineer', '2023-01-01');

INSERT INTO people (people_last_name, people_first_name, email, linkedin_url, headshot_url,discord_handle, brief_bio, date_joined ) VALUES
    ('Johnson', 'Emily', 'emily.johnson@email.com', 'https://www.linkedin.com/in/emilyjohnson', 'https://example.com/emilyjohnson.jpg', 'emilyjohnson#5678', 'Marketing enthusiast', '2023-02-15'),
    ('Brown', 'Michael', 'michael.brown@email.com', 'https://www.linkedin.com/in/michaelbrown', 'https://example.com/michaelbrown.jpg', 'michaelbrown#9876', 'Creative designer with a flair for art', '2023-03-20'),
    ('Jones', 'Jessica', 'jessica.jones@email.com', 'https://www.linkedin.com/in/jessicajones', 'https://example.com/jessicajones.jpg', 'jessicajones#4321', 'Experienced project manager', '2023-04-10'),
    ('Miller', 'David', 'david.miller@email.com', 'https://www.linkedin.com/in/davidmiller', 'https://example.com/davidmiller.jpg', 'davidmiller#7890', 'Passionate about data science', '2023-05-05'),
    ('Garcia', 'Sophia', 'sophia.garcia@email.com', 'https://www.linkedin.com/in/sophiagarcia', 'https://example.com/sophiagarcia.jpg', 'sophiagarcia#6543', 'Entrepreneur and business strategist', '2023-06-25'),
    ('Taylor', 'Olivia', 'olivia.taylor@email.com', 'https://www.linkedin.com/in/oliviataylor', 'https://example.com/oliviataylor.jpg', 'oliviataylor#2468', 'Environmental advocate and researcher', '2023-07-12'),
    ('Anderson', 'Christopher', 'christopher.anderson@email.com', 'https://www.linkedin.com/in/christopheranderson', 'https://example.com/christopheranderson.jpg', 'christopheranderson#1357', 'Technology enthusiast and AI developer', '2023-08-18'),
    ('Wang', 'Lily', 'lily.wang@email.com', 'https://www.linkedin.com/in/lilywang', 'https://example.com/lilywang.jpg', 'lilywang#3690', 'International relations specialist', '2023-09-30'),
    ('Martinez', 'Carlos', 'carlos.martinez@email.com', 'https://www.linkedin.com/in/carlosmartinez', 'https://example.com/carlosmartinez.jpg', 'carlosmartinez#8024', 'Finance and investment expert', '2023-10-22');

# Section 6
# Create people_skills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE people_skills (
    people_skills_id int AUTO_INCREMENT,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired DATE NOT NULL, 
    PRIMARY KEY(people_skills_id),
    FOREIGN KEY (skills_id) REFERENCES skills (skills_id),
    FOREIGN KEY (people_id) REFERENCES people (people_id)
);


# Section 7
# Populate people_skills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

-- Insert data into the people_skills table based on specified skills for each person
INSERT INTO people_skills (skills_id, people_id, date_acquired) VALUES
    -- Person 1
    (1, 1, '2023-01-05'), -- saxophonist
    (3, 1, '2023-01-07'), -- drummer
    (6, 1, '2023-01-10'), -- cook
    
    -- Person 2
    (3, 2, '2023-02-20'), -- drummer
    (4, 2, '2023-02-22'), -- barber
    (5, 2, '2023-02-25'), -- gamer
    
    -- Person 3
    (1, 3, '2023-03-25'), -- saxophonist
    (5, 3, '2023-03-27'), -- cook
    
    -- Person 4 (no skills)
    
    -- Person 5
    (3, 5, '2023-05-10'), -- drummer
    (6, 5, '2023-05-15'), -- cook
    
    -- Person 6
    (2, 6, '2023-06-30'), -- pianist
    (3, 6, '2023-07-05'), -- drummer
    (4, 6, '2023-07-08'), -- barber
    
    -- Person 7
    (3, 7, '2023-08-25'), -- drummer
    (5, 7, '2023-08-30'), -- gamer
    (6, 7, '2023-09-02'), -- cook
    
    -- Person 8
    (1, 8, '2023-09-10'), -- saxophonist
    (3, 8, '2023-09-15'), -- drummer
    (5, 8, '2023-09-18'), -- gamer
    (6, 8, '2023-09-20'), -- cook
    
    -- Person 9
    (2, 9, '2023-10-22'), -- pianist
    (5, 9, '2023-10-25'), -- gamer
    (6, 9, '2023-10-28'), -- cook
    
    -- Person 10
    (1, 10, '2023-11-05'), -- saxophonist
    (4, 10, '2023-11-08'), -- barber
    (5, 10, '2023-11-10'); -- gamer

 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int AUTO_INCREMENT,
    roles_name varchar(225),
    sort_priority int,
    PRIMARY KEY (roles_id) 
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (roles_name, sort_priority) VALUES
    ('Designer', 10),
    ('Developer', 20),
    ('Recruit', 30),
    ('Team Lead', 40),
    ('Boss', 50),
    ('Mentor', 60);

# Section 10
# Create people_roles( id, people_id, roles_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE people_roles(
    people_roles_id int AUTO_INCREMENT,
    people_id int NOT NULL,
    roles_id int NOT NULL,
    date_acquired date NOT NULL,
    PRIMARY KEY (people_roles_id),
    FOREIGN KEY (people_id) REFERENCES people (people_id),
    FOREIGN KEY (roles_id) REFERENCES roles (roles_id)
);

# Section 11
# Populate people_roles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO people_roles (people_id, roles_id, date_acquired) VALUES
    (1, 2, '2023-01-15'), -- Person 1 is a Developer
    (2, 5, '2023-02-20'), -- Person 2 is a Boss
    (2, 6, '2023-02-20'), -- Person 2 is a Mentor
    (3, 2, '2023-03-25'), -- Person 3 is a Developer
    (3, 4, '2023-03-25'), -- Person 3 is a Team Lead
    (4, 3, '2023-04-05'), -- Person 4 is a Recruit
    (5, 3, '2023-05-10'), -- Person 5 is a Recruit
    (6, 2, '2023-06-30'), -- Person 6 is a Developer
    (6, 1, '2023-06-30'), -- Person 6 is a Designer
    (7, 1, '2023-07-15'), -- Person 7 is a Designer
    (8, 1, '2023-08-25'), -- Person 8 is a Designer
    (8, 4, '2023-08-25'), -- Person 8 is a Team Lead
    (9, 2, '2023-09-10'), -- Person 9 is a Developer
    (10, 2, '2023-10-22'), -- Person 10 is a Developer
    (10, 1, '2023-10-22'); -- Person 10 is a Designer
