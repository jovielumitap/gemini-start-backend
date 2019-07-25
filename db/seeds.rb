nocategory = Category.create!(name: "nocategory", active: false) unless Category.find_by(name: 'nocategory')

User.create!(email: 'admin@gmail.com', password: 'admin123', user_type: 'admin', category_id: nocategory.id) unless User.find_by(email: 'admin@test.com')
