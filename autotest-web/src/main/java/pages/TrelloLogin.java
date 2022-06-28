package pages;

import com.codeborne.selenide.SelenideElement;
import ru.lanit.at.web.annotations.Name;
import ru.lanit.at.web.pagecontext.WebPage;

import static com.codeborne.selenide.Selenide.$x;

@Name(value = "TrelloLogin")
public class TrelloLogin extends WebPage {

    @Name("поле электронная почта")
    private SelenideElement emailField = $x("//input[@id='user']");

    @Name("поле пароль")
    private SelenideElement passwordField = $x("//input[@id='password']");

    @Name("кнопка войти")
    private SelenideElement loginButton = $x("//button[@id='login-submit']");

    @Name("кнопка войти с помощью Atlassian")
    private SelenideElement loginButtonWithAtlassian = $x("//input[@value='Войти с помощью Atlassian']");
}
