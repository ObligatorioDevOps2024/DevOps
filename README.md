# DevOps

En este repositorio se aloja todo lo referente a la documentación generada en el obligatorio, diagramas y archivos de configuración para integrar y administrar la configuración de despliegue.

# Universidad ORT Uruguay

## Facultad de Ingeniería

### Obligatorio DevOps 2024

**Alejandra Medina - 295013**  
**Matías Santos - 168085**  
**Julio Peraza - 244103**

**Prof. Federico Barceló**

**2024**

---

### El desafío planteado

En el marco de la tarea obligatoria para la certificación DevOps, se le solicita al equipo presentar un plan de acción detallado que resuelva las problemáticas operativas y errores que presenta una empresa al exponer nuevas versiones de código.

Se espera que la solución mejore la colaboración, confianza y aprendizaje continuo de los interesados en la puesta en funcionamiento del sistema.

---

### La solución lograda

La solución que planteamos, basada en la incorporación de herramientas de vanguardia, altamente confiables, muy utilizadas y probadas actualmente, organiza y facilita las pruebas y el despliegue de forma automática, rápida y con un margen de error mínimo.

Esto permite a la empresa ganar confianza y prestigio en la calidad del código publicado, además de liberar recursos para dedicarse a otras tareas a nivel de negocio.

#### Plan de despliegue para el frontend

- **Código fuente:** empaquetado en un bucket de **S3 de AWS**.
- **Aplicación:** accesible mediante un enlace generado para el navegador.
- **GitHub Actions:** configurado para vincular automáticamente el archivo con el bucket.

#### Plan de despliegue para las aplicaciones de backend

- **Orquestador:** Kubernetes para manejar los contenedores de los códigos fuente de las aplicaciones de backend.
- **Empaquetado:** cada aplicación Java será alojada en un contenedor Docker.
- **Configuración:** se generará un archivo Dockerfile vinculado al orquestador.

Para cada uno de los aplicativos tanto de backend como de frontend, se presenta un documento .tf, que tiene especificado
el script requerido para la creación de cada de cada una de los mismos.

En el archivo está configurada la secuencia de comandos y parámetros necesarios, para que mediante la herramienta Terraform,
se construyan los recursos indicados(el buckect S3 o el EKS según corresponda), se obtenga la imagen del aplicativo del repositorio referenciado y
se depliegue automáticamente sobre el recurso creado si todo ejecutó correctamente.

---

### Backlog de tareas

Se creó un tablero para la gestión administrativa del proyecto, con el fin de poder organizar, distribuir y ver
de forma ordenada y clara el avance y los pendientes del trabajo a realizar.

**Herramienta:** Microsoft Azure Boards  
**Link:** [https://dev.azure.com/ms168085ms/](https://dev.azure.com/ms168085ms/)

En las siguientes imagen se muestra el listado de tareas que inicialmente fue definido y el tablero de trabajo en una primera etapa:

![Imagen de tareas en tablero de Azure](images/TableroAzureTareas.png)

---

![Imagen de tareas en tablero de Azure progreso](images/TableroAzureProgreso.png)

### CI CD WorkFlow

En los diagramas contiguos se muestra el flujo de etapas por las que avanzaría el proceso de CI/CD

![CI_CD Workflow](https://github.com/user-attachments/assets/b95eee95-7204-4ab7-9b81-66f3fa1186b6)

### Diagrama

![Diagrama](https://github.com/user-attachments/assets/eb352ba0-d57e-484d-bfca-255f8a06598e)

---

### Repositorio GitHub

El equipo resolvió crear 5 repositorios en el gestor de versiones GitHub. En los mismos se alojan el aplicativo de Frontend, los
cuatro aplicativos de backend facilitados junto a los archivos de configuración que se generen para la solución,
y un repositorio para archivos de documentación requerida.

**Organización en GitHub:** [https://github.com/ObligatorioDevOps2024](https://github.com/ObligatorioDevOps2024)

![Imagen de GitHub de organización de repositorios](images/OrganizacionRepositorios.png)

Cada repositorio cuenta con tres ramas:

- **main:** contiene el código en producción. Solo se fusionan cambios después de pasar desarrollo y pruebas.
- **dev:** rama principal de desarrollo para integrar nuevas características.
- **test:** rama para pruebas, sirve como etapa de verificación antes de producción.

---

### Compilado de las aplicaciones de forma local

A continuación se dejan las capturas que evidencian las pruebas de correcta compilación de los aplicativos a nivel local,
este fue el paso inicial para empezar la construcción.

1. **order-service-example**

   ![Imagen order-service-example](images/order-service-example.png)

2. **payments-service-example**
   ![Imagen payments-service-example](images/payments-service-example.png)

3. **shipping-service-example**

   ![Imagen shipping-service-example](images/shipping-service-example.png)

4. **products-service-example**

   ![Imagen products-service-example](images/products-service-example.png)

---

![Imagen aplicaciones](images/aplicaciones.png)

![Imagen aplicaciones2](images/aplicaciones2.png)

![Imagen Shipping-spring](images/shippingSpring.png)

![Imagen Payments-spring](images/paymentsSpring.png)

![Imagen Products-spring](images/productsSpring.png)

![Imagen Orders-spring](images/ordersSpring.png)

### Despliegue de aplicación de frontend (React)

![Imagen Workflow frontend](images/workflowFrontend.png)

![Imagen Frontend Aws](images/frontendS3Aws.png)

![img_frontend](https://github.com/user-attachments/assets/16ce0e80-05e2-4785-8f53-34f9956be3db)

#### Configuración adicional: Política de seguridad del bucket

Para resolver el error 403 en el navegador, se agregó la siguiente política a nivel de configuración
en la herramienta aws en el bucket S3:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::frontend-app-obligatorio/*"
    }
  ]
}
```

El siguiente es el archivo de configuración que se implementó y ejecutó para lograr el despliegue del código en el caso de las aplicaciones de backend.
El mismo contiene todas las referencias necesarias para construir en el recurso especificado el despliegue.

### Ejemplo de archivo deploy.yml

![yml](https://github.com/user-attachments/assets/0ad3b786-5488-4a75-8fd0-99f1184d1d4a)

### Repositorios en AWS - ECR

La siguiente imagen muestra el repositorio construído en la herramienta AWS en el servicio ECR, que permitió alojar la imagen del aplicativo a deployar.

![repositorios_ECR](https://github.com/user-attachments/assets/6f10f3fe-151a-4e00-bc7c-ae24f76452cb)

Por último se muestra la imagen ya deployada en EKR construído mediante GitActions luego de que corriera exitosamente el proceso CI/CD que construyó y luego despliegó el sistema.

Ejemplo de imagen creada con Github Actions:

![ejemplo_imagen_en_ECR](https://github.com/user-attachments/assets/fe24fbd3-df1e-4d20-a22c-721b9ccfd4ef)
