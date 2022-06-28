package pages;

import com.codeborne.selenide.SelenideElement;
import ru.lanit.at.web.annotations.Name;
import ru.lanit.at.web.pagecontext.WebPage;

import static com.codeborne.selenide.Selenide.$x;

@Name(value = "ВАШИ РАБОЧИЕ ПРОСТРАНСТВА")
public class TrelloBoards extends WebPage {

    @Name("доска KanbanTool")
    private SelenideElement boardName = $x("//div[@title='KanbanTool']");

    @Name("доска")
    private SelenideElement board = $x("//div[@class='board-tile-details is-badged']");

}
