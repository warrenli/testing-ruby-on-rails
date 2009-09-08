功能: 用戶可以發出電子郵件給朋友
  為了聯絡好友
  作為一名訪客
  我要發出電子郵件給朋友

  Scenario: Send email to friend after entering valid information
    Given I am on start_page
    When I fill in "Sender name" with "陳大文"
    And I fill in "Sender email" with "taiming@example.com"
    And I fill in "Recipient name" with "李小強"
    And I fill in "Recipient email" with "peter@example.com"
    And I fill in "Subject" with "你好嗎"
    And I fill in "Message" with "好久不見，你近況如何?"
    And I press "Send email"
    Then I should see "Email sent"

  Scenario: Send email to friend after entering valid information
    Given I am on start_page
    When I fill in "Sender name" with "陳大文"
    And I fill in "Sender email" with "taiming@example.com"
    And I fill in "Recipient name" with "李小強"
    And I fill in "Recipient email" with "peter@example.com"
    And I fill in "Subject" with "你好嗎"
    And I fill in "Message" with "好久不見，你近況如何?"
    And I press "Send email"
    Then I should see "Email sent"

  Scenario Outline: Send email if information valid
    Given I am on start_page
    When I fill in "Sender name" with "<senderName>"
    And I fill in "Sender email" with "<senderEmail>"
    And I fill in "Recipient name" with "<recipientName>"
    And I fill in "Recipient email" with "<recipientEmail>"
    And I fill in "Subject" with "<subject>"
    And I fill in "Message" with "<body>"
    And I press "Send email"
    Then I should see "<text>"

  Examples:
    | senderName | senderEmail | recipientName | recipientEmail | subject | body | text |
    | 陳大文  | taiming@example.com | 李小強 | peter@example.com | 你好嗎 | 你近況如何? | Email sent |
    |  | taiming@example.com | 李小強 | peter@example.com | 你好嗎 | 你近況如何? | Not able to send email |
    | 陳大文  | taiming@example | 李小強 | peter@example.com | 你好嗎 | 你近況如何? | Not able to send email |
    | 陳大文  | taiming@example.com |  | peter@example.com | 你好嗎 | 你近況如何? | Not able to send email |
    | 陳大文  | taiming@example.com | 李小強 | peter@example | 你好嗎 | 你近況如何? | Not able to send email |
    | 陳大文  | taiming@example.com | 李小強 | peter@example.com |  | 你近況如何? | Not able to send email |
    | 陳大文  | taiming@example.com | 李小強 | peter@example.com | 你好嗎 |  | Not able to send email |

