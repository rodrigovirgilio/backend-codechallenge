module Docs
  module UsersControllerDoc
    extend Apipie::DSL::Concern

    ########## PARAM GROUPS START #########
    def_param_group :users_serializer_atributes do
      property :id, Integer, desc: "ID", required: true
      property :first_name, String, desc: "First Name", required: true
      property :last_name, String, desc: "Last Name", required: true
      property :admin, [true, false], desc: "Admin", required: false
      property :created_at, DateTime, desc: "Created at", required: false
      property :updated_at, DateTime, desc: "Updated at", required: false
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

    # api :GET, "/v1/users", "Users index"
    def_param_group :user_controller_index do
      returns code: 200, desc: "OK" do
        param_group :users_serializer_atributes, UsersControllerDoc
      end
      error code: 401, desc: "Unauthorized"
    end
    ########## ACTIONS DOC END ############
  end
end
