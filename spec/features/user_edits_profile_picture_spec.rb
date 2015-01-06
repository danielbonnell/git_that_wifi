require "rails_helper"

feature "user edits profile picture", %Q{
  As an authenticated user, I want to upload an image for my avatar,
  so that I can distinguish myself from other users.

  Acceptance Criteria:
  -[ ] I have an option to upload an image from my computer as my avatar.
  -[ ] I see an error if the file I supplied is not a valid image format (jpg, gif, png).
  -[ ] I see an error if the file size of the image I supplied is too large.
  -[ ] I see the image I supplied as my new avatar.
  } do

  # describe AvatarUploadSpec
    include CarrierWaveDirect::Test::CapybaraHelpers
  # end

  scenario "visit your account detail and edit" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"

    visit edit_user_path(user)

    avatar = "Kiran Sridhar-2.jpg"
    file = "/Users/kiransridhar/Desktop/#{avatar}"
    save_and_open_page
    attach_file_for_direct_upload(file)
    expect(page).to have_css("img", :src => avatar)
  end

end
