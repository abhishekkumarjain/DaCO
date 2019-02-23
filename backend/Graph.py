import numpy as np
from Node import *
import time
from scipy.io import mmread, mminfo

class Graph :
    def __init__(self, name = "") :
        self.name = name
        self.nodes = []
        self.next_node_id = 0
        self.total_edges = 0
        self.critical_path = 0
        self.floatCriticalityComputed = False 
        # print("Created graph with name = " + str(name))

    def addNode(self,node_type,name = "",init_val = -1.0) :
        n = Node(node_type,id = self.next_node_id,name = name,init_val = init_val)
        self.nodes.append(n)
        self.next_node_id += 1
        return n

    def graphStats(self) :
        print("Num nodes = " + str(len(self.nodes)))
        print("Num edges = " + str(self.total_edges))
        print("Critical path length = " + str(self.critical_path))

    def toDot(self, fname = None) :
        if fname == None :
            fname = self.name
        fp = open(fname+".dot","w")
        fp.write("digraph %s {\n" % (fname))
        for i in range(len(self.nodes)) :
            fp.write("\t%d[ label = \"%s, ASAP/ALAP/Slack/CritF/CritQ\n = %d/%d/%d/%.4f/%d\"];\n" % (self.nodes[i].id,self.nodes[i].name,self.nodes[i].asap_depth,self.nodes[i].alap_depth,self.nodes[i].slack,self.nodes[i].criticality_float,self.nodes[i].criticality_int))
        for i in range(len(self.nodes)) :
            for j in range(len(self.nodes[i].edges_out)) :
                fp.write("\t%d -> %d [ label = \"%s\"];\n" % (self.nodes[i].id,self.nodes[i].edges_out[j][1].id,self.nodes[i].edges_out[j][0]))

        fp.write("}\n")
        fp.close()
        print("Created dot file = " + str(fname + ".dot"))

    def addEdge(self,edge_from,edge_to,edge_id = "") :
        edge_from.edges_out.append([edge_id,edge_to])
        edge_to.edges_in.append([edge_id,edge_from])
        self.total_edges += 1

    def returnNodeByIndex(self,index) :
        return self.nodes[index]

    def returnNodeByID(self,id) :
        for i in range(len(self.nodes)) :
            if self.nodes[i].id == id :
                return self.nodes[i]

        print("Node with ID = " + str(id) + " not found!")
        exit()

    def computeASAP(self) :
        for i in range(len(self.nodes)) :
            self.nodes[i].asap_depth = int(0) # initialize node depth
        complete = False
        while not complete :
            complete = True
            for i in range(len(self.nodes)) :
                node_depth = self.nodes[i].asap_depth
                for j in range(len(self.nodes[i].edges_out)) :
                    sink = self.nodes[i].edges_out[j][1]
                    if (sink.asap_depth <= node_depth and sink.node_type != NodeTypes.Input) :
                        sink.asap_depth = node_depth + 1
                        if (self.critical_path < node_depth + 1) :
                            self.critical_path = node_depth + 1
                        complete = False
                    else :
                        backpointers = []
                        for k in range(len(sink.edges_in)) :
                            if sink.edges_in[k][1].asap_depth == sink.asap_depth - 1 :
                                backpointers.append(sink.edges_in[k][1])
                        sink.backpointers = backpointers

    def computeALAP(self) :
        for i in range(len(self.nodes)) :
            self.nodes[i].alap_depth = self.nodes[i].asap_depth

        complete = False
        while not complete :
            complete = True
            for i in range(len(self.nodes)) :
                node = self.nodes[i]
                earliest_cycle = self.critical_path
                valid_fanout_count = 0
                for j in range(len(node.edges_out)) :
                    sink = node.edges_out[j][1]
                    if (earliest_cycle >= sink.alap_depth and sink.node_type != NodeTypes.Input) :
                        earliest_cycle = sink.alap_depth
                        valid_fanout_count += 1

                src_depth = node.alap_depth
                if (src_depth != (earliest_cycle-1) and valid_fanout_count > 0) :
                    complete = False
                    node.alap_depth = earliest_cycle - 1

    def computeSlack(self) :
        self.computeASAP()
        self.computeALAP()
        for i in range(len(self.nodes)) :
            self.nodes[i].slack = self.nodes[i].alap_depth - self.nodes[i].asap_depth

    def computeFloatCriticality(self) :
        self.computeSlack()
        for i in range(len(self.nodes)) :
            self.nodes[i].criticality_float = 1.0 - (float(self.nodes[i].slack)/self.critical_path)
        self.floatCriticalityComputed = True

    def computeQuantizedCriticality(self,bitw) :
        # check to make sure float criticality is computed before quantized criticality is calculated
        if not self.floatCriticalityComputed :
            self.computeFloatCriticality() 
        
        max_crit = 2**bitw
        for i in range(len(self.nodes)) :
            self.nodes[i].criticality_int = int(self.nodes[i].criticality_float * max_crit + 0.5) - 1

    # removes nodes which are just floating around -- constants/inputs that have no fanouts
    def eliminateFloatingNodes(self) :
        nodesRemoved = 0
        toRemove_indexes = []

        for i in range(len(self.nodes)) :
            n = self.nodes[i]
            if ((n.node_type == NodeTypes.Input or n.node_type == NodeTypes.Constant) and len(n.edges_out) == 0) or n.node_type == NodeTypes.Unknown :
                assert len(n.edges_in) == 0 # Input/Constant/Unknown node must have zero fanins
                toRemove_indexes.append(i)

        for index in sorted(toRemove_indexes, reverse=True):
            del self.nodes[index]
            nodesRemoved += 1

        print("%d floating nodes removed." % (nodesRemoved))

    def finalizeGraph(self) :
        self.eliminateFloatingNodes()


