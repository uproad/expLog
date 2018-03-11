class Post < ApplicationRecord
  validates :content, {presence: true, length:{maximum:10000}}
  validates :title, {presence: true, length:{maximum:20}}
  validates :user_id, {presence: true}
end
