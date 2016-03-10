User.create! name: "Kratos",
  email: "nguyenthanhluan@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  is_admin: true

User.create! name:  "Example User",
  email: "example@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  is_admin: true

99.times do |n|
  name = Faker::Name.name
  email = "example#{n+1}@gmail.com"
  password = "111111"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end

10.times do |n|
  name  = "category#{n+1}"
  description = Faker::Lorem.paragraphs rand(5..15)
  number_of_words_in_lesson = rand 10..30
  Category.create! name:  name,
  description: description,
  number_of_words_in_lesson: number_of_words_in_lesson  
end

categories = Category.order(:created_at).take(10)
categories.each {|category| 
  rand_times = rand 50..100;
  rand_times.times do
  name = Faker::Name.name
  word= category.words.create!(name: name) 
  word.word_options.create(content: "A", is_correct: false)
  word.word_options.create(content: "B", is_correct: false)
  word.word_options.create(content: "C", is_correct: true)
  word.word_options.create(content: "D", is_correct: false)
  end
}
