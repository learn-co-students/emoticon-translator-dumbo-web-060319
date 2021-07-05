# require modules here
require 'pry'
require 'yaml'

def load_library(path)
  library = YAML.load_file(path)
  hash = {"get_emoticon" => {}, "get_meaning" => {}}
  library.each do |meaning, emotes|
    hash["get_meaning"][emotes[1]] = meaning
    hash["get_emoticon"][emotes[0]] = emotes[1]
  end 
  return hash
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if library["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  end
  return library["get_emoticon"][emoticon]
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  if library["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  end
  return library["get_meaning"][emoticon]
end