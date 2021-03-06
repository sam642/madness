require 'spec_helper'

describe Server do
  before do 
    config.reset
    config.path = 'spec/fixtures/docroot'
  end

  describe "sass plugin" do
    let(:css) { 'app/public/css/main.css' }

    it "generates css in the public folder" do
      File.unlink css if File.exist? css
      expect(File).not_to exist css
      sleep 1
      get '/css/main.css'
      expect(File).to exist css      
    end

    it "serves css" do
      get '/css/main.css'
      expect(last_response.content_type).to eq "text/css;charset=utf-8"
      expect(last_response.body).to match(/font-family/)
    end
  end

end