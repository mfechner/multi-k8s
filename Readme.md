# Create a secret
```
kubectl create secret generic <secret_name> --from-literal key=value
kubectl create secret generic pgpassword --from-literal PGPASSWORD=password123
```
