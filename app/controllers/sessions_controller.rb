class SessionsController < Clearance::SessionsController
    def create_from_omniauth
        auth_hash = request.env["omniauth.auth"]
        authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

        # if: previously already logged in with OAuth
        if authentication.user
            user = authentication.user
            authentication.update_token(auth_hash)
            @next = root_url
            @notice = "Signed in!"
        # else: user logs in with OAuth for the first time
        else
            user = User.create_with_auth_and_hash(authentication, auth_hash)
            # you are expected to have a path that leads to a page for editing user details
            @next = edit_user_path(user)
            @notice = "User created. Please confirm or edit details"
        end

        sign_in(user)
        redirect_to @next, :notice => @notice
    end

    def create
        # @user = authenticate(params)

        # sign_in(@user) do |status|
        #     if status.success? &&
        #         if @user.type == "Patient"
        #             redirect_to patient_path(@user.id)
        #         elsif @user.type == "Doctor"
        #             redirect_to doctor_path(@user.id)
        #         end
        #     else
        #         flash.now.notice = status.failure_message
        #         render template: "sessions/new", status: :unauthorized
        #     end
        # end
    end

    def url_after_destroy
        root_path
    end

    # Patient Sign In
    def create_patient
        @user = authenticate(params)

        if @user.type == "Patient"
            sign_in(@user) do |status|    
                if status.success?
                    redirect_to patient_path(@user.id)
                end
            end
        else
            # flash.now.notice = status.failure_message
            render template: "sessions/new", status: :unauthorized
        end
    end
    
    # Doctor Sign In
    def create_doctor
        @user = authenticate(params)

        if @user.type == "Doctor"
            sign_in(@user) do |status|
                if status.success?
                    redirect_to doctor_path(@user.id)
                end
            end
        else
            # flash.now.notice = status.failure_message
            render template: "sessions/new", status: :unauthorized
        end
    end
end