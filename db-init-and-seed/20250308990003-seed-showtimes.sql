USE kinodev_local;

-- Showtimes
DROP procedure if exists showtimes_loop;
DELIMITER $$

CREATE PROCEDURE showtimes_loop()
BEGIN
	set @counter = 1;
    set @yesterday_date = DATE(DATE_SUB(NOW(), INTERVAL 1 DAY));

    set @movieA = 1001;
    set @movieB = 1002;
    set @movieC = 1003;
    set @movieD = 1004;    
    set @movieE = 1005;

    set @weekAdjustment = 5;
    set @endOfWeekCounter = 1;
    
    my_loop: WHILE @counter < 28 DO
		set @dayToSet = DATE(DATE_ADD(@yesterday_date, INTERVAL 1 DAY));

        set @time1200 = CONCAT(date_format(@dayToSet, '%Y-%m-%d'), ' 12:00:00');
        set @time1700 = CONCAT(date_format(@dayToSet, '%Y-%m-%d'), ' 17:00:00');
        set @time2000 = CONCAT(date_format(@dayToSet, '%Y-%m-%d'), ' 20:00:00');

        if @counter > 1 AND @counter % 7 = 0 THEN
            set @movieA = @movieA + @weekAdjustment;
            set @movieB = @movieB + @weekAdjustment;    
            set @movieC = @movieC + @weekAdjustment;
            set @movieD = @movieD + @weekAdjustment;
            set @movieE = @movieE + @weekAdjustment;
            
            set @endOfWeekCounter = 1;
        END IF;  

        SELECT @counter, @dayToSet, @time1200, @time1700, @time2000, @endOfWeekCounter;

        if @endOfWeekCounter < 5 THEN
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieA, '1', @time1200, '15');  
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieA, '1', @time1700, '20');
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieA, '1', @time2000, '20');  

            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieB, '2', @time1200, '15');  
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieB, '2', @time1700, '20');
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieB, '2', @time2000, '20'); 
        ELSE
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieA, '1', @time1200, '15');  
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieA, '1', @time1700, '20');

            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieC, '1', @time2000, '20'); 

            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieB, '2', @time1200, '15');  
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieB, '2', @time1700, '20');

            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieD, '2', @time2000, '20');  
        END IF;

        if @counter % 2 = 0 THEN
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieA, '4', @time1700, '20');  
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieB, '4', @time2000, '20'); 
        ELSE
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieC, '4', @time1700, '20');  
            INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieD, '4', @time2000, '20'); 
        END IF;

        INSERT INTO `kinodev_local`.`ShowTimes` (`MovieId`, `HallId`, `Time`, `Price`) VALUES (@movieE, '3', @time2000, '25'); 

       set @endOfWeekCounter = @endOfWeekCounter + 1;
       set @counter = @counter + 1;
       set @yesterday_date = @dayToSet;
    END WHILE my_loop;
END$$
DELIMITER ;

call showtimes_loop();

