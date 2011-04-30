module Bookie
  module Emitters
    class HTML
      def initialize
        @body = ""
      end

      attr_reader :body

      def build_paragraph(paragraph)
        @body << "<p>#{paragraph.contents}</p>"
      end

      def build_raw_text(raw_text)
        @body << "<pre>#{raw_text.contents}</pre>"
      end

      def build_section_heading(header)
        @body << "<h2>#{header.contents}</h2>"
      end

      def build_list(list)
        list_elements = list.contents.map { |li| "<li>#{li}</li>" }.join
        @body << "<ul>"+list_elements+"</ul>"
      end

      def render(params)
        File.open(params[:file], "w") do |file|
          file << %{
            <html>
               <body><h1>#{params[:title]}</h1>#{@body}</body>
            </html>
          }
        end
      end
    end
  end
end
