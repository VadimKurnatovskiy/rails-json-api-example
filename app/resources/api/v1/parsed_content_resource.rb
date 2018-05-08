module Api
  module V1
    class ParsedContentResource < JSONAPI::Resource
      attributes :email, :url, :data
    end
  end
end
