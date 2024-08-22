-- CreateTable
CREATE TABLE `jalur` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL,
    `aktif` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pendaftaran` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `jalurId` INTEGER NOT NULL,
    `nomor` VARCHAR(191) NOT NULL,
    `status` ENUM('DITERIMA', 'DITOLAK', 'PENDING') NOT NULL DEFAULT 'PENDING',
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `pendaftaran_nomor_key`(`nomor`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `siswa` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `agama` VARCHAR(191) NULL,
    `nisn` VARCHAR(191) NOT NULL,
    `nik` VARCHAR(191) NOT NULL,
    `alamat` VARCHAR(191) NULL,
    `tempatLahir` VARCHAR(191) NULL,
    `tanggalLahir` DATETIME(3) NULL,

    UNIQUE INDEX `siswa_nisn_key`(`nisn`),
    UNIQUE INDEX `siswa_nik_key`(`nik`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `aktif` BOOLEAN NOT NULL DEFAULT false,
    `role` ENUM('SISWA', 'ADMIN', 'PANITIA') NOT NULL DEFAULT 'SISWA',
    `nomorTelepon` VARCHAR(191) NULL,
    `jenisKelamin` ENUM('L', 'P') NOT NULL DEFAULT 'L',
    `emailVerifiedAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `siswaId` INTEGER NOT NULL,

    UNIQUE INDEX `user_email_key`(`email`),
    INDEX `User_siswaId_fkey`(`siswaId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `pendaftaran` ADD CONSTRAINT `pendaftaran_jalurId_fkey` FOREIGN KEY (`jalurId`) REFERENCES `jalur`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pendaftaran` ADD CONSTRAINT `pendaftaran_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `User_siswaId_fkey` FOREIGN KEY (`siswaId`) REFERENCES `siswa`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
