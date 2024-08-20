INTERFACE="ens4f0"

# Get all ntuple filter IDs
filter_ids=$(sudo ethtool -u $INTERFACE | grep "Filter: " | awk '{print $2}')

# Delete each filter
for id in $filter_ids; do
    sudo ethtool -U $INTERFACE delete $id
    echo "Deleted filter ID: $id"
done