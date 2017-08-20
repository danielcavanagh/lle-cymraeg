defmodule LleCymraegWeb.LanguageView do
  use LleCymraegWeb, :view
  alias LleCymraegWeb.LanguageView

  def render("index.json", %{languages: languages}) do
    %{data: render_many(languages, LanguageView, "language.json")}
  end

  def render("show.json", %{language: language}) do
    %{data: render_one(language, LanguageView, "language.json")}
  end

  def render("language.json", %{language: language}) do
    %{id: language.id,
      name: language.name,
      code: language.code}
  end
end
