# This will be a terminal based interactive program to browse the database through Python.
def displayMenu(menu):
    print('Displaying ' + menu + ' menu.')
    print('Please select an option below: \n')

    print('r: return to last menu')
    print('q: quit program')

def awaitResponse():
    response = input()

    if response.lower() == 'q':
        print('Exiting program')
        global runProgram
        runProgram = False
        return
    elif response.lower() == 'r':
        print('Returning to last menu.')
        global currentMenu, lastMenu
        currentMenu = lastMenu
        return
    else:
        print('Input not recognized')


def main():
    global runProgram, currentMenu, lastMenu
    runProgram = True
    currentMenu = 'main'
    lastMenu = 'last'
    while runProgram == True:

        displayMenu(currentMenu)
        awaitResponse()

main()
