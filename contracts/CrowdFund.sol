pragma solidity ^0.5.0;
contract CrowdFund {
    uint balance;
    address payable public buyer;
    address payable public seller;
    address payable public escrow;
    uint private start;
    bool buyerOk;
    bool sellerOk;
    constructor() public {
        // this is the constructor function that runs ONCE upon initialization
        escrow = msg.sender;
        start = now; //now is an alias for block.timestamp, not really "now"
    }

    function setBuyerSellerAddress(address payable buyer_address, address payable seller_address)public{
        buyer=buyer_address;
        seller=seller_address;
    }
    
    function accept() public {
        if (msg.sender == buyer){
            buyerOk = true;
        } else if (msg.sender == seller){
            sellerOk = true;
        }
        if (buyerOk && sellerOk){
            selfdestruct(seller);
            //payBalance();
        } /*else if (buyerOk && !sellerOk ) {
            // Freeze 30 days before release to buyer. The customer has to remember to call this method after freeze period.
            selfdestruct(buyer);
        }*/
    }
    
    /*function payBalance() private {
        // we are sending ourselves (contract creator) a fee
        //escrow.transfer((address(this).balance / 100));
        // send seller the balance
        
        /*
        if (seller.send(address(this).balance)) {
            balance = 0;
            selfdestruct()
        } else {
            assert(false);
        }
    }*/
    
    function deposit(uint sellerAmount) public payable {
        require(msg.sender==buyer);
        require(msg.value==sellerAmount);
        if (msg.sender == buyer) {
            balance += msg.value;
            escrow.transfer(msg.value);
            //todo : to check if balance equals to the seller amount
        }
    }
    
    function cancel() public {
        if (msg.sender == buyer){
            buyerOk = false;
        } else if (msg.sender == seller){
            sellerOk = false;
            selfdestruct(buyer);
        }
        // if both buyer and seller would like to cancel, money is returned to buyer 
        if (!buyerOk && !sellerOk){
            selfdestruct(buyer);
        }
    }
    
    /*function kill() public {
        require(msg.sender==escrow);
        /*if (msg.sender == escrow) {
            selfdestruct(buyer);
        }
    }*/

}