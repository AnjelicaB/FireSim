object GemminiConfigs {
    // Add these directly to the bottom of the existing `GemminiConfigs` object
    val mediumDefaultConfig = defaultConfig.copy(
        tileRows = 1,
        tileColumns = 1,
        meshRows = 8,
        meshColumns = 8,

        sp_capacity = CapacityInKilobytes(128),
        acc_capacity = CapacityInKilobytes(32),
    )

    val mediumPrintDefaultConfig = defaultConfig.copy(
        tileRows = 1,
        tileColumns = 1,
        meshRows = 8,
        meshColumns = 8,

        sp_capacity = CapacityInKilobytes(128),
        acc_capacity = CapacityInKilobytes(32),
        use_firesim_simulation_counters=true
    )
}

class MediumGemminiConfig[T <: Data : Arithmetic, U <: Data, V <: Data](
  gemminiConfig: GemminiArrayConfig[T,U,V] = GemminiConfigs.mediumDefaultConfig
) extends Config((site, here, up) => {
  case BuildRoCC => up(BuildRoCC) ++ Seq(
    (p: Parameters) => {
      implicit val q = p
      val gemmini = LazyModule(new Gemmini(gemminiConfig))
      gemmini
    }
  )
})

class MediumPrintGemminiConfig[T <: Data : Arithmetic, U <: Data, V <: Data](
  gemminiConfig: GemminiArrayConfig[T,U,V] = GemminiConfigs.mediumPrintDefaultConfig
) extends Config((site, here, up) => {
  case BuildRoCC => up(BuildRoCC) ++ Seq(
    (p: Parameters) => {
      implicit val q = p
      val gemmini = LazyModule(new Gemmini(gemminiConfig))
      gemmini
    }
  )
})