# Data Manipulation with Python Question 1
log_file = open("um-server-01.txt")
# opening the data file and assigning it to log_file for future reference

def sales_reports(log_file):
    # creating a function named sales_report that looks over the log_file data
    for line in log_file:
        # starts a loop over the log_file data
        line = line.rstrip()
        # separates the data lines for better manipulation
        day = line[0:3]
        # provides a value for day
        if day == "Tue":
            # only grab the data if the day equals Tue
            print(line)
            # display the data discovered through the function


sales_reports(log_file)
# invoke the funtion 

# Data Manipulation with Python Question 2
log_file = open("um-server-01.txt")

def sales_reports(log_file):
    for line in log_file:
        line = line.rstrip()
        day = line[0:3]
        if day == "Mon":
            print(line)


sales_reports(log_file)


# EXTRA CREDIT