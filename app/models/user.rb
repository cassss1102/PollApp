# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true


  has_many :authored_polls,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Poll

  has_many :responses,
  primary_key: :id,
  foreign_key: :respondent_id,
  class_name: :Response
end
