 --Blog saytı databazası qurursunuz
  --Saytda istifadəçilər (Users table), paylaşılan postlar (Posts table) .  Hər post bir istifadəçiyə aiddir. Bir istifadəçi istədiyi sayda post paylaşa bilər.
--Bu databza sturukturunu dbdesigner saytında qrurub screenini və databazanı, içindəki table-ları yaradan DDL commandlarınız və eyni zamanda hər table-a ən az 5-10 data insert etdiyiniz DML commandlarınızın olduğu sql saylını github reponuza yerləşdirib linki atırsınız.


--Table sturuklarını özünüz quracaqsınız.Sadəcə aşağıdakı columnlar mütləq olmalıdır.Aşağıdakılardan əlavə columnlar artıra bilərsiniz istəsəniz.


--Users-da Name,Surname,Email
--Posts-da LikeCount,CreatedAt, Title, UserId


--Databazanın commandlarını yazarkən aşağıdakıları nəzərə alın:
--Post-un mətni 500-dən uzun ola bilməz və null ola bilməz
--User-in Email dəyəri təkrarlana bilməz və null ola bilməz və uzunluğu 4-100 aralığında olmalıdır--

CREATE DATABASE Blog
USE Blog

CREATE TABLE Users(
ID INT Primary Key identity,
Name NVARCHAR(25),
Surname NVARCHAR(25),
Email NVARCHAR  Not Null Constraint CK_EMAIL CHECK(LEN(Email)>=4), CHECK(LEN(Email)<=100)
)


ALTER TABLE Users
Drop Constraint CK_EMAIL
ALTER TABLE Users
Add Constraint CK_EMAIL CHECK((LEN(Email)>=4) AND (LEN(Email)<=100))

ALTER TABLE Users
Drop Constraint CK__Users__Email__37A5467C

ALTER TABLE Users
Drop Column Email 
ALTER TABLE Users
Add Email NVARCHAR(200)

INSERT INTO Users
Values
( 'Asli', 'Gadirova', 'gadirova@mail.com'),
( 'Yusif', 'Gadirov', 'yusif@gmail.com'),
( 'Turan', 'Əhmədova', 'turan@gmail.com'),
( 'Asim', 'Vəliyev', 'asim@gmail.com'),
( 'Banu', 'Əliyeva' ,'banu@gmail.com'),
( 'Ləman', 'Haciyeva' ,'banu@gmail.com')


CREATE TABLE Posts(
ID INT Primary Key identity,
Title NVARCHAR (150),
PostText  NVARCHAR(250) NOT NULL,  Constraint CK_PT CHECK(LEN(PostText)<500) ,
LikeCount INT,
CreatedAt date DEFAULT getdate(),
UserId INT references Users(ID)
)


INSERT INTO Posts (Title,PostText, LikeCount,CreatedAt, UserId)
Values
('Saglamliq', 'Idman etmək sağlamlığa faydalıdır', 45, '2022-07-22', 14)
INSERT INTO Posts (Title,PostText, LikeCount,CreatedAt, UserId)
Values
('C vitamini', 'Sitrus meyveleri C vitamini ilə zəngindir', 56, '2022-07-22', 17),
('Texnologiya', 'Müasir dövrdə texnologiya həyatımızın ayrılmaz hissəsinə cevrilib', 122,'2022-07-22', 18),
('IT', 'IT sahesine gunumuzde boyuk tələb var',67,'2022-07-22', 19),
('Code academy', 'Intensiv tədrisə üstünlük verir', 643, '2022-07-22', 20),
('Netflix', 'Muxtelif janrda kinolarinin platforma',67, '2022-07-22',21)



CREATE TABLE UserPost(
ID INT Primary Key identity,
PostID INT references Posts(ID),
UserID INT references Users(ID)
)
INSERT INTO UserPost ( PostID, UserID)
VALUES 
(8, 14)
INSERT INTO UserPost ( PostID, UserID)
VALUES 
(9, 17),
(10, 18),
(11, 19),
(12, 20),
(13, 21)
