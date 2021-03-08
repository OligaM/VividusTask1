Description: Adding the movie to the WatchList;

Scenario: <Open Sign up page>
Given I am on a page with the URL 'https://www.imdb.com'
When I click on an element by the xpath '//*[text()="Sign In"]' 
When I click on a link with the text 'Create a New Account'
When I enter `#{generate(Name.firstName)}` in field located `By.xpath(//*[@id="ap_customer_name"])`
When I enter `#{generate(Internet.safeEmailAddress)}` in field located `By.xpath(//*[@id="ap_email"])`
When I enter '${userPass}' in a field by the xpath '//*[@id="ap_password"]'
When I enter '${userPass}' in a field by the xpath '//*[@id="ap_password_check"]'
When I click on an element by the xpath '//*[@id="continue"]'
Then the text 'Please solve this puzzle so we know you're a real person' exists

Scenario:  < Sign In>
Given I am on a page with the URL 'https://www.imdb.com'
When I click on an element by the xpath '//*[text()="Sign In"]' 
When I click on an element by the xpath '//*[text()="Sign in with IMDb"]'
When I wait until an element with the xpath '//*[@id="authportal-main-section"]' appears
When I enter '${userEmail}' in a field by the xpath '//*[@id="ap_email"]'
When I enter '${userPass}' in a field by the xpath '//*[@id="ap_password"]'
When I click on an element by the xpath '//*[@id="signInSubmit"]'
Then the page has the relative URL '/?ref_=login'

Scenario: <Perform search for movie by search box>
Given I am on a page with the URL 'https://www.imdb.com/?ref_=nv_home'
When I enter 'Safe' in a field by the xpath '//*[@id="suggestion-search"]'
When I click on an element by the xpath '//*[@id="suggestion-search-button"]'
Then the page with the URL 'https://www.imdb.com/find?q=Safe&ref_=nv_sr_sm' is loaded
Then at least one element by the xpath '//*[@class="result_text"]' exists

Scenario: <Open movie page>
Given I am on a page with the URL 'https://www.imdb.com/find?q=Safe&ref_=nv_sr_sm'
When I click on a link with the text 'Safe' and URL '/title/tt7902072/?ref_=fn_al_tt_1' 
Then the page with the URL 'https://www.imdb.com/title/tt7902072/?ref_=fn_al_tt_1' is loaded

Scenario: <Add movie to Watchlist>
Given I am on a page with the URL 'https://www.imdb.com/title/tt7902072/?ref_=fn_al_tt_1'
When I wait until an element with the xpath '//*[@class="ribbonize"]//div[@class="wl-ribbon standalone not-inWL"]' appears
When I click on an element by the xpath '//*[@class="ribbonize"]//div[@class="wl-ribbon standalone not-inWL"]'
Then an element by the xpath '//*[@class="ribbonize"]//div[@class="wl-ribbon standalone inWL"]' exists

Scenario: <Navigate to Your Watchlist>
Given I am on a page with the URL 'https://www.imdb.com/title/tt7902072/?ref_=fn_al_tt_1'
When I click on an element by the xpath '//*[text()="Watchlist"]'
Then the page with the URL containing 'https://www.imdb.com/user/ur129798859/' is loaded

Scenario: <Sort list from Your Watchlist and export it>
Given I am on a page with the URL 'https://www.imdb.com/user/ur129798859/watchlist?ref_=nv_usr_wl_all_0'
When I click on an element by the xpath '//*[@id="lister-sort-by-options"]'
When I select 'Alphabetical' from a drop down by the xpath '//*[@id="lister-sort-by-options"]'
When I click on a link with the text 'Export this list'
Then elements located `By.xpath(//h3[@class="lister-item-header"])` are sorted by text in ASCENDING order

Scenario: <Delete selected movie>
Given I am on a page with the URL 'https://www.imdb.com/user/ur129798859/watchlist?ref_=nv_usr_wl_all_0'
When I click on a link with the text 'Safe'
When I click on an element by the xpath '//*[@class="ribbonize"]//div[@class="wl-ribbon standalone inWL"]'
Then an element by the xpath '//*[@class="ribbonize"]//div[@class="wl-ribbon standalone not-inWL"]' exists



