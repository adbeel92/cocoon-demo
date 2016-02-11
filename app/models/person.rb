class Person < ActiveRecord::Base
  has_one :collaborator
  has_many :relationships
  has_many :collaborators, through: :relationships

  accepts_nested_attributes_for :collaborator#, reject_if: :all_blank, allow_destroy: true
end
