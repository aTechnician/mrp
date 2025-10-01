CREATE DATABASE ww2_log;

USE ww2_log;

CREATE TABLE unit_types(
ident 	VARCHAR(5) NOT NULL,
descr	VARCHAR(15),
PRIMARY KEY (ident)
);

INSERT INTO unit_types (ident, descr)
VALUES
('PL', 'Platoon')
,('Coy', 'Company')
,("BN", "Battalion")
,("Rgmt", "Regiment")
,("Bde", "Brigade")
,("Div", "Division")
,("Corps", "Corps")
;

CREATE TABLE units (
uic INT NOT NULL AUTO_INCREMENT,
nme varchar(15) NOT NULL,
num VARCHAR(5),
size VARCHAR(5) NOT NULL,
parent INT,
PRIMARY KEY (uic),
FOREIGN KEY (size) REFERENCES unit_types(ident),
FOREIGN KEY (parent) REFERENCES units(uic)
);

CREATE TABLE unit_notes (
	id INT NOT NULL AUTO_INCREMENT,
    uic INT,
    note TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (uic) REFERENCES units(uic)
);

CREATE TABLE fonds_tna (
originator VARCHAR (5) NOT NULL,
section VARCHAR(4) NOT NULL,
folder VARCHAR(5) NOT NULL,
s_date DATE,
e_date DATE,
ancestry BOOL,
requested BOOL,
scanned BOOL,
filed BOOL,
fond VARCHAR(16) AS (CONCAT(originator,section,"/",folder)) STORED,
PRIMARY KEY(fond)
);

CREATE TABLE fonds_tna_notes (
	id INT NOT NULL AUTO_INCREMENT,
    fond VARCHAR(16),
    note TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (fond) REFERENCES fonds_tna(fond)
);

CREATE TABLE unit_fonds (
uic INT,
fond VARCHAR(16),
PRIMARY KEY (uic, fond),
FOREIGN KEY (uic) REFERENCES units(uic),
FOREIGN KEY (fond) REFERENCES fonds_tna(fond)
);

CREATE TABLE tna_bookings (
ref_no VARCHAR(16) NOT NULL,
dte DATE,
PRIMARY KEY (ref_no)
);

CREATE TABLE tna_fond_booking (
	ref_no VARCHAR(16) NOT NULL,
    fond VARCHAR(16) NOT NULL,
    PRIMARY KEY (ref_no, fond),
    FOREIGN KEY (ref_no) REFERENCES tna_bookings(ref_no),
    FOREIGN KEY (fond) REFERENCES fonds_tna(fond)
);
