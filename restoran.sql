-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Nov 2022 pada 08.38
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `nmMenu` char(50) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`idMenu`, `nmMenu`, `harga`) VALUES
(1, 'Nasi Goreng', 30000),
(2, 'Bebek Madura', 15000),
(5, 'Tahu Bulat', 500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idPelanggan` int(11) NOT NULL,
  `nmPelanggan` varchar(255) NOT NULL,
  `jk` char(10) NOT NULL,
  `noHP` char(13) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`idPelanggan`, `nmPelanggan`, `jk`, `noHP`, `alamat`) VALUES
(1, 'Kiyul', 'Laki-Laki', '9248342904', 'Bekasi'),
(5, 'Mumtaz', 'Laki-Laki', '085776594448', 'Bekasi'),
(6, 'Eri', 'Laki-Laki', '08238238328', 'Jakarta'),
(7, 'Ucup', 'Laki-Laki', '082723723', 'Bekasi, Pasar Kecapi'),
(8, 'al', 'Laki-Laki', '123123', 'afeaeaffea'),
(9, 'kiyul', 'Laki-Laki', '1234567890', 'Bekasi'),
(10, 'Hakim', 'Laki-Laki', '08439292', 'Jl'),
(11, 'Mumtaz', 'Laki-Laki', '9238829', 'Bekasi'),
(12, '', 'Laki-Laki', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `idPesanan` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL,
  `idPelanggan` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`idPesanan`, `idMenu`, `idPelanggan`, `jumlah`) VALUES
(1, 1, 1, 2),
(8, 4, 5, 3),
(9, 2, 7, 5),
(10, 4, 8, 2),
(11, 1, 1, 1),
(12, 1, 5, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `idTransaksi` int(11) NOT NULL,
  `idPesanan` int(11) NOT NULL,
  `idPelanggan` int(11) NOT NULL,
  `nmMenu` char(55) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `status` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`idTransaksi`, `idPesanan`, `idPelanggan`, `nmMenu`, `jumlah`, `harga`, `total`, `bayar`, `kembalian`, `status`) VALUES
(1, 1, 1, 'Nasi Goreng', 2, 30000, 60000, 70000, 10000, 'Paid'),
(2, 8, 5, 'Alpukat', 3, 5000, 15000, 20000, 5000, 'Paid'),
(3, 10, 8, 'Alpukat', 2, 5000, 0, 0, 0, 'Paid'),
(4, 11, 1, 'Nasi Goreng', 1, 30000, 30000, 50000, 20000, 'Paid'),
(5, 9, 7, 'Bebek Madura', 5, 15000, 50000, 50000, 0, 'Paid'),
(6, 10, 8, 'Alpukat', 2, 5000, 0, 0, 0, 'Paid'),
(7, 12, 5, 'Nasi Goreng', 4, 30000, 120000, 130000, 10000, 'Paid');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `nmUser` char(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lvl` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`idUser`, `nmUser`, `password`, `lvl`) VALUES
(1, 'admin', 'admin', 'ADM'),
(2, 'waiter', 'waiter', 'WAIT'),
(3, 'kasir', 'kasir', 'KSR'),
(4, 'owner', 'owner', 'OWN');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idPelanggan`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`idPesanan`),
  ADD KEY `idMenu` (`idMenu`),
  ADD KEY `idPelanggan` (`idPelanggan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idTransaksi`),
  ADD KEY `idPesanan` (`idPesanan`),
  ADD KEY `idPelanggan` (`idPelanggan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `idMenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idPelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `idPesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `idTransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
