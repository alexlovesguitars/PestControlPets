class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  include PgSearch::Model

  pg_search_scope :search_by_race_targets,
    against: [ :race, :targets ],
    using: {
      tsearch: { prefix: true }
    }

end
