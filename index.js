const express = require('express');
const { PrismaClient } = require('@prisma/client');
const bodyParser = require('body-parser');
const cors = require('cors');

const prisma = new PrismaClient();
const app = express();

app.use(bodyParser.json());
app.use(cors());

// Get all drinks
app.get('/drinks', async (req, res) => {
  try {
    const drinks = await prisma.drink.findMany();
    res.json(drinks);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Create a new drink
app.post('/drinks', async (req, res) => {
  try {
    const { name, description, price, stock, imageUrl } = req.body;
    const drink = await prisma.drink.create({
      data: { name, description, price, stock, imageUrl },
    });
    res.json(drink);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update drink stock
app.put('/drinks/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { stock } = req.body;
    const drink = await prisma.drink.update({
      where: { id: parseInt(id) },
      data: { stock },
    });
    res.json(drink);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Delete a drink
app.delete('/drinks/:id', async (req, res) => {
  try {
    const { id } = req.params;
    await prisma.drink.delete({ where: { id: parseInt(id) } });
    res.json({ message: 'Drink deleted' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Create an order
app.post('/orders', async (req, res) => {
  try {
    const { drinkId, quantity } = req.body;
    const order = await prisma.order.create({
      data: { drinkId, quantity },
    });
    // Update drink stock
    const drink = await prisma.drink.update({
      where: { id: drinkId },
      data: { stock: { decrement: quantity } },
    });
    res.json(order);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get all orders
app.get('/orders', async (req, res) => {
  try {
    const orders = await prisma.order.findMany();
    res.json(orders);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
