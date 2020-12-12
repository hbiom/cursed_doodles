# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Uptime.destroy_all
User.destroy_all
Event.destroy_all

thesis = Event.create!(name: 'Soutenance de thése',
                      place: 'Paris',
                      note: 'Cest avec plaisir que',
                      start_time: Date.today)

newton = User.create!(name:'newton', role: 'Dr', event_id: thesis.id)
pasteur = User.create!(name:'pasteur', role: 'Pr', event_id: thesis.id)
curie = User.create!(name:'curie', role: 'Présidente', event_id: thesis.id)
jenner = User.create!(name:'jenner', role: 'directeur de thése', event_id: thesis.id)
pascal = User.create!(name:'pascal', role: 'directeur de thése', event_id: thesis.id)

def define_uptime(user,event)
  if user.role == "Organisator"
    @uptime = Uptime.create!(start_time: event.start_time, user: user)
    @uptime.start_time = event.start_time
    if @uptime.save
      redirect_to event_path(event)
    end
  else
    ### uptime for invite people
    event.start_event.empty? ? user_date = "" : user_date = event.define_date_for_user
    @uptime = Uptime.create!(start_time: user_date, user: user)
    if @uptime.save
      redirect_to event_path(event)
    end
  end
end


define_uptime(pasteur)
