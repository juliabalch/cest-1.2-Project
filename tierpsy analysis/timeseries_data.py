import pandas as pd
from tierpsytools.read_data import get_timeseries


rootDir = r'C:\Users\julia\OneDrive\Desktop\Projects\cest-1.2-Project\tierpsy analysis\hdf5_files'


filenames, data = get_timeseries.get_timeseries(rootDir)

# combining dataframes, adding genotypes, excluding bad worms

genotype1 = ['N2'] * 3192
data[1]['genotypes'] = genotype1

genotype0 = ['cest-1.2'] * 5872
data[0]['genotypes'] = genotype0

frames = [data[0], data[1]]
combined_df = pd.concat(frames)

good_worms = [17, 57, 80, 103, 141, 185, 229, 274, 313, 331, 376, 414, 487, 30, 115,
              137, 194, 354, 409, 470, 509, 600, 939]

df = combined_df.loc[combined_df['worm_index'].isin(good_worms)]

df.to_csv('tracking_data.csv')
