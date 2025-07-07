USE kinodev_local;

-- Showtimes
DROP procedure if exists showtimes_loop;
DELIMITER $$

CREATE PROCEDURE showtimes_loop()
BEGIN
	set @counter = 1;
    set @yesterday_date = DATE(DATE_SUB(NOW(), INTERVAL 1 DAY));



    my_loop: WHILE @counter < 20 DO
		set @dayToSet = DATE(DATE_ADD(@yesterday_date, INTERVAL 1 DAY));

        set @time1200 = CONCAT(date_format(@dayToSet, '%Y-%m-%d'), ' 12:00:00');
        set @time1500 = CONCAT(date_format(@dayToSet, '%Y-%m-%d'), ' 15:00:00');
        set @time1800 = CONCAT(date_format(@dayToSet, '%Y-%m-%d'), ' 18:00:00');
        set @time2100 = CONCAT(date_format(@dayToSet, '%Y-%m-%d'), ' 21:00:00');

        if(@counter % 2 = 0) THEN
            set @movie_01 = 1001;
            set @movie_02 = 1003;
            set @movie_03 = 1005;
            set @movie_04 = 1007;
            set @movie_05 = 1009;
            set @movie_06 = 1011;    
            set @movie_07 = 1013;
            set @movie_08 = 1015; 
            set @movie_09 = 1017; 
            set @movie_10 = 1019;  
        ELSE
            set @movie_01 = 1002;
            set @movie_02 = 1004;
            set @movie_03 = 1006;
            set @movie_04 = 1008;
            set @movie_05 = 1010;
            set @movie_06 = 1012;    
            set @movie_07 = 1014;
            set @movie_08 = 1016; 
            set @movie_09 = 1018; 
            set @movie_10 = 1020;  
        END IF;

        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_01, '1', @time1200, '15');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_02, '2', @time1200, '15');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_03, '3', @time1200, '15');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_04, '4', @time1200, '15');

        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_05, '1', @time1500, '15');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_06, '2', @time1500, '15');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_07, '3', @time1500, '15');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_08, '4', @time1500, '15');

        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_01, '1', @time1800, '20');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_02, '2', @time1800, '20');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_03, '3', @time1800, '20');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_04, '4', @time1800, '20');

        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_05, '1', @time2100, '20');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_06, '2', @time2100, '20');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_07, '3', @time2100, '20');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_01, '4', @time2100, '20'); 

        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_09, '5', @time1800, '25');
        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movie_10, '5', @time2100, '25');        

       set @counter = @counter + 1;
       set @yesterday_date = @dayToSet;
    END WHILE my_loop;
END$$
DELIMITER ;

call showtimes_loop();

