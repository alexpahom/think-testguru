# frozen_string_literal: true
[TestPassage, Answer, Question, Test, Category, User, RuleTemplate, BadgeImage].each(&:delete_all)
users = User.create!([
                       { first_name: 'Борис', last_name: 'Бритва', email: 'fox@test.com', password: 'Test123',
                         type: 'Admin', confirmed_at: Time.now },
                       { first_name: 'Евгений', last_name: 'Петросян', email: 'wolf@test.com',
                         password: 'Test123', confirmed_at: Time.now },
                       { first_name: 'Саша', last_name: 'Бородач', email: 'bear@test.com',
                         password: 'Test123', confirmed_at: Time.now }
                     ])

categories = Category.create!([{ title: 'Кино' }, { title: 'Музыка' }])

tests = Test.create!([
                       { title: 'Властелин Колец', level: rand(1..3), author_id: users.sample&.id,
                         category_id: categories[0].id },
                       { title: 'Гарри Поттер', level: rand(1..3), author_id: users.sample&.id,
                         category_id: categories[0].id },
                       { title: 'Metallica', level: rand(1..3), author_id: users.sample&.id,
                         category_id: categories[1].id }
                     ])

questions = Question.create!([
                               { body: 'Кто не был в братстве кольца', test_id: tests[0].id },
                               { body: 'Почему Фродо не отправили на орле в самом начале', test_id: tests[0].id },
                               { body: 'Сколько Арагорну лет во время действия ВК', test_id: tests[0].id },
                               { body: 'Где бабушки\дедушки Поттера?', test_id: tests[1].id },
                               { body: 'Откуда у родителей Поттера столько денег', test_id: tests[1].id },
                               { body: 'Какой из альбомов Metallica состоит из каверов', test_id: tests[2].id }
                             ])

Answer.create!([
                 { body: 'Пиппин', question_id: questions[0].id },
                 { body: 'Леголас', question_id: questions[0].id },
                 { body: 'Элронд', correct: true, question_id: questions[0].id },
                 { body: 'Боромир', question_id: questions[0].id },

                 { body: 'На одной книге бы закончили', correct: true, question_id: questions[1].id },
                 { body: 'хз', question_id: questions[1].id },
                 { body: 'Не подумали', question_id: questions[1].id },
                 { body: 'Орлы были еще маленькие', question_id: questions[1].id },

                 { body: '30-40', question_id: questions[2].id },
                 { body: '60-80', question_id: questions[2].id },
                 { body: '80-90', correct: true, question_id: questions[2].id },
                 { body: '120-130', question_id: questions[2].id },

                 { body: 'Погибли до времени действия сюжета', correct: true, question_id: questions[3].id },
                 { body: 'Косяк сюжета', question_id: questions[3].id },
                 { body: 'Отсутствуют ввиду непорочного зачания', question_id: questions[3].id },
                 { body: 'Переметнулись на другую сторону', question_id: questions[3].id },

                 { body: 'Заработали', question_id: questions[4].id },
                 { body: 'Украли', question_id: questions[4].id },
                 { body: 'Наследство', correct: true, question_id: questions[4].id },

                 { body: 'St. Anger', question_id: questions[5].id },
                 { body: 'Garage Inc.', correct: true, question_id: questions[5].id },
                 { body: 'Death Magnetic', question_id: questions[5].id },
                 { body: 'Load', question_id: questions[5].id }
               ])

10.times do
  TestPassage.create!(
    user_id: users.sample&.id,
    test_id: tests.sample&.id,
    created_at: DateTime.now - rand(0..10).hours
  )
end

50.times do |i|
  id = 3185100 + i
  BadgeImage.create!(url: "https://cdn-icons-png.flaticon.com/128/3185/#{id}.png")
end

RuleTemplate.create!([
                      { text: 'first_test' },
                      { text: 'all_tests_of_category', option_key: 'category_id' },
                      { text: 'at_first_try' },
                      { text: 'pass_after_fail' },
                      { text: 'n_tests_in_row', option_key: 'count' },
                      { text: 'n_tests', option_key: 'count' },
                      { text: 'all_tests_of_level', option_key: 'level' },
                      { text: 'all_tests' },
                      { text: 'n_badges', option_key: 'count' },
                    ])
