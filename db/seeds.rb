prng = Random.new
role = {admin: 0}

ActiveRecord::Base.transaction do
  # Users
  User.create! name:  "Example User",
               email: "example@railstutorial.org",
               password:              "foobar",
               password_confirmation: "foobar",
               role:  role[:admin]

  User.create! name:  "Đặng Minh Dũng",
               email: "dungdm93@example.com",
               password:              "qwerty",
               password_confirmation: "qwerty"

  18.times do
    name     = Faker::Name.name
    email    = Faker::Internet.email
    password = "password"
    User.create! name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password
  end

  # Categories
  5.times do
    name        = Faker::Name.name
    description = Faker::Lorem.paragraph
    Category.create! name: name, description: description
  end

  # Books
  100.times do
    isbn            = Faker::Code.isbn
    title           = Faker::Name.title
    edition         = prng.rand(10) + 1
    author          = Faker::Name.name
    cover           = prng.rand(100) < 20 ? nil :
                      Faker::Avatar.image(slug = isbn, size ='168x238')
    publish_date    = Faker::Date.between 15.years.ago, Date.today
    number_of_pages = Faker::Number.number 3
    category        = Category.all.sample
    Book.create! isbn: isbn, title: title, edition: edition,
                 author: author, cover: cover,
                 category_id: category.id,
                 publish_date: publish_date,
                 number_of_pages: number_of_pages
  end

  users = User.all
  user  = users.first
  following = users[2..50]
  followers = users[3..40]
  following.each {|followed| user.follow followed}
  followers.each {|follower| follower.follow user}

end
