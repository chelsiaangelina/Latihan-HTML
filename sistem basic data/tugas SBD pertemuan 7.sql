-- menggunakan database
USE siakad_24200011;
SHOW TABLES;

-- 2.a. mengisi tabel dengan 1 data
INSERT INTO kelas(kelas_id,kode_kelas,nama_kelas)
VALUES (1,"SA.01","STI A PAGI");
-- lihat hasilnya
SELECT * FROM kelas;

-- 2.b mengisi tabel dengan 1 data
INSERT INTO kelas(kelas_id,kode_kelas,nama_kelas)
VALUES 
(2,"SB.01","STI B SORE"),
(3,"BA.01","BD A PAGI"),
(4,"BB.01","BD B SORE");
SELECT * FROM kelas;

-- No 3. Mengisi data baru
INSERT INTO kelas(kelas_id,kode_kelas,nama_kelas)
VALUES (5,"KA.01","KWU A PAGI");
SELECT * FROM kelas;

-- No 4. mengubah data lebih dari jumlah karakter yang disediakan
UPDATE kelas SET nama_kelas="kewirrausahan A Pagi" 
WHERE kelas_id="5"; 
SELECT * FROM kelas;


-- No 5. mengupdate panjang karakter pada fised 
ALTER kelas CHANGE nama_kelas nama_kelas VARCHAR(30);
DESCRIBE kelas;


-- No 6. mengubah kembali data yang diinput agar sesuai 
UPDATE kelas SET nama_kelas="kewirausahaan A Pagi"
WHERE kelas_id=5;
SELECT * FROM kelas;


-- No 7. membuat data mata_kuliah
INSERT INTO mata_kuliah(kode_mk,nama_mk,sks)
VALUES 
("ST1005","Struktur data",3),
("BD1002","Struktur data",3),
("ST1008","Sistem basis data",3),
("BD1006","Sistem basis data",3);
SELECT * FROM mata_kuliah;

-- No 8. membuat data dosen
INSERT INTO dosen(nip,nama_dosen,password_dosen,email_dosen)
VALUES
("123001","Daniel oktodeli",MD5("123001"),"daniel@mail.com"),
("123002","william wendy",MD5("123002"),"wendy@mail.com"),
("123003","brian sebastian",MD5("123003"),"brian@mail.com");
SELECT * FROM dosen;

-- No 9. membuat data sesi
INSERT INTO sesi (kode_sesi,hari,sesi)
VALUES 
("1","senin","sesi 1 (08.00-09:40)" ),
("2","senin","sesi 2 (09.50-11:30)" ),
("3","selasa","sesi 1 (08.00-09:40)"),
("4","selasa","sesi 2 (08.00-09:40)"),
("5","selasa","sesi 3 (08.00-09:40)"),
("6","rabu","sesi 3 (08.00-09:40)"),
("7","rabu","sesi 4 (08.00-09:40)");
SELECT * FROM sesi;

-- No 10. membuat data mahasiswa
CREATE TABLE mahasiswa (
    nim VARCHAR(8),
    kelas_id INT(2) NOT NULL,
    nama VARCHAR(50) NOT NULL,
    PASSWORD VARCHAR(32) NOT NULL,
    email VARCHAR(75) NOT NULL,
    PRIMARY KEY (nim),
    FOREIGN KEY (kelas_id) REFERENCES kelas(kelas_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=INNODB;
INSERT INTO mahasiswa(nim,kelas_id,nama,PASSWORD,email)
VALUES
("24190001",1,"Andi Budiman",MD5("123abcde"),"andi.budiman@email.com"),
("24190002",1,"Cindy Wijaya",MD5("345abc22"),"cindy.wijaya@email.com"),
("24190003",2,"Kevin Wiliam",MD5("321987bb"),"kevin.wiliam@email.com"),
("24290001",3,"Melisa Gunawan",MD5("555bbb23"),"melisa.gunawan@email.com"),
("24290002",4,"Budi Hartono",MD5("389xyz99"),"budi.hartono@email.com"),
("24290003",4,"Sherly Olivia",MD5("999123xy"),"sherly.olivia@email.com");



DROP TABLE IF EXISTS mahasiswa;
-- N0 11. membuat data jadwal_kuliah


INSERT INTO jadwal_kuliah(jadwal_id,nim,nip,kode_mk,kode_sesi,tanggal_input,jam_input)
VALUES
(1,"24190001","123001","ST1008",2,"2025-04-14","09:30:23"),
(2,"24190002","123001","ST1008",2,"2025-04-14","09:31:15"),
(3,"24290002","123001","BD1006",7,"2025-04-14","09:33:10"),
(4,"24290003","123001","BD1006",7,"2025-04-14","09:35:25");
SELECT * FROM jadwal_kuliah;
SHOW TABLES;
DROP TABLES IF EXISTS mahasiswa;
