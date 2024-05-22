import { test, expect } from '@playwright/test';

/*******************

PLAYWRIGHT EXERCISES

Teemu Sipiläinen
AF9274

22.5.2024

********************

EXERCISES

1. Perform visual checks on the Saucedemo Swag Labs store using the standard_user account.

- Create checks on the product pages for at least the product image, specifically for the Backpack, Fleece Jacket, and Onesie products.
- Create a check for the homepage layout.
- Check the appearance of the shopping cart both when empty and with a few products added.
- You can extend your previously created tests (recorded or self-written) with visual checks for either the entire page or individual elements.

2. Run the tests using other users (visual_user, problem_user). 

How do the visual checks differ from those with the standard_user account?

********************

Useful links: 

https://www.saucedemo.com/inventory.html

https://www.saucedemo.com/cart.html

********************

Useful commands: 

npx playwright show-report

********************

*/

const username=process.env.SD_USERNAME;
const password=process.env.SD_PASSWORD;

test.describe('Testing Saucedemo / Swag Labs', () => {

  
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test.afterEach(async ({ page }) => {
    await page.getByRole('button', { name: 'Open Menu' }).click();
    await page.getByTestId('logout-sidebar-link').click();
  });
  

   test('Test login with correct username and correct password', async ({ page }) => {

    await page.getByTestId('username').fill(username);
    await page.getByTestId('password').fill(password);
    await page.getByTestId('login-button').click(); 

    await expect(page.getByTestId('title')).toContainText('Products');

  });

});