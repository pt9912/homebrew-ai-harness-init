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
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.6/ai-harness-init-darwin-arm64"
      sha256 "f696781fa854421e6ce4bec744fbcec318f6f363e8c44d3f43309d7e436632a5"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.6/ai-harness-init-darwin-amd64"
      sha256 "6fe333bf3d9defe7dcddb96d7ae6bbc73b2c3645e5426e46bfa4bc8a237e55a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.6/ai-harness-init-linux-arm64"
      sha256 "ee94e40f952673c1cc5f5bc5db79e40ef1ebfd7c31923451cdcaf262f2f901f2"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.6/ai-harness-init-linux-amd64"
      sha256 "015dd1053581fe410a554f96520955380e4f27443fd8ca54e723e5fd4a0f6fd7"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
