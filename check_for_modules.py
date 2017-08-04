from __future__ import print_function
import imp


# def print(inp):
#     print inp

found=dict()
modules_list = ['subprocess', 'os', 'sys', 'time', 'logging', 'glob', 're', 'maps', 'random', 'six', 'matplotlib']

for module in modules_list:
    try:
        imp.find_module(module)
        found[module] = True
    except ImportError:
        found[module] = False

# modules_found = [module for module in modules_list if found[module]]
modules_not_found = [module for module in modules_list if not found[module]]

# print('Found these packages', modules_found)
xsprint('Not Found:', modules_not_found)
print('Please install required packages')
