import express from "express";
import { pool } from "../config/db.js";
export const addAnimal = async (req : Request , res : Response){
  
  try{
   const {name , type , iconUrl} = req.body ;
   if(!name || !type || iconUrl){
    return res.status(404).json({
        message : "name or type or icons are requirement"
    });
    const result = await pool.query(
      `INSERT INTO animals (name , type , iconUrl)
       VALUES ($1 , $2 , $3)
        RETURNING *` , [name , type , iconUrl],
    ),
   }
  }catch(e){

  }

}