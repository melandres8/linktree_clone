require 'test_helper'

class SocialsControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
    @social = socials(:one)
  end

  test "should get index" do
    get :index, params: { profile_id: @profile }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { profile_id: @profile }
    assert_response :success
  end

  test "should create social" do
    assert_difference('Social.count') do
      post :create, params: { profile_id: @profile, social: @social.attributes }
    end

    assert_redirected_to profile_social_path(@profile, Social.last)
  end

  test "should show social" do
    get :show, params: { profile_id: @profile, id: @social }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { profile_id: @profile, id: @social }
    assert_response :success
  end

  test "should update social" do
    put :update, params: { profile_id: @profile, id: @social, social: @social.attributes }
    assert_redirected_to profile_social_path(@profile, Social.last)
  end

  test "should destroy social" do
    assert_difference('Social.count', -1) do
      delete :destroy, params: { profile_id: @profile, id: @social }
    end

    assert_redirected_to profile_socials_path(@profile)
  end
end
