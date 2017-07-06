class FoodChain

  LINES = {
    "fly" => "",
    "spider" => "It wriggled and jiggled and tickled inside her.",
    "bird" => "How absurd to swallow a bird!",
    "cat" => "Imagine that, to swallow a cat!",
    "dog" => "What a hog, to swallow a dog!",
    "goat" => "Just opened her throat and swallowed a goat!",
    "cow" => "I don't know how she swallowed a cow!",
    "horse" => ""
  }
  ANIMALS = LINES.keys.freeze

  class << self

    def song
      lines = []
      1.upto(ANIMALS.size) do |i|
        lines << construct_verse(ANIMALS.take(i).reverse)
      end
      lines.join
    end

    def construct_verse(animals_array)
      intro(animals_array.first) + middle_lines(animals_array) + last_line(animals_array)
    end

    def intro(animal)
      first_animal, last_animal = ANIMALS[0], ANIMALS[-1]
      intro = "I know an old lady who swallowed a #{animal}.\n"
      intro +=  "#{LINES[animal]}\n" unless [first_animal, last_animal].include?(animal)
      intro
    end

    def middle_lines(animals_array)
      return '' if animals_array.size == ANIMALS.size
      lines = []
      animals_array.each_cons(2) do |pair|
        line =  if (pair - %w(spider bird)).empty?
                  "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
                else
                  swallowed_to_catch_line(pair)
                end
        lines << line
      end
      lines.join()
    end

    def last_line(animals_array)
      return "She's dead, of course!" if animals_array.first == ANIMALS.last
      "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
    end

    def swallowed_to_catch_line(pair)
      return if pair.size != 2
      "She swallowed the #{pair[0]} to catch the #{pair[1]}.\n"
    end


  end

end

puts FoodChain.song

