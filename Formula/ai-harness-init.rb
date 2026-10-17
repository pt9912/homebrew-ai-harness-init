# ai-harness-init.rb — Homebrew-Formel-Skeleton (slice-tap-verteilt-die-release-assets,
# LH-QA-04). Formularseitig: dieselbe Kopplung wie SHA256SUMS nach ADR-0059 — das
# Formular reist als Release-Asset;
# der Bau injiziert genau einen Wert ins Binary, die Fassung (ADR-0063 Festlegung 1);
# eingebettete Vorgaben aus dem Quellstand berührt das nicht.
# Die sechs markierten Platzhalter-Felder unten werden im Release-Workflow je Schnitt aus der SHA256SUMS
# desselben Schnitts befuellt (.github/workflows/release.yml, Job `artifacts`) und
# ersetzen keinen Wert im Binary — dieses Skeleton bleibt dabei unveraendert. Vier
# Plattformen, nicht sechs: Homebrew traegt Windows nicht.
class AiHarnessInit < Formula
  desc "Bootstrap-Werkzeug fuer den AI-Harness-Prozess"
  homepage "https://github.com/pt9912/ai-harness-init"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.9.0/ai-harness-init-darwin-arm64"
      sha256 "0422691f5c42b120101f8cf2142aeeb121256b8e9335fe57e0154b5b2d9ca10d"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.9.0/ai-harness-init-darwin-amd64"
      sha256 "66c7fffda09c6615f0381089f3b34856996db0581faa7418d7c39652a0b9cbcb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.9.0/ai-harness-init-linux-arm64"
      sha256 "4148c0459eb8e27a6f0d574177dde4fc108025bec0a863276b6b073f579bfe48"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.9.0/ai-harness-init-linux-amd64"
      sha256 "c7b1ac076cc656d6c9662c25b5665628d18c3056dce03e3c081ff6c44f79a23c"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
