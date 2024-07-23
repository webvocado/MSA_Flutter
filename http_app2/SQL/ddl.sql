-- Active: 1719384389661@@127.0.0.1@3306@joeun
CREATE TABLE `board` (
    `no` int NOT NULL AUTO_INCREMENT,
    `title` varchar(100) NOT NULL,
    `writer` varchar(100) NOT NULL,
    `content` text,
    `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `views` int NOT NULL DEFAULT '0',
    PRIMARY KEY (`no`)
);


INSERT INTO `board` (`title`, `writer`, `content`, `reg_date`, `upd_date`, `views`)
VALUES 
('첫 번째 게시물', '작성자1', '이것은 첫 번째 게시물의 내용입니다.', '2024-07-18 10:00:00', '2024-07-18 10:00:00', 10),
('두 번째 게시물', '작성자2', '이것은 두 번째 게시물의 내용입니다.', '2024-07-18 11:00:00', '2024-07-18 11:00:00', 20),
('세 번째 게시물', '작성자3', '이것은 세 번째 게시물의 내용입니다.', '2024-07-18 12:00:00', '2024-07-18 12:00:00', 30),
('네 번째 게시물', '작성자4', '이것은 네 번째 게시물의 내용입니다.', '2024-07-18 13:00:00', '2024-07-18 13:00:00', 40),
('다섯 번째 게시물', '작성자5', '이것은 다섯 번째 게시물의 내용입니다.', '2024-07-18 14:00:00', '2024-07-18 14:00:00', 50);
