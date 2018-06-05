pragma solidity ^0.4.24;
contract Splitter {
    
    // address walletAlice;
    address walletBob = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
    address walletCarol = 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db;
    address owner;
    
    uint fundsAmountReceived;   //will be in wei
    uint fundsSplitAmount;
    uint fundsResidue;
    
    event Payout(
        uint _amount,
        address _to);
    
    // modifier check that Alice called the contract
    
    constructor() public {
        owner=msg.sender;
    }
    
    function splitFunds() public payable returns (bool success) {
        require(msg.value>0);
        require(msg.sender==owner);
        fundsAmountReceived=msg.value;
        fundsSplitAmount=fundsAmountReceived/2;
        transferFunds(fundsSplitAmount, walletBob);
        emit Payout(fundsSplitAmount, walletBob);
        transferFunds(fundsSplitAmount, walletCarol);
        emit Payout(fundsSplitAmount, walletCarol);
    }
    
    function transferFunds(uint fundsToSend, address fundsRecipient) internal returns (bool success) {
        fundsRecipient.transfer(fundsToSend);
    }
}
