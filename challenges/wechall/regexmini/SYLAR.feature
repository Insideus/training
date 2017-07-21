Feature: Solve the challenge RegexMini
  From www.wechall.net
  With my username SYLAR

  Scenario: Try Failed
    Given source code
        And a form to send one answer
    When I read source code
      And I see conditionals
      And 
    Then  I send eeeeeeeeeeeeee%e
        But I don't solve the challenge

    Scenario: Try Failed
    Given source code
        And a form to send one answer
    When I read source code
      And I see conditionals
	  And I send aaaaaa
      And I use tempering with charlesproxy
    Then  I change username value to rewerwerwerwerra%0A
    Then I solve the challenge
