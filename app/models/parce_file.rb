class ParceFile < ApplicationRecord
  def parce_dir (from, to)
    p = self.path+'**/*.html'
    self.report=''
    Dir[p].each do |f|
      doc = File.open(f){|ff| Nokogiri::HTML(ff)}
      doc.search("title",
                 "//meta[@property='og:title']/@content",
                 "//meta[@property='og:description']/@content",
                 "//meta[@name='twitter:title']/@content",
                 "//meta[@name='twitter:description']/@content",
                 "nav ul li a span",
                 "div.subheader div ul li a",
                 "div ul li a",
                 "h1",
                 "h2",
                 "h3",
                 "h4",
                 "div.desc h6",
                 "span.date",
                 ".copyright",
                 "input/@value",
                 "input/@placeholder",
                 "option",
                 "span",
                 "label",
                 "p"
      ).each do |str|
        if str.content!=nil&&str.content!='\n'&&str.content!=''&&!str.content['']
          self.report = self.report+str.name+'='+str.content+', '
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
