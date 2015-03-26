ActiveRecord::Base.transaction do
  User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

  User.create!(name:  "Đặng Minh Dũng",
               email: "dungdm93@example.com",
               password:              "qwerty",
               password_confirmation: "qwerty")

  User.create!(name:  "abc xyz",
               email: "abcxyz@gmail.com",
               password:              "123456",
               password_confirmation: "123456")

  18.times do
    name     = Faker::Name.name
    email    = Faker::Internet.email
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)
  end
  20.times do
    isbn = Faker::Code.isbn
    title = Faker::Name.title
    edition = Faker::Number.digit
    publish_date = Faker::Date.between 100.days.ago, Date.today
    author = Faker::Name.name 
    number_of_pages = Faker::Number.number 3
    book = Book.create! isbn: isbn, title: title, edition: edition, 
                        publish_date: publish_date, author: author,
                        number_of_pages: number_of_pages
  end
end
