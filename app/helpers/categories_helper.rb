module CategoriesHelper
  def example_img(category)
    img_example = '/assets/budgetbulga.png'
    category.icon.present? ? category.icon : img_example
  end
end
