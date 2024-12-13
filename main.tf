provider "oci" {
  tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa6znd2iqiij4bt6wt6akhkdyhpmmuepgq4nbzxzxklxacbzjoyt3a"
  user_ocid        = "ocid1.user.oc1..aaaaaaaa6m3se3f5oq6kw3x76yhogjz76mprfsaa3m5khxvqstydl5sq2jba"
  fingerprint      = "bc:74:44:cd:b9:33:5b:c7:da:0d:1d:3e:81:76:6b:0d"
  private_key_path = "C:\\Users\\nill2\\YandexDisk\\old_files\\me\\OracleCloud\\danil.d.kabanov@gmail.com_2024-12-10T19_12_06.591Z.pem"
  region           = "eu-frankfurt-1"
}

resource "oci_core_vcn" "vcn" {
  cidr_block       = "10.0.0.0/16"
  display_name     = "MyVCN"
  compartment_id   = "ocid1.compartment.oc1..aaaaaaaaahcd46lsg6h7duazrp2yqnsmnnxr6il5ukh2wmkjh66gx6ff45hq"
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = oci_core_vcn.vcn.compartment_id
  display_name   = "MyInternetGateway"
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_subnet" "subnet" {
  cidr_block              = "10.0.0.0/24"
  vcn_id                  = oci_core_vcn.vcn.id
  display_name            = "MySubnet"
  compartment_id          = oci_core_vcn.vcn.compartment_id
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_route_table" "route_table" {
  compartment_id = oci_core_vcn.vcn.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "MyRouteTable"

  route_rules {
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_instance" "instance" {
  compartment_id       = "ocid1.tenancy.oc1..aaaaaaaa6znd2iqiij4bt6wt6akhkdyhpmmuepgq4nbzxzxklxacbzjoyt3a"
  availability_domain  = "AD-1"
  shape                = "VM.Standard.E2.1.Micro"
  
  create_vnic_details {
    subnet_id     = oci_core_subnet.subnet.id
    assign_public_ip = true
  }

metadata = {
  ssh_authorized_keys = file("C:\\Users\\nill2\\YandexDisk\\old_files\\me\\OracleCloud\\VM\\newvm\\OracleVMFacePrivateKey.pem")
  user_data           = base64encode(file("cloud-init-script.sh"))
}

  source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaxroekfbow3kdrdjlwao6tsxxfcb23xmqrdjtjcay2ow52eijvzqa"
  }
}

output "instance_public_ip" {
  value = oci_core_instance.instance.public_ip
}
