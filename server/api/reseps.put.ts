import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
    const body = await readBody(event)

    if (!(body.id && body.foto && body.judul && body.bahan && body.langkah && body.author)) return createError({ statusCode: 400, statusMessage: "Data yang dimasukkan tidak valid!"})

    let resep = null

    if (body.id && body.judul && body.bahan && body.langkah && body.author) {
        resep = await prisma.reseps.update({
            where: {
                id: body.id
            },
            data: {
                judul: body.judul,
                foto: body.foto,
                bahan: body.bahan,
                langkah: body.langkah,
                author: body.author
            }
        })
    }

    return resep
})