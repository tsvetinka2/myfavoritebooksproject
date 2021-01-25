# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
more_books = [
    {:title => 'The Proposal', :genre => 'Romance', :description => 'Freelance writer Nik boyfriend proposes at a Dodger game, and the dude can not even spell her name right. She says no (duh), and the video goes viral.', :isbn_number => '1-39563-118-3', :publish_date => '03-May-2005'},
 {:title => 'Then She Was Gone', :genre => 'Drama', :description => 'She was fifteen, her mother golden girl. She had her whole life ahead of her. And then, in the blink of an eye, Ellie was gone.', :isbn_number => '1-39563-998-3', :publish_date => '09-Aug-2011'},
 {:title => 'Woman in White', :genre => 'Mystery', :description => 'Laura was betrothed to Sir Percival Glyde and yet she was mysteriously warned not to proceed with the marriage.', :isbn_number => '1-39563-111-8', :publish_date => '01-Jan-2021'},
 {:title => 'Foundation', :genre => 'Science fiction', :description => 'The Foundation series follows Hari Seldon, who is the architect of psychohistory – a branch of mathematics that can make accurate predictions thousands of years in advance, and which Seldon believes is necessary to save the human race from the dark ages.', :isbn_number => '1-93263-111-9', :publish_date => '31-Jan-2018'},
 {:title => 'The Haunting of Hill House', :genre => 'Horror', :description => 'The Haunting of Hill House is simply the best haunted house story ever written. The scares come not just from the malevolent actions of a house that seems sentient and angry, but from the claustrophobia we experience from the novel’s unreliable narrator, Eleanor, whose descent into madness is slow and excruciating and only begins after we’ve been lulled into a false sense of security by the seeming relatability of her early persona.', :isbn_number => '1-39333-111-8', :publish_date => '25-Feb-2010'},
 {:title => 'Treasure Island', :genre => 'Action and Adventure', :description => 'Written by Scottish author Robert Louis Stevenson, this story of “buccaneers and buried gold” launched a million tropes of treasure maps, sea chests, Black Spots, and deserted islands.', :isbn_number => '1-93263-123-6', :publish_date => '25-Apr-2017'}
]
more_books.each do |book|
 Book.create!(book)
end