def makeSnakeGraph(length) :
    g = Graph(name = "Snake")
    in0 = g.addNode(NodeTypes.Constant, name = "3")
    in1 = g.addNode(NodeTypes.Constant, name = "5")
    mult0 = g.addNode(NodeTypes.Multiply, name = "*")
    g.addEdge(in0,mult0,edge_id = "0")
    g.addEdge(in1,mult0,edge_id = "1")
    last = mult0
    for i in range(length-1) :
        inn = g.addNode(NodeTypes.Constant, name = str(i))
        mult = g.addNode(NodeTypes.Multiply, name = "*")
        g.addEdge(inn,mult,edge_id = "0")
        g.addEdge(last,mult,edge_id = "1")
        last = mult

    return g

def test0() :
    g = Graph(name = "Test")
    mult0 = g.addNode(NodeTypes.Multiply, name = "*")
    _ = g.addNode(NodeTypes.Constant, name = "3")
    _ = g.addNode(NodeTypes.Constant, name = "5")
    add0 = g.addNode(NodeTypes.Add, name = "+")
    constant2 = g.addNode(NodeTypes.Constant, name = "9")
    constant0 = g.returnNodeByID(1)
    constant1 = g.returnNodeByID(2)
    g.addEdge(constant0,mult0,edge_id = "0")
    g.addEdge(constant1,mult0,edge_id = "1")
    g.addEdge(mult0,add0,edge_id = "0")
    g.addEdge(constant2,add0,edge_id = "1")

def timeTest() :
    RUNS = 1000
    for i in range(0,2001,100) :
        if i == 0 : 
            continue
        g = makeSnakeGraph(i)
        t0 = time.time()
        for j in range(RUNS) :
            g.computeQuantizedCriticality(8)
        t1 = time.time()
        total = t1 - t0
        print("Graph size = %d, Time = %f" % (i,float(total)/RUNS))

def test1() :
    g = makeSnakeGraph(16)
    g.computeQuantizedCriticality(1)
    g.graphStats()
    g.toDot()

    for n in g.nodes :
        for b in n.backpointers :
            print("node %s backpointer = %s" % (n.name,b.name))

# mmread function reads columns with offset 0.. i.e. column 1 is stored as column 0. This is unlike the MTX reader in C.
def read_mtx(filepath) :
    # rows,cols,nnz,form,field,symm = mminfo(filepath)
    # print("Rows = %d, Cols = %d, NNZ = %d, Format = %s, Field = %s, Symmetrical? = %s" % (rows,cols,nnz,form,field,symm))
    x = mmread(filepath)
    nrow, ncol = x.shape
    nnz = x.nnz
    return nrow, ncol, nnz, x.tocsr()

