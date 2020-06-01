 to # Jakis tam score
def get_smiles_optim_score(smiles_list, delete_nans=False):
    smiles_optim_score = [get_optim_score(smi) for smi in smiles_list]
    
    if delete_nans:
        smiles_optim_score = [x for x in smiles_optim_score if x is not None]
    
    return smiles_optim_score

# Dystans tanimoto
def smiles_distance_tanimoto(smiles_A, smiles_B):
    df_smiles = pd.DataFrame({'A': smiles_A, 'B': smiles_B})
    df_smiles.dropna(inplace=True)
    df_smiles = df_smiles.iloc[np.logical_and(df_smiles['A'].values != 'nan', df_smiles['B'].values != 'nan')]
    smiles_A = df_smiles.A
    smiles_B = df_smiles.B
    
    smiles_A_mol = [Chem.MolFromSmiles(x) for x in smiles_A]
    smiles_B_mol = [Chem.MolFromSmiles(x) for x in smiles_B]
    
    smiles_A_fps = [AllChem.GetMorganFingerprint(mol, 2) for mol in smiles_A_mol]
    smiles_B_fps = [AllChem.GetMorganFingerprint(mol, 2) for mol in smiles_B_mol]
    
    tanimoto = np.array([DataStructs.TanimotoSimilarity(fp1, fp2)  for (fp1, fp2) in zip(smiles_A_fps, smiles_B_fps)])
    return tanimoto