import re
import datetime

NETWORK_VISA = "Visa"
NETWORK_DISCOVER = "Discover"
NETWORK_MASTERCARD = "Mastercard"
NETWORK_AMERICAN_EXPRESS = "American Express"
NETWORK_OTHER = "Other"

NETWORK_PREFIXES = {
    NETWORK_VISA: ("4"),
    NETWORK_MASTERCARD: ("5"),
    NETWORK_AMERICAN_EXPRESS: ("3", "37"),
    NETWORK_DISCOVER: ("6011", "644", "65"),
}


def get_network(number: str) -> str:
    """Return network for user-provided cc number prefix."""
    for network, prefixes in NETWORK_PREFIXES.items():
        if number.startswith(prefixes):
            return network

    return NETWORK_OTHER


def ValidateLuhnChecksum(number_as_string):
    """ checks to make sure that the card passes a luhn mod-10 checksum """

    sum = 0
    num_digits = len(number_as_string)
    oddeven = num_digits & 1

    for i in range(0, num_digits):
        digit = int(number_as_string[i])

        if not ((i & 1) ^ oddeven):
            digit = digit * 2
        if digit > 9:
            digit = digit - 9

        sum = sum + digit

    return ((sum % 10) == 0)


# Regex for valid card numbers
CC_PATTERNS = {
    'mastercard': '^5[12345]([0-9]{14})$',
    'visa': '^4([0-9]{12,15})$',
}


def ValidateCharacters(number):
    """ Checks to make sure string only contains valid characters """
    return re.compile('^[0-9 ]*$').match(number) != None


def StripToNumbers(number):
    """ remove spaces from the number """
    if ValidateCharacters(number):
        result = ''
        rx = re.compile('^[0-9]$')
        for d in number:
            if rx.match(d):
                result += d
        return result
    else:
        raise Exception('Number has invalid digits')


def ValidateDigits(type, number):
    """ Checks to make sure that the Digits match the CC pattern """
    regex = CC_PATTERNS.get(type.lower(), False)
    if regex:
        return re.compile(regex).match(number) != None
    else:
        return False


def ValidateCreditCard(clean, number):
    """ Check that a credit card number matches the type and validates the Luhn Checksum """
    clean = clean.strip().lower()
    if ValidateCharacters(number):
        number = StripToNumbers(number)
        if CC_PATTERNS.has_key(clean):
            return ValidateDigits(clean, number)
            return ValidateLuhnChecksum(number)
    return False
