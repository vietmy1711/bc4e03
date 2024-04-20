pragma solidity ^0.8.13;

contract TicTacToe {
    /* 
        Bài này giải sử bạn đã biết xử lý mảng lổng nhau                                                                                                                                                                                                                                                                
        1. Hợp đồng này kiểm tra, TicTacToe thắng hay thua.
        2. Viết code trong `isWinning` function trả về true nếu game này có người chiến thắng hoặc trả về false nếu không ai thắng.
        3. Bảng bao gồm 1 và 0, nó cùng là mảng 3x3.
        
        [[1, 1, 0], 
         [0, 1, 0],
         [1, 0, 1]] => true (thắng theo hàng học)
    */

    function isWinning(uint8[3][3] memory board) public pure returns (bool) {
        for (uint8 i = 0; i < 3; i++) {
            if (
                board[i][0] == board[i][1] &&
                board[i][1] == board[i][2] &&
                board[i][0] != 0
            ) {
                return true;
            }
            if (
                board[0][i] == board[1][i] &&
                board[1][i] == board[2][i] &&
                board[0][i] != 0
            ) {
                return true;
            }
        }

        if (
            board[0][0] == board[1][1] &&
            board[1][1] == board[2][2] &&
            board[0][0] != 0
        ) {
            return true;
        }

        if (
            board[0][2] == board[1][1] &&
            board[1][1] == board[2][0] &&
            board[0][2] != 0
        ) {
            return true;
        }
        return false;
    }
}
