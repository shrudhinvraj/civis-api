class Question < ApplicationRecord
	belongs_to :parent, class_name: "Question", optional: true
	belongs_to :consultation, optional: true
  has_many :sub_questions, class_name: 'Question', foreign_key: :parent_id
  enum question_type: { checkbox: 0, multiple_choice: 1, long_text: 2 }
end