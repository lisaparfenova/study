module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        res_array = []
        array.filter do |el|
          if el['country'].to_s.split(',').size > 1 && el['rating_kinopoisk'].to_f.positive?
            res_array << el['rating_kinopoisk']
          end
        end
        res_array.reduce { |sum, x| sum.to_f + x.to_f } / res_array.size
      end

      def chars_count(films, threshold)
        res_array = []
        films.filter do |el|
          res_array << el['name'] if el['rating_kinopoisk'].to_f >= threshold
        end
        res_array.map { |el| el.to_s.scan('и').count }.reduce(:+)
      end
    end
  end
end
