/*
 * hello_world_module.c
 *
 * This is a test module for testing Python's C extensions.
 *
 *  Created on: 12-Nov-2015
 *      Author: Pankaj Singh
 */

#include <Python.h>

static PyObject *hwError;

static PyObject* hw_say_hello(PyObject* self, PyObject *args) {
	const char *msg;
	if (!PyArg_ParseTuple(args, "s", &msg)){
		return NULL;
	}

	if (strcmp(&msg, "my_test_error") == 0) {
		PyErr_SetString(hwError, "This is an error to test exceptions.");
		return NULL;
	}

	printf("Behold, a message from the C world\n%s\n", msg);
	return Py_BuildValue("i", 0);
}

static PyMethodDef hw_methods[] = {
		{"ola", hw_say_hello, METH_VARARGS, "Hello from the C World!!!"},
		{NULL, NULL, 0, NULL}
};

PyMODINIT_FUNC inithw(void) {
	PyObject *m;
	m = Py_InitModule("hw", hw_methods);
	if (m == NULL) return;

	hwError = PyErr_NewException("hw.error", NULL, NULL);
	Py_INCREF(hwError);
	PyModule_AddObject(m, "error", hwError);
}
