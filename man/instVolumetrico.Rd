% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{instVolumetrico}
\alias{instVolumetrico}
\title{Incertidumbre estándar para material volumétrico de vidrio y micropipetas tipo A}
\usage{
instVolumetrico(
  nominal,
  tipo,
  clase = "A_AS",
  subdivision = 0.1,
  volumen = 0,
  temp = 20,
  calibracion = c(0, 0, 0, 1),
  gamma = 0.00021,
  distrib = "triangular",
  t_ref = 20
)
}
\arguments{
\item{nominal}{valor nominal del material}

\item{tipo}{tipo de material volumétrico: "pipeta", "bureta", "balon", "micropipeta"}

\item{clase}{A o AS: "A_AS"), B: "B" (Solo para material de vidrio)}

\item{subdivision}{solo para buretas 0.01 mL, 0.02 mL, 0.05 mL, 0.1 mL y 0.2 mL}

\item{volumen}{entregado para el caso de buretas y la micropipetas. Los valores se deben expresar en "mL"}

\item{temp}{temperatura de uso del instrumento volumétrico}

\item{calibracion}{vector  c(sesgo, u_s, prec,k_us), con sesgo (error); u_s, incertidumbre estándar del sesgo, incertidumbre estándar debida a la precisión u(V,Prec) y
factor de cobertura de la incertidumbre del sesgo (k_us=1.0 por omisión). Si el valor de la especificación corresponde a "Error \%", "Inaccuracy \%" o "Accuracy \%"
se recomienda usar k_us=sqrt(3), asumiendo un distribución rectangular para este parámetro.
La incertidumbre u(V,Prec) se relaciona con la variación del volumen en el llenado del instrumento (depende del líquido y del operador), esta se puede expresar como una desviación estándar en el caso de una única medición.
Los valores se deben expresar en "mL"}

\item{gamma, }{coefficiente de expansión t\'ermico (por omisión gamma=2.1E-4/ºC para el agua)}

\item{distrib}{distribución asumida (por omisión distrib="triangular")}

\item{t_ref}{Temperatura de referencia a la que se caracterizó el instrumento (20 ºC por omisión)}
}
\value{
data.frame con volumen nominal o corregido, incertidumbre estandar combinada (u_V), incertidumbre
debida a la calibración o al error máximo permitido (u_V_c) e incertimubre debida a variación de la temperatura (u_V_T).
}
\description{
Devuelve la incertidumbre asociada a intrumentos volumétricos (pipetas, buretas, balores aforados o micropipetas) empleado en el LPAQ, teniendo
en cuenta las siguientes fuentes principales:
\enumerate{
\item Error máximo permitido u(V,EM), considerando una distribucion triangular o calibración (sesgo, precisión) u(V,sesgo), u(V,R)
\item Desviación de temperatura respecto a 20 ºC, u(V,T)
}
}
\details{
Los valores devueltos y las especificaciones empleadas se expresan en mL, teniendo en cuenta los valores de las normas
ISO 385:2005 (Buretas) (1), ISO 648:2008 (Pipetas volumétricas) (2), ISO 1042:1998 (Balones volumétricos) (3) y
ISO 8655-2:2002 (micropipetas) (4).

Si el valor de incertidumbre del sesgo
}
\examples{
instVolumetrico(nominal=100,tipo="balon",clase="B")

}
\references{
(1) ISO 385:2005, Laboratory glassware - Burettes. Geneva, Switzerland. \url{https://www.iso.org/standard/38678.html}

(2) ISO 648:2008, Laboratory glassware - Single-volume pipettes. Geneva, Switzerland. \url{https://www.iso.org/standard/44142.html}

(3) ISO 1042:1998, Laboratory glassware - One-mark volumetric flasks. Geneva, Switzerland. \url{https://www.iso.org/standard/25484.html}

(4) ISO 8655-2:2002, Piston-operated volumetric apparatus — Part 2: Piston pipettes. Geneva, Switzerland. \url{https://www.iso.org/standard/29727.html}
}
