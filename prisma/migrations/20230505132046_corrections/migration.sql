/*
  Warnings:

  - You are about to drop the column `user_id` on the `reseps` table. All the data in the column will be lost.
  - Added the required column `author` to the `reseps` table without a default value. This is not possible if the table is not empty.
  - Added the required column `foto` to the `reseps` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `reseps` DROP FOREIGN KEY `reseps_user_id_fkey`;

-- AlterTable
ALTER TABLE `reseps` DROP COLUMN `user_id`,
    ADD COLUMN `author` VARCHAR(255) NOT NULL,
    ADD COLUMN `foto` VARCHAR(255) NOT NULL;
