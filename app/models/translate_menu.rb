class TranslateMenu < ApplicationRecord
  def translate
    key = 'trnsl.1.1.20170807T054657Z.a3d80dc5d9ec50cc.08771236f9b132c0e28b1580bc8627d535836d83'
    translator = Yandex::Translator.new(key)
    self.result = translator.translate self.text, from: self.from, to: self.to
  end
end
