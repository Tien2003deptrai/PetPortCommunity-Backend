const petRepo = require('~/repository/PetRepository');

class PetService {
  async createPet(data) {
    return petRepo.createPet(data);
  }

  async getAllPets(page, limit) {
    const offset = (page - 1) * limit;
    return petRepo.findAllPets(offset, limit);
  }

  async getPetById(id) {
    const pet = await petRepo.findPetById(id);
    if (!pet) throw new Error('Pet not found');
    return pet;
  }

  async updatePet(id, data) {
    const [updated] = await petRepo.updatePet(id, data);
    if (!updated) throw new Error('Pet not found');
    return petRepo.findPetById(id);
  }

  async deletePet(id) {
    const deleted = await petRepo.deletePet(id);
    if (!deleted) throw new Error('Pet not found');
  }

  async getPetsByOwner(owner_id) {
    return petRepo.findPetsByOwner(owner_id);
  }

  async getPetsByCategory(category_id) {
    return petRepo.findPetsByCategory(category_id);
  }

  async getPetsByGender(gender) {
    return petRepo.findPetsByGender(gender);
  }

  async countPets() {
    return petRepo.countPets();
  }
}

module.exports = new PetService();
