import { Request, Response } from "express";
import { pool } from "../config/db.js";

export const addAnimal = async (req: Request, res: Response) => {
  try {
    const { name, type, iconUrl } = req.body;

    if (!name || !type || !iconUrl) {
      return res.status(400).json({
        message: "Name, type and iconUrl are required",
      });
    }

    const result = await pool.query(
      `
      INSERT INTO animal (name, type, icon_url)
      VALUES ($1, $2, $3)
      RETURNING *
      `,
      [name, type, iconUrl]
    );

    return res.status(201).json({
      message: "Animal was added successfully",
      animal: result.rows[0],
    });
  } catch (e) {
    console.error(e);

    return res.status(500).json({
      message: "Failed to add animal",
    });
  }
};