// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;
contract Bank{

    address public owner;
    mapping(address=> uint256) private userbalance;

    constructor() public {
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner,'you are not the owner of this contract');
        _;
    }

    function deposite(uint256 _amount) public payable returns(bool){
        require(msg.value > 10 wei,'please deposit at least 10 wei');
        userbalance[msg.sender]+=msg.value;
       // payable(msg.sender).transfer(_amount);
        return true;

    }

    function withdraw(uint256 _amount) public payable returns(bool){
        require(_amount <= userbalance[msg.sender],'you dont have sufficeint funds');
        userbalance[msg.sender]-=_amount;
        payable(msg.sender).transfer(_amount);
        return true;
    }

    function getbalance() public view returns(uint256){
        return userbalance[msg.sender];
    }

    function getcontractbalance() public view onlyOwner returns(uint256){
        return address(this).balance;
    }

    function withdrawfunds(uint256 _amount) public payable onlyOwner returns(bool){
        payable(owner).transfer(_amount);
        return true;
    }


}

/*


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ethereum bank</title>
    <script src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
</head>
<body>
    
    <!--Bootstrap-->

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script
        
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script src="app.js"></script>
    <h1>Welcome to the Ethereum bank</h1>
</body>
</html>

*/