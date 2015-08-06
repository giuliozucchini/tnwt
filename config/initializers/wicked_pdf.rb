WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  if Rails.env.production?
  	:exe_path => '/app/vendor/bundle/bin/wkhtmltopdf'
  else
  	:exe_path => '/Users/giuliozucchini/.rvm/gems/ruby-2.2.1/bin/wkhtmltopdf'
  end
}
