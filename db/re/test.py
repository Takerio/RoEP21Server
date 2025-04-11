import yaml
import os

# 如果你的檔案位於某個資料夾，例如 "C:/你的路徑/"，請修改 base_path 變數
base_path = "./"  # 或 "./" 如果在相同資料夾內

filenames = [
    "item_db_Weapon.yml",
    "item_db_equip.yml",
    "item_db_equip_NO.yml",
    "item_db_etc.yml",
    "item_db_laphine.yml",
    "item_db_reform.yml",
    "item_db_usable.yml",
]

lines = []
for fname in filenames:
    file_path = os.path.join(base_path, fname)
    if os.path.exists(file_path):
        with open(file_path, "r", encoding="utf-8") as f:
            try:
                data = yaml.safe_load(f)
            except Exception as e:
                print(f"Error loading {fname}: {e}")
                continue
            body = data.get("Body", [])
            if isinstance(body, list):
                for record in body:
                    if isinstance(record, dict) and "AegisName" in record and "Id" in record:
                        aegis = record["AegisName"]
                        id_val = record["Id"]
                        lines.append(f'["{aegis}"] = {id_val},')
    else:
        print(f"File not found: {file_path}")

output_path = os.path.join(base_path, "mapping.txt")
with open(output_path, "w", encoding="utf-8") as fout:
    for line in lines:
        fout.write(line + "\n")

print("mapping.txt generated successfully.")
print("Total mappings:", len(lines))
