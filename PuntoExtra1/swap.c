void swap(int *d1p, int *d2p) 
{
    // Esta función intercambia los valores de las variables mediante el uso de punteros, usando la variable temporal temp0 y temp1 que son de tipo int.
  int temp0 = *d1p;
  int temp1 = *d2p;
  *d1p = temp1;
  *d2p = temp0;
}