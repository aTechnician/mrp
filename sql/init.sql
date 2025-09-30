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
PRIMARY KEY (unit),
FOREIGN KEY (size) REFERENCES unit_types(ident),
FOREIGN KEY (parent) REFERENCES units(parent)
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
fond VARCHAR(16) AS (CONCAT(originator,section,"/",folder)) STORED,
PRIMARY KEY(fond)
);

CREATE TABLE unit_fonds (
uic INT,
fond VARCHAR(16),
PRIMARY KEY (uic, fond),
FOREIGN KEY (uic) REFERENCES units(uic),
FOREIGN KEY (fond) REFERENCES fonds_tna(fond)
);