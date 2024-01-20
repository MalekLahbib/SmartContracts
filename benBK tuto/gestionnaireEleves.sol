// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract GestionnaireEleve {
    
    address owner;

    struct Grade {
        string subject;
        uint grade;
    }

    struct Student {
        string firstName;
        string lastName;
        uint nbrOfGrades;
        mapping(uint => Grade) grades;
    }

    mapping (address => Student) students;

    constructor() {
        owner = msg.sender;
    }

    function addStudent(address _studentAddress, string memory _firstName, string memory _lastName) public {
        require(msg.sender == owner, "Not the owner");
        bytes memory firstNameOfAddress = bytes(students[_studentAddress].firstName);
        require(firstNameOfAddress.length == 0, unicode"Existe déjà");
        students[_studentAddress].firstName = _firstName;
        students[_studentAddress].lastName = _lastName;
    }

    function addGrade(address _studentAddress, uint _grade, string memory _subject) public {
        require(msg.sender == owner, "Not the owner");
        bytes memory firstNameOfAddress = bytes(students[_studentAddress].firstName);
        require(firstNameOfAddress.length > 0, unicode"Elève inexistant. I l faut le rajouter.");
        students[_studentAddress].grades[students[_studentAddress].nbrOfGrades].grade = _grade;
        students[_studentAddress].grades[students[_studentAddress].nbrOfGrades].subject = _subject;
        students[_studentAddress].nbrOfGrades++;
    }

    function getGrades(address _studentAddress) public view returns(uint[] memory) {
        require(msg.sender == owner, "Not the owner");
        uint nbrGrades = students[_studentAddress].nbrOfGrades;
        uint[] memory grades = new uint[](nbrGrades);
        for (uint i = 0; i < nbrGrades ; i++) {
            grades[i] = students[_studentAddress].grades[i].grade;
        }
        return grades;
    }
}