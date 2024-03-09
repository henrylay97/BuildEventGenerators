export VERSION=NCPiZeroBv1
export HIST_VERSION=_eff_z

export FLUX_DIR=/exp/sbnd/data/users/hlay/ncpizero/plots/$VERSION/flux_hists$HIST_VERSION
export SAVE_DIR=/exp/sbnd/data/users/hlay/ncpizero/generators/genie/$VERSION
export NEVTS=5000000

mkdir -p $SAVE_DIR

source /exp/sbnd/app/users/hlay/generators/BuildEventGenerators/setup_generators.sh

declare -A flavours=( [numu]=14 [anumu]=-14 [nue]=12 [anue]=-12 )

for flavour in "${!flavours[@]}"
do
    export pdg=${flavours[$flavour]}

    gevgen -p $pdg -n $NEVTS -t 1000180400 -f $FLUX_DIR/sbnd_flux.root,flux_sbnd_${flavour} -e 0,10 --cross-sections /cvmfs/larsoft.opensciencegrid.org/products/genie_xsec/v3_04_00/NULL/AR2320i00000-k250-e1000/data/gxspl-FNALsmall.xml --tune AR23_20i_00_000 -o $SAVE_DIR/genie_${flavour}.root --event-generator-list NC

    PrepareGENIE -i $SAVE_DIR/genie_${flavour}.root -t 1000180400[1] -o $SAVE_DIR/genie_${flavour}_prep.root -f $FLUX_DIR/sbnd_flux.root,flux_sbnd_${flavour}

    nuisflat -i GENIE:$SAVE_DIR/genie_${flavour}_prep.root -o $SAVE_DIR/genie_${flavour}_prep.flat.root
done

rm input-flux.root
