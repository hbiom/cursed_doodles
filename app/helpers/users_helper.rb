module UsersHelper



  def create_user
    User.new(name: "dede", role:"nettoyeur")
  end
end
