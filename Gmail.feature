Feature: Test the Compose functionality in Gmail

 Background:
    Given User has opened a web browser
    And Navigates to the Gmail login page
    When The user logged into their Gmail account

 Scenario: Successfully compose and send an email
 
    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte" 
    When The user clicks the "Send" button
    Then The email should be sent successfully
    And  Verify "Sent" folder if the email was sent successfully
    And Verify that email address in "To" field received the email

    
Scenario: Verify the Compose Function in Gmail with Multiple Email Addresses

    When  User clicks on the "Compose" button
    And The user enters a multiple email address in the "To" field as "validemail01@gmail.com","validemail01@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enterin the " Email Body" field as "QA test for Incubyte" 
    When User clicks the "Send" button
    Then The email should be sent successfully
    And  Verify "Sent" folder if the the email was sent successfully  
    And Verify that all email addresses in "To" field should received the email
    
 
Scenario: Validate the Compose Functionality with Various Email Addresses

    When User clicks on the "Compose" button
    And The user enters a multiple email address in the "To", "CC","BCC" field as "validemail01@gmail.com","validemail02@gmail.com","validemail03@gmail.com"
    And User enter in the "Subjecent successfully  t" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte" 
    When User clicks the "Send" button
    Then The email should be sent successfully  
    And Review the "Sent" folder to ensure the email was sent successfully  
    And Confirm that all email addresses in the "To","CC","BCC" field have received the email  
    
    
Scenario: Verify to send an email with an invalid email address in the recipient field

     
    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "invalidemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte" 
    When The user clicks the "Send" button
    Then The email should not be sent successfully
    And Verify "Sent" folder if the email was sent successfully
    And Verify that email address in "To" field received the email
    
    
Scenario: Verify to send an email without entering a recipient email address

    When User clicks on the "Compose" button
    And User Leave the "To" field as empty
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Body" field as "QA test for Incubyte" 
    And The user clicks the "Send" button
    When User attempt to send the email
    Then User should see an error message "Recipient email address is required"
    And the email should not be sent


Scenario: Verify to send an email with attachment

    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte"
    And Attach a file to the email
    When The user clicks the "Send" button
    Then The email should be sent successfully
    And  Verify "Sent" folder if the the email was sent successfully 
    And Verify that email address in "To" field received the email
     
    
Scenario: Verify to send an email without a subject and body

    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User leave the "Subject" field as empty
    And User leave the "Body" field as empty
    When User clicks "Send" button
    Then User should see a warning message saying "The subject and body are empty. Do you want to send the email anyway?"
    When User confirm to send the email
    Then Thd email should be sent successfully
    And  Recipient should receive an email with an empty subject and body
    
    
Scenario: Verify to attach a file larger than the allowed size limit

    Given The allowed file size limit is 5 MB
    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte"
    And User is on the file upload page
    When The user tries to attach a file larger than 5 MB
    Then an error message should be displayed saying "File size exceeds the allowed limit"
    And The file should not be attached
    
Scenario: Verify to send an email with multiple invalid email address 
    
    When User clicks on the "Compose" button
    And The user enters a invalid email address in the "To" field as "invalidemail01@gmail.com","invalidemail01@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte" 
    When User attempt to send the email to these addresses
    Then The email should not be sent successfully
    And Verify "Sent" folder if the email was sent successfully


Scenario: Verify that users can successfully sent an email with image 
    
    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte" 
    And User attaches an image file from a computer
    When User clicks "Send" button
    Then The email should be sent successfully
    And Recipient should receive the email with the attached image 
    
  
Scenario: Verify the compose function with Valid Subject and Empty Body

    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User leave the "Body" field as empty
    When The user clicks the "Send" button
    Then The email should be sent successfully
    And  Verify "Sent" folder if the email was sent successfully
    And Verify that email address in "To" field received the email
    
