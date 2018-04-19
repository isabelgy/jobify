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




puts "created #{Job.count}  jobs"




names = ["Wendy", "Pavel", "Isabel", "Rose"]

  4.times do
    User.create(name: names.sample, last_question_id: (10..50).to_a.sample)
    puts "made #{User.count} user with name and last_question_id"
  end

  tags = %w(outgoing
  aggressive
  assertive
  sociable
  extraverted
  distant
  non-conflicting
  reserved
  loyal
  introverted

  talkative
  empathetic
  light-hearted
  agreeable
  warm-hearted
  collaborative
  independent
  stubborn
  direct
  unemotional

  responsible
  conscientious
  structure-freak
  perfectionist)

Job.create(tag_list: tags.sample(9), description: "Hero is an international, family owned company with a rich heritage and more than 129 years’ experience of conserving fruit and vegetable based products and making them convenient to consumers food. Since their foundation in 1886 and within the many brands that have since joined the Hero family, their ethos continues: making high quality, natural products easily accessible to consumers. They want to bring this heritage to today’s consumers to share their love for naturally good food.", user_id: User.last.id, title: "Junior Sales Operations Manager", company: "Hero", image: "http://www.growhr.com/wp-content/uploads/2014/10/grow_logo_small_square.png", location: "Shanghai", email: "pavel.liser@growhr.com", phone: "13688888888", wechat: "liserp", attachment: "http://www.growhr.com/wp-content/uploads/2018/04/Grow-HR-Hero-Junior-Sales-Operations-Manager-.pdf")
puts "made a job"

Job.create(tag_list: tags.sample(9), description: "Hero is an international, family owned company with a rich heritage and more than 129 years’ experience of conserving fruit and vegetable based products and making them convenient to consumers food. Since their foundation in 1886 and within the many brands that have since joined the Hero family, their ethos continues: making high quality, natural products easily accessible to consumers. They want to bring this heritage to today’s consumers to share their love for naturally good food.", user_id: (User.last.id - 1), title: "Retail Sales Manager", company: "Hero", image: "http://www.growhr.com/wp-content/uploads/2014/10/grow_logo_small_square.png", location: "Shanghai", email: "pavel.liser@growhr.com", phone: "13688888888", wechat: "liserp", attachment: "http://www.growhr.com/wp-content/uploads/2018/04/Grow-HR-Hero-Sales-Manager-China-Retail.pdf")
puts "made a job"

Job.create(tag_list: tags.sample(9), description: "KTK is a leading company within hardware tools and plastics products. The company has a wide range of products including plastics furniture, medical equipment, blow mold cases and automotive components. Their major markets are North America, Japan and China, but also export to Middle East and Southeast Asia. The company has around 300 employees and a turnover RMB 220 million.", user_id: (User.last.id - 1), title: "HR Manager", company: "KTK", image: "http://www.growhr.com/wp-content/uploads/2014/10/grow_logo_small_square.png", location: "Kunshan", email: "pavel.liser@growhr.com", phone: "13688888888", wechat: "liserp", attachment: "http://www.growhr.com/wp-content/uploads/2018/03/Grow-HR-KTK-HR-Manager_RF.doc.pdf")
puts "made a job"

Job.create(user_id: (User.last.id - 1), tag_list: tags.sample(9), description: "Gina Tricot is a Swedish fashion chain offering exciting, feminine fashion to women in over 30 countries. The company was founded in 1997 and has been growing exponentially, now with 180 stores in five European countries and more than 2,000 employees. Gina Tricot has a passion for fashion, with the goal of offering customers a new and exciting shopping experience. The company is still expanding, while keeping a constant focus on the future to see how they can evolve as an international fashion supplier.", title: "Merchandiser", company: "Gina Tricot", image: "http://www.growhr.com/wp-content/uploads/2014/10/grow_logo_small_square.png", location: "Shanghai", email: "pavel.liser@growhr.com", phone: "13688888888", wechat: "liserp", attachment: "http://www.growhr.com/wp-content/uploads/2018/03/Grow-HR-Gina-Tricot-Job-Description-Merchandiser-ShoesAccesories.pdf")
puts "made a job"

Job.create(tag_list: tags.sample(9), description: "IKEA is a values-driven company with a passion for life at home. As a multinational group, IKEA was founded in Sweden in the early 1940s and has a label of being one of Sweden’s most recognizable brands. It is known for its trendy designs, ready-to-assemble furniture, kitchen appliances and home accessories. IKEA has been the world’s largest furniture retailer since 2008 and boasts more than 160,000 employees worldwide. Furthermore, IKEA has a global footprint that encompasses 48 countries and 392 stores.", user_id: (User.last.id - 2), title: "Solutions Architect", company: "IKEA", image: "http://www.growhr.com/wp-content/uploads/2014/10/grow_logo_small_square.png", location: "Shanghai", email: "pavel.liser@growhr.com", phone: "13688888888", wechat: "liserp", attachment: "http://www.growhr.com/wp-content/uploads/2018/02/Grow-HR-Solution-Architect-IKEA.pdf")
puts "made a job"

Job.create(tag_list: tags.sample(9), description: "Monbento is a French company founded in 2009. The company offers a wide range of bento boxes, lunch boxes and accessories for any meal in your day. The products are designed in France and have won several international awards. Monbento focuses on quality, design and customization. Today, focusing on ECommerce, Monbento is a global brand and their key markets are France and China.", user_id: (User.last.id), title: "E-Commerce Manager", company: "Monbento", image: "http://www.growhr.com/wp-content/uploads/2014/10/grow_logo_small_square.png", location: "Shanghai", email: "pavel.liser@growhr.com", phone: "13688888888", wechat: "liserp", attachment: "http://www.growhr.com/wp-content/uploads/2017/12/Grow-HR-Monbento-E-commerce-Manager.pdf")

puts "made a job"

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
