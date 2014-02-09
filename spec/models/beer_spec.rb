require 'spec_helper'

describe Beer do

  it "is not saved without a name" do
    beer = Beer.new style:"Lager"

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "is not saved without a style" do
    beer = Beer.new name:"Tyylitön muttei mauton"

    expect(Beer.count).to eq(0)
  end

  describe "with a proper name and style set" do
    let(:beer){ Beer.create name:"Olvi", style:"Lager"}

  it "is saved" do
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end
    end
end
