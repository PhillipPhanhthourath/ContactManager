// Appropriate Strutures

struct Contact {
    let name: String
    let phoneNumber: String
}

// Global contacts array accessed by all functions
var contacts: [Contact] = []

// Should add contact to the contacts datastructure
func addContact(name: String, phoneNumber: String) {
    let newContact = Contact(name: name, phoneNumber: phoneNumber)
    contacts.append(newContact)
    print("Contact added: \(name)")
}

// listContacts function that lists the contacts that the user has in their contact book
func listContacts() {
    if contacts.isEmpty {
        print("No Contacts!")
    } else {
        for (index, contact) in contacts.enumerated() {
            print("\(index + 1). \(contact.name)")
        }
    }
}

// searchContacts should allow for searching of user's contacts
func searchContacts(byName name: String) {
    let filteredContacts = contacts.filter{$0.name.lowercased().contains(name.lowercased())}
    if filteredContacts.isEmpty {
        print("No Contacts Found!")
    } else {
        for contact in filteredContacts {
            print("Name: \(contact.name), Phone: \(contact.phoneNumber)")
        }
    }
}


// deleteContacts should allow the user to remove contacts from their book.
func deleteContacts(byName name: String) {
    if let index = contacts.firstIndex(where: {$0.name.lowercased() == name.lowercased()}){
        contacts.remove(at: index)
        print("Contact \(name) deleted.")
    } else {
        print("No contact found by that name.")
    }
}

// USER INTERFACE

func showMenu() {
    print("""
    Contact Manager
    1. Add Contact
    2. View Contacts
    3. Search Contact
    4. Delete Contact
    5. Exit
    """)
}

func getUserInput() -> String? {
    return readLine()
}

func main() {
    var shouldContinue = true
    while shouldContinue {
        showMenu()
        if let choice = getUserInput() {
            switch choice {
            case "1":
                print("Enter name:")
                if let name = getUserInput(), !name.isEmpty {
                    print("Enter phone number:")
                    if let phoneNumber = getUserInput(), !phoneNumber.isEmpty {
                        addContact(name: name, phoneNumber: phoneNumber)
                    } else {
                        print("Invalid phone number")
                    }
                } else {
                    print("Invalid name")
                }
            case "2":
                listContacts()
            case "3":
                print("Enter name to search:")
                if let name = getUserInput(), !name.isEmpty{
                    searchContacts(byName: name)
                } else {
                    print("Invalid name")
                }
            case "4":
                print("Enter name to delete from contacts:")
                if let name = getUserInput(), !name.isEmpty {
                    deleteContacts(byName: name)
                } else {
                    print("Invalid name.")
                }
            case "5":
                shouldContinue = false
                print("Exiting...")
            default:
                print("Please enter a valid choice from 1-5")
            }
        }
    }
}

main()
