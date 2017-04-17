require 'rails_helper'

describe Link do
  it { is_expected.to have_db_column(:url) }
  it { is_expected.to validate_uniqueness_of(:url).case_insensitive }
  it { is_expected.to have_db_column(:read_count) }
end
