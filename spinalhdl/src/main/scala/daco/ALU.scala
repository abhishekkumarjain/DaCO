package daco 

import spinal.core._

class ALU extends Component {

  /**
   * This is the compenent definition that corresponds to
   * the Verilog entity of the component
   */

  val io = new Bundle {
    val a = in Bool
    val b = in Bool
    val c = out Bool
  }

  // Here we define some asynchornous logic
  io.c := io.a & io.b
}

object ALU {
  // Compile to verilog
  def main(args: Array[String]) {
    SpinalVerilog(new ALU)
  }
}
