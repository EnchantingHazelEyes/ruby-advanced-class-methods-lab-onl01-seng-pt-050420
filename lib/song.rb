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
    s = self.new 
    s.save
    s
  end 
  
  def self.new_by_name(name)
    s = self.new 
    s.name = name
    s
  end 
  
   def self.create_by_name(string_name_of_song)
    s = self.new 
    s.name = string_name_of_song
    s.save
    s 
  end 
  
  def self.find_by_name(string_name_of_song)
    self.all.detect{|n| n.name == string_name_of_song}
  end 
  
    def self.find_or_create_by_name(find_this_song)
      did_i_find_it = self.all.detect {|n| n.name == find_this_song}
      if did_i_find_it == nil
        s = self.new 
        s.name = find_this_song
        s.save 
        s
      else
        did_i_find_it
      end
  end 
  
  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end 
  
  def self.new_from_filename(mp3_formatted_file)
     s = self.new 
    s.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    s.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    s
  end 
  
  def self.create_from_filename(mp3_formatted_file)
     s = self.new 
    s.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    s.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    s.save
    s
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  
end
