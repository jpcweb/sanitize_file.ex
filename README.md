# SanitizeFile

Sanitization for Elixir. This module helps you to clean up your filename for example.
SanitizeFile takes a string and strip and normalizes it with :nfd, keeps number and non accent character.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `sanitize_file` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:sanitize_file, "~> 0.1.0"}]
    end
    ```

  2. Ensure `sanitize_file` is started before your application:

    ```elixir
    def application do
      [applications: [:sanitize_file]]
    end
    ```

