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
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.4.0/ai-harness-init-darwin-arm64"
      sha256 "e7fa1b21840669525b2cc678a75e0f69c985dfe0542db74ca42e350545d6ed83"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.4.0/ai-harness-init-darwin-amd64"
      sha256 "c43a51cbba1bfcca19e6d372f5987254675282876866b6808f2ecb6ca00c8e7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.4.0/ai-harness-init-linux-arm64"
      sha256 "e8b6aa7e14ae6ba777394e50b11a441686a11217980d2c6efcfdebf1aaecfb24"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.4.0/ai-harness-init-linux-amd64"
      sha256 "7c1ea3d1c18e7473ff8baa95c32b7df84665ba8532ef4af2b11f31e4e1f48415"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
