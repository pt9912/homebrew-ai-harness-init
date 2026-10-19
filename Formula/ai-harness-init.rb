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
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.10.0/ai-harness-init-darwin-arm64"
      sha256 "046c020656b72a77970bd1874d56fb1cbee3e226366ff454be7740f135423e25"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.10.0/ai-harness-init-darwin-amd64"
      sha256 "6f17f018b13ae8ee0f96ee923c47f3f27d11e06d2aa84567da582945f3f5dfdc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.10.0/ai-harness-init-linux-arm64"
      sha256 "e87d9ef1ceaf189fec2256367f1a294aa5a5f7616647519bca61df6556ebde5d"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.10.0/ai-harness-init-linux-amd64"
      sha256 "fd7738a098c59a8ac1e8dbf5e825529e551c0e1a9469583b85c6459b5db2a4fa"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
