# This will be a terminal based interactive program to browse the database through Python.

def main():
    print('Hello World')

    runProgram = True
    while runProgram == True:

        print('MAIN MENU')
        print('What would you like to do?')
        print('Q. Quit')

        response = input();
        if response == 'q' or response == 'Q':
            print('Tank you for using the database browser.')
            runProgram = False
        else:
            print('I don\'t know that command')

main()
