import { Router } from "express"; 
import { addAnimal , GetallAnimals} from "../controllers/animals.js";
const router = Router();

router.post("/animal", addAnimal);
router.get("/animal", GetallAnimals);
export default router ;