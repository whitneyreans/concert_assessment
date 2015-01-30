require('spec_helper')

describe(Band) do
   it("validates presence of a band name") do
    band = Band.create({:name => ""})
    expect(band.save()).to(eq(false))
  end

  it ("capitalizes the first letter of each band") do
    band = Band.create({:name => "chromeo"})
    expect(band.name()).to(eq("Chromeo"))
  end

  it { should have_and_belong_to_many(:venues) }
end
