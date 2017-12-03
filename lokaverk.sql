use 1608984379_lokaverk;
#1-2
create table Membership(
	MEM_NUM int not null primary key,
    MEM_FNAME varchar(50),
    MEM_LNAME varchar(50),
    MEM_STREET varchar(50),
    MEM_CITY varchar(50),
    MEM_STATE varchar(5),
    MEM_ZIP int(10),
    MEM_BALANCE decimal
);

insert into Membership
values 
(102, 'Tami', 'Dawson', '2632 Takli Circle', 'Norene', 'TN', 37136, 11),
(103, 'Curt', 'Knight', '4025 Cornell Court', 'Flatgap', 'KY', 41219, 6),
(104, 'Jamal', 'Melendez', '788 East 145th Avenue', 'Quebeck', 'TN', 38579, 0),
(105, 'Iva', 'Mcclain', '6045 Musket Ball Circle', 'Summit', 'KY', 42783, 15),
(106, 'Miranda', 'Parks', '4469 Maxwell Place', 'Germantown', 'TN', 38183, 0),
(107, 'Rosario', 'Elliott', '7578 Danner Avenue', 'Columbia', 'TN', 38402, 5),
(108, 'Mattie', 'Guy', '4390 Evergreen Street', 'Lily', 'KY', 40740, 0),
(109, 'Clint', 'Ochoa', '1711 Elm Street', 'Greeneville', 'TN', 37745, 10),
(110, 'Lewis', 'Rosales', '4524 Southwind Circle', 'Counce', 'TN', 38326, 0),
(111, 'Stacy', 'Mann', '2789 East Cook Avenue', 'Murfreesboro', 'TN', 37132, 8),
(112, 'Luis', 'Trujillo', '7267 Melvin Avenue', 'Heiskell', 'TN', 37754, 3),
(113, 'Minnie', 'Gonzales', '6430 Vasili Drive', 'Williston', 'TN', 38076, 0);

create table Rental(
	RENT_NUM int not null primary key,
    RENT_DATE date,
    MEM_NUM int not null,
    foreign key (MEM_NUM) references Membership(MEM_NUM)
);

insert into Rental
values 
(1001, '09-03-01', 103),
(1002, '09-03-01', 105),
(1003, '09-03-02', 102),
(1004, '09-03-02', 110),
(1005, '09-03-02', 111),
(1006, '09-03-02', 107),
(1007, '09-03-02', 104),
(1008, '09-03-03', 105),
(1009, '09-03-03', 111);

Create table Price(
	PRICE_CODE int not null primary key,
    PRICE_DESCRIPTION varchar(50),
    PRICE_RENTFEE decimal(5,2), 
    PRICE_DAILYLATEFEE decimal(5,2)
);

insert into Price
values
(1, 'Standard', 2, 1),
(2, 'New Release', 3.5, 3),
(3, 'Discount', 1.5, 1),
(4, 'Weekly Special', 1, 0.5);

create table Movie(
	MOVIE_NUM int not null primary key,
	MOVIE_TITLE varchar(50),
    MOVIE_YEAR int(4),
    MOVIE_COST decimal(10,2),
    MOVIE_GENRE varchar(20),
    PRICE_CODE int not null,
    foreign key (PRICE_CODE) references Price(PRICE_CODE)
);

insert into Movie
values
(1234, 'The Cesar Family Christmas', 2007, 39.95, 'Family', 2),
(1235, 'Smokey Mountain Wildlife', 2004, 59.95, 'Action', 1),
(1236, 'Richard Goodhope', 2008, 59.95, 'Drama', 2),
(1237, 'Beatnik Fever', 2007, 29.95, 'Comedy', 2),
(1238, 'Constant Companion', 2008, 89.95, 'Drama', 2),
(1239, 'Where Hope Dies', 1998, 25.49, 'Drama', 3),
(1245, 'Time to Burn', 2005, 45.49, 'Action', 1),
(1246, 'What He Doesnt´t Know', 2006, 58.29, 'Comedy', 1);

create table Video(
	VID_NUM int not null primary key,
    VID_INDATE date,
    MOVIE_NUM int not null,
    foreign key(MOVIE_NUM) references Movie(MOVIE_NUM)
    
);

