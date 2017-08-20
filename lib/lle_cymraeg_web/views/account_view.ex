defmodule LleCymraegWeb.AccountView do
  use LleCymraegWeb, :view
  alias LleCymraegWeb.AccountView

  def render("index.json", %{accounts: accounts}) do
    %{data: render_many(accounts, AccountView, "account.json")}
  end

  def render("show.json", %{account: account}) do
    %{data: render_one(account, AccountView, "account.json")}
  end

  def render("account.json", %{account: account}) do
    %{id: account.id,
      role: account.role,
      email: account.email,
      password_hash: account.password_hash}
  end
end
