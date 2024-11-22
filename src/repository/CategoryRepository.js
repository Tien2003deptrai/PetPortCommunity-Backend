const { Category, Product, Pet, Service, Op } = require('~/models');

class CategoryRepository {
  async createCategory(data) {
    return Category.create(data);
  }

  async findAllCategories(options) {
    return Category.findAll({
      include: [
        { model: Product, as: 'CategoryProducts' },
        { model: Pet, as: 'CategoryPets' },
      ],
      ...options,
    });
  }

  async findCategoryById(id) {
    return Category.findByPk(id, {
      include: [
        { model: Product, as: 'CategoryProducts' },
        { model: Pet, as: 'CategoryPets' },
      ],
    });
  }

  async updateCategory(id, data) {
    return Category.update(data, { where: { id } });
  }

  async deleteCategory(id) {
    return Category.destroy({ where: { id } });
  }

  async countCategoryUsage(categoryId) {
    const productCount = await Product.count({ where: { category_id: categoryId } });
    const serviceCount = await Service.count({ where: { category_id: categoryId } });
    const petCount = await Pet.count({ where: { category_id: categoryId } });

    return { productCount, serviceCount, petCount };
  }

  async findAndCountCategories(filters, limit, offset) {
    const whereClause = {};

    if (filters.type) {
      whereClause.type = filters.type;
    }

    if (filters.name) {
      whereClause.name = { [Op.like]: `%${filters.name}%` };
    }

    if (filters.status) {
      whereClause.status = filters.status;
    }

    return Category.findAndCountAll({
      where: whereClause,
      include: [
        { model: Product, as: 'CategoryProducts' },
        { model: Pet, as: 'CategoryPets' },
      ],
      limit,
      offset,
    });
  }
}

module.exports = new CategoryRepository();
