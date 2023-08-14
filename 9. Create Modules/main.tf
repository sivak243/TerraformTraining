module networking{
  source="./vpc-module"
  
}


module instanceConfig{
  source="./server-node"
  NewSecurityGrp = module.networking.Output_SecurityGroup
  
  
}