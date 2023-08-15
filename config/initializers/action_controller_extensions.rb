module ActionController
  class Light < ActionController::Metal
    include AbstractController::Rendering
    include ActionController::Renderers
    include ActionController::Head
    include ActionController::StrongParameters
    include ActionController::Rescue

    use_renderers :json

    ActiveSupport.run_load_hooks(:action_controller, self)
  end
end
