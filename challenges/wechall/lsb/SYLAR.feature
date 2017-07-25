Feature: Solve the challenge Training: LSB
  From www.wechall.net
  With my username SYLAR

  Scenario: Succesful Solution
    Given a URL with an Image in format PNG
    When I download the image
      And I see a hidden link
      And I download steganabara 
      And I open the file
    Then  I use bit mask option
        And I mixed all options with <<amplify>> checked
        Then I see the word
			And I solve the challenge
