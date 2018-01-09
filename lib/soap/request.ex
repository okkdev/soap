defmodule Soap.Request do
  defstruct [:method, :url, :body, :headers, :options]
  @moduledoc """
  Documentation for Soap.Request.
  """

  @spec init_model(wsdl :: String.t, %{headers: headers :: String.t, body: body :: String.t}) :: map
  def init_model(wsdl, %{headers: headers, body: body}) do
    %Soap.Request{
      url: wsdl[:endpoint],
      headers: headers,
      body: body,
      method: :post,
      options: nil
    }
  end

  @doc """
  Executing with parsed wsdl and headers with body map.
  Calling httpoison request by Map with method, url, body, headers, options keys.
  """
  @spec call(wsdl :: String.t, %{headers: headers :: String.t, body: body :: String.t}) :: tuple
  def call(wsdl, %{headers: headers, body: body}) do
    params = init_model(wsdl, %{headers: headers, body: body}) |> Map.values

    HTTPoison.request!(params)
  end
end
