
delimiter //
create trigger trg_cancel_ticket
after insert on airline_reservation_system.cancel_ticket
for each row
begin
	update airline_reservation_system.ticket_info
	set status='cancel'
	where ticket_id=new.ticket_id;	
end;
//

delimiter //
create procedure flight_schedule()
begin
   declare v_counter int default 0;
    declare v_max int default 7;
  while v_counter < v_max do
    INSERT INTO airline_reservation_system.flight_details
        (flight_id,airline_name, from_location,to_location,departure_time,arrival_time,departure_date,total_seats,economy,business,premium,first_class)VALUES
        ('AA001','AirAsia','Kolkata','Chennai','14:00:00','16:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('AA002','AirAsia','Kolkata','PUNE','09:00:00','11:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('AA003','AirAsia','Kolkata','DELHI','10:00:00','18:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('AA004','AirAsia','Kolkata','MUMBAI','11:00:00','17:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('AA005','AirAsia','Kolkata','PATNA','01:00:00','05:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('AI001','AirIndia','Kolkata','Chennai','14:00:00','16:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('AI002','AirIndia','Kolkata','PUNE','09:00:00','11:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('AI003','AirIndia','Kolkata','DELHI','10:00:00','18:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('AI004','AirIndia','Kolkata','MUMBAI','11:00:00','17:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('AI005','AirIndia','Kolkata','PATNA','01:00:00','05:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('IND001','Indigo','Kolkata','Chennai','14:00:00','16:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('IND002','Indigo','Kolkata','PUNE','09:00:00','11:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('IND003','Indigo','Kolkata','DELHI','10:00:00','18:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('IND004','Indigo','Kolkata','MUMBAI','11:00:00','17:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('IND005','Indigo','Kolkata','PATNA','01:00:00','05:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('KF001','KingFisher','Kolkata','Chennai','14:00:00','16:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('KF002','KingFisher','Kolkata','PUNE','09:00:00','11:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('KF003','KingFisher','Kolkata','DELHI','10:00:00','18:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('KF004','KingFisher','Kolkata','MUMBAI','11:00:00','17:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('KF005','KingFisher','Kolkata','PATNA','01:00:00','05:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('SJ001','Spicejet','Kolkata','Chennai','14:00:00','16:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('SJ002','Spicejet','Kolkata','PUNE','09:00:00','11:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('SJ003','Spicejet','Kolkata','DELHI','10:00:00','18:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('SJ004','Spicejet','Kolkata','MUMBAI','11:00:00','17:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50)
        ,('SJ005','Spicejet','Kolkata','PATNA','01:00:00','05:00:00',date_add(curdate(),interval v_counter day),300,100,100,50,50);
    set v_counter=v_counter+1;
  end while;
end;
//
delimiter ;

SET GLOBAL event_scheduler = ON;
show processlist;


delimiter //
CREATE EVENT IF NOT EXISTS flight_schedule_event
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 7 DAY
    ON COMPLETION PRESERVE    
    DO
BEGIN
	call flight_schedule;
END;
//
delimiter ;




