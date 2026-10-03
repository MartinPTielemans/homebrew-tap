class Fleetx < Formula
  desc "Keep every machine you run T3 Code on equivalent"
  homepage "https://github.com/MartinPTielemans/fleetx"
  url "https://github.com/MartinPTielemans/fleetx/releases/download/v0.3.0/fleetx.mjs"
  version "0.3.0"
  sha256 "8f3cfd0a93473a088ca9bac345cf4db66f6377ae8796680006dc199aac7a784a"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "fleetx.mjs"
    (bin/"fleetx").write <<~SH
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/fleetx.mjs" "$@"
    SH
  end

  test do
    assert_match "fleetx v#{version}", shell_output("#{bin}/fleetx --version")
  end
end
