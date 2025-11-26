from CoalBlendPredictor import *

if __name__ == "__main__":
    # Initialize predictor
    predictor = CoalBlendPredictor()
    # csv = predictor.predict_from_csv("Blend_ratio_oct.csv", output_csv_path="output1.csv", verbose=True)
    # # Single prediction
    result = predictor.predict({'Goonyella': 50, 'R.PCI': 50})
    print(result)