class ParceFile < ApplicationRecord
  def parce_dir (from, to)
    p = self.path+'**/*.html'
    self.report=''
    Dir[p].each do |f|
      self.report = self.report+'path = '+f+'\n'
      doc = File.open(f){|ff| Nokogiri::HTML(ff)}
      doc.search("img/@alt",
                 "title",
                 "//meta[@property='og:title']/@content",
                 "//meta[@property='og:description']/@content",
                 "//meta[@name='twitter:title']/@content",
                 "//meta[@name='twitter:description']/@content",
                 "input/@value",
                 "input/@placeholder",
                 "p/text()",
                 "div/text()",
                 "a/text()",
                 "strong/text()",
                 "small/text()",
                 "span/text()",
                 "h1/text()",
                 "h2/text()",
                 "h3/text()",
                 "h4/text()",
                 "h5/text()",
                 "h6/text()",
                 "ul/text()",
                 "li/text()"
      ).each do |str|
        if str.content!=nil&&str.content!=''
          translation = TranslateMenu.find_by text: str.content
          if translation!=nil
            str.content = translation.result
          else
            translation = TranslateMenu.new('from'=>from,'to'=>to,'text'=>str.content)
            translation.translate
            translation.save
            str.content = translation.result
          end
        end
      end
      File.write(f,doc.to_html)
    end
  end
end
#
# "nav ul li a span",
#     "div.subheader div ul li a",
#     "div ul li a",
#     "h1",
#     "h2",
#     "h3",
#     "h4",
#     "div.desc h6",
#     "span.date",
#     ".copyright",
#     "option",
#     "span",
#     "label",
#     "p"
#
#
# "div.subheader div ul li a",
#     "nav ul.menu li a span",
#     "div.column h1",
#     "ul.breadcrumbs li a",
#     "nav.wpDropdownNavMenu div ul li a",
#     "footer h4",
#     "footer h6",