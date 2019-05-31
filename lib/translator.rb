# require modules here
require 'pry'
require 'yaml'


def load_library(path)
  # code goes here
  library = YAML.load_file(path)
  hash = {"get_emoticon" => {}, "get_meaning" => {}}
  library.each do |meaning, emotes|
    hash["get_meaning"][emotes[1]] = meaning 
    hash["get_emoticon"][emotes[0]] = emotes[1]
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  library = load_library(path)
  if library["get_emoticon"][emoticon] == nil 
    return "Sorry, that emoticon was not found"
  else
    return library["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  library = load_library(path)
  if library["get_meaning"][emoticon] == nil 
    return "Sorry, that emoticon was not found"
  else
    return library["get_meaning"][emoticon]
  end
end