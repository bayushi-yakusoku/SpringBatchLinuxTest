#!/usr/bin/bash

# ######### #
# FUNCTIONS #
# ######### #
function print_transactions()
{
  local account=$1

  for trans in $(seq -w $(random 20)); do
    printf "$account,2021-03-$(random 10 30) "
    printf "$(random 10 23):$(random 10 59):$(random 10 59),"
    printf "$(random 10000).$(random 99)\n"
  
    printf "$account,2021-03-$(random 10 30) "
    printf "$(random 10 23):$(random 10 59):$(random 10 59),-"
    printf "$(random 10000).$(random 99)\n"
  done

  return 0
}

# ######### #
#   MAIN    #
# ######### #
echo "## Generating Transactions lines..."

typeset -i nb_accounts=$1

account_prefix="3985729"

for index in $(seq -w $nb_accounts); do
  account="${account_prefix}${index}"
  print_transactions $account
done

echo
echo "## Generating Insert statements..."

for index in $(seq -w $nb_accounts); do
  account="${account_prefix}${index}"
  printf "insert into account_summary (account_number, current_balance) "
  printf "values ('$account', 0);\n"
done

echo
echo "## End."
exit 0

