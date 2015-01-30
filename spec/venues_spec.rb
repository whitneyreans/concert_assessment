require('spec_helper')

describe(Venue) do
  it("validates presence of a venue name") do
   venue = Venue.create({:name => ""})
   expect(venue.save()).to(eq(false))
 end

  it { should have_and_belong_to_many(:bands) }
end
