package pages;

import com.codeborne.selenide.SelenideElement;
import ru.lanit.at.web.annotations.Name;
import ru.lanit.at.web.pagecontext.WebPage;

import static com.codeborne.selenide.Selenide.$x;

@Name(value = "созданное рабочее пространство")
public class TrelloNewWorkspace extends WebPage {

    @Name("создать доску")
    private SelenideElement buttonCreateBoard = $x("//li[@data-test-id='create-board-tile']");

    @Name("заголовок доски")
    private SelenideElement newBoardName = $x("//input[@data-test-id='create-board-title-input']");

//    @Name("кнопка создать")
//    private SelenideElement buttonCreate = $x("//button[@data-test-id='create-board-submit-button']");

}
