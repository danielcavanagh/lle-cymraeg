defmodule LleCymraegWeb.InvitationView do
  use LleCymraegWeb, :view
  alias LleCymraegWeb.InvitationView

  def render("index.json", %{invitations: invitations}) do
    %{data: render_many(invitations, InvitationView, "invitation.json")}
  end

  def render("show.json", %{invitation: invitation}) do
    %{data: render_one(invitation, InvitationView, "invitation.json")}
  end

  def render("invitation.json", %{invitation: invitation}) do
    %{id: invitation.id,
      type: invitation.type,
      status: invitation.status}
  end
end
