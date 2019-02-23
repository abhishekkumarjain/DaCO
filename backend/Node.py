from enum import Enum

NodeTypes = Enum('NodeType','Input Constant Multiply Add Subtract Unknown')
# print(NodeTypes.Input.name)
# print(NodeTypes.Constant.name)

class Node :
    def __init__(self, node_type, id = -1, name = "", init_val = -1.0) :
        self.id = id
        self.name = name
        self.node_type = node_type
        self.init_val = init_val
        self.edges_out = []
        self.edges_in = []
        self.asap_depth = int(-1)
        self.alap_depth = int(-1)
        self.criticality_float = -1.0
        self.criticality_int = int(-1)
        self.backpointers = []

