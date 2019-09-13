# PuppeteerImg

Wrapper for `puppeteer-img`. Generates screenshot of browser page at a given URL.

## Installation

Install `puppeteer-img` with npm, using the following command:

```
npm i puppeteer-img -g
```

Then add the following dependency to your Elixir project

```elixir
def deps do
  [
    {:puppeteer_img, "~> 0.1.1"}
  ]
end
```

### Instructions

```elixir
options = [
  type: "jpeg"
  path: "example.jpeg
]

case PuppeteerImg.generate_image("http://www.example.com", options) do
  {:ok, path} -> path # where "path" == final path where generated image is stored.
  {:error, error} -> error # where "error" == some error message.
end
```

## Available Options

```elixir
options = [
  type: "png", # The file type to generate. Options are jpeg or png. Defaults to png.
  path: "/screenshots/example.png", # The file path to save the image to.
  width: 400, # The width of the browser viewport. Default is 800
  height: 800 # The height of the browser viewport. Default is 600
]
```
