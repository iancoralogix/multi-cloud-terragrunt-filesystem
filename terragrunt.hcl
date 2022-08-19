# I want to share values across all my companies, their clouds, their
# organzations, their accounts, their regions, their environments, all
# the way down to their individual resources.

locals {
  corporate_level_required_tags = {
    company_id = "0123456789ABCDEF"
  }
}
