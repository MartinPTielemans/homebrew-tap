class Fleetx < Formula
  desc "Keep every machine you run T3 Code on equivalent"
  homepage "https://github.com/MartinPTielemans/fleetx"
  url "https://github.com/MartinPTielemans/fleetx/releases/download/v0.2.0/fleetx.mjs"
  version "0.2.0"
  sha256 "a39db1a258de2f565a29f05188f50290110005065f1e552f7aa4a6003948ce2d"
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
