package fr.eseo.se.vrignaud.tp_eseo_client.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Coordonnees
        implements Serializable{
    private String latitude;
    private String longitude;
}
