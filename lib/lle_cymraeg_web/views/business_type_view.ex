defmodule LleCymraegWeb.BusinessTypeView do
  use LleCymraegWeb, :view
  alias LleCymraegWeb.BusinessTypeView

  def render("index.json", %{business_types: business_types}) do
    %{data: render_many(business_types, BusinessTypeView, "business_type.json")}
  end

  def render("show.json", %{business_type: business_type}) do
    %{data: render_one(business_type, BusinessTypeView, "business_type.json")}
  end

  def render("business_type.json", %{business_type: business_type}) do
    %{id: business_type.id,
      name: business_type.name}
  end
end
