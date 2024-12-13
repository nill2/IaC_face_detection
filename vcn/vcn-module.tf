  provider "oci" {
    tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa6znd2iqiij4bt6wt6akhkdyhpmmuepgq4nbzxzxklxacbzjoyt3a"
    user_ocid        = "ocid1.user.oc1..aaaaaaaa6m3se3f5oq6kw3x76yhogjz76mprfsaa3m5khxvqstydl5sq2jba"
    fingerprint      = "35:83:e8:0b:00:71:a8:c7:1b:20:c4:03:f5:fe:bf:d9"
    private_key_path = "C:\\Users\\nill2\\pk_danilspa\\IaC_face_detection\\OCI_keys\\new_api_key.pem"
    region           = "eu-frankfurt-1"
  }

  module "vcn" {
    source  = "oracle-terraform-modules/vcn/oci"
    version = "3.1.0"

    # Required Inputs
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaahcd46lsg6h7duazrp2yqnsmnnxr6il5ukh2wmkjh66gx6ff45hq"
    region         = "eu-frankfurt-1"

    # Optional Inputs
    vcn_name                 = "vcn-face-recognition"
    vcn_dns_label            = "facerecognition"
    vcn_cidrs                = ["10.0.0.0/16"]
    create_internet_gateway  = true
    create_nat_gateway       = true
    create_service_gateway   = true

    # Corrected inputs
    internet_gateway_route_rules = []
    local_peering_gateways       = {}
    nat_gateway_route_rules      = []
  }
