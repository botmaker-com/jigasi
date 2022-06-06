package org.jitsi.jigasi.text2speech;

import com.google.cloud.texttospeech.v1beta1.*;
import com.google.protobuf.ByteString;

import java.io.IOException;

public class Text2Speech {

    private static final AudioConfig audioConfig = AudioConfig.newBuilder()
            .setAudioEncoding(AudioEncoding.ALAW)
            .setSampleRateHertz(8000)
            .addEffectsProfileId("telephony-class-application")
            .build();

    public static byte[] textToSpeech(String text) {
        // Instantiates a client
        try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create()) {

            SynthesisInput input = SynthesisInput.newBuilder()
                    .setText(text)
                    .build();

            final VoiceSelectionParams voice = VoiceSelectionParams.newBuilder()
                    .setName("en")
                    .setLanguageCode("en")
                    .setSsmlGender(SsmlVoiceGender.MALE)
                    .build();

            // Perform the text-to-speech request on the text input with the selected voice parameters and
            // audio file type
            SynthesizeSpeechResponse response =
                    textToSpeechClient.synthesizeSpeech(input, voice, audioConfig);

            // Get the audio contents from the response
            ByteString audioContents = response.getAudioContent();


            // Write the response to the output file.
            //try (OutputStream out = new FileOutputStream("./output.mulaw")) {
            //    out.write(audioContents.toByteArray());
            //    System.out.println("Audio content written to file \"output.mulaw\"");
            //}

            return audioContents.substring(88).toByteArray();

        } catch (IOException ioE) {
            throw new RuntimeException("Unable to connect to GCP Text To Speech Service");
        }

    }

    public static void main(String[] args) {
        textToSpeech("hola, soy Diego");
    }
}
