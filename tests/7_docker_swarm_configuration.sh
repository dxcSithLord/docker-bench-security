#!/bin/sh

check_7() {
  logit "\n"
  id_7="7"
  desc_7="Docker Swarm Configuration"
  check_7="$id_7 - $desc_7"
  info "$check_7"
  startsectionjson "$id_7" "$desc_7"
}

# 7.1
check_7_1() {
  retval=1
  if docker info 2>/dev/null | grep -e "Swarm:*\sinactive\s*" >/dev/null 2>&1; then
    retval=0
  fi
  return "$retval"
}

# 7.2
check_7_2() {
  retval=0
  if docker info 2>/dev/null | grep -e "Swarm:*\sactive\s*" >/dev/null 2>&1; then
    managernodes=$(docker node ls | grep -c "Leader")
    if [ "$managernodes" -eq 1 ]; then
      retval=0
    else
      retval=1
    fi
  else
    retval=0
  fi
  return "$retval"
}

# 7.3
check_7_3() {
  retval=0
  if docker info 2>/dev/null | grep -e "Swarm:*\sactive\s*" >/dev/null 2>&1; then
    ss -lnt | grep -e '\[::]:2377 ' -e ':::2377' -e '*:2377 ' -e ' 0\.0\.0\.0:2377 ' >/dev/null 2>&1
    if [ $? -eq 1 ]; then
      retval=0
    else
      retval=1
    fi
  else
    retval=0
  fi
}

# 7.4
check_7_4() {
  retval=0
  fail=0
  unencrypted_networks=""
  for encnet in $(docker network ls --filter driver=overlay --quiet); do
    if docker network inspect --format '{{.Name}} {{ .Options }}' "$encnet" | \
      grep -v 'encrypted:' 2>/dev/null 1>&2; then
      # If it's the first container, fail the test
      if [ $fail -eq 0 ]; then
        retval=1 #warn "$check_7_4"
        fail=1
      fi
      warn "     * Unencrypted overlay network: $(docker network inspect --format '{{ .Name }} ({{ .Scope }})' "$encnet")"
      unencrypted_networks="$unencrypted_networks $(docker network inspect --format '{{ .Name }} ({{ .Scope }})' "$encnet")"
    fi
  done
  # We went through all the networks and found none that are unencrypted
  if [ $fail -eq 0 ]; then
      retval=0
  else
      logit "WARN" "Unencrypted overlay networks:" "$unencrypted_networks"
      retval=1
  fi
  return "$retval"
}

# 7.5
check_7_5() {
  id_7_5="7.5"
  desc_7_5="Ensure that Docker's secret management commands are used for managing secrets in a swarm cluster"
  check_7_5="$id_7_5  - $desc_7_5"
  starttestjson "$id_7_5" "$desc_7_5"

  totalChecks=$((totalChecks + 1))
  if docker info 2>/dev/null | grep -e "Swarm:\s*active\s*" >/dev/null 2>&1; then
    if [ "$(docker secret ls -q | wc -l)" -ge 1 ]; then
      pass "$check_7_5"
      resulttestjson "PASS"
      currentScore=$((currentScore + 1))
    else
      info "$check_7_5"
      resulttestjson "INFO"
      currentScore=$((currentScore + 0))
    fi
  else
    pass "$check_7_5 (Swarm mode not enabled)"
    resulttestjson "PASS"
    currentScore=$((currentScore + 1))
  fi
}

# 7.6
check_7_6() {
  retval=0
  if docker info 2>/dev/null | grep -e "Swarm:\s*active\s*" >/dev/null 2>&1; then
    if ! docker swarm unlock-key 2>/dev/null | grep 'SWMKEY' 2>/dev/null 1>&2; then
      retval=1
    fi
  fi
  return "$retval"
}

# 7.7
check_7_7() {
  id_7_7="7.7"
  desc_7_7="Ensure that the swarm manager auto-lock key is rotated periodically"
  check_7_7="$id_7_7  - $desc_7_7"
  starttestjson "$id_7_7" "$desc_7_7"

  totalChecks=$((totalChecks + 1))
  if docker info 2>/dev/null | grep -e "Swarm:\s*active\s*" >/dev/null 2>&1; then
    note "$check_7_7"
    resulttestjson "NOTE"
    currentScore=$((currentScore + 0))
  else
    pass "$check_7_7 (Swarm mode not enabled)"
    resulttestjson "PASS"
    currentScore=$((currentScore + 1))
  fi
}

# 7.8
check_7_8() {
  id_7_8="7.8"
  desc_7_8="Ensure that node certificates are rotated as appropriate"
  check_7_8="$id_7_8  - $desc_7_8"
  starttestjson "$id_7_8" "$desc_7_8"

  totalChecks=$((totalChecks + 1))
  if docker info 2>/dev/null | grep -e "Swarm:\s*active\s*" >/dev/null 2>&1; then
    if docker info 2>/dev/null | grep "Expiry Duration: 2 days"; then
      pass "$check_7_8"
      resulttestjson "PASS"
      currentScore=$((currentScore + 1))
    else
      info "$check_7_8"
      resulttestjson "INFO"
      currentScore=$((currentScore + 0))
    fi
  else
    pass "$check_7_8 (Swarm mode not enabled)"
    resulttestjson "PASS"
    currentScore=$((currentScore + 1))
  fi
}

# 7.9
check_7_9() {
  id_7_9="7.9"
  desc_7_9="Ensure that CA certificates are rotated as appropriate"
  check_7_9="$id_7_9  - $desc_7_9"
  starttestjson "$id_7_9" "$desc_7_9"

  totalChecks=$((totalChecks + 1))
  if docker info 2>/dev/null | grep -e "Swarm:\s*active\s*" >/dev/null 2>&1; then
    info "$check_7_9"
    resulttestjson "INFO"
    currentScore=$((currentScore + 0))
  else
    pass "$check_7_9 (Swarm mode not enabled)"
    resulttestjson "PASS"
    currentScore=$((currentScore + 1))
  fi
}

# 7.10
check_7_10() {
  id_7_10="7.10"
  desc_7_10="Ensure that management plane traffic is separated from data plane traffic"
  check_7_10="$id_7_10  - $desc_7_10"
  starttestjson "$id_7_10" "$desc_7_10"

  totalChecks=$((totalChecks + 1))
  if docker info 2>/dev/null | grep -e "Swarm:\s*active\s*" >/dev/null 2>&1; then
    info "$check_7_10"
    resulttestjson "INFO"
    currentScore=$((currentScore + 0))
  else
    pass "$check_7_10 (Swarm mode not enabled)"
    resulttestjson "PASS"
    currentScore=$((currentScore + 1))
  fi
}

check_7_end() {
  endsectionjson
}
