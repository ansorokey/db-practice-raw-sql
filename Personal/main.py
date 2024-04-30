# This will be a terminal based interactive program to browse the database through Python.
def displayMenu(menu):
    print('Displaying ' + menu + ' menu.')
    print('Please select an option below: \n')

    print('r: return to last menu')
    print('q: quit program')

def awaitResponse():
    global runProgram, currentMenu, lastMenu
    response = str(input())

    if response == '1':
        lastMenu = currentMenu
        currentMenu = response
    elif response.lower() == 'q':
        print('Exiting program')
        runProgram = False
    elif response.lower() == 'r':
        print('Returning to last menu.')
        currentMenu = lastMenu
    else:
        print('Input not recognized')
    
    return


def main():
    global runProgram, currentMenu, lastMenu
    # I should make the last menu a stack, and pop to go back

    runProgram = True
    currentMenu = 'main'
    lastMenu = 'last'

    while runProgram == True:

        displayMenu(currentMenu)
        awaitResponse()

main()
