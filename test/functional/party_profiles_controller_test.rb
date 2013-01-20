require 'test_helper'

class PartyProfilesControllerTest < ActionController::TestCase
  setup do
    @party_profile = party_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:party_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create party_profile" do
    assert_difference('PartyProfile.count') do
      post :create, party_profile: { date: @party_profile.date, host: @party_profile.host, location: @party_profile.location, name: @party_profile.name, password: @party_profile.password }
    end

    assert_redirected_to party_profile_path(assigns(:party_profile))
  end

  test "should show party_profile" do
    get :show, id: @party_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @party_profile
    assert_response :success
  end

  test "should update party_profile" do
    put :update, id: @party_profile, party_profile: { date: @party_profile.date, host: @party_profile.host, location: @party_profile.location, name: @party_profile.name, password: @party_profile.password }
    assert_redirected_to party_profile_path(assigns(:party_profile))
  end

  test "should destroy party_profile" do
    assert_difference('PartyProfile.count', -1) do
      delete :destroy, id: @party_profile
    end

    assert_redirected_to party_profiles_path
  end
end
