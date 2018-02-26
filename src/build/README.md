
## Empty exercises


This script provides the functionality to clean all chunks with a given identifier and save the output as a new file. The aimed workflow is as follows:

1. Make the complete Rmarkdown file with all exercises solved inside the chunks and mark all chunks containing solutions code with the identifier `exercise = TRUE`. For example:

<pre>
\`\`\`{r weight_in_kg, exercise = TRUE}
 data %>% mutate(weight = weight / 1000)
\`\`\`
</pre>

We advice you to provide a file name that informs about the solutions, e.g. `dplyr-solutions.Rmd`

2. As the function is not part of any package, the easiest way to use the functionality is to `source` the functio `empty_exercises.R`:

```R
source("./src/build/empty_exercises.R")
```

3. Apply the function `empty_exercises` on all files with the exercise chunks to render the cleaned version:

```R
empty_exercises("./src/dplyr-solutions.Rmd", "./src/dplyr.Rmd")
```
which will convert the file `dplyr-solutions.Rmd` to `dplyr.Rmd` while removing the exercise solution chunks.