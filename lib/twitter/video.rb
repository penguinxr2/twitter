require 'twitter/creatable'
require 'twitter/identity'

module Twitter
  class Video < Twitter::Identity
    include Twitter::Creatable

    # @return [String]
    attr_reader :data, :title
  end
end
