CREATE DATABASE vanactivity;

CREATE TABLE Users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Hosts (
    id SERIAL PRIMARY KEY,
    user_id INT,
    kyc_status BOOLEAN NOT NULL,
    event_count INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);



CREATE TABLE Events(
    id SERIAL PRIMARY KEY,
    host_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES Hosts(id)
);

CREATE TABLE HostRatings (
   host_id INT NOT NULL,  -- Host receiving the rating
   user_id INT NOT NULL,  -- User giving the rating
   rating INT CHECK (rating >= 1 AND rating <= 5),
   comment TEXT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (user_id) REFERENCES Users(id),
   FOREIGN KEY (host_id) REFERENCES Hosts(id),
   UNIQUE (user_id, host_id) -- Ensure a user can rate a host only once
);

CREATE TABLE user_event_preference(
    user_id INT NOT NULL,
    event_tag_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (event_tag_id) REFERENCES event_tag_list(id)
);

CREATE TABLE event_tag_list(
    id SERIAL PRIMARY KEY,
    event_tags VARCHAR(50)
);

CREATE TABLE event_tags(
    event_id INT NOT NULL,
    event_tag_id INT NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(id),
    FOREIGN KEY (event_tag_id) REFERENCES event_tag_list(id)
);

CREATE TABLE Restuarants(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    number_of_user_selected INT DEFAULT 0
);

CREATE TABLE cuisine_tag_list(
    id SERIAL PRIMARY KEY,
    type_of_cuisine VARCHAR(50)
);

CREATE TABLE user_eaten_restuarant(
    user_id INT NOT NULL,
    cuisine_tag_id INT NOT NULL,
    restuarant_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (restuarant_id) REFERENCES Restuarants(id),
    FOREIGN KEY (cuisine_tag_id) REFERENCES cuisine_tag_list(id)
);



CREATE TABLE RestuarantRatings (
   restuarant_id INT NOT NULL,  
   user_id INT NOT NULL,  -- User giving the rating
   rating INT CHECK (rating >= 1 AND rating <= 5),
   comment TEXT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (user_id) REFERENCES Users(id),
   FOREIGN KEY (restuarant_id) REFERENCES Restuarants(id),
   UNIQUE (user_id, restuarant_id) -- Ensure a user can rate a restuarant only once
);