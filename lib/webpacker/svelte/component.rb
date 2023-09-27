module Webpacker
  module Svelte
    class Component
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::TextHelper
      include ActionView::Helpers::CaptureHelper

      attr_accessor :name

      def initialize(name)
        @name = name
      end

      def render(props = {}, options = {}, &block)
        tag = options.delete(:tag) || :div
        data = { data: { "svelte-component" => @name, "svelte-props" => props.to_json } }

        content_tag(tag, options.deep_merge(data)) do
          block.call if block_given?
        end
      end
    end
  end
end
