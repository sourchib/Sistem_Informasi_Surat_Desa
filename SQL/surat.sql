-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Bulan Mei 2020 pada 10.34
-- Versi server: 10.1.30-MariaDB
-- Versi PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `surat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_buatsurat`
--

CREATE TABLE `tb_buatsurat` (
  `id_buat` int(11) NOT NULL,
  `no_permohonan` int(11) NOT NULL,
  `nik` int(80) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `tgl_buat` varchar(30) NOT NULL,
  `keperluan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_datapenduduk`
--

CREATE TABLE `tb_datapenduduk` (
  `nik` int(80) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `agama` varchar(30) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` varchar(40) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `pendidikan` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `rt` int(10) NOT NULL,
  `rw` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_datapenduduk`
--

INSERT INTO `tb_datapenduduk` (`nik`, `nama`, `kelamin`, `agama`, `tempat_lahir`, `tgl_lahir`, `alamat`, `pendidikan`, `status`, `rt`, `rw`) VALUES
(11221, 'siti', 'Perempuan', 'islam', 'blitar', '1987-05-28', 'bence 2', 'S1', 'ibu rumah tangga', 2, 2),
(12344, 'habib', 'Laki-Laki', 'islam', 'blitar', '2001-06-05', 'ludoyo', 'sma', 'bekerja', 2, 4),
(12345, 'Muhammad charis', 'Laki-Laki', 'Islam', 'blitar', '2000-05-10', 'bence', 'SMA', 'pelajar', 2, 2),
(21332, 'nadya', 'Perempuan', 'islam', 'blitar', '0200-08-06', 'bence 2', 'd1', 'bekerja', 3, 4),
(32101, 'Anisa Intan', 'Perempuan', 'islam', 'blitar', '2005-11-22', 'tumpang', 'sma', 'bekerja', 2, 2),
(54321, 'Ridho Nasruallah', 'Laki-Laki', 'islam', 'blitar', '2007-05-05', 'bence 1', 'smp', 'pelajar', 2, 2),
(55441, 'dino', 'Laki-Laki', 'islam', 'blitar', '2008-05-04', 'bence 1', 'mts', 'pelajar', 2, 2),
(55555, 'muchib', 'Laki-Laki', 'islam', 'Blitar', '1999-07-30', 'bence garum', 'SMK', 'pelajar', 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenissurat`
--

CREATE TABLE `tb_jenissurat` (
  `id_surat` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jenissurat`
--

INSERT INTO `tb_jenissurat` (`id_surat`, `jenis_surat`) VALUES
(1, 'SURAT KETERANGAN CATATAN KEPOLISIAN'),
(2, 'SURAT KETERANGAN TIDAK MAMPU'),
(3, 'SURAT KETERANGAN TANDA PENDUDUK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_permohonan`
--

CREATE TABLE `tb_permohonan` (
  `no_permohonan` int(11) NOT NULL,
  `nik` int(80) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `keperluan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nik` int(80) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nik`, `nama`, `password`, `id_role`) VALUES
(1, 55555, 'muchib', 'admin', 1),
(2, 12345, 'charis', 'user', 2),
(3, 54321, 'ridho', 'user', 2),
(4, 55441, 'dino', 'user4', 2),
(5, 11221, 'siti', 'user5', 2),
(6, 21332, 'nadya', 'user', 2),
(7, 11221, 'sania', 'user', 2),
(8, 12344, 'habib', 'user', 2),
(9, 32101, 'anisa', 'user', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id_role` int(11) NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id_role`, `status`) VALUES
(1, 'staf'),
(2, 'penduduk');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_buatsurat`
--
ALTER TABLE `tb_buatsurat`
  ADD PRIMARY KEY (`id_buat`),
  ADD KEY `nik` (`nik`),
  ADD KEY `no_permohonan` (`no_permohonan`);

--
-- Indeks untuk tabel `tb_datapenduduk`
--
ALTER TABLE `tb_datapenduduk`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `tb_jenissurat`
--
ALTER TABLE `tb_jenissurat`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indeks untuk tabel `tb_permohonan`
--
ALTER TABLE `tb_permohonan`
  ADD PRIMARY KEY (`no_permohonan`),
  ADD KEY `nik` (`nik`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `nik` (`nik`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_buatsurat`
--
ALTER TABLE `tb_buatsurat`
  MODIFY `id_buat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_jenissurat`
--
ALTER TABLE `tb_jenissurat`
  MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_permohonan`
--
ALTER TABLE `tb_permohonan`
  MODIFY `no_permohonan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_buatsurat`
--
ALTER TABLE `tb_buatsurat`
  ADD CONSTRAINT `tb_buatsurat_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `tb_datapenduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_permohonan`
--
ALTER TABLE `tb_permohonan`
  ADD CONSTRAINT `tb_permohonan_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `tb_datapenduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `user_role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
