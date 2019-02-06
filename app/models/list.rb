# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  color       :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class List < ApplicationRecord
  belongs_to :user
  has_many :assignments

  validates :title, presence: true, uniqueness: true

	include AASM

	aasm column: "state" do
		state :publico, initial:true 
		state :privado

		event :published do
			transitions from: :private, to: :public
		end

		event :privated do
			transitions from: :public, to: :private
		end
	end

end
