# echo "# this file is located in 'src/scan_command.sh'"
# echo "# code for 'saws scan' goes here"
# echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args
default_region="us-east-1"
service="${args[service]}"
exclude="${args[--exclude]}"

get_regions() {
  REGIONS=()
  echo "Getting regions from AWS..."
  echo "The default region is $(get_region)"
  aws ec2 --region ${default_region} describe-regions | jq -e '.Regions[].RegionName' > regions.txt

  while read -r region; do 
    REGIONS+=("${region}")
  done < regions.txt

  # Hanlding the exclude flag to eliminate a certain region
  if [[ ${exclude} != "" ]]; then 
    echo "Choose a region to exclude"
    EXECLUDED_REGION=$(fzf < regions.txt)
  fi
}

find_instances() {
  for region in "${REGIONS[@]}"; do 
        if [[ "${region}" == "${EXECLUDED_REGION}" ]]; then 
          echo "Skipping $region"
        else 
          instances=$(aws ec2 describe-instances --region "$region" --filter Name=instance-state-name,Values=running)
          sum=$(echo "${instances}" jq '.Reservation')
        fi
  done
}

get_regions
find_instances
