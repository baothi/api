# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(
    { login: 'baothi', name: 'baothi', provider: 'github' }
  )


  Article.create([
    { title: 'Article title 1',
      content: 'Article content 1',
      slug: 'article-title-1',
      user: user
    },
    { title: 'Article title 2',
      content: 'Article content 2',
      slug: 'article-title-2',
      user: user
    },
    { title: 'Article title 3',
      content: 'Article content 3',
      slug: 'article-title-3',
      user: user
    }
  ])