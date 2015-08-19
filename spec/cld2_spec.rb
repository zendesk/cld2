# encoding: UTF-8
require "spec_helper"

describe CLD2 do

  context "English text" do
    subject { CLD2.detect_language("This is a test") }

    it { subject[:name].should eq("ENGLISH") }
    it { subject[:code].should eq("en") }
    it { subject[:reliable].should be_true }
  end

  context "French text" do
    subject { CLD2.detect_language("plus ça change, plus c'est la même chose") }

    it { subject[:name].should eq("FRENCH") }
    it { subject[:code].should eq("fr") }
    it { subject[:reliable].should be_true }
  end

  context "Italian text" do
    subject { CLD2.detect_language("sono tutti pazzi qui") }

    it { subject[:name].should eq("ITALIAN") }
    it { subject[:code].should eq("it") }
    it { subject[:reliable].should be_true }
  end

  context "French in HTML - using CLD2 html " do
    subject { CLD2.detect_language("<html><head><body><script>A large amount of english in the script which should be ignored if using html in detect_language.</script><p>plus ça change, plus c'est la même chose</p></body></html>", false) }

    it { subject[:name].should eq("FRENCH") }
    it { subject[:code].should eq("fr") }

  end
  context "French in HTML - using CLD2 text " do
    subject { CLD2.detect_language("<html><head><body><script>A large amount of english in the script which should be ignored if using html in detect_language.</script><p>plus ça change, plus c'est la même chose</p></body></html>", true) }

    it { subject[:name].should eq("ENGLISH") }
    it { subject[:code].should eq("en") }

  end

  context "Simplified Chinese text" do
    subject { CLD2.detect_language("你好吗箭体") }

    it { subject[:name].should eq("Chinese") }
    it { subject[:code].should eq("zh") }
  end

  context "Traditional Chinese text" do
    subject { CLD2.detect_language("你好嗎繁體") }

    it { subject[:name].should eq("ChineseT") }
    it { subject[:code].should eq("zh-Hant") }
  end

  context "Unknown text" do
    subject { CLD2.detect_language("") }

    it { subject[:name].should eq("Unknown") }
    it { subject[:code].should eq("un") }
    it { subject[:reliable].should_not be_true }
  end

  context "nil for text" do
    subject { CLD2.detect_language(nil) }

    it { subject[:name].should eq("Unknown") }
    it { subject[:code].should eq("un") }
    it { subject[:reliable].should_not be_true }
  end

end
