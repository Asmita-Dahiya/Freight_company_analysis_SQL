use sqlbasics;
-- Upload the FreightRates.csv dataset to the lab
-- Import freightRates.csv into the database as a table
select * from freightrates;

-- Create a VIEW and name it FR_GROUND and use it to display the record of the FreightRates table for the orders transported via GROUND:
create view fr_ground as select * from freightrates where mode_dsc = 'ground';
select * from fr_ground;

-- count the records of fr_ground:
select count(*) from fr_ground;

-- Create a VIEW and name it FR_GROUND and use it to display the record of the FreightRates table for the orders transported via Air:
create view fr_air as select * from freightrates where mode_dsc = 'air';
select * from fr_air;

-- count the records of fr_air:
select count(*) from fr_air;

-- Create a VIEW and name it FR_V1 with mode_dsc and the average rate for each type of value in the mode_dsc column:
create view fr_v1 as select mode_dsc, avg(rate) from freightrates group by mode_dsc;
select * from fr_v1;

-- Alter the VIEW FR_V1 by replacing the column mode_dsc with carrier:
create or replace view fr_v1 as select carrier, avg(rate) from freightrates group by carrier;
select * from fr_v1;

-- Rename the VIEW FR_V1 as FR_GROUPED_DATA:
rename table fr_v1 to fr_grouped_data;
select * from fr_grouped_data;

-- Create a VIEW with the carrier and mode_dsc columns using WITH CHECK option to make sure that mode_dsc accepts no entry other than AIR or GROUND:
create view fr_v2 as select carrier, mode_dsc from freightrates
where mode_dsc in ('air','ground')
with check option;

select * from fr_v2;

insert into fr_v2 (carrier, mode_dsc) values ('V444_9','water');
