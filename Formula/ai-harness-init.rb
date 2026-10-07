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
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.3.0/ai-harness-init-darwin-arm64"
      sha256 "9304b4d5ec06d2e397374d091b5455bab916daffd670f873cc9c27cab3d2db52"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.3.0/ai-harness-init-darwin-amd64"
      sha256 "f06b29e3a7824f8a9ebe5790fea533b6d7782721ecd142ad447d3363dca445ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.3.0/ai-harness-init-linux-arm64"
      sha256 "94aa4f2e6520bffe9a2e50b080327a59d4a59b9591e4104c69bed23bfffd404d"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.3.0/ai-harness-init-linux-amd64"
      sha256 "f0e194d5ef687f1e8c641d8dea9c9a93bd79af51d7eb8a0732cab5ee670c6a23"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
