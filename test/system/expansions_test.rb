require "application_system_test_case"

class ExpansionsTest < ApplicationSystemTestCase
  setup do
    @expansion = expansions(:one)
  end

  test "visiting the index" do
    visit expansions_url
    assert_selector "h1", text: "Expansions"
  end

  test "creating a Expansion" do
    visit expansions_url
    click_on "New Expansion"

    fill_in "Designer", with: @expansion.designer_id
    fill_in "Game", with: @expansion.game_id
    fill_in "Name", with: @expansion.name
    fill_in "Pcount", with: @expansion.pcount
    fill_in "Publisher", with: @expansion.publisher_id
    fill_in "Year", with: @expansion.year
    click_on "Create Expansion"

    assert_text "Expansion was successfully created"
    click_on "Back"
  end

  test "updating a Expansion" do
    visit expansions_url
    click_on "Edit", match: :first

    fill_in "Designer", with: @expansion.designer_id
    fill_in "Game", with: @expansion.game_id
    fill_in "Name", with: @expansion.name
    fill_in "Pcount", with: @expansion.pcount
    fill_in "Publisher", with: @expansion.publisher_id
    fill_in "Year", with: @expansion.year
    click_on "Update Expansion"

    assert_text "Expansion was successfully updated"
    click_on "Back"
  end

  test "destroying a Expansion" do
    visit expansions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expansion was successfully destroyed"
  end
end
