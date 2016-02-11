class Collaborator < ActiveRecord::Base
  belongs_to :person
  has_many :relationships
  has_many :people, through: :relationships, :class_name => 'Person'
  has_many :relative_relationships, -> { where(rel_type: Relationship.rel_types[:relative]) }, foreign_key: "collaborator_id", class_name: "Relationship"
  has_many :relative, through: :relative_relationships, :class_name => 'Person'
  has_one :spouse_relationship, -> { where(rel_type: Relationship.rel_types[:spouse]) }, foreign_key: "collaborator_id", class_name: "Relationship"
  has_one :spouse, through: :spouse_relationship, :class_name => 'Person'
  has_many :children_relationships, -> { where(rel_type: Relationship.rel_types[:children]) }, foreign_key: "collaborator_id", class_name: "Relationship"
  has_many :children, through: :children_relationships, :class_name => 'Person'
  has_many :parental_relationships, -> { where(rel_type: Relationship.rel_types[:parental]) }, foreign_key: "collaborator_id", class_name: "Relationship"
  has_many :parental, through: :parental_relationships, :class_name => 'Person'

  accepts_nested_attributes_for :children_relationships
  accepts_nested_attributes_for :children
end
