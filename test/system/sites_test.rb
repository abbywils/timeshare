require "application_system_test_case"

class SitesTest < ApplicationSystemTestCase
  setup do
    @site = sites(:one)
  end

  test "visiting the index" do
    visit sites_url
    assert_selector "h1", text: "Sites"
  end

  test "creating a Site" do
    visit sites_url
    click_on "New Site"

    fill_in "Area", with: @site.area
    fill_in "Category", with: @site.category
    fill_in "Country", with: @site.country_id
    fill_in "Countryname", with: @site.countryname
    fill_in "Dateinscribed", with: @site.dateinscribed
    fill_in "Description", with: @site.description
    fill_in "Latitude", with: @site.latitude
    fill_in "Longitude", with: @site.longitude
    fill_in "Sitename", with: @site.sitename
    click_on "Create Site"

    assert_text "Site was successfully created"
    click_on "Back"
  end

  test "updating a Site" do
    visit sites_url
    click_on "Edit", match: :first

    fill_in "Area", with: @site.area
    fill_in "Category", with: @site.category
    fill_in "Country", with: @site.country_id
    fill_in "Countryname", with: @site.countryname
    fill_in "Dateinscribed", with: @site.dateinscribed
    fill_in "Description", with: @site.description
    fill_in "Latitude", with: @site.latitude
    fill_in "Longitude", with: @site.longitude
    fill_in "Sitename", with: @site.sitename
    click_on "Update Site"

    assert_text "Site was successfully updated"
    click_on "Back"
  end

  test "destroying a Site" do
    visit sites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Site was successfully destroyed"
  end
end
