object GemminiConfigs {
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