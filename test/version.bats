#!/usr/bin/env bats

load test_helper

@test 'version recognizes ruby version in Gemfile' {
  create_versions 1.8.7 1.9.3
  cd_into_project_with_Gemfile "'" 1.8.7
  run rbenv-version
  assert_output "1.8.7 (set by $EXAMPLE_APP_DIR/Gemfile)"
  assert_line_starts_with 0 '1.8.7'
  assert_success
}

@test 'version-name recognizes ruby version in Gemfile' {
  create_versions 1.8.7 1.9.3
  cd_into_project_with_Gemfile "'" 1.8.7
  run rbenv-version-name
  assert_output '1.8.7'
  assert_success
}
