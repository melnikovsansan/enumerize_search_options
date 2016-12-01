require 'spec_helper'

require 'active_record'

silence_warnings do
  ActiveRecord::Migration.verbose = false
  ActiveRecord::Base.logger = Logger.new(nil)
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
end

ActiveRecord::Base.connection.instance_eval do
  create_table :users do |t|
    t.string :sex
    t.string :role
  end
end

class User < ActiveRecord::Base
  extend Enumerize

  enumerize :sex, in: { male: 0, female: 1 }, scope: true, search_options: true
end

RSpec.describe Enumerize::Integrations::RSpec::Matcher do

  describe '.search_options' do

    subject do
      User.sex_search_options
    end

    it { expect(subject).to eq [['Male', 0], ['Female', 1]] }
  end
end