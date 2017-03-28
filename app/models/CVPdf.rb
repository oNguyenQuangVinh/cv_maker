require "render_anywhere"

class CVPdf
  include RenderAnywhere

  def initialize user
    @user = user
  end

  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/cv.pdf")
  end

  def filename
    "User #{user.id}.pdf"
  end

  private

  attr_reader :user

  def as_html
    render template: "downloads/show", layout: "cv_pdf", locals: {user: user}
  end
end
