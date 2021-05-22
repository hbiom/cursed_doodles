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


print('db erase')

dates_string = "December 17 2020, December 16 2020,December 18 2020,December 19 2020,December 20 2020"

today = Date.today

dates = []
[5, 8, 12, 15].sample.times do
  today += [1, 2, 3, 5].sample
  dates << today.strftime("%B %d %Y")
end
dates = dates * ","

thesis_text = "Hello, dear thesis commitee, please indicate your disponibility for my thesis soutenance below. I know you are all
very busy and sollicitated all around the world, but I really hope we find a common date soon.
cordially."

thesis = Event.create!(name: 'Thesis soutenance',
                      place: 'Paris',
                      note: thesis_text,
                      start_time: dates)

emilie = User.create!(name:'Emilie', role: 'Organisator', event_id: thesis.id)
newton = User.create!(name:'Newton', role: 'Dr', event_id: thesis.id)
pasteur = User.create!(name:'Pasteur', role: 'Pr', event_id: thesis.id)
curie = User.create!(name:'Curie', role: 'Présidente', event_id: thesis.id)
pascal = User.create!(name:'Pascal', role: 'directeur de thése', event_id: thesis.id)

comitee = [emilie, newton, pasteur, curie, pascal]

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

dates = []
[5, 8, 12, 15].sample.times do
  today += [1, 2, 3, 5].sample
  dates << today.strftime("%B %d %Y")
end
dates = dates * ","

weeding_text = 'Dear family, dear friends. I am so happy to invite you all to my wedding ! I want you all to be
present for this special day. Please indicate your disponibilities so we can find a common date. I know some of you
are angry about each other, please take you differences aside and do not purposedly choose different dates so you do not
have to meet... I love you all !'

weeding = Event.create!(name: 'Wedding',
                        place: 'Paris',
                        note: weeding_text,
                        start_time: dates)

marie = User.create!(name:'Marie', role: 'Organisator', event_id: weeding.id)
juliette = User.create!(name:'Juliette', role: 'bestie', event_id: weeding.id)
tata_jeannine = User.create!(name:'Aunt jeannine', role: 'aunt', event_id: weeding.id)
tata_huguette = User.create!(name:'Aunt huguette', role: 'aunt', event_id: weeding.id)
marie = User.create!(name:'Marie', role: 'Mun', event_id: weeding.id)
yves = User.create!(name:'Yves', role: 'Distant cousin', event_id: weeding.id)

family_co = [marie, juliette, tata_jeannine, tata_huguette, marie, tonton_yves]

family_co.each {|menber| define_uptime(menber, weeding)}

dates = []
[5, 8, 12, 15].sample.times do
  today += [1, 2, 3, 5].sample
  dates << today.strftime("%B %d %Y")
end
dates = dates * ","

job_text = 'Dear all, I wish to ask you for a meeting about the new job position I\'m looking for our department.
Please indicate your disponibilities so we can find a common date shortly.
Best regards !'

job_meeting = Event.create!(name: 'Meeting',
                      place: 'Paris',
                      note: job_text,
                      start_time: dates)

derek = User.create!(name:'Derek', role: 'Organisator', event_id: weeding.id)
bruno = User.create!(name:'Bruno', role: 'n+1', event_id: job_meeting.id)
elon = User.create!(name:'Elon', role: 'n+2', event_id: job_meeting.id)
steve = User.create!(name:'Steve', role: 'RH', event_id: job_meeting.id)
jack = User.create!(name:'jack', role: 'DRH', event_id: job_meeting.id)

boss = [derek, bruno, elon, bill, steve, jack]

boss.each {|menber| define_uptime(menber, job_meeting)}
