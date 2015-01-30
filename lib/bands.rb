class Band < ActiveRecord::Base

  validates(:name, :presence => true)
  before_save(:capitalize_name)

  has_and_belongs_to_many(:venues)


  private

  define_method(:capitalize_name) do
    self.name=(name().capitalize)
  end
end
