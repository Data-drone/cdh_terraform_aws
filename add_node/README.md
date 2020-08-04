# Tasks

- Need to add x number of nodes
  - standard terraform will do that but we need to collect them and add properly to the cluster as well as enable the ?
- Need to set swapping and other prework
- Need then execute preload bits

# Problems - inventory management

- CM returns the internal addresses and not roles and host templates
- Need to manually add nodes to main inventory
- Need to look at roles in order to be able to manage the inventory better
- Can use a role tag in order to sort out the logic

current hack requires manually copying over details on the krb5 node as well
