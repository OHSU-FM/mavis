require "helper"

describe Mavis::Users do
  before do
    @client = Mavis::Client.new(client_id: "123", institution: "test", p_key: "456")
  end

  describe "#users_types" do
    before do
      stub_post("/users/types")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("users_types.json"))
    end

    it "should return an Array of Hashes" do
      t = @client.users_types()
      expect(t).to be_a Array
      expect(t.first).to be_a Hash
    end
  end

  describe "#users_residents" do
    before do
      stub_post("/users/residents")
        .with(body: body(@client, {"programID": 1111}.to_json) + "&request=%7B%22programID%22%3A1111%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_residents.json"))
    end

    it "requests the correct resource" do
      @client.users_residents(1111)
      expect(a_post("/users/residents")).to have_been_made
    end
  end

  describe "#users_faculty" do
    before do
      stub_post("/users/faculty")
        .with(body: body(@client, {"programID": 1111}.to_json) + "&request=%7B%22programID%22%3A1111%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_faculty.json"))
    end

    it "requests the correct resource" do
      @client.users_faculty(1111)
      expect(a_post("/users/faculty")).to have_been_made
    end
  end

  describe "#users_students" do
    before do
      stub_post("/users/students")
        .with(body: body(@client, {"courseID": 1111}.to_json) + "&request=%7B%22courseID%22%3A1111%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_students.json"))
    end

    it "requests the correct resource" do
      @client.users_students(1111)
      expect(a_post("/users/students")).to have_been_made
    end
  end

  describe "#users_outside" do
    before do
      stub_post("/users/outside")
        .with(body: body(@client, {"programID": 1111}.to_json) + "&request=%7B%22programID%22%3A1111%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_outside.json"))
    end

    it "requests the correct resource" do
      @client.users_outside(1111)
      expect(a_post("/users/outside")).to have_been_made
    end
  end

  describe "#users_resident_search" do
    before do
      stub_post("/users/residentSearch")
        .with(body: body(@client, {"username": "ggregg"}.to_json) + "&request=%7B%22username%22%3A%22ggregg%22%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_resident_search.json"), headers: {})
    end

    it "requests the correct resource" do
      @client.users_resident_search({"username": "ggregg"})
      expect(a_post("/users/residentSearch")).to have_been_made
    end
  end

  describe "#users_faculty_search by name" do
    before do
      stub_post("/users/facultySearch")
        .with(body: body(@client, {"name": "Peter Sagan"}.to_json) + "&request=%7B%22name%22%3A%22Peter%20Sagan%22%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_faculty_search.json"), headers: {})
    end

    it "requests the correct resource" do
      @client.users_faculty_search({"name": "Peter Sagan"})
      expect(a_post("/users/facultySearch")).to have_been_made
    end
  end

  describe "#users_faculty_search by username" do
    before do
      stub_post("/users/facultySearch")
        .with(body: body(@client, {"username": "saganp"}.to_json) + "&request=%7B%22username%22%3A%22saganp%22%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_faculty_search.json"), headers: {})
    end

    it "requests the correct resource" do
      @client.users_faculty_search({"username": "saganp"})
      expect(a_post("/users/facultySearch")).to have_been_made
    end
  end

  describe "#users_student_search" do
    before do
      stub_post("/users/studentSearch")
        .with(body: body(@client, {"username": "test"}.to_json) + "&request=%7B%22username%22%3A%22test%22%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_student_search.json"), headers: {})
    end

    it "should return an Array of Hashes" do
      t = @client.users_student_search({"username": "test"})
      expect(t).to be_a Array
      expect(t.first).to be_a Hash
      expect(t.first["name_last"]).to eq "Sagan"
    end
  end

  describe "#users_student_info" do
    before do
      stub_post("/users/studentTraining")
        .with(body: body(@client, {"userID": 1111}.to_json) + "&request=%7B%22userID%22%3A1111%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_student_training.json"), headers: {})
    end

    it "requests the correct resource" do
      @client.users_student_training(1111)
      expect(a_post("/users/studentTraining")).to have_been_made
    end
  end

  describe "#users_student_types" do
    before do
      stub_post("/users/studentTypes")
        .with(body: body(@client, ""), headers: headers)
        .to_return(status: 200, body: fixture("users_student_types.json"), headers: {})
    end

    it "requests the correct resource" do
      @client.users_student_types
      expect(a_post("/users/studentTypes")).to have_been_made
    end
  end

  describe "#users_user_lookup" do
    before do
      stub_post("/users/userLookup")
        .with(body: body(@client, {"userID": 567}.to_json) + "&request=%7B%22userID%22%3A567%7D", headers: headers)
        .to_return(status: 200, body: fixture("users_user_lookup.json"), headers: {})
    end

    it "requests the correct resource" do
      @client.users_user_lookup(567)
      expect(a_post("/users/userLookup")).to have_been_made
    end
  end
end
