const petService = require('~/service/PetService');

const PetController = {
  async create(req, res, next) {
    try {
      const pet = await petService.createPet(req.body);
      res.status(201).json({ success: true, data: pet });
    } catch (error) {
      next(error);
    }
  },

  async getAll(req, res, next) {
    try {
      const { page = 1, limit = 10 } = req.query;
      const pets = await petService.getAllPets(parseInt(page, 10), parseInt(limit, 10));
      res.status(200).json({ success: true, data: pets.rows, total: pets.count });
    } catch (error) {
      next(error);
    }
  },

  async getById(req, res, next) {
    try {
      const pet = await petService.getPetById(req.params.id);
      res.status(200).json({ success: true, data: pet });
    } catch (error) {
      next(error);
    }
  },

  async update(req, res, next) {
    try {
      const updatedPet = await petService.updatePet(req.params.id, req.body);
      res.status(200).json({ success: true, data: updatedPet });
    } catch (error) {
      next(error);
    }
  },

  async delete(req, res, next) {
    try {
      await petService.deletePet(req.params.id);
      res.status(200).json({ success: true, message: 'Deleted successfully' });
    } catch (error) {
      next(error);
    }
  },

  async getPetsByOwner(req, res, next) {
    try {
      const pets = await petService.getPetsByOwner(req.params.owner_id);
      res.status(200).json({ success: true, data: pets });
    } catch (error) {
      next(error);
    }
  },

  async getPetsByCategory(req, res, next) {
    try {
      const pets = await petService.getPetsByCategory(req.params.category_id);
      res.status(200).json({ success: true, data: pets });
    } catch (error) {
      next(error);
    }
  },

  async getPetsByGender(req, res, next) {
    try {
      const pets = await petService.getPetsByGender(req.params.gender);
      res.status(200).json({ success: true, data: pets });
    } catch (error) {
      next(error);
    }
  },

  async countPets(req, res, next) {
    try {
      const totalPets = await petService.countPets();
      res.status(200).json({ success: true, data: totalPets });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = PetController;
