require 'rjb'
require 'nokogiri'

class NER

  class << self
    def classifier
      @classifier ||= begin
        # Make sure we have jar path and classifier defined
        raise "No file defined. Please set NER_JAR_PATH constant or ENV['NER_JAR_PATH']" if !jar_path
        raise "No file defined. Please set CLASSIFIER_FILE constant or ENV['CLASSIFIER_FILE']" if !classifier_file
        Rjb::load(jar_path, ['-Xmx800m'])
        crfclassifier = Rjb::import('edu.stanford.nlp.ie.crf.CRFClassifier')
        crfclassifier.getClassifierNoExceptions(classifier_file)
      end
    end

    def classify_with_inline_xml(string)
      classifier.classifyWithInlineXML(string)
    end

    def labels
      classifier.labels.toArray.map(&:toString)
    end

    def background_symbol
      classifier.backgroundSymbol
    end

    # returns hash of values tagged by classifier
    def classify(string)
      classified_hash = Hash.new
      doc = Nokogiri::HTML(classify_with_inline_xml(string))
      (labels - [background_symbol]).each do |tag|
        classified_hash[tag] = doc.xpath(".//#{tag.downcase}").map(&:content)
      end
      classified_hash
    end

    def jar_path
      defined?(NER_JAR_PATH) ? NER_JAR_PATH : ENV['NER_JAR_PATH']
    end

    def classifier_file
      defined?(CLASSIFIER_FILE) ? CLASSIFIER_FILE : ENV['CLASSIFIER_FILE']
    end
  end
end