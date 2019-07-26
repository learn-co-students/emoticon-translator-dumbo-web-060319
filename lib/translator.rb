# require modules here
require "yaml"
require "pry"

def load_library file_path
  yaml_file = YAML.load_file(file_path)
  two_keys = {"get_meaning" => {}, "get_emoticon" => {}}
  yaml_file.each do |meaning, emoticons|
    two_keys["get_meaning"][emoticons[1]] = meaning
    two_keys["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  two_keys
end

def get_japanese_emoticon (file_path, emoticon)
  # code goes here
  translator = load_library(file_path)
  if translator["get_emoticon"].include?(emoticon)
  	translator["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (file_path, emoticon)
  # code goes here
  translator = load_library(file_path)
  if translator["get_meaning"].include?(emoticon)
  	translator["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end