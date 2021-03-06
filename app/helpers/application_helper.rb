module ApplicationHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  def alert_helper(type)
    types = {
      success: "success",
      info: "info",
      warning: "warning",
      danger: "danger",
      notice: "success",
      alert: "danger"
    }
    types[type.to_sym]
  end
end
