Given('I have a profile with:') do |table|
  attributes = table.rows_hash.transform_values(&:strip)
  @user ||= User.create!(email: 'test@example.com', password: 'password')
  @user.update!(attributes.transform_keys(&:to_sym))
  @previous_profile_snapshot = attributes.transform_values(&:to_s)
end

When('I visit my profile page') do
  visit profile_path
end

Then('I should see my profile information:') do |table|
  table.rows_hash.each_value do |value|
    expect(page).to have_content(value.strip)
  end
end

When(/I (?:update|attempt to update) my profile with:/) do |table|
  attributes = table.rows_hash.transform_values(&:strip)
  visit edit_profile_path
  @previous_profile_snapshot = @user.attributes.slice(*attributes.keys).transform_values(&:to_s)
  attributes.each do |field, value|
    # Use field name directly (e.g., 'user_display_name') or try label text
    field_id = "user_#{field}"
    begin
      fill_in field_id, with: value
    rescue Capybara::ElementNotFound
      # Fallback to label text if field ID doesn't work
      fill_in field.humanize, with: value
    end
  end
  click_button 'Save Profile'
  @last_submitted_profile = attributes
end

Then('my profile should be saved with:') do |table|
  expected = table.rows_hash.transform_values(&:strip)
  user = @user.reload
  expected.each do |field, value|
    expect(user.send(field).to_s).to eq(value)
  end
end

Then('I should see a profile update confirmation {string}') do |message|
  expect(page).to have_content(message)
end

Then('the profile should not be saved') do
  expected = @previous_profile_snapshot || {}
  current = @user.reload.attributes.slice(*expected.keys).transform_values { |v| v.to_s }
  expect(current).to eq(expected)
end

Then('I should see a profile validation error {string}') do |message|
  expect(page).to have_content(message)
end

Given('I have uploaded a profile picture') do
  visit edit_profile_path
  # Find the hidden file input and attach file to it
  file_input = find('#user_avatar', visible: false)
  file_input.attach_file(Rails.root.join('features', 'screenshots', 'create_listing_1.jpg').to_s)
  click_button 'Save Profile'
  @user.reload
end

When('I remove my profile picture') do
  visit edit_profile_path
  # Click the delete icon button (trash icon) which is only visible when avatar exists
  find('button[title="Remove profile picture"]').click
end

Then('I should see a profile picture placeholder') do
  expect(page).to have_css('[data-testid="profile-picture-placeholder"]')
end

Then('my profile should not have a profile picture') do
  expect(@user.reload.avatar).to be_nil
end
