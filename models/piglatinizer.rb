class PigLatinizer
#check if starts with consonant. If not, add 'way' to the end of it
#if it does, slice letters off until you reach a vowel
#add letters to the end followed by 'ay'
  def piglatinize(string)
    starting_array = []
    string.split(" ").each do |word|
      if consonant?(word)
       starting_array << slice_and_paste(word,starting_index(word))
      else
       new_word = word += "way"
       starting_array << new_word
     end
   end
   starting_array.join(" ")
  end

  def consonant?(word)
    word[0].scan(/[aeiouAEIOU]/).empty?
  end

  def starting_index(word)
    word.split("").each_with_index do |letter, index|
      if %w(a e i o u A E I O U).include?(letter)
        return index
      end
    end
  end

  def slice_and_paste(word, index)
    remains = word.slice(index,word.length)
    start_of_word = word.slice(0,index)
    new_word = remains += start_of_word += "ay"
    new_word
  end

end
