class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invitations
  has_many :guests, :through => :invitations

  accepts_nested_attributes_for :invitations
end
