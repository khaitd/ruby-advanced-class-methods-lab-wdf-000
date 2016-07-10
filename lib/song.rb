require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []



  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new

    song.name = name
      # binding.pry
    song
  end

 def self.create_by_name(name)
   song = self.create

   song.name = name

   song.save

   song
 end

  def self.find_by_name(name)
     @@all.each do |song|
       if song.name == name
         return song
       end
     end

  end

  def self.find_or_create_by_name(name)
     song = self.create
    #  if !self.find_by_name(name)
    #     self.create_by_name(name)
    #   else
    #   self.name
    # end
    song
  end

  def self.alphabetical
    array = []
    self.all.sort_by {|song| song.name}.uniq
   #  binding.pry

  end


  def self.new_from_filename(name)
    song = Song.new

    name_array = name.split(/\ - |\./)
    name_array.pop

    song.artist_name = name_array[0]
    song.name = name_array[1]


    song

  end

  def self.create_from_filename(name)
    song = Song.new

    name_array = name.split(/\ - |\./)
    name_array.pop

    song.artist_name = name_array[0]
    song.name = name_array[1]


    song.save
    song

  end

 def self.destroy_all
    @@all.clear

 end




end