# badges_icons = %w[
# https://cdn-icons-png.flaticon.com/128/3185/3185187.png
# https://cdn-icons-png.flaticon.com/128/3185/3185258.png
# https://cdn-icons-png.flaticon.com/128/3185/3185314.png
# https://cdn-icons-png.flaticon.com/128/3185/3185157.png
# https://cdn-icons-png.flaticon.com/128/3185/3185387.png
# https://cdn-icons-png.flaticon.com/128/3185/3185394.png
# https://cdn-icons-png.flaticon.com/128/3185/3185366.png
# https://cdn-icons-png.flaticon.com/128/3185/3185239.png
# https://cdn-icons-png.flaticon.com/128/3185/3185389.png
# https://cdn-icons-png.flaticon.com/128/3185/3185233.png
# https://cdn-icons-png.flaticon.com/128/3185/3185341.png
# https://cdn-icons-png.flaticon.com/128/3185/3185170.png
# https://cdn-icons-png.flaticon.com/128/3185/3185245.png
# https://cdn-icons-png.flaticon.com/128/3185/3185335.png
# https://cdn-icons-png.flaticon.com/128/3185/3185347.png
# https://cdn-icons-png.flaticon.com/128/3185/3185228.png
# https://cdn-icons-png.flaticon.com/128/3185/3185381.png
# https://cdn-icons-png.flaticon.com/128/3185/3185296.png
# https://cdn-icons-png.flaticon.com/128/3185/3185155.png
# https://cdn-icons-png.flaticon.com/128/3185/3185313.png
# https://cdn-icons-png.flaticon.com/128/3185/3185214.png
# https://cdn-icons-png.flaticon.com/128/3185/3185358.png
# https://cdn-icons-png.flaticon.com/128/3185/3185179.png
# https://cdn-icons-png.flaticon.com/128/3185/3185175.png
# https://cdn-icons-png.flaticon.com/128/3185/3185309.png
# https://cdn-icons-png.flaticon.com/128/3185/3185369.png
# https://cdn-icons-png.flaticon.com/128/3185/3185159.png
# https://cdn-icons-png.flaticon.com/128/3185/3185161.png
# https://cdn-icons-png.flaticon.com/128/3185/3185208.png
# https://cdn-icons-png.flaticon.com/128/3185/3185276.png
# https://cdn-icons-png.flaticon.com/128/3185/3185317.png
# https://cdn-icons-png.flaticon.com/128/3185/3185372.png
# https://cdn-icons-png.flaticon.com/128/3185/3185267.png
# https://cdn-icons-png.flaticon.com/128/3185/3185350.png
# https://cdn-icons-png.flaticon.com/128/3185/3185193.png
# https://cdn-icons-png.flaticon.com/128/3185/3185251.png
# https://cdn-icons-png.flaticon.com/128/3185/3185163.png
# https://cdn-icons-png.flaticon.com/128/3185/3185281.png
# https://cdn-icons-png.flaticon.com/128/3185/3185363.png
# https://cdn-icons-png.flaticon.com/128/3185/3185286.png
# https://cdn-icons-png.flaticon.com/128/3185/3185222.png
# https://cdn-icons-png.flaticon.com/128/3185/3185330.png
# https://cdn-icons-png.flaticon.com/128/3185/3185377.png
# https://cdn-icons-png.flaticon.com/128/3185/3185322.png
# https://cdn-icons-png.flaticon.com/128/3185/3185205.png
# https://cdn-icons-png.flaticon.com/128/3185/3185167.png
# https://cdn-icons-png.flaticon.com/128/3185/3185355.png
# https://cdn-icons-png.flaticon.com/128/3185/3185153.png
# https://cdn-icons-png.flaticon.com/128/3185/3185300.png
# https://cdn-icons-png.flaticon.com/128/3185/3185338.png
# ]