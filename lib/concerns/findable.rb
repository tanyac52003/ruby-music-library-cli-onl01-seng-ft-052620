module Concerns
  module Findable
    def find_by_name(name)
      self.all.find {|obj| object.name == name}
    end 
  end 
end 