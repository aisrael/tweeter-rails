#!/usr/bin/env ruby

require 'active_support/core_ext/string'

# https://hub.docker.com/aisrael
REGISTRY_PREFIX = 'aisrael'

BASE_PWD = File.basename(Dir.pwd)
WORK_DIR = '.'

REPO_NAME = File.join(REGISTRY_PREFIX, BASE_PWD)

CURRENT_BRANCH = `git symbolic-ref --short HEAD`.chomp

GIT_COMMIT_SHA = `git rev-parse HEAD`.chomp

BRANCH_SLUG = CURRENT_BRANCH.parameterize

def sh(cmd)
  puts cmd
  system(cmd)
end

if CURRENT_BRANCH == 'develop' || CURRENT_BRANCH == 'master'
  IMAGE_TAG = ENV['IMAGE_TAG'] || GIT_COMMIT_SHA[0,8]

  sh %{docker build -t "#{REPO_NAME}:latest" -t "#{REPO_NAME}:#{IMAGE_TAG}" "#{WORK_DIR}"}
else
  # Note: on Linux, use `sed -r`
  IMAGE_TAG = ENV['IMAGE_TAG'] || "#{BRANCH_SLUG}-#{GIT_COMMIT_SHA[0,8]}"

  sh %{docker build -t "#{REPO_NAME}:#{IMAGE_TAG}" "#{WORK_DIR}"}
end