def makeFakeB(dim) :
    b = []
    for i in range(dim) :
        b.append((i+1)/256.0) # chosen at random

    return np.array(b)

def frontSolve2DFG(A,b,nrow,ncol,nnz) :
    g = Graph(name = "FrontSolveDFG")
    b_nodes = []
    for i in range(nrow) : # assuming rows = cols, i.e. square matrices
        node_label = "b_"+str(i+1)
        bi = g.addNode(NodeTypes.Constant, name = node_label, init_val = b[i])
        b_nodes.append(bi)

    x = np.ndarray(shape=(nrow), dtype=type(b_nodes[0]))
    for row in range(nrow) :
        node_sop = None # node that represents the result of the sum-of-products
        if row == 0 :
            x[0] = b_nodes[0];
        else :
            corner = True
            for col in range(A.indptr[row],A.indptr[row+1],1) :
                if A.indices[col] != row :
                    mult = g.addNode(NodeTypes.Multiply,name = "*")
                    src1 = x[A.indices[col]]
                    aij = "A_" + str(row+1) + "_" + str(A.indices[col]+1)
                    src2 = g.addNode(NodeTypes.Input,name = aij,init_val = A.data[col])
                    g.addEdge(src1,mult,edge_id = "0")
                    g.addEdge(src2,mult,edge_id = "1")
                    if corner :
                        corner = False
                        node_sop = mult
                    else :
                        add = g.addNode(NodeTypes.Add,name = "+")
                        g.addEdge(node_sop,add,edge_id = "0")
                        g.addEdge(mult,add,edge_id = "1")
                        node_sop = add

            if corner :
                x[row] = b_nodes[row]
            else :
                subtract = g.addNode(NodeTypes.Subtract,name = "-")
                g.addEdge(b_nodes[row],subtract,edge_id = "0")
                g.addEdge(node_sop,subtract,edge_id = "1")
                x[row] = subtract # save x vector nodes
    return g

# do a depth-limited unroll for a front-solve kernel
def depthLimitedFrontSolve(A,b,nrow,ncol,nnz,depth) :
    g = Graph(name = "FrontSolveDFG")
    b_nodes = []
    for i in range(nrow) : # assuming rows = cols, i.e. square matrices
        node_label = "b_"+str(i+1)
        bi = g.addNode(NodeTypes.Constant, name = node_label, init_val = b[i])
        b_nodes.append(bi)

    x = np.ndarray(shape=(nrow), dtype=type(b_nodes[0]))
    for row in range(0,nrow,depth) :
        node_sop = None # node that represents the result of the sum-of-products
        if row == 0 :
            x[0] = b_nodes[0];
        else :
            corner = True
            for col in range(A.indptr[row],A.indptr[row+1],1) :
                if A.indices[col] != row :
                    mult = g.addNode(NodeTypes.Multiply,name = "*")
                    src1 = x[A.indices[col]]
                    aij = "A_" + str(row+1) + "_" + str(A.indices[col]+1)
                    src2 = g.addNode(NodeTypes.Input,name = aij,init_val = A.data[col])
                    g.addEdge(src1,mult,edge_id = "0")
                    g.addEdge(src2,mult,edge_id = "1")
                    if corner :
                        corner = False
                        node_sop = mult
                    else :
                        add = g.addNode(NodeTypes.Add,name = "+")
                        g.addEdge(node_sop,add,edge_id = "0")
                        g.addEdge(mult,add,edge_id = "1")
                        node_sop = add

            if corner :
                x[row] = b_nodes[row]
            else :
                subtract = g.addNode(NodeTypes.Subtract,name = "-")
                g.addEdge(b_nodes[row],subtract,edge_id = "0")
                g.addEdge(node_sop,subtract,edge_id = "1")
                x[row] = subtract # save x vector nodes
    return g

nrow, ncol, nnz, A = read_mtx("bomhof2_circuit_4509.mtx")
b = makeFakeB(nrow)
g = frontSolve2DFG(A,b,nrow,ncol,nnz)
g.finalizeGraph()
g.computeQuantizedCriticality(8)
g.graphStats()

