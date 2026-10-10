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
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.7.0/ai-harness-init-darwin-arm64"
      sha256 "ec3ef089532a0987680c01c673ac05910441e2d772bb963730de5e3f48400309"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.7.0/ai-harness-init-darwin-amd64"
      sha256 "1e82a56b5f8f6bdc3ba8931aff4e795e43a38b54a0763bd3de280f77361747ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.7.0/ai-harness-init-linux-arm64"
      sha256 "90344c0ba00b2c15c08eae1b3d56b4f74f5f2b4e4e26f812d1cf0cdb67c7077d"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.7.0/ai-harness-init-linux-amd64"
      sha256 "91fe2ba5ab15f1d289b274f20bdefab9a5fc1d39fe38e0bc82f446a8cc0f3642"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
