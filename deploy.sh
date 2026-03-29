#!/bin/bash

echo "🚀 Starting config deployment..."

for node in R1 R2 S1; do
  echo "Applying config to $node..."

  docker exec -i clab-ospf-lab-$node vtysh < configs/$node/frr.conf

  if [ $? -eq 0 ]; then
    echo "✅ $node configured successfully"
  else
    echo "❌ Failed on $node"
  fi
done

echo "🎯 Deployment complete"
