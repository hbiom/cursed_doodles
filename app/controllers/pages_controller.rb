class PagesController < ApplicationController
  def home
    @thesis = Event.find_by(name: 'Thesis soutenance')
    @wedding = Event.find_by(name: 'Wedding')
    @meeting = Event.find_by(name: 'Meeting')
  end
end
