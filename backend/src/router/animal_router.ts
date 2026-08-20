import { Router } from "express"; 
import { addAnimal , GetallAnimals} from "../controllers/animals.js";
const router = Router();

router.post("/animal" , addAnimal);
router.post("/animal", GetallAnimals);
export default router ;