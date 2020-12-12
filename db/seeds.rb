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

dates_string = "December 17 2020, December 16 2020,December 18 2020,December 19 2020,December 20 2020"
# dates.map {|date| date.to_date}

today = Date.today

dates = []
[5, 8, 12, 15].sample.times do
  today += [1, 2, 3, 5].sample
  dates << today.strftime("%B %d %Y")
end

  print((dates*","))


thesis = Event.create!(name: 'Soutenance de thése',
                      place: 'Paris',
                      note: 'Cest avec plaisir que',
                      start_time: dates*",")

newton = User.create!(name:'newton', role: 'Dr', event_id: thesis.id)
pasteur = User.create!(name:'pasteur', role: 'Pr', event_id: thesis.id)
curie = User.create!(name:'curie', role: 'Présidente', event_id: thesis.id)
jenner = User.create!(name:'jenner', role: 'directeur de thése', event_id: thesis.id)
pascal = User.create!(name:'pascal', role: 'directeur de thése', event_id: thesis.id)

comitee = [newton, pasteur, curie, jenner, pascal]

 def define_uptime(user, event)
    if user.role == "Organisator"
      @uptime = Uptime.create!(start_time: event.start_time, user: user)
      @uptime.start_time = event.start_time
      @uptime.save
    else
      ### uptime for invite people
      event.start_event.empty? ? user_date = "" : user_date = event.define_date_for_user
      @uptime = Uptime.create!(start_time: user_date, user: user)
      @uptime.save
    end
  end

comitee.each {|menber| define_uptime(menber, thesis)}
