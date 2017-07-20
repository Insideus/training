Feature: Solve the challenge Repeating History
  From www.wechall.net
  With my username SYLAR

  Scenario: Try Failed
    Given a URL
    When I see the source in GWF3 codebase (GitHub)
      And I see the challenge URL to find the ubication in repo
      And I enter in <<repeating>> folder
      And I open a file named <<what_do_you_want_here.php>>
    Then  I see <<the solution to part one is>>
        And I see <<InDaxIn>>
        But I don't solve the challenge

    Scenario: Try Failed
    Given a REPO
    When I see the source in GWF3 codebase (GitHub)
      And I see the challenge URL to find the ubication in repo
      And I enter in <<history>> folder
      And I open a file named <<install.php>>
    Then  I see a variable named solution
        And I see the value 2bda2998d9b0ee197da142a0447f6725
        And I decrypted his value was <<wrong>>
        But I don't solve the challenge

    Scenario: Try Failed
    Given a REPO
    When I see the download in GWF3 codebase (GitHub)
      And I use grep command to find word solution
      And I search in repeating folder
    Then  I see the result
        But I don't solve the challenge

    Scenario: Try Failed
    Given a REPO
    When I see the source in GWF3 codebase (GitHub)
      And I see the challenge URL to find the ubication in repo
      And I enter in <<repeating>> folder
      And I see the folder's history
    Then  I search solution
        And I see the changes
        And I see the install.php was changed
        And I see NothingHereMoveAlong asigned to solution variable
        But I solve the challenge

    Scenario: Try Failed
    Given a REPO
    When I see the source in GWF3 codebase (GitHub)
      And I see the challenge URL to find the ubication in repo
      And I enter in <<repeating>> folder
      And I see the folder's history
      And I failed in 4 scenarios before
    Then  I mixed <<InDaxIn> and <<NothingHereMoveAlong>>
    Then I solve the challenge