insert into Video
values
(54321, '18-06-18', 1234),
(54324, '18-06-18', 1234),
(54325, '18-06-18', 1234),
(34341, '07-01-22', 1235),
(34342, '07-01-22', 1235),
(34366, '09-03-02', 1236),
(34367, '09-03-02', 1236),
(34368, '09-03-02', 1236),
(34369, '09-03-02', 1236),
(44392, '08-10-21', 1237),
(44397, '08-10-21', 1237),
(59237, '09-02-14', 1237),
(61388, '07-01-25', 1239),
(61353, '06-01-28', 1245),
(61354, '06-01-28', 1245),
(61367, '30-07-08', 1246),
(61369, '30-07-08', 1246);

create table DetailRental(
	RENT_NUM int not null,
    VID_NUM int not null,
    DETAIL_FEE decimal(5,1),
    DETAIL_DUEDATE date,
    DETAIL_RETURNDATE date,
	DETAIL_DAILYLATEFEE decimal,
    foreign key (RENT_NUM) references Rental(RENT_NUM),
    foreign key (VID_NUM) references Video(VID_NUM)
);

insert into DetailRental
values
(1001, 34342, 2, '09-03-04', '09-03-02', 1),
(1001, 61353, 2, '09-03-04', '09-03-03', 1),
(1002, 59237, 3.5, '09-03-04', '09-03-04', 3),
(1003, 54325, 3.5, '09-03-04', '09-03-09', 3),
(1003, 61369, 2, '09-03-06', '09-03-09', 1),
(1003, 61388, 0, '09-03-06', '09-03-09', 1),
(1004, 44392, 3.5, '09-03-05', '09-03-07', 3),
(1004, 34367, 3.5, '09-03-05', '09-03-07', 3),
(1004, 34341, 2, '09-03-07', '09-03-07', 1),
(1005, 34342, 2, '09-03-07', '09-03-05', 1),
(1005, 44397, 3.5, '09-03-05', '09-03-05', 3),
(1006, 34366, 3.5, '09-03-05', '09-03-04', 3),
(1006, 61367, 2, '09-03-07', null, 1),
(1007, 34368, 3.5, '09-03-05', null, 3),
(1008, 34369, 3.5, '09-03-05', '09-03-05', 3),
(1009, 54324, 3.5, '09-03-05', null, 3),
(1001, 34366, 3.5, '09-03-04', '09-03-02', 3);

#3
SELECT movie_title, movie_year, movie_cost FROM movie
WHERE movie_title like '%Hope%' ORDER BY movie_title asc;

#4
SELECT movie_title, movie_year, movie_genre FROM movie
WHERE movie_genre = 'Action';

#5
SELECT movie_num, movie_title, movie_cost FROM movie
WHERE movie_cost > 40;

#6
SELECT movie_num, movie_title, movie_cost, movie_genre FROM movie
WHERE movie_cost < 50 and movie_genre in ('Action', 'Comedy') ORDER BY movie_genre asc; 

#7
SELECT movie_num, concat(movie_title, ' (',movie_year, ')  ', upper(movie_genre))  AS 'Movie Description' FROM movie;

#8
SELECT movie_genre, count(movie_genre) as 'Number of Movies' FROM movie
GROUP BY movie_genre;

#9
SELECT AVG(movie_cost) as 'Average Movie Cost' FROM movie;

#10
SELECT movie_genre, AVG(movie_cost) AS 'Average Cost' FROM movie
GROUP BY movie_genre;

#11
SELECT movie.movie_title, movie.movie_genre, price.price_description, price.price_rentfee FROM movie
JOIN price on price.price_code = movie.price_code
WHERE price.price_code = movie.price_code;

#12
SELECT movie.movie_genre, AVG(price.price_rentfee) FROM movie
JOIN price on price.price_code = movie.price_code
GROUP BY movie.movie_genre;

#13
SELECT movie_title, movie_year, movie_cost / price_rentfee AS 'Breakeven Rentals' FROM movie, price 
where movie.price_code = price.price_code;

#14
SELECT movie_title, movie_year FROM movie, price
WHERE price.price_code = movie.price_code;

#15
SELECT movie_title, movie_year, movie_cost FROM movie
WHERE movie_cost BETWEEN 44.99 AND 49.44;

