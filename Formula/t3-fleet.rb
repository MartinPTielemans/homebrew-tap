class T3Fleet < Formula
  desc "Keep every machine you run T3 Code on equivalent"
  homepage "https://github.com/MartinPTielemans/fleetx"
  url "https://github.com/MartinPTielemans/fleetx/releases/download/v0.9.0/t3-fleet.mjs"
  # Keep the explicit version for the release workflow's checked updates.
  version "0.9.0"
  sha256 "c2d489230c8185b4ea696c51552d95286f9bb7ff2c8e7f22a47f860711bd67fb"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "t3-fleet.mjs"
    (bin/"t3-fleet").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/t3-fleet.mjs" "$@"
    SH
  end

  test do
    assert_match "t3-fleet v#{version}", shell_output("#{bin}/t3-fleet --version")
  end
end
