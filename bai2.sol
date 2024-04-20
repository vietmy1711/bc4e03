// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BasicBank {
    /// sử dụng để lưu trữ số dư của người dùng
    ///     USER    =>  BALANCE
    mapping(address => uint256) public balances;

    /// @notice gửi ether vào contract
    /// @dev mong muốn nó hoạt động tốt khi thực hiện nhiều lần
    function addEther() external payable {
        balances[msg.sender] += msg.value;
    }

    /// @notice sử dụng để rút tiền khỏi hợp đồng
    /// @param amount là số lượng muốn rút
    function removeEther(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Khong du so du");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
