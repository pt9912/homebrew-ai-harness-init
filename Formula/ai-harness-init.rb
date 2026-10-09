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
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.6.0/ai-harness-init-darwin-arm64"
      sha256 "a0fdac144242f109a53b07c789708108b26f3be0b7c3f79be8ffe7bc2e330313"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.6.0/ai-harness-init-darwin-amd64"
      sha256 "da24e2c1f5d36414af463f64cdf7608cc83b7c1cefc8cf73fa6a76874dd93034"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.6.0/ai-harness-init-linux-arm64"
      sha256 "1989231c344c4ebcc50cf9c4ed079e8c62c3a7ef8f3dde1ebe397921cf11ed7b"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.6.0/ai-harness-init-linux-amd64"
      sha256 "4c175d70baa753e6d773751e377e4bf6172653b4a885002b2aa905b7f389d44c"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