#16
SELECT movie_title, movie_year, price_description, price_rentfee, movie_genre FROM movie, price
WHERE price.price_code = movie.price_code AND movie_genre IN ('Family', 'Comedy', 'Drama');

#17
SELECT MIN(mem_balance) as 'Maximum Balance', MAX(mem_balance) as 'Maximum Balance', AVG(mem_balance) AS 'Average Balance' FROM membership, rental
WHERE membership.mem_num = rental.mem_num; 

#18
SELECT concat(mem_fname, ' ', mem_lname) AS 'Membership Name', concat(mem_street, ', ', mem_city, ', ', mem_state, ' ', mem_zip) AS 'Membership Address' FROM membership;

#19
SELECT rental.rent_num, rent_date, video.vid_num, movie_title, detail_duedate, detail_returndate FROM rental, movie, video, detailrental
WHERE rental.rent_num = detailrental.rent_num
AND detailrental.vid_num = video.vid_num
AND video.movie_num = movie.movie_num
AND detailrental.detail_duedate < detailrental.detail_returndate
order by rental.rent_num, movie_title;

#20
SELECT rental.rent_num, rent_date, video.vid_num, movie_title, detail_duedate, detail_returndate, DATEDIFF(detailrental.detail_returndate, detailrental.detail_duedate) AS 'Days Past Due' FROM rental, movie, video, detailrental
WHERE rental.rent_num = detailrental.rent_num
AND detailrental.vid_num = video.vid_num
AND video.movie_num = movie.movie_num
AND detailrental.detail_duedate < detailrental.detail_returndate
order by rental.rent_num, movie_title;

#21
SELECT rental.rent_num, rent_date, movie_title, detail_fee FROM rental, movie, video, detailrental
WHERE rental.rent_num = detailrental.rent_num
AND detailrental.vid_num = video.vid_num
AND video.movie_num = movie.movie_num
AND detailrental.detail_duedate >= detailrental.detail_returndate
order by rental.rent_num, movie_title;

#22
SELECT membership.mem_num, mem_lname, mem_fname, sum(detail_fee) AS 'Rental Fee Revenue' FROM rental, detailrental, membership
WHERE membership.mem_num = rental.mem_num
AND rental.rent_num = detailrental.rent_num
group by membership.mem_num;

#23
SELECT movie.movie_num, movie.movie_genre, avgcost AS 'Average Cost', movie_cost, (movie_cost - avgcost)/avgcost*100 as 'Percent Dififrence'
FROM movie, (SELECT movie_genre, avg(movie_cost) AS avgcost FROM movie group by movie_genre) as s
WHERE movie.movie_genre = s.movie_genre;

#24
ALTER TABLE DetailRental ADD DETAIL_DAYSLATE int(3) null;

#25
ALTER TABLE Video ADD VID_STATUS varchar(4) default 'IN' NOT NULL check(VID_STATUS IN('IN', 'OUT', 'LOST'));

#26;
UPDATE Video 
SET vid_status = 'OUT'
WHERE vid_num in (SELECT vid_num FROM detailrental WHERE detail_returndate is null);

#27
ALTER TABLE Price ADD PRICE_RENTDAYS int(2) default 3 not null;

#28
UPDATE Price 
SET price_rentdays = 5
WHERE price_code in (1,3);

UPDATE Price 
SET price_rentdays = 7
WHERE price_code = 4;

delimiter //
#29
/*CREATE TRIGGER trg_late_return
BEFORE UPDATE OF detail_returndate, detail_duedate ON detailrental
FOR EACH ROW 
BEGIN 
		IF new.detail_returndate is null then
			UPDATE detailrental 
            set detail_dayslate = null;
        end if;
        
END;//*/

#31
CREATE procedure prc_new_rental(in member_num int)
begin 
	declare mem_num_count int;
	set mem_num_count = (select count(*) from membership where mem_num = member_num);
    if mem_num_count = 0 then
		select 'This memember doesnt exist' as 'Not Found';	
	else
		select concat('Previous balance: ', mem_balance) as 'Found' from membership
        where mem_num = member_num;
	end if;
end;//

call prc_new_rental(104);

#32
