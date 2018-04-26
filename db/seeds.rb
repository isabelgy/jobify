# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Job.delete_all
# Answer.delete_all
# # Answer.truncate_me!
# User.delete_all
# Question.delete_all
# Question.truncate_me!
require 'csv'


# puts "created #{Job.count}  jobs"



# names = ["Wendy", "Pavel", "Isabel", "Rose"]

#   4.times do
#     User.create(name: names.sample, last_question_id: (10..50).to_a.sample)
#     puts "made user with name and last_question_id"
#   end

  tags = %w(outgoing
  driven
  assertive
  sociable
  extraverted
  loyal
  introverted
  talkative
  empathetic
  agreeable
  warm-hearted
  collaborative
  independent
  determined
  direct
  unemotional
  responsible
  aware
  structure-freak
  perfectionist)

Job.create(tag_list: tags.sample(5), description: "Hero is an international, family owned company with a rich heritage and more than 129 years’ experience of conserving fruit and vegetable based products and making them convenient to consumers food. Since their foundation, their ethos continues: making high quality, natural products easily accessible to consumers.", user_id: User.first.id, title: "Junior Sales Operations Manager", company: "Hero", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/fb0e4de6f9df745e51c1.png", location: "Shanghai", email: "dora.babak@growhr.com")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "Hero is an international, family owned company with a rich heritage and more than 129 years’ experience of conserving fruit and vegetable based products and making them convenient to consumers food. Since their foundation, their ethos continues: making high quality, natural products easily accessible to consumers.", user_id: (User.first.id), title: "Retail Sales Manager", company: "Hero", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/fb0e4de6f9df745e51c1.png", location: "Shanghai", email: "stephanie.hong@growhr.com")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "KTK is a leading company within hardware tools and plastics products. The company has a wide range of products including plastics furniture, medical equipment, blow mold cases and automotive components.", user_id: (User.first.id), title: "HR Manager", company: "KTK", location: "Kunshan", email: "sybil.kong@growhr.com")
puts "made a job"

