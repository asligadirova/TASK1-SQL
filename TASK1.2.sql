-- Cədvəl :
--İşçi - (SAA, VəzifəId,Maaş)
--Vəzifə - (Ad)
--Filial - (Ad)
--Məhsul - (Ad, Alış qiyməti, Satış qiyməti)
--Satış - (MəhsulId, İşçiId, Satış tarixi)
---Satış cədvəlində işçilərin , satılan məhsulların, satışın olduğu filialın, məhsulun alış və satış qiyməti yazılsın.


USE Blog
CREATE Table İşçi(
ID INT Primary Key identity,
AD NVARCHAR (25) NOT NULL,
SOYAD NVARCHAR (25) NOT NULL,
MAAŞ DEC(18,2),
VəzifəID INT REFERENCES Vəzifə(ID)
)
INSERT INTO İşçi (AD, SOYAD, MAAŞ, VəzifəID)
Values
('Asli', 'Qedirova', 1800, 1 ),
('Fərid', 'İsgendorov', 12800, 2),
('Guler', 'Ehmedova', 890, 3),
('Zəhra' , 'Quluyeva', 5600, 4),
('Ali', 'Aliyev', 7900, 5),
('Qurban', 'Qurbanov', 1670, 6)


CREATE TABLE Vəzifə(
ID INT Primary Key identity,
AD NVARCHAR (150) NOT NULL
)
INSERT INTO Vəzifə
Values 
('Satis Meneceri'),
('Filial mudiri'),
('Satici'),
('Bas kassir'),
('Anbardar')
INSERT INTO Vəzifə
Values 
('Nezaretci')

Select * from Vəzifə


CREATE TABLE Filial(
ID INT Primary Key identity,
AD NVARCHAR (50) NOT NULL
)
 INSERT INTO Filial
 Values
 ('Yasamal'),
 ('Buzovna'),
 ('Guneshli'),
 ('Bineqedi'),
 ('Sabirabad'),
 ('Goycay')

CREATE TABLE Məhsul(
ID INT Primary Key identity,
AD NVARCHAR (50) NOT NULL,
AlışQiyməti DEC (18,2) NOT NULL,
SatışQiyməti DEC (18,2) NOT NULL
)
 INSERT INTO Məhsul(AD, AlışQiyməti, SatışQiyməti)
 Values
 ('Alma', 2, 2.50),
 ('Nar', 5, 6),
 ('Heyva', 3.5, 4),
 ('Gavali', 3, 5),
 ('Ciyelek', 5, 6),
 ('Gilas', 3, 4)

 Select * From Məhsul

CREATE TABLE Satış(
ID INT Primary Key identity,
MəhsulId INT REFERENCES Məhsul(ID),
İşçiId INT REFERENCES İşçi(ID),
FilialID INT REFERENCES Filial(ID),
SatışTarixi date ,
)

INSERT INTO Satış (MəhsulId,İşçiId ,FilialID, SatışTarixi)
Values
(1, 1, 1, '2022-07-01')
INSERT INTO Satış (MəhsulId,İşçiId ,FilialID, SatışTarixi)
Values
(2, 1, 1, '2022-06-03')
INSERT INTO Satış (MəhsulId,İşçiId ,FilialID, SatışTarixi)
Values
(2, 2, 2, '2022-05-01'),
(3, 3, 3, '2022-05-11'),
(4, 3, 3, '2022-07-13')

INSERT INTO Satış (MəhsulId,İşçiId ,FilialID, SatışTarixi)
Values
(2, 1, 1, '2022-07-01')
Select * from Satış

Select * from Satış  as s
LEFT JOIN Məhsul as m
ON m.SatışQiyməti=s.MəhsulId