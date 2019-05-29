require "pry"
require "yaml"


def load_library(lib)
  # create dictionary
  emote_dictionary = {
    "get_emoticon" => {}, 
    "get_meaning" => {}
  }
  # binding.pry
  # load the file
  data = YAML.load_file(lib)
  
  # go through our data
  data.map do |meaning, emotes|
    # binding.pry  
    # english emote to japanese emote
    emote_dictionary["get_emoticon"][emotes[0]] = emotes[1] 
    # japanese emote to meaning
    emote_dictionary["get_meaning"][emotes[1]] = meaning
  end

  emote_dictionary
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end