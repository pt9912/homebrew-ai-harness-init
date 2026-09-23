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
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.2/ai-harness-init-darwin-arm64"
      sha256 "8adbecb56ff2164fd749e588337ca84fa765f06951b3478e3ff3ab5ed6bb7c0b"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.2/ai-harness-init-darwin-amd64"
      sha256 "e182029cc4b0c8a003c3d863c0ced0b487261d16d479cc2ab7b056ebb299cb1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.2/ai-harness-init-linux-arm64"
      sha256 "38e34e7d7793a29f44b690815572fb211c4d36303fda65a2900f1f060332788d"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.2/ai-harness-init-linux-amd64"
      sha256 "686a12cd3d424b0b09d91d0d3f6f7bbb361a30d61a13c39157f943eddde0c630"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
