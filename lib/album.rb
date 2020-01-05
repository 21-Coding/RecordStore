
class Album
  attr_accessor :name, :id, :name, :status
  @@albums = {}
  @@total_rows = 0
  @@sold_albums = {}

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
    @status = "available"
  end

  def songs
    Song.find_by_album(self.id)
  end
  
  def self.all()
    @@albums.values().sort { |a, b| a.name.downcase <=> b.name.downcase }
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def self.search_name(name)
    @@albums.values().select { |album| /#{name}/i.match? album.name }
  end

  def update(name)
    self.name = name
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def delete()
    @@albums.delete(self.id)
  end

  def sold()
    self.status = "sold"
    @@sold_albums[self.id] = Album.new(self.name, self.id)
    end
  end
