﻿function Select-SecTask {

    #Establecimiento del modo estricto en la version actual de PS
    Set-StrictMode -Version $PSVersionTable.PSVersion

    #Importacion de los modulos de las 4 tareas
    Import-Module C:\Users\GitHub\Modules\Function_ResourcesUsage.psm1 -Force
    Import-Module C:\Users\Modules\hashesVirusTotal.psm1 -Force
    Import-Module C:\Users\Modules\fun_arocultos.psm1 -Force
    #Import-Module -Name Modulo_4 -Force

    try {
        
        #Menú principal
        Write-Host "¿Que tarea desea hacer? 
        [1] Revisar hashes de archivos. 
        [2] Listar archivos ocultos de la carpeta actual. 
        [3] Revisar los recursos en uso del sistema. 
        [4] Obtener programas instalados en la computadora"
        
        [int]$Tarea = Read-Host -Prompt "Tarea"

        switch ($Tarea) {
            1 {
              Show-HashFile
            }
            
            2 {
                
                Save-HiddenFiles
                break
            }
            
            3 {
                #Menu que muestra las opciones 
                Write-Host "¿Que desea hacer?
                [1] Obtener la memoria en uso.
                [2] Obtener la cantidad de disco en uso.
                [3] Obtener la cantidad de CPU en uso.
                [4] Obtener la red en uso.
                [5] Realizar todo lo anterior."
                
                #Captura el error en caso de que el valor ingresado no sea entero.
                try {
                    [int]$Op_RescUsg = Read-Host -Prompt "Opción"
                }
                
                catch {
                    $_.Exception.Message
                }
                
                switch ($Op_RescUsg) {
                    1 {
                        #Obtiene la memoria en uso
                        Get-MemoryUsage
                        break
                      }
                    
                    2 {
                        #Obtiene el disco en uso.
                        Get-DiskUsage
                        break
                      }
                    
                    3 {
                        #Obtiene la cantidad de procesador en uso.
                        Get-ProcessorUsage
                        break
                      }
                    
                    4 {
                        #Obtiene la red en uso.
                        Get-NetworkUsage
                        break
                      }
                    
                    5 {
                        #Realiza todo a la vez.
                        Get-MainFunction
                        break
                      }
                }
                
                break
            }
            
            4 {
                #Modulo-4
                break
            
            }
            
            default {
                Write-Host "Opción ingresada no válida, por favor ingrese una opción del menú de nuevo."
            }
        }

    }
    
    catch {
        $_.Exception.Message
    }

    #Código para conseguir ayuda.
}