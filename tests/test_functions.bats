#!/usr/bin/env bats

setup() {
  export logger="/dev/null"
  export nocolor="nocolor"
  source ./functions/output_lib.sh
}

@test "Verificar que info imprime mensaje" {
  output="$(info "Mensaje de prueba")"
  status=$?

  echo "=== Output completo ==="
  echo "$output"
  echo "======================="

  [ "$status" -eq 0 ]
  [[ "$output" == *"[INFO]"* ]]
  [[ "$output" == *"Mensaje de prueba"* ]]
}

