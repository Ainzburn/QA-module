*** Variables ***
${demo}                             //div[@id="demo"]
${dropdown}                         //div[@id="dropdown-display"]
${account_settings}                 //a[@class="trading-hub-header__setting"]
${closing_account_page}             //a[@id="dc_close-your-account_link"]

${security_policy_link}             //a[@href="https://deriv.com/tnc/security-and-privacy.pdf"]
${cancel_button_1st_page}           //button[@class="dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel"]
${close_my_acc_button}              //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]

${back_button_2nd_page}             //button[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large"]
${continue_button_2nd_page}         //span[text()="Continue"]//parent::button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
${cb_financial}                     //input[@name="financial-priorities"]//following-sibling::span[@class="dc-checkbox__box"]
${cb_stop}                          //input[@name="stop-trading"]//following-sibling::span[@class="dc-checkbox__box"]
${cb_not_int}                       //input[@name="not-interested"]//following-sibling::span[@class="dc-checkbox__box"]
${cb_another}                       //input[@name="another-website"]//following-sibling::span[@class="dc-checkbox__box"]
${cb_not_user}                      //input[@name="not-user-friendly"]//following-sibling::span[@class="dc-checkbox__box"]
${cb_difficult}                     //input[@name="difficult-transactions"]//following-sibling::span[@class="dc-checkbox__box"]
${cb_lack}                          //input[@name="lack-of-features"]//following-sibling::span[@class="dc-checkbox__box"]
${cb_unsatisfactory}                //input[@name="unsatisfactory-service"]//following-sibling::span[@class="dc-checkbox__box"]
${cb_other}                         //input[@name="other-reasons"]//following-sibling::span[@class="dc-checkbox__box"]

${cb_financial_active}              //input[@name="financial-priorities"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${cb_stop_active}                   //input[@name="stop-trading"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${cb_not_int_active}                //input[@name="not-interested"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${cb_another_active}                //input[@name="another-website"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${cb_not_user_active}               //input[@name="not-user-friendly"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${cb_difficult_active}              //input[@name="difficult-transactions"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${cb_lack_active}                   //input[@name="lack-of-features"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${cb_unsatisfactory_active}         //input[@name="unsatisfactory-service"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${cb_other_active}                  //input[@name="other-reasons"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]

${cb_financial_disabled}            //input[@name="financial-priorities"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--disabled"]
${cb_stop_disabled}                 //input[@name="stop-trading"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--disabled"]
${cb_not_int_disabled}              //input[@name="not-interested"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--disabled"]
${cb_another_disabled}              //input[@name="another-website"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--disabled"]
${cb_not_user_disabled}             //input[@name="not-user-friendly"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--disabled"]
${cb_difficult_disabled}            //input[@name="difficult-transactions"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--disabled"]
${cb_lack_disabled}                 //input[@name="lack-of-features"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--disabled"]
${cb_unsatisfactory_disabled}       //input[@name="unsatisfactory-service"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--disabled"]
${cb_other_disabled}                //input[@name="other-reasons"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--disabled"]

${text_field_1}                     //textarea[@name="other_trading_platforms"]
${text_field_2}                     //textarea[@name="do_to_improve"]
${characters_count}                 //p[@class="dc-text closing-account-reasons__hint"]

${pop_up}                           //div[@class="account-closure-warning-modal"]
${pop_up_back}                      //span[text()="Go Back"]//parent::button[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large"]
${pop_up_close_account}             //span[text()="Close account"]//parent::button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
