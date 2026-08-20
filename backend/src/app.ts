import express from "express";
import animalRouters from "../src/router/animal_router.js"
const app = express();

app.use(express.json());
app.use("/home" , animalRouters);

export default app;