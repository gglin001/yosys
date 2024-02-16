git clone https://github.com/YosysHQ/abc

# asume conda env `bear` has bear installed
$CONDA_PREFIX/../bear/bin/bear -- make -j10

# patchelf
# micromamba install -y patchelf
# patchelf --add-rpath $CONDA_PREFIX/lib yosys

# macos
install_name_tool -add_rpath $CONDA_PREFIX/lib yosys

pushd examples/aiger
bash demo.sh
popd
