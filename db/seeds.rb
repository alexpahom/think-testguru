# frozen_string_literal: true
[TestPassage, Answer, Question, Test, Category, User].each(&:delete_all)
users = User.create!([
                       { username: 'fox', email: 'fox@test.com', password: 'Test123' },
                       { username: 'wolf', email: 'wolf@test.com', password: 'Test123' },
                       { username: 'bear', email: 'bear@test.com', password: 'Test123' }
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