Job.create(user_id: (User.first.id), tag_list: tags.sample(5), description: "Gina Tricot is a Swedish fashion chain offering exciting, feminine fashion to women in over 30 countries. The company was founded in 1997 and has been growing exponentially, now with 180 stores in five European countries and more than 2,000 employees.", title: "Merchandiser", company: "Gina Tricot", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/fb0e4de6f9df745e51c1.png", location: "Shanghai", email: "pavel.liser@growhr.com")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "Monbento is a French company founded in 2009. The company offers a wide range of bento boxes, lunch boxes and accessories for any meal in your day. The products are designed in France and have won several international awards. Monbento focuses on quality, design and customization.", user_id: (User.first.id), title: "E-Commerce Manager", company: "Monbento", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/fb0e4de6f9df745e51c1.png", location: "Shanghai", email: "sybil.kong@growhr.com")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "Our client is a Norwegian buying office for Sportswear and Sports Equipment. We are looking for an experienced professional in Production Planning and/or Supply Chain to lead their production processes in Asia.", user_id: (User.first.id), title: "Supply Chain Manager", company: "Scandinavian Buying Office", location: "Shanghai", email: "liser.pavel@gmail.com")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "Our client is a famous French buying office in Ningbo. With over 10 differencet product ranges, they position themselves as a multi specialist . The company employs 300 people (including 50 in China) to develop new TRENDY PRODUCTS and UNIQUE DESIGNS.", user_id: (User.first.id), title: "Procurement Manager", company: "French Sourcing Company", location: "Ningbo", email: "stephaniehyxj@gmail.com")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "Famous Italian food company is looking for a new Accountant to join their Shanghai team. They have more than 50 years of history and have been growing rapidly in China!", user_id: (User.first.id), title: "Accountant", company: "Italian Food MNC", location: "Shanghai", email: "dorababak@yahoo.com", salary: '15000 RMB')
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "Grow HR is a recruitment firm operating in China since 2007. We have accumulated a great track record in helping foreign companies find top-calibre local management talent.", user_id: (User.first.id), title: "Marketing Associate", company: "Grow HR", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/fb0e4de6f9df745e51c1.png", location: "Shanghai", email: "career@growhr.com", salary: 'Negotiable')
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "We are a blockchain company based in Shanghai and we are looking for a Online Marketing Assistant to lead our online marketing programs and strategy development.", user_id: (User.first.id), title: "Online Marketing", company: "Caasiope", location: "Shanghai", email: "careers.svcw@gmail.com")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "We are looking for English or German native speakers for exciting game localization projects. You will also have a chance to work on market research, create engaging content and promote the company through marketing campaigns.", user_id: (User.first.id), title: "Game Localization", company: "CGC", location: "Shanghai", email: "hr@chinaglobalconnections.com", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/a3c23dc3ac717d945958.png")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "We are a real estate technology startup that strongly believes moving to China should be convenient, fast and fair. We are looking for a person to be our digital soldier on the front-line of Social Media.", user_id: (User.first.id), title: "Marketing Intern", company: "Ask Cucu", location: "Shanghai", email: "hrchina@askcucu.com", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/2d2369fde88b1daa1c4e.png")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "We are a blockchain technology company, focused on providing seamless applications for iOS and Android cryptocurrency wallets, instant messaging and DAPP platforms. We currently have 5m users worldwide and are continuing to grow!", user_id: (User.first.id), title: "Assistant", company: "Qbao", location: "Shanghai", email: "tracy.shi@qbao.fund", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/6ac62abcbc8d870b8e5a.jpg")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "We are a full-service creative agency with a focus on luxury clients. Our scope includes everything from brand identity and campaign strategies to events, OOH advertising, and social media. We strongly believe that communication is an art, not a science, and aim to make luxury marketing meaningful.", user_id: (User.first.id), title: "Account Manager", company: "Reflex Group", location: "Shanghai", email: "afaverjon@reflexgroup.com", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/23778f6ee02e33ce953b.jpg")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "Operate effectively on efficient turnaround of web design, video, photographic items, artwork, enhancements, adjustments and resizes. Responsible for meeting and exceeding client expectations and deliverables on time and in high quality Assist with storyboarding and graphic pre-designs where appropriate.", user_id: (User.first.id), title: "Senior Graphic Designer", company: "KOLLEKTIV Creative Hub", location: "Shanghai", email: "INFO@KOLLEKTIV.CO", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/bc72350290fd92262cf8.png")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "Lead the Front of House team and ensure all job responsibilities are being upheld. Ensure all guests receive the highest standard of service required. Liaise with the Back of House team on menu changes and adjust service accordingly Strategic planning of staff management, including staff recruitment, briefing and training. Build a positive, collaborative and enjoyable working environment.", user_id: (User.first.id), title: "Restaurant Manager", company: "Kathleen's Waitan", location: "Shanghai", email: "http://www.kwaitan.com/", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/259c825b82d8b9f92bb2.jpg")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "You are supposed to transform complex accounting jargon into human language. And you work to facilitate the communication between Megi and different types of audiences by producing enriching and insightful content to deliver a beautiful reading experience. Industrial developments in accounting firms and profession driven by cloud technology, in the form of a blog and soft articles.", user_id: (User.first.id), title: "Senior Content Producer", company: "MEGI", location: "Shanghai", email: "hello@megichina.com", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/e73d17ecb3f1df215aef.jpg")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "Candidates must have worked in recruitment for a minimum of 2 years Native-level fluency in English is essential. Mandarin not required Degree qualified applicants are preferable An existing expat-network in Shanghai is highly desirable", user_id: (User.first.id), title: "Recruitment Consultant", company: "deVere Shanghai", location: "Shanghai", email: "https://www.devere-group-careers.com/contact-us", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/1421ac12778021fe5bab.jpg")
puts "made a job"

Job.create(tag_list: tags.sample(5), description: "Assists in preparing process mapping material Configures Initial workflow & ensures data import Documents and ensures implementation of changes in project or configuration (using ticketing tool) Prepare training material and performs training Prepares and animates progress meetings with Customers Creates and updates Customer page in the Group.", user_id: (User.first.id), title: "Customer Success Manager/Coordinator", company: "Pivot88 (Shanghai) Limited", location: "Shanghai", email: "info@pivot88.com", image: "https://lc-5hxsbqle.cn-n1.lcfile.com/99bf3b3969d0518e8d75.png")
puts "made a job"



# filepath = 'quest-value-merged2.csv'

# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }


# CSV.foreach(filepath, csv_options) do |row|

#   title =  row['title']
#   first_trait =  row['first_trait']
#   second_trait = row['second_trait']
#   first_value =  row['first_value']
#   second_value = row['second_value']

#   question = Question.new(title: title, first_trait: first_trait, second_trait: second_trait, first_value: first_value, second_value: second_value )
#   question.save
#   puts "created #{Question.count} questions"
# end
