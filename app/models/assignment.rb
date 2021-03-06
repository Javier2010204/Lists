# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  state       :string           default("open")
#  list_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assignment < ApplicationRecord
  belongs_to :list

  validates :title, presence: true
  validates :description, presence: true


  include AASM

  aasm column: "state" do 

  	state :open, initial: true
  	state :completed
  	state :failed

  	event :to_complete do
  		transitions from: :open, to: :completed
  	end

  	event :to_failed do
  		transitions from: :failed, to: :open
  	end

  end

end
