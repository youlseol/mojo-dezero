from python import Python

#@value
struct Variable:
    var data: PythonObject

    def __init__(inout self, data: PythonObject):
        self.data = data

# https://docs.modular.com/mojo/manual/python/
# Currently, you cannot import individual members (such as a single Python class or function)—you must import the whole Python module and then access members through the module name.
# Mojo doesn’t yet support top-level code, so the import_module() call must be inside another method. This means you may need to import a module multiple times or pass around a reference to the module. This works the same way as Python: importing the module multiple times won’t run the initialization logic more than once, so you don’t pay any performance penalty.
# import_module() may raise an exception (for example, if the module isn’t installed). If you’re using it inside an fn function, you need to either handle errors (using a try/except clause), or add the raises keyword to the function signature. You’ll also see this when calling Python functions that may raise exceptions. (Raising exceptions is much more common in Python code than in the Mojo standard library, which limits their use for performance reasons.)

# fn main() raises:
#     Python.add_to_path("./modules")
#     var mypython = Python.import_module("module_main")
#     _ = mypython.main()

fn main() raises:
    try:
        var np = Python.import_module("numpy") #FIXME: python3 not import working in macOS
        var data = np.array(1.0)
        print(data)
        var x = Variable(data)
        print(x.data)

        var new_data = np.array(2.0)
        x.data = new_data
        print(x.data)
    except e:
        print("Failed to import numpy. Please ensure that numpy is installed in your Python environment.")
        raise e

