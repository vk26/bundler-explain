require 'test_helper'

class Bundler::Explain::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Bundler::Explain
  end
end
