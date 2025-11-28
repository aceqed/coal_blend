import pandas as pd
import os
import sys

# Add backend to path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from genetic_algorithm import FastCoalPredictor, VectorizedGA

def test_ga():
    # Mock coal data
    data = {
        'Name_of_coal': ['Coal A', 'Coal B', 'Coal C'],
        'IM': [1.0, 1.5, 1.2],
        'Ash': [9.0, 10.0, 8.5],
        'VM_weight': [20.0, 22.0, 21.0],
        'FC': [60.0, 58.0, 62.0],
        'S': [0.5, 0.6, 0.4],
        'P': [0.05, 0.04, 0.06],
        'SiO2': [50.0, 52.0, 48.0],
        'Al2O3': [25.0, 24.0, 26.0],
        'Fe2O3': [5.0, 6.0, 4.0],
        'CaO': [2.0, 1.8, 2.2],
        'MgO': [1.0, 0.9, 1.1],
        'Na2O': [0.5, 0.4, 0.6],
        'K2O': [1.5, 1.6, 1.4],
        'TiO2': [1.0, 1.1, 0.9],
        'Mn3O4': [0.1, 0.1, 0.1],
        'SO3': [0.5, 0.6, 0.4],
        'P2O5': [0.1, 0.1, 0.1],
        'BaO': [0.01, 0.01, 0.01],
        'SrO': [0.01, 0.01, 0.01],
        'ZnO': [0.01, 0.01, 0.01],
        'CRI_weight': [25.0, 30.0, 28.0],
        'CSR_weight': [60.0, 55.0, 58.0],
        'N': [1.0, 1.1, 0.9],
        'Inertinite': [30.0, 35.0, 32.0],
        'Minerals': [5.0, 6.0, 4.0],
        'MaxFluidity': [100.0, 200.0, 150.0],
        'coal_category': ['HCC', 'SHCC', 'PCI'],
        'Cost': [100, 110, 105]
    }
    
    # Add V7-V19
    for i in range(7, 20):
        data[f'V{i}'] = [0.0] * 3

    coal_df = pd.DataFrame(data)
    
    models_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Models")
    
    print("Initializing Predictor...")
    predictor = FastCoalPredictor(coal_df, models_dir=models_dir)
    
    print("Initializing GA...")
    ga = VectorizedGA(predictor, population_size=10, generations=2)
    
    print("Running Evolution...")
    best_blend, best_score = ga.evolve()
    
    print("Best Blend:", best_blend)
    print("Best Score:", best_score)
    
    # Get predictions for the best blend (index of min fitness)
    best_idx = ga.fitness.argmin()
    best_preds = {k: v[best_idx] for k, v in ga.preds.items()}
    print("\n🔹 Predictions for Best Blend:")
    for k, v in best_preds.items():
        print(f"   {k}: {v}")

    top_blends = ga.get_top_blends(2)
    print("\nTop Blends:", top_blends)
    
    # Verify names are preserved (case-sensitive)
    if top_blends:
        first_blend = top_blends[0]['composition']
        for name in first_blend.keys():
            if name not in data['Name_of_coal']:
                print(f"❌ Name mismatch: '{name}' not found in input names {data['Name_of_coal']}")
            else:
                print(f"✅ Name match: '{name}' found in input")

if __name__ == "__main__":
    test_ga()
