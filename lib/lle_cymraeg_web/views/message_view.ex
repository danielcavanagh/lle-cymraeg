defmodule LleCymraegWeb.MessageView do
  use LleCymraegWeb, :view
  alias LleCymraegWeb.MessageView

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessageView, "message.json")}
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{id: message.id,
      text: message.text,
      is_read?: message.is_read?}
  end
end
