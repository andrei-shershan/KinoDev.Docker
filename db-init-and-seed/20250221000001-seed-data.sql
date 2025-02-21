USE kinodev_local;

-- Monives
INSERT INTO `kinodev_local`.`Movies` (`Id`, `Name`, `Description`, `ReleaseDate`, `Duration`) VALUES ('101', 'Shadow Horizon', 'A lone detective battles dark forces in a mysterious town', '2025-01-01', '123');
INSERT INTO `kinodev_local`.`Movies` (`Id`, `Name`, `Description`, `ReleaseDate`, `Duration`) VALUES ('102', 'Crimson Echoes', 'Hidden secrets stir as a cursed family confronts fate.', '2025-02-10', '138');
INSERT INTO `kinodev_local`.`Movies` (`Id`, `Name`, `Description`, `ReleaseDate`, `Duration`) VALUES ('103', 'Neon Abyss', 'A cyber hero dives into a futuristic city underbelly.', '2024-12-10', '241');
INSERT INTO `kinodev_local`.`Movies` (`Id`, `Name`, `Description`, `ReleaseDate`, `Duration`) VALUES ('104', 'Silent Whispers', 'Eerie secrets unravel in a quiet, haunted town.', '2024-05-05', '167');
INSERT INTO `kinodev_local`.`Movies` (`Id`, `Name`, `Description`, `ReleaseDate`, `Duration`) VALUES ('105', 'Broken Mirrors', 'Fractured realities reveal haunting truths beyond reflection.', '2024-01-10', '136');

-- Halls
INSERT INTO `kinodev_local`.`Halls` (`Id`, `Name`, `Capacity`) VALUES ('1', 'Sala A', '150');
INSERT INTO `kinodev_local`.`Halls` (`Id`, `Name`, `Capacity`) VALUES ('2', 'Sala B', '150');
INSERT INTO `kinodev_local`.`Halls` (`Id`, `Name`, `Capacity`) VALUES ('3', 'Sala VIP', '30');
INSERT INTO `kinodev_local`.`Halls` (`Id`, `Name`, `Capacity`) VALUES ('4', 'Grand Hall', '300');

-- Showtimes
DROP procedure if exists showtimes_loop;
DELIMITER $$

CREATE PROCEDURE showtimes_loop()
BEGIN
	set @counter = 1;
    set @yesterday_date = DATE(DATE_SUB(NOW(), INTERVAL 1 DAY));
    
    my_loop: WHILE @counter <= 30 DO
		set @dayToSet = DATE(DATE_ADD(@yesterday_date, INTERVAL 1 DAY));
        set @time1200 = CONCAT(date_format(@dayToSet, '%Y-%m-%d'), ' 12:00:00');
		set @time1700 = CONCAT(date_format(@dayToSet, '%Y-%m-%d'), ' 17:00:00');
		set @time2100 = CONCAT(date_format(@dayToSet, '%Y-%m-%d'), ' 21:00:00');

        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES ('101', '1', @time1200, '15');       
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES ('101', '1', @time1700, '25');       

        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES ('102', '2', @time1200, '15');       
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES ('102', '2', @time1700, '25'); 
        
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES ('103', '3', @time2100, '40');              
       
		INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES ('104', '4', @time1700, '20');
        
		INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES ('105', '4', @time2100, '20');
        
       set @counter = @counter + 1;
       set @yesterday_date = @dayToSet;
    END WHILE my_loop;
END$$
DELIMITER ;

call showtimes_loop();

-- Seats
DROP procedure if exists seats_loop;
DELIMITER $$

CREATE PROCEDURE seats_loop()
BEGIN
	set @r = 1; 
    row_loop: WHILE @r <= 10 DO
		set @n = 1;
		number_loop: WHILE @n <= 15 DO
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
				INSERT INTO `kinodev_local`.`Seats` (`HallId`, `Row`, `Number`) VALUES ('3', @r, @n);
			set @n = @n + 1;
		END WHILE number_loop;
       set @r = @r + 1;       
    END WHILE row_loop; 
    
	set @r = 1;
	row_loop: WHILE @r <= 15 DO
		set @n = 1;
		number_loop: WHILE @n <= 20 DO
				INSERT INTO `kinodev_local`.`Seats` (`HallId`, `Row`, `Number`) VALUES ('4', @r, @n);
			set @n = @n + 1;
		END WHILE number_loop;
       set @r = @r + 1;
    END WHILE row_loop; 

END$$
DELIMITER ;

call seats_loop();