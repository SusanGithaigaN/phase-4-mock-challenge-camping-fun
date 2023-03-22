class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  has_many :activities

  def summary
    " #{self.object.name} - #{self.object.camper.activities} "
  end
end
