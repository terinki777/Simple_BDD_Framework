package pages;

import com.codeborne.selenide.SelenideElement;
import ru.lanit.at.web.annotations.Name;
import ru.lanit.at.web.pagecontext.WebPage;

import static com.codeborne.selenide.Selenide.$x;

@Name(value = "открытая доска")
public class TrelloOpenBoard extends WebPage {

    @Name("колонка Done")
    private SelenideElement columnDone = $x("//h2[contains(text(),'Done')]/parent::node()/..");

    @Name("зеленый цвет")
    private SelenideElement greenColor = $x("//div[@style='background-color: rgb(81, 152, 57);']");

    @Name("закрыть меню доски")
    private SelenideElement closeBoardMenu = $x("//a[@class='board-menu-header-close-button icon-lg " +
            "icon-close js-hide-sidebar']");


}
