FactoryGirl.define do |f|
  factory :image do |f|
    f.image_file Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'test', 'test.jpg'), 'image/jpeg')
  end
end
