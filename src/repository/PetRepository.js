const { Pet, User, Category } = require('~/models');

class PetRepository {
  async createPet(data) {
    return Pet.create(data);
  }

  async findAllPets(offset, limit) {
    return Pet.findAndCountAll({
      offset,
      limit,
      include: [
        { model: User, attributes: ['id', 'full_name', 'email', 'phone'], as: 'PetOwner' },
        { model: Category, attributes: ['id', 'name', 'type'], as: 'Category' },
      ],
    });
  }

  async findPetById(id) {
    return Pet.findByPk(id, {
      include: [
        { model: User, attributes: ['id', 'full_name', 'email', 'phone'], as: 'PetOwner' },
        { model: Category, attributes: ['id', 'name', 'type'], as: 'Category' },
      ],
    });
  }

  async updatePet(id, data) {
    return Pet.update(data, { where: { id } });
  }

  async deletePet(id) {
    return Pet.destroy({ where: { id } });
  }

  async findPetsByOwner(owner_id) {
    return Pet.findAll({
      where: { owner_id },
      include: [
        { model: User, attributes: ['id', 'full_name', 'email', 'phone'], as: 'PetOwner' },
        { model: Category, attributes: ['id', 'name', 'type'], as: 'Category' },
      ],
    });
  }

  async findPetsByCategory(category_id) {
    return Pet.findAll({
      where: { category_id },
      include: [
        { model: User, attributes: ['id', 'full_name', 'email', 'phone'], as: 'PetOwner' },
        { model: Category, attributes: ['id', 'name', 'type'], as: 'Category' },
      ],
    });
  }

  async findPetsByGender(gender) {
    return Pet.findAll({
      where: { gender },
      include: [
        { model: User, attributes: ['id', 'full_name', 'email', 'phone'], as: 'PetOwner' },
        { model: Category, attributes: ['id', 'name', 'type'], as: 'Category' },
      ],
    });
  }

  async countPets() {
    return Pet.count();
  }
}

module.exports = new PetRepository();
