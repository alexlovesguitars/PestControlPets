class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  include PgSearch::Model

  pg_search_scope :search_by_race,
    against: [ :race ],
    using: {
      tsearch: { prefix: true }
    }

end
