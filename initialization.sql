BEGIN;
    CREATE TABLE plants (
        id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(1024)
    );

    CREATE TABLE rooms (
        id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
        name VARCHAR(255) NOT NULL
    );

    CREATE TABLE typeOfCare (
         id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
         name VARCHAR(255) NOT NULL,
         description VARCHAR(1024) NOT NULL
    );

    CREATE TABLE plantsLocations (
         id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
         roomId INTEGER NOT NULL,
         plantId INTEGER NOT NULL,
         FOREIGN KEY (roomId) REFERENCES rooms(id) ON DELETE CASCADE ON UPDATE CASCADE,
         FOREIGN KEY (plantId) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE
    );

    CREATE TABLE careHistory (
         id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
         plantId INTEGER NOT NULL,
         careDate TIMESTAMP NOT NULL,
         typeOfCareId INTEGER NOT NULL,
         FOREIGN KEY (plantId) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
         FOREIGN KEY (typeOfCareId) REFERENCES typeOfCare(id) ON DELETE CASCADE ON UPDATE CASCADE
    );

    CREATE TABLE requirements (
         id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
         plantId INTEGER NOT NULL,
         typeOfCareId INTEGER NOT NULL,
         HowManyTimesPerDay INTEGER NOT NULL,
         FOREIGN KEY (plantId) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
         FOREIGN KEY (typeOfCareId) REFERENCES typeOfCare(id) ON DELETE CASCADE ON UPDATE CASCADE
    );
COMMIT;