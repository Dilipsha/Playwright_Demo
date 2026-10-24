import {test, expect, Browser} from '@playwright/test';

test("Playwright locators", async({page})=>{
    await page.goto("https://www.irctc.co.in/nget/train-search")
    
    const API_link=page.getByText("LOGIN / REGISTER");
    await page.waitForTimeout(3000);

    await API_link.click();
    await page.waitForTimeout(3000);
})
