require "language/node"

class Gitmoji < Formula
  desc "Interactive command-line tool for using emoji in commit messages"
  homepage "https://gitmoji.dev"
  url "https://registry.npmjs.org/gitmoji-cli/-/gitmoji-cli-5.3.0.tgz"
  sha256 "f66dc36c7ab05b5fabec0d1ae30dc2108a4ffa5ea713ab391ebe106b64d9dcae"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "fd1c2514528f05bbf0841f67f943b8fad5d4311ef097d4569a3166831518fdf9"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "fd1c2514528f05bbf0841f67f943b8fad5d4311ef097d4569a3166831518fdf9"
    sha256 cellar: :any_skip_relocation, monterey:       "31a6108708c2e341b1f6dc589b4db0d5d87f0e1cd564ee19df68ecd9f85ccdd4"
    sha256 cellar: :any_skip_relocation, big_sur:        "31a6108708c2e341b1f6dc589b4db0d5d87f0e1cd564ee19df68ecd9f85ccdd4"
    sha256 cellar: :any_skip_relocation, catalina:       "31a6108708c2e341b1f6dc589b4db0d5d87f0e1cd564ee19df68ecd9f85ccdd4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "fd1c2514528f05bbf0841f67f943b8fad5d4311ef097d4569a3166831518fdf9"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match ":bug:", shell_output("#{bin}/gitmoji --search bug")
  end
end
