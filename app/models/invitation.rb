class Invitation < ActiveRecord::Base
  belongs_to :event
  belongs_to :guest, class_name: "User"
end
