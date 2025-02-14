CREATE TABLE country (
    Code CHAR(3) PRIMARY KEY NOT NULL DEFAULT 'UNK',
    Name VARCHAR(255) NOT NULL DEFAULT '',
    Code2 CHAR(2) NOT NULL DEFAULT '' UNIQUE
);

ALTER TABLE country
ADD CONSTRAINT check_code_length CHECK (LENGTH(Code) >= 3);

CREATE TABLE city (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255) NOT NULL DEFAULT '',
    CountryCode CHAR(3) NOT NULL DEFAULT '',
    District VARCHAR(255) NOT NULL DEFAULT '',
    Info JSON DEFAULT NULL
);

ALTER TABLE country
ADD Capital INT DEFAULT NULL,
ADD CONSTRAINT fk_capital FOREIGN KEY (Capital) REFERENCES city(ID);

CREATE TABLE countrylanguage (
    CountryCode CHAR(3) NOT NULL DEFAULT '',
    Language CHAR(30) NOT NULL DEFAULT '',
    IsOfficial ENUM('T', 'F') NOT NULL DEFAULT 'F',
    Percentage DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    PRIMARY KEY (CountryCode, Language),
    FOREIGN KEY (CountryCode) REFERENCES country(Code)
);

CREATE INDEX idx_country_code ON countrylanguage(CountryCode);

CREATE TABLE countryinfo (
    doc JSON,
    _id INT NOT NULL AUTO_INCREMENT PRIMARY KEY  
);

