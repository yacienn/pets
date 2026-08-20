import { Router } from "express"; 
import { addAnimal } from "../controllers/animals.js";
const router = Router();

router.post("/animal" , addAnimal);
export default router ;