class Movie < ApplicationRecord
  SORT_COLUMNS = %w[title release_date].freeze

  def self.all_ratings
    %w[G PG PG-13 R]
  end

  # ratings_list: array such as ['G', 'PG']; nil/empty returns all movies.
  def self.with_ratings(ratings_list)
    return all if ratings_list.blank?

    where("UPPER(rating) IN (?)", ratings_list.map { |r| r.to_s.upcase })
  end
end
