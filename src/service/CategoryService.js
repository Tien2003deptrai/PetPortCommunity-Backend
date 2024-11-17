const categoryRepo = require('~/repository/CategoryRepository');

class CategoryService {
  async createCategory(data) {
    return categoryRepo.createCategory(data);
  }

  async getAllCategories() {
    return categoryRepo.findAllCategories({});
  }

  async getCategoryById(id) {
    const category = await categoryRepo.findCategoryById(id);
    if (!category) {
      throw new Error('Category not found');
    }
    return category;
  }

  async updateCategory(id, data) {
    const [updated] = await categoryRepo.updateCategory(id, data);
    if (!updated) {
      throw new Error('Category not found');
    }
    return categoryRepo.findCategoryById(id);
  }

  async deleteCategory(id) {
    const { productCount, serviceCount, petCount } = await categoryRepo.countCategoryUsage(id);

    if (productCount > 0 || serviceCount > 0 || petCount > 0) {
      throw new Error('Category is in use and cannot be deleted');
    }

    const deleted = await categoryRepo.deleteCategory(id);
    if (!deleted) {
      throw new Error('Category not found');
    }
  }

  async getCategoriesByType(type) {
    return categoryRepo.findCategoriesByType(type);
  }
}

module.exports = new CategoryService();
