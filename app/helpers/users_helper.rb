module UsersHelper
  
  def gravatar_for(user, options = { :size => 10, :alt => user.name}) 
    gravatar_image_tag(user.email.downcase, :alt => user.name, 
                                            :class => 'gravatar', 
                                            :gravator => options )
  end 
  
end
