class ZipCode < ActiveRecord::Base
  attr_accessible :code, :endorsed_candidates
  serialize :endorsed_candidates

end
