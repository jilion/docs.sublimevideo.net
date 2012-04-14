module CoderayHelper

  def coderay_options(language, options = {})
    options.reverse_merge!(css: :class, line_number_anchors: false, bold_every: false)

    Haml::Filters::CodeRay.encoder_options = options
    "#!#{language.to_s}"
  end

end
