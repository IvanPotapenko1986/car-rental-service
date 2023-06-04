DROP TABLE admins;
DROP TABLE car;
DROP TABLE client;
DROP TABLE rental;
DROP TABLE passport;
DROP TABLE users;
DROP TABLE car_client;



CREATE TABLE admins
(
    id               INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    email            VARCHAR(20) NOT NULL UNIQUE,
    passwords        VARCHAR(20) NOT NULL,
    date_of_creation TIMESTAMP   NOT NULL
);

CREATE TABLE car
(
    id               INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    brand            VARCHAR(20)      NOT NULL,
    model            VARCHAR(20)      NOT NULL,
    year_of_release  INT              NOT NULL CHECK (year_of_release > 2000),
    color            VARCHAR(20)      NOT NULL,
    fuel             VARCHAR(20)      NOT NULL,
    engine_capacity  DOUBLE PRECISION NOT NULL CHECK (engine_capacity > 0.0),
    horse_power      INT              NOT NULL CHECK (horse_power > 0),
    transmission     VARCHAR(20)      NOT NULL,
    fuel_consumption DOUBLE PRECISION NULL CHECK (fuel_consumption > 0.0),
    ranges           INT              NULL,
    battery          DOUBLE PRECISION NULL,
    type            VARCHAR(20)      NOT NULL,
    quantity_places  INT              NOT NULL CHECK (quantity_places > 0),
    quantity_doors   INT              NOT NULL CHECK (quantity_doors > 0),
    trunk_volume     INT              NOT NULL CHECK (trunk_volume > 0),
    vin_code         VARCHAR(20)      NOT NULL UNIQUE,
    numbers          VARCHAR(20)      NOT NULL UNIQUE,
    price            DOUBLE PRECISION NOT NULL CHECK ( price > 0 )
);

CREATE TABLE client
(
    user_id          INT PRIMARY KEY REFERENCES users (id) ON DELETE CASCADE,
    first_name       VARCHAR(20)  NOT NULL,
    last_name        VARCHAR(20)  NOT NULL,
    middle_name      VARCHAR(20)  NULL,
    phone            VARCHAR(30)  NOT NULL UNIQUE,
    address          VARCHAR(100) NULL,
    driver_license   VARCHAR(30)  NOT NULL UNIQUE,
    date_of_birthday DATE         NOT NULL,
    date_of_creation TIMESTAMP    NOT NULL
);

CREATE TABLE passport
(
    id            INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    client_id     INT         NOT NULL UNIQUE REFERENCES client (user_id) ON DELETE CASCADE,
    series        VARCHAR(2)  NOT NULL,
    numbers       VARCHAR(7)  NOT NULL UNIQUE,
    date_of_issue DATE        NOT NULL,
    issued        VARCHAR(20) NOT NULL,
    passport_id   VARCHAR(13) NOT NULL UNIQUE
);

CREATE TABLE rental
(
    id               INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    car_id           INT              NOT NULL REFERENCES car (id) ON DELETE CASCADE,
    client_id        INT              NOT NULL REFERENCES client (user_id) ON DELETE CASCADE,
    rental_date      DATE             NOT NULL,
    return_date      DATE             NOT NULL,
    price            DOUBLE PRECISION NOT NULL CHECK ( price > 0 ),
    rental_days      INTEGER          NOT NULL CHECK ( rental_days > 0 ),
    status           VARCHAR(10)      NOT NULL,
    date_of_creation TIMESTAMP        NOT NULL
);

CREATE TABLE users
(
    id               INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    logins           VARCHAR(50) NOT NULL,
    email            VARCHAR(50) NOT NULL UNIQUE,
    passwords        VARCHAR(50) NOT NULL,
    roles            VARCHAR(7)  NOT NULL,
    date_of_creation TIMESTAMP   NOT NULL
);

CREATE TABLE car_client
(
    car_id    INT REFERENCES car (id),
    client_id INT REFERENCES client (user_id),
    PRIMARY KEY (car_id, client_id)
);

INSERT INTO admins (email, passwords, date_of_creation)
values ('admin', 'password', '2023-05-25');

INSERT INTO car
(color, quantity_doors, numbers, quantity_places, trunk_volume, vin_code, brand, engine_capacity,
 fuel_consumption, type, fuel, horse_power, transmission, model, price, year_of_release)
VALUES ('WHITE', 5, '1092873', 5, 587, '123-0948098j882d', 'Audy',  1.5, 7,'no_electric', 'DIESEL', 125, 'AUTOMATIC',
        'A8', 102, 2020);

INSERT INTO car
(color, quantity_doors, numbers, quantity_places, trunk_volume, vin_code, brand, engine_capacity,
 ranges,battery, type, fuel, horse_power, transmission, model, price, year_of_release)
VALUES ('WHITE', 5, '1876786', 5, 580, '123-0945656876', 'BMW', 1.5,500,100,'electric', 'ELECTRIC', 125, 'AUTOMATIC',
        'A8', 102, 2020);

INSERT INTO users (logins, email, passwords, roles, date_of_creation)
values ('test', 'test@mail.ru', 'password', 'USER', '2023-05-25');

INSERT INTO client (user_id, first_name, last_name, middle_name, phone, address, driver_license, date_of_birthday,
                    date_of_creation)
VALUES (1, 'Ivan', 'Potapenko', 'Yrevich', '+375447899840', 'Gomel,Mazurova,20', '1092837y', '1986-05-02',
        '2023-05-02');

INSERT INTO rental (car_id, client_id, rental_date, return_date, price, rental_days, status, date_of_creation)
VALUES (1, 1, '2023-05-20', '2023-05-23', 100, 3, 'CHECK', '2023-05-20');

INSERT INTO passport (client_id, series, numbers, date_of_issue, issued, passport_id)
VALUES (1, 'HB', '1209838', '2011-05-14', 'ROVD', '1238u8rru8');

INSERT INTO car_client (car_id, client_id)
VALUES (1, 1);