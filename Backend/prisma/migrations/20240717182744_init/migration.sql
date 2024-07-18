/*
  Warnings:

  - You are about to drop the `Appointment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Media` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Review` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ServiceProvider` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Appointment" DROP CONSTRAINT "Appointment_serviceProviderId_fkey";

-- DropForeignKey
ALTER TABLE "Media" DROP CONSTRAINT "Media_serviceProviderId_fkey";

-- DropForeignKey
ALTER TABLE "Review" DROP CONSTRAINT "Review_serviceProviderId_fkey";

-- DropTable
DROP TABLE "Appointment";

-- DropTable
DROP TABLE "Media";

-- DropTable
DROP TABLE "Review";

-- DropTable
DROP TABLE "ServiceProvider";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "hashedPassword" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "userType" TEXT NOT NULL,
    "profilePhoto" BYTEA,
    "userAddress" TEXT NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "serviceProvider" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "businessName" TEXT NOT NULL,
    "businessAddress" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "hashedPassword" TEXT NOT NULL,
    "userType" TEXT NOT NULL,
    "services" TEXT NOT NULL,
    "profilePhoto" BYTEA,
    "bio" TEXT NOT NULL,
    "priceRange" TEXT NOT NULL,

    CONSTRAINT "serviceProvider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "appointment" (
    "id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "time" TIMESTAMP(3) NOT NULL,
    "customerId" TEXT NOT NULL,
    "serviceProviderId" TEXT NOT NULL,

    CONSTRAINT "appointment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "review" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "customerId" TEXT NOT NULL,
    "serviceProviderId" TEXT NOT NULL,

    CONSTRAINT "review_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "media" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "serviceProviderId" TEXT NOT NULL,

    CONSTRAINT "media_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "serviceProvider_email_key" ON "serviceProvider"("email");

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_serviceProviderId_fkey" FOREIGN KEY ("serviceProviderId") REFERENCES "serviceProvider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_serviceProviderId_fkey" FOREIGN KEY ("serviceProviderId") REFERENCES "serviceProvider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "media" ADD CONSTRAINT "media_serviceProviderId_fkey" FOREIGN KEY ("serviceProviderId") REFERENCES "serviceProvider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
