// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract StudentDB {
    /*
    Struct Student lưu hai thông tin cơ bản của người dùng
    */
    struct Student {
        string name;
        uint256 age;
    }

    mapping(uint256 => Student) public students;

    uint256 public studentCount;
    mapping(uint256 => bool) public studentExists;

    /// @notice Create
    /// @param _name Ten
    /// @param _age Tuoi
    function createStudent(string memory _name, uint256 _age) external {
        students[studentCount++] = Student(_name, _age);
        studentExists[studentCount] = true;
    }

    /// @notice Read
    /// @param _studentId id
    /// @return name Ten
    /// @return age Tuoi
    function readStudent(
        uint256 _studentId
    ) external view returns (string memory name, uint256 age) {
        Student storage student = students[_studentId];
        require(student.age != 0, "Khong ton tai");
        return (student.name, student.age);
    }

    /// @notice Update
    /// @param _studentId id
    /// @param _name Ten
    /// @param _age Tuoi
    function updateStudent(
        uint256 _studentId,
        string memory _name,
        uint256 _age
    ) external {
        require(_studentId <= studentCount && _studentId > 0, "Sai ID");
        students[_studentId] = Student(_name, _age);
    }

    /// @notice Delete
    /// @param _studentId id
    function deleteStudent(uint256 _studentId) external {
        require(
            _studentId <= studentCount &&
                _studentId > 0 &&
                studentExists[studentCount],
            "Sai ID"
        );
        studentExists[_studentId] = false;
        delete students[_studentId];
    }
}
