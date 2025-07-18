minimal contract that can

- receive ether
- send ether to contract owner
- handle transactions fallback
- uses custom errors
- deployment script

with foundry

<!--  -->

sepolia contract address - 0x55726984184A11743d2E8eF7B63d4BD93929EcBb
anvil contract address - 0xa513E6E4b8f2a923D98304ec87F64353C4D5C853

### setup default key

```bash
# encrypt your private key with a password
# use the password each time instead of revealing the private key
cast wallet import defaultKey --interactive
```

### deploy contract (locally)

```bash
forge script script/DeployFundme.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --account defaultKey --sender 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```

### fund contract

```bash
cast send 0xa513E6E4b8f2a923D98304ec87F64353C4D5C853 --value 0.01ether --from 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --account defaultKey --rpc-url http://127.0.0.1:8545
```

### contract balance

```bash
cast balance 0xa513E6E4b8f2a923D98304ec87F64353C4D5C853 --rpc-url http://127.0.0.1:8545
```

### withdraw ether from contract

```bash
cast send 0xa513E6E4b8f2a923D98304ec87F64353C4D5C853 "withdraw()" --account defaultKey --rpc-url
```
