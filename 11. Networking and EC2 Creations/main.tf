module networking{
  source="./vpc-module"
}


module instanceConfig{
  source="./server-node"
  VPC_ID = module.networking.Output_VPCID
  igw1_ID = module.networking.Output_GateWayID
 
}