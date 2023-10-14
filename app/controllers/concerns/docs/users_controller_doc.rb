module Docs
  module UsersControllerDoc
    extend Apipie::DSL::Concern

    ########## PARAM GROUPS START #########
    def_param_group :users_serializer_atributes do
      property :first_name, String, desc: "First Name", required: true
      property :last_name, String, desc: "Last Name", required: true
    end
    ########## PARAM GROUPS END ###########

    ########## ACTIONS DOC START ##########
    # api :POST, "api/v1/users", "Create user"
    def_param_group :user_controller_create do
      returns code: 201, desc: "Created" do
        param_group :users_serializer_atributes, UsersControllerDoc
      end
      error code: 401, desc: "Unauthorized"
      error code: 422, desc: "Unprocessable Entity"
    end
    ########## ACTIONS DOC END ############
  end
end
