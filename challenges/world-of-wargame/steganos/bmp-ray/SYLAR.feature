Feature: Solve the challenge BMP RAW
  From wow.sinfocol.org
  With my username SYLAR

  Scenario: Succesful Solution
    Given an image
    When I read html source
      And Download the image
    Then  Open up with notepad++
        And I find the solution
    Then I solve the challenge
