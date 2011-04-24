module Bookie
  class Parser
    def self.parse(contents)
      parser = new(contents)
      parser.document_tree
    end

    def initialize(contents)
      generate_document_tree(contents)
    end

    attr_reader :document_tree

    private

    def generate_document_tree(contents)
      @document_tree = contents.split(/\n\n+/)
    end
  end
end
