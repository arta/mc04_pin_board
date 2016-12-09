module PinsHelper
  def link_to_user_profile_of( pin )
    name = pin.user == current_user ? 'Myself' : pin.user.profile.username
    concat 'By '
    concat link_to( name, profile_path( pin.user.profile ) )
  end

  def like_dislike_buttons_for( pin )
    like_button_for( pin )
    concat ' '
    dislike_button_for( pin )
  end
  def like_button_for( pin )
    like_and_size = link_to like_pin_path( pin ), method: :put, class:'btn btn-default' do
      concat( content_tag :span, nil, class:'glyphicon glyphicon-heart' )
      concat ' '
      concat( pin.get_upvotes.size )
    end
    concat like_and_size
  end
  def dislike_button_for( pin )
    dislike_and_size = link_to dislike_pin_path( pin ), method: :put, class:'btn btn-default' do
      concat( content_tag :span, nil, class:'glyphicon glyphicon-thumbs-down' )
      concat ' '
      concat( pin.get_downvotes.size )
    end
    concat dislike_and_size
  end
end
