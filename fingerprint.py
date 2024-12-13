import base64
import hashlib

def calculate_fingerprint(private_key_path):
    with open(private_key_path, "rb") as key_file:
        key_data = key_file.read()
        sha256_digest = hashlib.sha256(key_data).digest()
        fingerprint = base64.b64encode(sha256_digest).decode()
        return fingerprint

private_key_path = "C:\\Users\\nill2\\YandexDisk\\old_files\\me\\OracleCloud\\danil.d.kabanov@gmail.com_2024-12-10T19_12_06.591Z.pem"
fingerprint = calculate_fingerprint(private_key_path)
print("Fingerprint:", fingerprint)
