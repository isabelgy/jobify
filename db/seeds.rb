# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Job.delete_all
Answer.delete_all
User.delete_all
Question.delete_all
require 'csv'

Job.create(title: "Junior Sales Operations Manager", company: "Hero", image: "http://www.growhr.com/wp-content/uploads/2014/10/grow_logo_small_square.png", location: "Shanghai", email: "pavel.liser@growhr.com", phone: "13688888888", wechat: "liserp", attachment: "http://www.growhr.com/wp-content/uploads/2018/04/Grow-HR-Hero-Junior-Sales-Operations-Manager-.pdf")
Job.create(title: "Retail Sales Manager", company: "Hero", image: "http://www.growhr.com/wp-content/uploads/2014/10/grow_logo_small_square.png", location: "Shanghai", email: "pavel.liser@growhr.com", phone: "13688888888", wechat: "liserp", attachment: "http://www.growhr.com/wp-content/uploads/2018/04/Grow-HR-Hero-Sales-Manager-China-Retail.pdf")
Job.create(title: "HR Manager", company: "KTK", image: "http://www.growhr.com/wp-content/uploads/2014/10/grow_logo_small_square.png", location: "Kunshan", email: "pavel.liser@growhr.com", phone: "13688888888", wechat: "liserp", attachment: "http://www.growhr.com/wp-content/uploads/2018/03/Grow-HR-KTK-HR-Manager_RF.doc.pdf")
Job.create(title: "Merchandiser (Shoes&Accesories)", company: "Gina Tricot", image: "http://www.growhr.com/wp-content/uploads/2014/10/grow_logo_small_square.png", location: "Shanghai", email: "pavel.liser@growhr.com", phone: "13688888888", wechat: "liserp", attachment: "http://www.growhr.com/wp-content/uploads/2018/03/Grow-HR-Gina-Tricot-Job-Description-Merchandiser-ShoesAccesories.pdf")

puts "created #{Job.count}  jobs"



names = ["Wendy", "Pavel", "Isabel", "Rose"]

  4.times do
    User.create(name: names.sample, last_question_id: (10..50).to_a.sample)
    puts "made user with name and last_question_id"
  end

filepath = 'quest-value-merged2.csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }


CSV.foreach(filepath, csv_options) do |row|

  title =  row['title']
  first_trait =  row['first_trait']
  second_trait = row['second_trait']
  first_value =  row['first_value']
  second_value = row['second_value']

  question = Question.new(title: title, first_trait: first_trait, second_trait: second_trait, first_value: first_value, second_value: second_value )
  question.save
  puts "created #{Question.count} questions"
end
