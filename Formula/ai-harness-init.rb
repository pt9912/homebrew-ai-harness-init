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
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.5/ai-harness-init-darwin-arm64"
      sha256 "3816b1abf762f84c30b620f646aa26a8b865e87e3c714d289cea7c03e569e035"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.5/ai-harness-init-darwin-amd64"
      sha256 "0cb3874776850381d6a95f6378fc60507aeb454b1405a94101effbc0bd6deeaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.5/ai-harness-init-linux-arm64"
      sha256 "1a00ea114a0b713d10464eb9b31de4d44525dcd7429db77b63d90574facf63a4"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.2.5/ai-harness-init-linux-amd64"
      sha256 "c6a6a171bef7c9eeb500ddc89ef6bfaf9ca52079454eabf450e94923e0ce9186"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
