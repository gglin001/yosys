git clone https://github.com/YosysHQ/abc

# edit `Makefile.conf`

# asume conda env `bear` has bear installed
$CONDA_PREFIX/../bear/bin/bear -- make -j10

# make install

# patchelf
# micromamba install -y patchelf
# patchelf --add-rpath $CONDA_PREFIX/lib yosys

# macos
install_name_tool -add_rpath $CONDA_PREFIX/lib yosys

pushd examples/aiger
bash demo.sh
popd

pushd examples/cxx-api
# no `make install`
yosys-config --exec --cxx -o demomain --cxxflags --ldflags demomain.cc -I../../ -L../../ -lyosys -lstdc++
# # need `make install`
# yosys-config --exec --cxx -o demomain --cxxflags --ldflags demomain.cc -I../../ -L../../build/lib/yosys -lyosys -lstdc++
install_name_tool -add_rpath $CONDA_PREFIX/lib demomain
popd
