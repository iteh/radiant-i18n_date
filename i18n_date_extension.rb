# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class I18nDateExtension < Radiant::Extension
  version "1.0"
  description "Provides a <r:i18n:date /> tag, which formats date with i18n rules"
  url "http://github.com/iteh/radiant-i18n_date/"
  
  # extension_config do |config|
  #   config.gem 'some-awesome-gem
  #   config.after_initialize do
  #     run_something
  #   end
  # end

  # See your config/routes.rb file in this extension to define custom routes
  
  def activate
    # tab 'Content' do
    #   add_item "I18n Date", "/admin/i18n_date", :after => "Pages"
    # end
    Page.send :include, I18nDateTags
    
    Page.descendants.each do |klass|
      next unless klass.included_modules.include?(ArchiveIndexTagsAndMethods)
      klass.send :include, I18nDateTitleTags
    end
  end
end
