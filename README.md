# cart_app
Creating Mobile Shopping Cart app through Flutter. Selecting Products and removing products from cart.


## How to make Contributions in this repo ?

Contributions are always welcome!

1. **Fork the Repository:**
   Navigate to the repository you want to contribute to. Click the "Fork" button at the top right corner of the repository page. This creates a copy of the repository in your own GitHub account.

2. **Clone the Forked Repository:**
   After forking, go to your GitHub account and open the forked repository. Click the "Code" button and copy the repository's URL. Then, open a terminal on your computer and use the `git clone` command to download the repository to your local machine.
   ```
   git clone <repository_url>
   ```

3. **Create a New Branch:**
   It's a good practice to create a new branch for each contribution. This keeps your changes separate from the main codebase. Use the following command to create a new branch:
   ```
   git checkout -b new-branch-name
   ```

4. **Make and Commit Changes:**
   Make the necessary changes to the code, documentation, or any other files in your local repository. Once you're satisfied with your changes, use the following commands to commit them:
   ```
   git add .
   git commit -m "Your commit message here"
   ```

5. **Push Changes to Your Fork:**
   Push your local changes to the forked repository on your GitHub account:
   ```
   git push origin new-branch-name
   ```

6. **Create a Pull Request (PR):**
   Go to the original repository that you forked from. You'll likely see a notification suggesting you create a pull request. Click on the "Compare & pull request" button. Write a descriptive title and explanation of your changes in the pull request description.

7. **Review and Discussion:**
   The maintainers of the repository will review your changes. Be prepared for feedback or discussions about your contribution. Make any necessary updates or address concerns in your branch.

8. **Merge the Pull Request:**
   Once your changes have been approved and any issues have been addressed, the repository maintainers will merge your pull request into the main codebase. Congratulations, your contribution is now part of the project!

9. **Syncing Fork with Original Repository (Optional):**
    Over time, the original repository might have new changes that you might want to incorporate into your fork. You can sync your fork with the original repository using the following steps:
    ```
    git remote add upstream <original_repository_url>
    git fetch upstream
    git checkout main  # or your main branch name
    git merge upstream/main
    git push origin main
    ```

