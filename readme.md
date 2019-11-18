This is a Todo Board as specified in App Academy's Free Online Program, Software Engineering Foundations Course, Additional Projects section. Lists on the board are kept only in memory.

To start, run "ruby todo_board.rb" in a terminal.

Available commands are:
mklist <list_label>
    -make a new list with the given label
ls
    -print the labels of all lists
showall
    -print all lists
mktodo <list_label> <item_title> <item_deadline> <optional_item_description>
    -add a new item to the specified list with the given information
toggle <list_label> <item_index>
    -toggle "done" for the specified item on the given list
rm <list_label> <item_index>
    -remove the specified item on the given list
purge <list_label>
    -remove all "done" items on the given list
up <list_label> <item_index> <optional_amount>
    -move the specified item higher on the given list
down <list_label> <item_index> <optional_amount>
    -move the specified item higher on the given list
swap <list_label> <item_index_1> <item_index_2>
    -swap the positions of the specified items on the given list
sort <list_label>
    -sort the given list by deadline
priority <list_label>
    -print the all information for the item at the top of the given list
print <list_label> <optional_index>
    -print all items of the given list if index is not provided
    -print the specific item of the given list if index is provided
quit
    -quit todo_board