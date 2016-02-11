class Relationship < ActiveRecord::Base
  belongs_to :person
  belongs_to :collaborator

  enum rel_type: [:relative, :spouse, :children, :parental]

  accepts_nested_attributes_for :person, :reject_if => :all_blank
end
