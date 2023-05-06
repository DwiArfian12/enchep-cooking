import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
    const body = await readBody(event)
    let resep = null

    if (body.judul && body.foto  && body.bahan && body.langkah && body.author) {
        await prisma.reseps.create({
            data: {
                judul: body.judul,
                foto: body.foto,
                bahan: body.bahan,
                langkah: body.langkah,
                author: body.author
            }
        }).then((response) => {
            resep = response
        })
    }

    return resep
})