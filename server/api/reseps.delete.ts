import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
    const body = await readBody(event)
    let resep = null
    
    if (body.id) {
        await prisma.reseps.delete({
            where: {
                id: body.id
            }
        }).then((response) => {
            resep = response
        })
    }

    return resep
})