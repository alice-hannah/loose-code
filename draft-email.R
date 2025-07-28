library(RDCOMClient)

OutApp <- COMCreate("Outlook.Application")
outMail <- OutApp$CreateItem(0)

# Set recipients:
outMail[["To"]] <- "john.doe@notexist.com; jane.smith@notexist.com"
outMail[["CC"]] <- "manager@notexist.com"
outMail[["BCC"]] <- "hidden@notexist.com"

# Set subject and body
outMail[["Subject"]] <- "Quarterly Report Attached"
outMail[["body"]] <- "Dear team,\n\nPlease find the report attached.\nRegards,\nYour Name"

# Add attachments - THESE FILES MUST ALREADY EXIST OR WILL GET AN ERROR
outMail[["Attachments"]]$Add("test.xlsx")
outMail[["Attachments"]]$Add("test.docx")

# Open the email draft in Outlook
outMail$Display()

# alternatively send it (NOTE: If Display() first then Send() it does not work)
outMail$Send()
