# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Article.create!()
Article.create!(title: 'Sample article', content: 'My awesome article',slug: 'Sample-article')
Article.create!(title: 'Sample article 1', content: 'My awesome article',slug: 'Sample-article-1')