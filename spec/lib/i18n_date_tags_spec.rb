require File.dirname(__FILE__) + '/../spec_helper'

describe 'I18nDateTags' do
  dataset :pages
  
  describe '<r:i18n:date>' do
    it 'should render the correct format' do
      format = "%B %Y"
      tag = %{<r:i18n:date format="#{format}"/>}
      
      expected = I18n.l(Date.today, :format => format)
    
      pages(:home).should render(tag).as(expected)
    end
  end
end