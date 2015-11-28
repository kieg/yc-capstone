## Imputing  KNN


#Homicides

data.NA[, "Region"] <- as.numeric(data.full[,"Region"])


homicides.k.impute <- kNN(as.data.frame(data.NA[, c("homicides", "Region")]), 
                          "homicides")
homicides.k.impute <- as.numeric(as.character(homicides.k.impute$homicides))



# CTax Rate

c.tax.rate.k.impute <- kNN(as.data.frame(data.NA[, c("c.tax.rate", "Region")]), 
                           "c.tax.rate")
c.tax.rate.k.impute <- as.numeric(as.character(c.tax.rate.k.impute$c.tax.rate))  

# student.debt
student.debt.k.impute <- kNN(as.data.frame(data.NA[, c("student.debt", "Region")]), 
                             "student.debt")

student.debt.k.impute <- as.numeric(as.character(student.debt.k.impute$student.debt))  


# MI
# ----------------------

usePackage("mi")

homicides.k.impute <- missing_data.frame(data.NA[, c("road.death", "food.safety", "homicides","Region")])

homicides.k.impute <- mi(homicides.k.impute)

homicides.k.impute <- complete(homicides.k.impute)$`chain:4`[, "homicides"]

# c,tax
c.tax.rate.k.impute <- missing_data.frame(data.NA[, c("c.tax.rate","Region")])

c.tax.rate.k.impute <- mi(c.tax.rate.k.impute)

c.tax.rate.k.impute <- complete(c.tax.rate.k.impute)$`chain:4`[, "c.tax.rate"]

# Student Debt
student.debt.k.impute <- missing_data.frame(data.NA[, c("student.debt","Region")])

student.debt.k.impute <- mi(student.debt.k.impute)

student.debt.k.impute <- complete(student.debt.k.impute)$`chain:4`[, "student.debt"]



summary(data.NA)

length(which(is.na(data.full[, "homicides"])))
length(which(is.na(data.NA[, "homicides"])))




####### MEAN IMPUTE

### HOMICIDES
homicides.m.impute <- vector()

for (r in 1:length(data.NA[, "homicides"])) {
  
  if (is.na(data.NA[r,"homicides"])) {     # if it is NA, continue
    
    homicides.m.impute[r] <- mean(data.full[data.full$Region == data.full[r, "Region"], "homicides"], na.rm = TRUE)
    
  } else {  #if not NA, keep the same as original dataset
    homicides.m.impute[r] <- data.full[r, "homicides"]
    
    
  }
}

homicides.m.impute




### Consumer Tax Rate

c.tax.rate.m.impute <- vector()

for (r in 1:length(data.NA[, "c.tax.rate"])) {
  
  if (is.na(data.NA[r,"c.tax.rate"])) {     # if it is NA, continue
    
    c.tax.rate.m.impute[r] <- mean(data.full[data.full$Region == data.full[r, "Region"], "c.tax.rate"], na.rm = TRUE)
    
  } else {  #if not NA, keep the same as original dataset
    c.tax.rate.m.impute[r] <- data.full[r, "c.tax.rate"]
    
    
  }
}

c.tax.rate.m.impute

## student.debt
student.debt.m.impute <- vector()

for (r in 1:length(data.NA[, "student.debt"])) {
  
  if (is.na(data.NA[r,"student.debt"])) {     # if it is NA, continue
    
    student.debt.m.impute[r] <- mean(data.full[data.full$Region == data.full[r, "Region"], "student.debt"], na.rm = TRUE)
    
  } else {  #if not NA, keep the same as original dataset
    student.debt.m.impute[r] <- data.full[r, "student.debt"]
    
    
  }
}

student.debt.m.impute

