defmodule PuppeteerImg do
  @moduledoc """
    Wrapper for puppeteer-img.  Generates screenshots of a website from given URL.
  """

  def generate_image(url, options \\ []) do
    options =
      options
      |> Keyword.take([:type, :path, :width, :height])
      |> Enum.reduce([url], fn {key, value}, result ->
        result ++ ["--#{key}=#{value}"]
      end)

    task =
      Task.async(fn ->
        try do
          case System.cmd("puppeteer-img", options) do
            {_, 127} ->
              {:error, :invalid_exec_path}

            {cmd_response, _} ->
              {:ok, cmd_response}
          end
        rescue
          e in ErlangError ->
            %ErlangError{original: error} = e

            case error do
              :enoent ->
                # This will happen when the file in exec_path doesn't exists
                {:error, :invalid_exec_path}
            end
        end
      end)

    Task.await(task, options[:timeout] || 5000)
  end
end
