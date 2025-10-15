// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract week0{

  //using struct to organise bigger information
  struct Student{
   string  name;
   uint256 score;
   string RegNo;
  }

  //map student record using only registration number(i.e using string vlue and student as key)
  mapping (string => Student)public Students;
  //to make sure no student is added twice
  mapping (string => bool) public isregNoExist;


//this function will attract gas fee,coz its writing to blockchain(saving)
function AddMyinfo(string memory _name,uint256 _score,string memory _regNo)public {

  //to make sure no two student with thesame reg num
  require(!isregNoExist[_regNo],"student already exist");

   //adding student info automatically to blockchain
  Students[_regNo] = Student(_name,_score,_regNo);
  isregNoExist[_regNo] = true;
}
//this function only view whats written on blockchain hence its not attracting any fees 
 function retrieveStudentInfo(string memory _regNo) public view returns (string memory, uint256, string memory) {
        
        //to make sure user are retrieving existing student
        require(isregNoExist[_regNo],"student not found check the info");

        //to retrieve student info from blockchain
        Student memory stu = Students[_regNo];
        return (stu.name, stu.score, stu.RegNo);
    }

   

}