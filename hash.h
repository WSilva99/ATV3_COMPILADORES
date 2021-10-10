#include <stdlib.h>
#include <string.h>
#include <math.h>

#define CAPACITY 500

typedef struct {
  char* key;
  float value;
} variable;

typedef struct {
  variable** variables;
  int size;
  int count;
} variablesTable;

int hashCode(char* key) {
  int code = 0;
  for (int i = 0; key[i]; i++) {
    code += key[i] * i;
  }
  return code % CAPACITY;
}

variable* createVariable(char* key, float value) {
  variable* var = (variable*) malloc (sizeof(variable));
  var->key = (char*) malloc (strlen(key) + 1);
  strcpy(var->key, key);
  var->value = value;
  return var;
}

variablesTable* createTable(int size) {
  variablesTable* table = (variablesTable*) malloc (sizeof(variablesTable));
  table->size = size;
  table->count = 0;
  table->variables = (variable**) calloc (table->size, sizeof(variable*));
  for (int i = 0; i < table->size; i++) {
    table->variables[i] = NULL;
  }
  return table;
}

void freeVariable(variable* var) {
  free(var->key);
  free(var);
}

void freeTable(variablesTable* table) {
  for (int i = 0; i < table->size; i++) {
    variable* var = table->variables[i];
    if (var != NULL) {
      freeVariable(var);
    }
  }
  free(table->variables);
  free(table);
}

void insertVariable(variablesTable* table, char* key, float value) {
  variable* var = createVariable(key, value);
  int index = hashCode(var->key);
  variable* curr = table->variables[index];

  if (curr == NULL) {
    if (table->count == table->size) {
      printf("Insert Error: Hash Table is full\n");
    } else {
      table->variables[index] = var; 
      table->count++;
    }
  } else {
    if (strcmp(curr->key, var->key) == 0) {
      table->variables[index]->value = value;
    } else {
      printf("Insert Error: Hash Code Collision\n");
    }
  }
}

variable* findVariable(variablesTable* table, char* key) {
  int index = hashCode(key);
  variable* var = table->variables[index];
  if (var != NULL) {
    if (strcmp(var->key, key) == 0)
    return var;
  }
  return NULL;
}

