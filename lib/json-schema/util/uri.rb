module JSON
  module Util
    module URI
      def self.normalized_uri(uri)
        @normalized_uris ||= Hash.new do |h, k|
          h[k] = _normalized_uri(uri)
        end
        @normalized_uris[uri]
      end

      def self._normalized_uri(uri)
        uri = Addressable::URI.parse(uri) unless uri.is_a?(Addressable::URI)
        # Check for absolute path
        if uri.relative?
          data = uri.to_s
          data = "#{Dir.pwd}/#{data}" if data[0,1] != '/'
          uri = Addressable::URI.convert_path(data)
        end
        uri
      end
    end
  end
end
