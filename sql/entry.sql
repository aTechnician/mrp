-- THIS IS A WORKSHEET

USE ww2_log;

-- link fond to unit
-- UIC, WO, 171, [NUMBER], ANCESTRY, REQUESTED, SCANNED, FILED, PRI 
call ww2_log.new_tna_fond(
258, 
'WO', '171', 
'524', 
NULL, 0, 0, 0, 3);

-- insert unit

INSERT INTO UNITS (num, nme, size, parent, pri)
VALUES (NULL,'Ord Fd Pk',NULL,174, 2);
SELECT last_insert_id(); 

insert into fonds_tna (originator,section,folder,requested, scanned, filed
                        , pri)
                        values ("WO", 171, 305, 0,0,0,2);
