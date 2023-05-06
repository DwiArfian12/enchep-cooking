-- CreateTable
CREATE TABLE `reseps` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `judul` VARCHAR(255) NOT NULL,
    `bahan` VARCHAR(4000) NOT NULL,
    `langkah` VARCHAR(4000) NOT NULL,
    `user_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `deleted_at` DATETIME(0) NULL,
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `reseps` ADD CONSTRAINT `reseps_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
