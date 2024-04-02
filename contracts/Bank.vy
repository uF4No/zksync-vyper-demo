# @version ^0.3.10
# vim: ft=python

# Event definitions for logging activities
event Deposit:
    depositor: indexed(address)
    amount: uint256
    balance: uint256

event Withdrawal:
    withdrawer: indexed(address)
    amount: uint256
    balance: uint256

# A mapping to store the ether balance of each address
balances: public(HashMap[address, uint256])

@external
@payable
def deposit() -> uint256:
    """
    Allows a user to deposit Ether into the contract. The deposited amount is
    added to the user's balance within the contract.
    """
    amount: uint256 = msg.value
    assert amount > 0, "Cannot deposit 0 Ether"

    # Update the sender's balance with the deposited amount
    self.balances[msg.sender] += amount

    # Log the deposit event
    log Deposit(msg.sender, amount, self.balances[msg.sender])

    return self.balances[msg.sender]

@external
def withdraw(amount: uint256) -> uint256:
    """
    Allows a user to withdraw Ether from the contract. The amount to withdraw
    is subtracted from the user's balance within the contract.
    """
    assert amount > 0, "Cannot withdraw 0 Ether"
    assert self.balances[msg.sender] >= amount, "Insufficient balance"

    # Update the sender's balance by subtracting the withdrawn amount
    self.balances[msg.sender] -= amount

    # Transfer the specified amount of Ether back to the sender
    send(msg.sender, amount)

    # Log the withdrawal event
    log Withdrawal(msg.sender, amount, self.balances[msg.sender])

    return self.balances[msg.sender]
