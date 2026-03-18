CREATE TABLE car_2025 (
type VARCHAR (200),
year_2024 INT,
year_2025 INT,
per_change DECIMAL (5, 2),
mkt_share_2025 DECIMAL(5, 2),
mkt_share_2024 DECIMAL (5, 2));

INSERT INTO car_2025
VALUES 
('Diesel', 6175, 7060, -12.50, 4.20, 5.00),
('Petrol', 57607, 59455, -3.10, 39.40, 42.20),
('BEV', 47139, 43656, 8.00, 32.20, 31.00),
('PHEV', 16868, 12716, 32.90, 11.60, 9.00),
('HEV', 18430, 17899, 3.00, 12.60, 12.70);

ALTER TABLE car_2025 
RENAME COLUMN mkt_share_2025 to mkt_share_pct_2025,
RENAME COLUMN mkt_share_2024 to mkt_share_pct_2024;

CREATE TABLE top_models_bev (
model_rank INT,
model VARCHAR (200),
sale INT);

INSERT INTO top_models_bev
VALUES
(1, 'Tesla Model Y', 24298),
(2, 'Tesla Model 3', 21188),
(3, 'Audi Q4 e-tron', 14433),
(4, 'Audi Q6 e-tron', 13148),
(5, 'Ford Explorer', 12237),
(6, 'BMW i4',12158),
(7, 'Skoda Enyaq',11940),
(8,	'Kia EV3', 11188),
(9,	'Skoda Elroq', 10713),
(10,'Volvo EX30',10289);

CREATE TABLE ytd (
type VARCHAR (200),	
ytd_2025 INT,	
ytd_2024 INT,	
per_change DECIMAL (5,2),	
mkt_share_25 DECIMAL (5,2),	
mkt_share_24 DECIMAL (5,2)
);

INSERT INTO ytd 
VALUES
('Diesel', 103906, 123104, -15.60, 5.10, 6.30),
('Petrol', 937938, 1019128, -8.00, 46.40, 52.20),
('BEV', 473348, 381970, 23.90, 23.40, 19.60),
('PHEV', 225143, 167178, 34.70, 11.10, 8.60),
('HEV', 280185, 261398, 7.20, 13.90, 13.40);

ALTER TABLE ytd 
RENAME COLUMN mkt_share_25 to mkt_share_pct_2025,
RENAME COLUMN mkt_share_24 to mkt_share_pct_2024;

