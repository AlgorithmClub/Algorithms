ops = {
    '+': (lambda x, y: x + y),
    '-': (lambda x, y: x - y),
    '*': (lambda x, y: x * y),
    '/': (lambda x, y: x / y)
}


class Node:
    def __init__(self, token):
        self.token = token
        self.left = self.right = None

    def evaluate(self):
        if type(self.token) == int:
            return self.token
        return ops[self.token](self.left.evaluate(), self.right.evaluate())


def _tokenize(exp):
    token_list = []
    number = None
    for i, ch in enumerate(exp):
        if ch in ops.keys() or ch in ['(', ')']:
            if number is not None:
                token_list.append(number)
            token_list.append(ch)
            number = None
        else:
            if number is None:
                number = 0
            number = number * 10 + int(ch)
    if number is not None:
        token_list.append(number)
    return token_list


def _trim(exp):
    if exp[0] == '(' and exp[-1] == ')':
        return exp[1:-1]
    return exp


def parse(exp_raw):
    exp = _trim(_tokenize(exp_raw))
    length = len(exp)
    if length == 1:
        return Node(exp[0])
    stack = 0
    for i in range(length - 1, -1, -1):
        token = exp[i]
        if token == ')':
            stack += 1
        if token == '(':
            stack -= 1
        if stack == 0 and (token == '+' or token == '-'):
            exp1 = exp[:i]
            exp2 = exp[i+1:]
            node = Node(token)
            node.left = parse(exp1)
            node.right = parse(exp2)
            return node

    for i in range(length - 1, -1, -1):
        token = exp[i]
        if token == ')':
            stack += 1
        if token == '(':
            stack -= 1
        if stack == 0 and (token == '*' or token == '/'):
            exp1 = exp[:i]
            exp2 = exp[i+1:]
            node = Node(token)
            node.left = parse(exp1)
            node.right = parse(exp2)
            return node


if __name__ == '__main__':
    samples = [
        '1+2*3',
        '(1+2)*3',
        '3+2*3-(1+7)*5',
        '(1+3)'
    ]
    for e in samples:
        root = parse(e)
        value = root.evaluate()
        print(value)
