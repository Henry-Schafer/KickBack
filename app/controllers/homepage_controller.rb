class HomepageController < ApplicationController
  def homepage
  
    render({ :template => "homepage/index.html.erb" })
  end
end