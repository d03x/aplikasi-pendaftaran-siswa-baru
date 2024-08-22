import * as userController from "~~/server/controller/user-controllers"
const router = createRouter();
//get all users
router.get('/users', userController.index);
router.post('/users', userController.store);
router.post('/register', userController.register);
export default useBase('/api/v1', router.handler);