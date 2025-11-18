SELECT 
`ww2_log`.`u`.`fond` AS `fond`,
`ww2_log`.`u`.`s_date` AS `s_date`,
`ww2_log`.`u`.`e_date` AS `e_date`,
`ww2_log`.`u`.`fond_pri` AS `fond_pri`,
`ww2_log`.`u`.`uic` AS `uic`,
`ww2_log`.`u`.`num` AS `num`,
`ww2_log`.`u`.`nme` AS `nme`,
`ww2_log`.`u`.`size` AS `size`,
`ww2_log`.`u`.`parent` AS `parent`,
`ww2_log`.`u`.`unit_pri` AS `unit_pri`,
`ww2_log`.`u`.`u_note` AS `u_note`,
`ww2_log`.`u`.`f_note` AS `f_note`
FROM
`ww2_log`.`unit_records` `u`
WHERE (u.requested IS NULL OR requested = 0) AND (u.ancestry IS NULL or u.ancestry = 0) 
AND fond IS NOT NULL;
