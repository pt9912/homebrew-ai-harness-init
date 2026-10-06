# ai-harness-init.rb — Homebrew-Formel-Skeleton (slice-tap-verteilt-die-release-assets,
# LH-QA-04). Formularseitig: dieselbe Kopplung wie SHA256SUMS nach ADR-0059 — das
# Formular reist als Release-Asset, kein Wert reist im Binary. Die sechs markierten
# Platzhalter-Felder unten werden im Release-Workflow je Schnitt aus der SHA256SUMS
# desselben Schnitts befuellt (.github/workflows/release.yml, Job `artifacts`) und
# ersetzen keinen Wert im Binary — dieses Skeleton bleibt dabei unveraendert. Vier
# Plattformen, nicht sechs: Homebrew traegt Windows nicht.
class AiHarnessInit < Formula
  desc "Bootstrap-Werkzeug fuer den AI-Harness-Prozess"
  homepage "https://github.com/pt9912/ai-harness-init"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.8/ai-harness-init-darwin-arm64"
      sha256 "428f600f24bcc767facde7c2f05031e7725efd4b49caf6a3d9ef82e38586a984"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.8/ai-harness-init-darwin-amd64"
      sha256 "44eeb15e0b5c2c71eea05cb6a9a0c5aed19ae9abd4a6ef64939902974f3ed0dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.8/ai-harness-init-linux-arm64"
      sha256 "f472b15cdd811d64254b4cce1d2d248073fcb4792c4d21a35c92cfe29e05c5ea"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.8/ai-harness-init-linux-amd64"
      sha256 "5407906dcb87dc130b62873a2eff5f273fb4a5b4d9296e2049d57456c47632b3"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
