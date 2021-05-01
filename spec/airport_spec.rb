require 'airport'

RSpec.describe Airport do
  describe "#land" do
    it "should tell a plane to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "accepts landing planes" do
      subject.land(Plane.new)
      expect(subject.planes.length).to be 1
    end

    it "should raise an error when full" do
      (Airport::DEFUALT_CAPACITY).times {subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error("Airport full.")
    end
  end

  describe "#take_off" do
    it "should tell a plane to take off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "should check the plane is gone" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

  describe "capacity" do
    it "has a default capacity" do
      expect(subject.capacity).to eq(Airport::DEFUALT_CAPACITY)
    end

    let (:airport) {Airport.new(40)}
    it "has a variable capacity" do
      expect(airport.capacity).to eq(40)
    end
  end
end