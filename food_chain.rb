class FoodChain

  LINES = {
    "fly" => "I don't know why she swallowed the fly. Perhaps she'll die.\n",
    "spider" => "It wriggled and jiggled and tickled inside her.",
    "bird" => "How absurd to swallow a bird!",
    "cat" => "Imagine that, to swallow a cat!",
    "dog" => "What a hog, to swallow a dog!",
    "goat" => "Just opened her throat and swallowed a goat!",
    "cow" => "I don't know how she swallowed a cow!",
    "horse" => "She's dead, of course!\n"
  }
  ANIMALS = LINES.keys.freeze

  class << self

    def build_song
      lines = []
      1.upto(ANIMALS.size) do |i|
        lines << construct_verse(ANIMALS.take(i).reverse)
      end
      lines.join
    end

    def construct_verse(array)
      intro(array.first)
    end

    def intro(animal)
      intro = "I know an old lady who swallowed a #{animal}.\n"
      intro +=  "#{LINES[animal]}\n"
      intro
    end


  end

end

puts FoodChain.build_song

