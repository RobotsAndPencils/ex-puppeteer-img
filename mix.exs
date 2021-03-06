defmodule PuppeteerImg.MixProject do
  use Mix.Project

  def project do
    [
      app: :puppeteer_img,
      version: "0.1.3",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description:
        "Wrapper for puppeteer-img.  Generates screenshots of a website from given URL.",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Robots & Pencils"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/RobotsAndPencils/ex-puppeteer-img"}
    ]
  end
end
