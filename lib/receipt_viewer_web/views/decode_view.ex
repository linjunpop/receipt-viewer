defmodule RViewerWeb.DecodeView do
  use RViewerWeb, :view

  def formate_datetime(nil), do: "N/A"

  def formate_datetime(%NaiveDateTime{} = naive_datetime) do
    naive_datetime
    |> NaiveDateTime.to_iso8601()
  end
end
