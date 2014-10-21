SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :agreement, 'Условия использования', root_path
    primary.item :policy, 'Политика конфиденциальности', root_path
    primary.item :about, 'О проекте', root_path
    primary.item :blog, 'Блог', root_path

    primary.dom_class = 'breadcrumb'
    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end
end