class Manticoreexecutor < Formula
  desc "Custom build PHP for launching scripts of Manticore"
  homepage "https://github.com/manticoresoftware/executor"
  url "https://github.com/manticoresoftware/executor/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "190006a14c5e9273914267efe4afea35be209d287c620e482fce8c9e2eb5822b"

  depends_on "curl" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "bison" => :build
  depends_on "re2c" => :build
  depends_on "git" => :build
  depends_on "make" => :build

  def install
    php_version = '8.1.10'
    php_dir = `pwd`.strip + "/php-src-php-#{php_version}"
    system "./build-osx", php_version, "1"
    bin.install "#{php_dir}/dist/bin/php" => "manticore-executor"
  end
end