Scenario: Verify the compose function with Empty Subject and Valid Body

    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User leave the "Subject" field as empty
    And User leave the "Body" field as "QA test for Incubyte" 
    When The user clicks the "Send" button
    Then Email should be sent successfully but warning message should be displayed indicating that subject are empty
    And  Verify "Sent" folder if the email was sent successfully
    And Verify that email address in "To" field received the email

Scenario: Verify the compose function with Long Subject

    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "LongSubject"
    And User leave the "Body" field as "QA test for Incubyte"
    When The user clicks the "Send" button
    Then The email should not be sent successfully
    
Scenario: Verify the compose function with Special Characters in Subject

    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte@#$"
    And User enter in the "Email Body" field as "QA test for Incubyte" 
    When The user clicks the "Send" button 
    Then The email should be sent successfully
    And  Verify "Sent" folder if the email was sent successfully
    And Verify that email address in "To" field received the email    
    
 
Scenario: Verify the compose function with Special Characters in Body

    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte%^&"
    When The user clicks the "Send" button 
    Then The email should be sent successfully
    And  Verify "Sent" folder if the email was sent successfully
    And Verify that email address in "To" field received the email 
    
    
Scenario: Verify the compose function with Large Body Content

    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "Large Body Content"
    When The user clicks the "Send" button 
    Then The email should be sent Successfully to the recipient with warning message
    And  Verify "Sent" folder if the email was sent successfully
    And Verify that email address in "To" field received the email 
    
    
Scenario: Verify the compose function with No Internet Connection

    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte"
    When The user clicks the "Send" button 
    Then The email should be sent,an error message should be displayed with no internet connection
    
Scenario: Verify the save email as Draft

    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte"
    When The user clicks the "Close" button
    Then The email should be saved as draft
    
Scenario: Verify the Discard Draft email

    When User Click on the "Draft" button located on the left-hand side of the Gmail Interface
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as "QA test for Incubyte"
    When The user clicks the "Send" button 
    Then The email should be sent Successfully
    And  Verify "Sent" folder if the email was sent successfully
    And Verify that email address in "To" field received the email 

    
Scenario: Verify the compose funtion use "CC" Field with Multiple Recipients

    When  User clicks on the "Compose" button
    And The user enters a email address in the "To" field as "validemail@gmail.com"
    And User enters a multiple email addresses in the "CC" field as "validemail01@gmail.com","validemail02@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enterin the " Email Body" field as "QA test for Incubyte" 
    When User clicks the "Send" button
    Then The email should be sent successfully
    And  Verify "Sent" folder if the the email was sent successfully  
    And Verify that all email addresses in "To" field should received the email
    
 
Scenario: Verify the compose funtion use "BCC" Field with Multiple Recipients
    
    When  User clicks on the "Compose" button
    And The user enters a email address in the "To" field as "validemail@gmail.com"
    And User enters a multiple email addresses in the "BCC" field as "validemail01@gmail.com","validemail02@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enterin the " Email Body" field as "QA test for Incubyte" 
    When User clicks the "Send" button
    Then The email should be sent successfully
    And  Verify "Sent" folder if the the email was sent successfully  
    And Verify that all email addresses in "To" field should received the email
    
    
Scenario: Verify the compose function with Emoji in Subject and Body
    
    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte" with Emoji
    And User enter in the "Email Body" field as "QA test for Incubyte" with Emoji 
    When The user clicks the "Send" button
    Then The email should be sent successfully without any errors
    And  Verify "Sent" folder if the email was sent successfully
    And Verify that email address in "To" field received the email
    
  
Scenario: Verify the compose function with HTML Content
   
    When User clicks on the "Compose" button
    And The user enters a valid email address in the "To" field as "validemail@gmail.com"
    And User enter in the "Subject" field as "Incubyte"
    And User enter in the "Email Body" field as"<h1>QA test for Incubyte</h1>"
    When The user clicks the "Send" button
    Then The email should be sent successfully
    And  Verify "Sent" folder if the email was sent successfully
    And Verify that email address in "To" field received the email
    
    
    
    

       
    
    
      
    
       
     
    
    
    
    
    
    













    