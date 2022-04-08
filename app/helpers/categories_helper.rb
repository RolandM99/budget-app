module CategoriesHelper
  def example_img(category)
    img_example = '/assets/budgetbulga.png'
    category.icon.present? and category.icon.last(4) == '.png' ? category.icon : img_example
  end
end
