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
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.3/ai-harness-init-darwin-arm64"
      sha256 "4910833535c7f6f6e1ce55b899b01efa1aeca4dc9179993842e196d210ec7af4"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.3/ai-harness-init-darwin-amd64"
      sha256 "1339ebe0bd4ff3ae3343d2dd34c2b4d86b16e2354624d6d4760a8a3042031993"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.3/ai-harness-init-linux-arm64"
      sha256 "5e1aa7adff082e80956c40a57aaa57d09dc0017a1007e8a9683aaa1bbc113651"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.3/ai-harness-init-linux-amd64"
      sha256 "13561bb1268d7ac48292481fa575b5ccf4d5f4cf8a503aa36af4dfb5e31918f8"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
