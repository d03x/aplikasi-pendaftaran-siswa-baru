import type { H3Event } from "h3";
import prisma from "~/lib/prisma";
/**
 * for get users
 */
export const index = defineEventHandler(async () => {
  const siswa = await prisma.user.findMany({
    where : {
        email : {
            endsWith : 'gmail.com'
        }
    },
    include: {
      siswa: true,
    },
  });
  return {
    status: true,
    data: siswa,
  };
});
/**
 * handler for insert users
 */
export const store = defineEventHandler((event: H3Event) => {
  const users = prisma.user.findMany();
  return {
    users,
  };
});

export const register = defineEventHandler(async (event : H3Event)=>{
    const body = await readBody(event);
    return {body};
});
