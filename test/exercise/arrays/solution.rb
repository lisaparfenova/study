module Exercise
  module Arrays
    class << self
      def search_max(array)
        max = array[0]
        for el in array
          max = el if el > max
        end
        max
      end

      def replace(array)
        max = search_max(array)
        array_res = []
        for el in array
          el = max if el.positive?
          array_res << el
        end
        array_res
      end

      def search(array, query, min_index = 0, max_index = array.size - 1)
        if array[min_index, max_index] == 0 && array == 0 || min_index > max_index
          -1
        else
          mid_index = (min_index + max_index) / 2
          if array[mid_index] == query
            mid_index
          elsif array[mid_index] < query
            min_index = mid_index + 1
            search(array, query, min_index, max_index)
          else
            max_index = mid_index - 1
            search(array, query, min_index, max_index)
          end
        end
      end
    end
  end
end
