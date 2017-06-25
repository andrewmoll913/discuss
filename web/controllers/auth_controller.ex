defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug Ueberauth

  alias Discuss.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider} = params) do
    user_params = %{token: auth.credentials.token,
		    email: auth.info.email,
		    provider: provider}
    changeset = User.changeset(%User{}, user_params)
  end
end
