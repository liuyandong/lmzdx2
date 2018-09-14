require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lmzdx2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2        

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
 html = %(<div class="field_with_errors">#{html_tag}</div>).html_safe
 # add nokogiri gem to Gemfile
 elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css "label, input"
 elements.each do |e|
   if e.node_name.eql? 'label'
     html = %(<div class="clearfix error">#{e}</div>).html_safe
   elsif e.node_name.eql? 'input'
     if instance.error_message.kind_of?(Array)
       html = %(<div class="clearfix error">#{html_tag}<span class="help-inline">&nbsp;#{instance.error_message.join(',')}</span></div>).html_safe
     else
       html = %(<div class="clearfix error">#{html_tag}<span class="help-inline">&nbsp;#{instance.error_message}</span></div>).html_safe
     end
   end
 end
 html
end