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
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.5.0/ai-harness-init-darwin-arm64"
      sha256 "e539d47a204edc58e100dbdf2c9dfeb9bf5241354ae25d7a7f9905ae498e95e1"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.5.0/ai-harness-init-darwin-amd64"
      sha256 "b9abb7019ef377e0309d738e6675d1ce1b771b674ec3876045ec9f07a48f823d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.5.0/ai-harness-init-linux-arm64"
      sha256 "b36f3adabe2f45e449af0784bdc47a484060522678460c6ad1c52b15c42849f3"
    end
    on_intel do
      url "https://github.com/pt9912/ai-harness-init/releases/download/v0.5.0/ai-harness-init-linux-amd64"
      sha256 "9156982d4ceaa05653c1e7d79494e124abe55e22a8155fbb7dba2cdc1ed8c791"
    end
  end

  def install
    bin.install Dir["ai-harness-init-*"].first => "ai-harness-init"
  end

  test do
    system "#{bin}/ai-harness-init", "--help"
  end
end
