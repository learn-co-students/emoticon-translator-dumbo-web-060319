require 'yaml'
emo=YAML.load_file('/Users/samip/lab/emoticon-translator-dumbo-web-060319/lib/emoticons.yml')


def load_library(path)
  emoticons_hash=YAML.load_file(path)

 result={"get_meaning"=>{},"get_emoticon"=>{}}

 emoticons_hash.each do |meaning,arr|
    arr.each_with_index do |symbols,i|
      if i == 0
      result["get_emoticon"][symbols]=arr[1]
      else 
      result["get_meaning"][symbols]=meaning
      end
    end
 end
 result
end

def get_japanese_emoticon(path,emoticon)
  emoticons_hash=load_library(path)
  english_to_japanese=emoticons_hash["get_emoticon"]
    english_to_japanese.each do |english,japaneese|
      if english == emoticon
        return japaneese
      end
    end
 return "Sorry, that emoticon was not found"
  end

def get_english_meaning(path,emoticon)
  emoticons_hash=load_library(path)
  meaning_to_japaneese=emoticons_hash["get_meaning"]
    meaning_to_japaneese.each do |japaneese,meaning|
      if japaneese == emoticon
        return meaning
      end
    end
 return "Sorry, that emoticon was not found"
  
  
end


p load_library '/Users/samip/lab/emoticon-translator-dumbo-web-060319/lib/emoticons.yml'