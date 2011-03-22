require File.expand_path(File.dirname(__FILE__)) + '/../test_helper'

class NERTest < Test::Unit::TestCase

  context "a name entity recognizer" do
    should "have correct jar path" do
      assert_equal(NER_JAR_PATH, NER.jar_path)
    end

    should "have correct classifier path" do
      assert_equal(CLASSIFIER_FILE, NER.classifier_file)
    end

    should "get labels" do
      assert_equal(["LOCATION", "PERSON", "ORGANIZATION", "O"], NER.labels)
    end

    should "classify with xml" do
      assert_equal("<PERSON>J.J. Abram</PERSON> likes <ORGANIZATION>Vulcan University</ORGANIZATION> in <LOCATION>New York</LOCATION>",
                   NER.classify_with_inline_xml("J.J. Abram likes Vulcan University in New York"))
    end

    should "return classified hash" do
      hash = NER.classify("J.J. Abram likes Vulcan University in New York")
      assert_equal(3, hash.count)
      assert_equal(["J.J. Abram"], hash["PERSON"])
      assert_equal(["Vulcan University"], hash["ORGANIZATION"])
      assert_equal(["New York"], hash["LOCATION"])
    end
  end

end
