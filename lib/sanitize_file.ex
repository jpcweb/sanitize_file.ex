defmodule SanitizeFile do
    @moduledoc """
        Filename sanitization for Elixir. This module helps you to clean up your filename for example.
        SanitizeFile takes a string and strip and normalizes it with :nfd, keeps number and non accent character.

        You can use iconv if you want to (SanitizeFile.sanitize(string,:iconv))

        ## Examples

          iex(1)> SanitizeFile.sanitize(" fd_fdsf-àç   à) 456454ç)'ç.jpg")

          "fd_fdsfac-a-456454cc.jpg"
      """
    @doc """
        Takes a filename and strip and normalizes it with :nfd, keeps number and non accent character.
     """
    def sanitize string do
      String.strip(string)
        |> String.normalize(:nfd)
        |> String.replace(~r/[^.0-9A-z\s]/u, "")
        |> String.replace(~r/[[:space:]]+/u, "-")
    end

    def sanitize string,:iconv do
      case :application.start(:iconv) do
        {:error, reason} ->
            if reason == {:already_started, :iconv} do
                iconv_me string
            else
                {:error, reason}
            end
        :ok ->
            iconv_me string
      end
    end

    defp iconv_me string do
      :iconv.convert "utf-8", "ascii//translit", string
        |> String.strip
        |> String.replace(~r/[[:space:]]+/u, "-")
    end
end
