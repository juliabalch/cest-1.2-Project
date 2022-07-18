# -*- coding: utf-8 -*-
"""
tierpsy tracker data analysis

created on Thu Jul 14 13:25:38 2022

@author: julia
"""
from tierpsytools.extract_data import extract_tables_from_hdf5
from pathlib import Path

src = Path(r'C:\Users\julia\OneDrive\Desktop\Projects\cest-1.2-Project\tierpsy analysis\hdf5_files')
dst = Path(r'C:\Users\julia\OneDrive\Desktop\Projects\cest-1.2-Project\tierpsy analysis\extracted_tables')
table_name = ['/timeseries_data']
search_string = '*.hdf5'

extract_tables_from_hdf5.extract_table(table_name, src, dst, search_string)
