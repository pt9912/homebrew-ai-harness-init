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
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.8.0/ai-harness-init-darwin-arm64"
      sha256 "822a7fa6b90f98538f46c3e4514546db2b7f1bce5f4de59dee0d94ab15cc0494"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.8.0/ai-harness-init-darwin-amd64"
      sha256 "ac2aa3f42ea39b68971d5190223ec0298e4356e05ee96ad13cdb5f1b7f67e4ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.8.0/ai-harness-init-linux-arm64"
      sha256 "22469502c063b6dd828b3188fdd0ab612892b7217d937cc70e9dc111277f75aa"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.8.0/ai-harness-init-linux-amd64"
      sha256 "6d89528d9b137b90667d7c1611da75301a5e60ee6d45058d24285c653e171ffc"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
