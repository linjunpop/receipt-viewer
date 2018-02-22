defmodule RViewerWeb.DecodeController do
  use RViewerWeb, :controller

  plug(:scrub_params, "receipt" when action in [:create])

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"receipt" => base64_receipt}) do
    case ReceiptDecoder.decode(base64_receipt) do
      {:ok, receipt} ->
        render(conn, "show.html", receipt: receipt)

      {:error, err} ->
        conn
        |> put_flash(:error, "Receipt: #{err}")
        |> redirect(to: decode_path(conn, :new))
    end
  end
end
