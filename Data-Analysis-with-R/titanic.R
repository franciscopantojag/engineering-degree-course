titanic <- read.csv("data/titanic.csv")

table(titanic$survived)
prop.table(table(titanic$survived))

table(titanic$sex, titanic$survived)
prop.table(table(titanic$sex, titanic$survived), 2)

## pasar variables char a factor
titanic$sex <- factor(titanic$sex)
titanic$survived <- factor(titanic$survived)

plot(titanic$sex, titanic$survived)

tab <- table(titanic$survived, titanic$sex)
chisq.test(tab)