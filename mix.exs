defmodule SanitizeFile.Mixfile do
  use Mix.Project

  def project do
    [app: :sanitize_file,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
        {:earmark, "~> 1.0", only: :dev},
        {:ex_doc, "~> 0.14.5", only: :dev},
        {:iconv, "~> 1.0.0"}
    ]
  end

  defp description do
      """
      Sanitization for Elixir. This module helps you to clean up your filename for example.
      """
  end

  defp package do
    [
        name: :sanitize_file,
        files: ["lib","mix.exs"],
        maintainers: ["Jérémie Payet (jpcweb)"],
        licences: ["MIT"],
        links: %{"Github" => "https://github.com/jpcweb/sanitize_file.ex"}
    ]
  end
end
