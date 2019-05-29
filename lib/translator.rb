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

def get_japanese_emoticon(lib, emote)
  # answer will be returned at the end of method
  ans = "Sorry, that emoticon was not found"
  # load library and iterate through
  load_library(lib).map do |get_stuff, kv_pairs|
    if get_stuff == "get_emoticon"
      # select key value pair where the english emote = the one passed to our method
      kv_pairs.select do |eng, jpn|
        # if it's a match, re-assign answer's value
        ans = jpn if eng == emote
      end
    end
  end
  # return answer
  ans
end

def get_english_meaning
  # code goes here
end