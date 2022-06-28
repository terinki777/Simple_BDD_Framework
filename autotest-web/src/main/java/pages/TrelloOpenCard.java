package pages;

import com.codeborne.selenide.SelenideElement;
import ru.lanit.at.web.annotations.Name;
import ru.lanit.at.web.pagecontext.WebPage;

import static com.codeborne.selenide.Selenide.$x;

@Name(value = "открытая карточка")
public class TrelloOpenCard extends WebPage {

    @Name("карточка для изучения API")
    private SelenideElement cardName = $x("//h2[@id='js-dialog-title']" +
            "[contains(text(),'Карточка для изучения API')]");

    @Name("checkitem Понять протокол HTTP")
    private SelenideElement checkItemOne = $x("//div[@class='checklist-item no-assignee no-due " +
            "checklist-item-state-complete']//span[contains(text(),'Понять протокол HTTP')]");

    @Name("checkitem Выучить методы запросов")
    private SelenideElement checkItemTwo = $x("//div[@class='checklist-item no-assignee no-due " +
            "checklist-item-state-complete']//span[contains(text(),'Выучить методы запросов')]");

    @Name("кнопка цвета")
    private SelenideElement cover = $x("//button[@class='aRrCrZDsIPXOIa kx4oqRlqCFjWrx']");

    @Name("чекбокс с сроком выполнения")
    private SelenideElement checkbox = $x("//a[@class='card-detail-badge-due-date-complete-box " +
            "js-card-detail-due-date-badge-complete js-details-toggle-due-date-complete']");

    @Name("закрыть карточку")
    private SelenideElement closeCard = $x("//a[@class='icon-md icon-close dialog-close-button " +
            "js-close-window dialog-close-button-dark']");
}
