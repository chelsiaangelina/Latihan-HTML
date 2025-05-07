-- membuat dan menggunakan database 
CREATE DATABASE IF NOT EXISTS siakad_24200011;
USE siakad_24200011;

-- membuat dan melihat tabel kelas
CREATE TABLE kelas (
    kelas_id INT NOT NULL AUTO_INCREMENT,
    kode_kelas VARCHAR(5) NOT NULL,
    nama_kelas VARCHAR(15) NOT NULL,
    PRIMARY KEY (kelas_id)
)ENGINE=INNODB;

DESCRIBE kelas;

-- membuat dan melihat tabel mahasiswa
CREATE TABLE mahasiswa (
nim VARCHAR(8),
kelas_id INT(2),
nama VARCHAR(50) NOT NULL,
PASSWORD VARCHAR(32) NOT NULL,
email VARCHAR(75) NOT NULL,
PRIMARY KEY (nim),
FOREIGN KEY (kelas_id) REFERENCES kelas(kelas_id)
ON DELETE CASCADE
ON UPDATE CASCADE
)ENGINE=INNODB;
DESCRIBE mahasiswa;

-- membuat dan melihat tabel dosen
CREATE TABLE dosen (
nip VARCHAR(12) NOT NULL,
nama_dosen VARCHAR(50) NOT NULL,
password_dosen VARCHAR(32) NOT NULL,
email_dosen VARCHAR(75) NOT NULL,
PRIMARY KEY(nip)
);
DESCRIBE dosen;

-- membuat dan melihat tabel mata_kuliah
CREATE TABLE mata_kuliah(
kode_mk VARCHAR(6) NOT NULL,
nama_mk VARCHAR(30) NOT NULL,
sks INT(1) NOT NULL,
PRIMARY KEY(kode_mk)
);
DESCRIBE mata_kuliah;

-- membuat tabel dan melihat tabel sesi
CREATE TABLE sesi (
kode_sesi INT(3) AUTO_INCREMENT,
hari VARCHAR(6) NOT NULL,
sesi VARCHAR(22) NOT NULL,
PRIMARY KEY (kode_sesi)
) ENGINE=INNODB;
DESCRIBE sesi;

-- membuat dan melihat jadwal_kuliah
CREATE TABLE jadwal_kuliah (
jadwal_id INT(5) AUTO_INCREMENT,
nim VARCHAR(8),
nip VARCHAR(12),
kode_mk VARCHAR(6),
kode_sesi INT(3),
tanggal_input DATE,
jam_input TIME, 
PRIMARY KEY (jadwal_id),
FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
FOREIGN KEY (nip) REFERENCES dosen(nip),
FOREIGN KEY (kode_mk) REFERENCES mata_kuliah(kode_mk),
FOREIGN KEY (kode_sesi) REFERENCES sesi(kode_sesi),
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=INNODB;
DESCRIBE jadwal_kuliah;

-- 