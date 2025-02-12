# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage "https://github.com/masutaka/github-nippou"
  version "4.2.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/masutaka/github-nippou/releases/download/v4.2.34/github-nippou_v4.2.34_darwin_amd64.zip"
      sha256 "eaca71da746c28df055940b73eb1503bbad7e1cc22c181dbf0a60c8e34363a32"

      def install
        bin.install 'github-nippou'

        # Install bash completion
        output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'bash')
        (bash_completion/'github-nippou').write output

        # Install fish completion
        output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'fish')
        (fish_completion/'github-nippou.fish').write output

        # Install zsh completion
        output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'zsh')
        (zsh_completion/'_github-nippou').write output
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/masutaka/github-nippou/releases/download/v4.2.34/github-nippou_v4.2.34_darwin_arm64.zip"
      sha256 "1fe472bf8de094cc557830c5f2f12bb36d062756672ae38b9e74ab6ef02b0b81"

      def install
        bin.install 'github-nippou'

        # Install bash completion
        output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'bash')
        (bash_completion/'github-nippou').write output

        # Install fish completion
        output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'fish')
        (fish_completion/'github-nippou.fish').write output

        # Install zsh completion
        output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'zsh')
        (zsh_completion/'_github-nippou').write output
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/masutaka/github-nippou/releases/download/v4.2.34/github-nippou_v4.2.34_linux_amd64.zip"
        sha256 "45d1821f83ec8dd5780d18a6f395187eff6f7fa78cdef1a4472913fd4f1896d8"

        def install
          bin.install 'github-nippou'

          # Install bash completion
          output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'bash')
          (bash_completion/'github-nippou').write output

          # Install fish completion
          output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'fish')
          (fish_completion/'github-nippou.fish').write output

          # Install zsh completion
          output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'zsh')
          (zsh_completion/'_github-nippou').write output
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/masutaka/github-nippou/releases/download/v4.2.34/github-nippou_v4.2.34_linux_arm64.zip"
        sha256 "0cc50883fef92673c76b6520698f60fb7b2e1e10f09367fb1ee3cb0e932e795c"

        def install
          bin.install 'github-nippou'

          # Install bash completion
          output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'bash')
          (bash_completion/'github-nippou').write output

          # Install fish completion
          output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'fish')
          (fish_completion/'github-nippou.fish').write output

          # Install zsh completion
          output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'zsh')
          (zsh_completion/'_github-nippou').write output
        end
      end
    end
  end

  test do
    system 'github-nippou', 'version'
  end
end
