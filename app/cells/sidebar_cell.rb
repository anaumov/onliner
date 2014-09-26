class SidebarCell < Cell::Rails

  def random_users
    @users  = User.all.sample(10)
    render
  end

end
