module Webpacker
  module Svelte
    module Helpers
      def svelte_component(component_name, props = {}, options = {}, &block)
        Webpacker::Svelte::Component.new(component_name).render(props, options, &block)
      end
    end
  end
end
