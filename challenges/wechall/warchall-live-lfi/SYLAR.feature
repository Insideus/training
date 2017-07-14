Feature: Solve the challenge Warchall: Live LFI
  From www.wechall.net
  With my username SYLAR

  Scenario: Try Failed
    Given a URL
    When I see the page I clicked on bottons to change the language
      And I see the same URL whith params
      And I try some injections to watch behavior
      And I see the next message <<failed to open stream>>
    Then  I sent solution.php as param for lang
        And I see a message tha say <<teh falg si naer!>>
        But I don't solve the challenge

    Scenario: Succesful Solution
    Given a URL
    When I see the page I clicked on bottons to change the language
      And I see the same URL whith params
      And I research about PHP protocol
      And I use php://filter/read=convert.base64-encode/resource
      And I inlcude solution.php for param resource
    Then  the page sent me out a message encoded
        And I decode the message on base64 online
        But I solve the challenge
