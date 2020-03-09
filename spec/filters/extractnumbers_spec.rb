require "logstash/devutils/rspec/spec_helper"
require "insist"
require "logstash/filters/extractnumbers"

describe LogStash::Filters::ExtractNumbers do

  describe "Extract numbers test" do
    # The logstash config goes here.
    # At this time, only filters are supported.
    config <<-CONFIG
      filter {
        extractnumbers {
        }
      }
    CONFIG

    sample("message" => "bla 1234 foo 5678 geek 10.43") do
      insist { subject.get("int1") } == 1234
      insist { subject.get("int2") } == 5678
      insist { subject.get("float1") } == 10.43
    end
  end

end
