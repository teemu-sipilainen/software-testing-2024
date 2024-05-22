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
https://www.saucedemo.com/inventory.html#

https://www.saucedemo.com/cart.html
https://www.saucedemo.com/cart.html#


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
    await page.getByTestId('username').fill(username);
    await page.getByTestId('password').fill(password);
    await page.getByTestId('login-button').click(); 
  });

  test.afterEach(async ({ page }) => {
    await page.getByRole('button', { name: 'Open Menu' }).click();
    await page.getByTestId('logout-sidebar-link').click();
  });

  /*

  TS 22.5.2024: Exercise 1
  
  Test product page pictures 
  
  At least these pictures must be okay: 
  - Backpack
  - Fleece Jacket
  - Onesie

  */

  test('Test product page pictures', async ({ page }) => {
    await page.getByRole('button', { name: 'Open Menu' }).click();
    await page.getByTestId('reset-sidebar-link').click(); 
    await page.getByTestId('inventory-sidebar-link').click(); 
    await page.getByRole('button', { name: 'Close Menu' }).click();
    
    /* 
    TS 22.5.2024: 
    Test fails if username and/or password fields are filled because 
    last time these fields were empty when the screenshot was taken. 
    */
    // await page.getByTestId('username').fill(username);
    // await page.getByTestId('password').fill(password);

    await expect(page).toHaveScreenshot({fullPage: true});

  });

  // TS 22.5.2024: Exercise 1

  test('Test front page visuality', async ({ page }) => {
    await page.goto('/');
    await expect(page).toHaveScreenshot();
    await page.getByTestId('username').fill(username);
    await page.getByTestId('password').fill(password);
    await page.getByTestId('login-button').click(); 
  });

  // TS 22.5.2024: Exercise 1. 

  test('Test Cart visuality when it is empty', async ({ page }) => {
    await page.getByRole('button', { name: 'Open Menu' }).click();
    await page.getByTestId('reset-sidebar-link').click(); 
    await page.getByTestId('inventory-sidebar-link').click(); 
    await page.getByRole('button', { name: 'Close Menu' }).click();
    await page.getByTestId('shopping-cart-link').click(); 

    await expect(page).toHaveScreenshot();
  });

  // TS 22.5.2024: Exercise 1. 
  
  test('Test Cart visuality when it contains items', async ({ page }) => {
    await page.getByRole('button', { name: 'Open Menu' }).click();
    await page.getByTestId('reset-sidebar-link').click(); 
    await page.getByTestId('inventory-sidebar-link').click(); 
    await page.getByRole('button', { name: 'Close Menu' }).click();

    await page.getByTestId('add-to-cart-sauce-labs-backpack').click();
    await page.getByTestId('add-to-cart-sauce-labs-fleece-jacket').click();
    await page.getByTestId('add-to-cart-sauce-labs-onesie').click();
    
    await page.getByTestId('shopping-cart-link').click(); 

    await expect(page.getByTestId('title')).toBeVisible();
    await expect(page.getByTestId('title')).toContainText('Your Cart');
    
    await expect(page).toHaveScreenshot();

  });

});