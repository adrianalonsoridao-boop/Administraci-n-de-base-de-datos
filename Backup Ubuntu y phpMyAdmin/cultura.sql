CREATE TABLE cultura(
    Fiesta_Nacional VARCHAR(20) PRIMARY KEY,
    Dia int (2),
    Mes VARCHAR (20),
    DescripciOn VARCHAR(200),
    Country_Code CHAR(3) REFERENCES country (code)
    );