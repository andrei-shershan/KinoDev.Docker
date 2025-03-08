USE kinodev_local;

-- Halls
INSERT INTO `kinodev_local`.`Halls` (`Id`, `Name`) VALUES ('1', 'Sala A');
INSERT INTO `kinodev_local`.`Halls` (`Id`, `Name`) VALUES ('2', 'Sala B');
INSERT INTO `kinodev_local`.`Halls` (`Id`, `Name`) VALUES ('3', 'Sala VIP');
INSERT INTO `kinodev_local`.`Halls` (`Id`, `Name`) VALUES ('4', 'Grand Hall');

-- Seats
DROP procedure if exists seats_loop;
DELIMITER $$

CREATE PROCEDURE seats_loop()
BEGIN
	set @r = 1; 
    row_loop: WHILE @r <= 10 DO
		set @n = 1;
		number_loop: WHILE @n <= 10 DO
				-- HAll A 10 x 10
				-- HALL B 10 x 10
				INSERT INTO `kinodev_local`.`Seats` (`HallId`, `Row`, `Number`) VALUES ('1', @r, @n);
				INSERT INTO `kinodev_local`.`Seats` (`HallId`, `Row`, `Number`) VALUES ('2', @r, @n);
			set @n = @n + 1;
		END WHILE number_loop;
       set @r = @r + 1;
    END WHILE row_loop;   
    
	set @r = 1;
    row_loop: WHILE @r <= 5 DO
		set @n = 1;
		number_loop: WHILE @n <= 6 DO
				-- HALL VIP 5 x 6
				INSERT INTO `kinodev_local`.`Seats` (`HallId`, `Row`, `Number`) VALUES ('3', @r, @n);
			set @n = @n + 1;
		END WHILE number_loop;
       set @r = @r + 1;       
    END WHILE row_loop; 
    
	set @r = 1;
	row_loop: WHILE @r <= 15 DO
		set @n = 1;
		number_loop: WHILE @n <= 20 DO
				-- HALL GRAND 15 x 20
				INSERT INTO `kinodev_local`.`Seats` (`HallId`, `Row`, `Number`) VALUES ('4', @r, @n);
			set @n = @n + 1;
		END WHILE number_loop;
       set @r = @r + 1;
    END WHILE row_loop; 

END$$
DELIMITER ;

call seats_loop();