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
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.4/ai-harness-init-darwin-arm64"
      sha256 "fe6891e23b4dacc25dd3abf3bac247796263ce4a76b0ec543c9ff6f7f507687a"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.4/ai-harness-init-darwin-amd64"
      sha256 "915ad5fca9491e6ac19e94d2513a21d479d3966a5eed1106147096ec15d270f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.4/ai-harness-init-linux-arm64"
      sha256 "e5d30669a1654c9d0168b5047ddc1d60bcee919df459b7d2b21bead5f28d6d36"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.4/ai-harness-init-linux-amd64"
      sha256 "dd7a2c792d17051087062d92e4c024f6003150d9f48d12e43746a996e8d88a8e"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
