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
  version "0.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.7/ai-harness-init-darwin-arm64"
      sha256 "f10bd0c5ae8404ff7095a820b5d605b9a2fa3fe24a6b616846468df1e5ca1eb9"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.7/ai-harness-init-darwin-amd64"
      sha256 "b133d754ad353ca9b1e5f0e3902501b73c4c956a654ee1fd727d2bab4133549f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.7/ai-harness-init-linux-arm64"
      sha256 "359df412896cc7ceb4d1ff5821f19dd81c7b60e45b66aa3e93c8456aad2b3a08"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.7/ai-harness-init-linux-amd64"
      sha256 "b72f482c6b370d1560bdfdde3c65c88cf20d0bf6262dccd2795747d455f8fdd6"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
