library(rgplates)
library(chronosphere)


mer <- chronosphere::fetch(src="GPlates", ser="MERDITH2021")

tar <- 560
divergence <- rgplates::reconstruct("divergence", age=tar, model=mer)
plot(divergence$geometry)
write.csv(divergence$geometry, paste(tar, "Divergence.csv", seq=""))

convergence <- rgplates::reconstruct("convergence", age=tar, model=mer)
plot(convergence$geometry)
write.csv(convergence$geometry, paste(tar, "Convergence.csv", seq=""))

transforms <- rgplates::reconstruct("transforms", age=tar, model=mer)
plot(transforms$geometry)
write.csv(transforms$geometry, paste(tar, "Transforms.csv", seq=""))