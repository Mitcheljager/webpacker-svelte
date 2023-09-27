module Webpacker
  module Svelte
    class Component
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::TextHelper

      attr_accessor :name

      def initialize(name)
        @name = name
      end

      def render(props = {}, options = {}, &block)
        tag = options.delete(:tag) || :div
        data = { data: { "svelte-component" => @name, "svelte-props" => props.to_json } }
        content = capture(&block) if block_given?

        content_tag(tag, content, options.deep_merge(data))
      end
    end
  end
end
