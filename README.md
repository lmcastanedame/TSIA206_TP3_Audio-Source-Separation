# Audio Source Separation (TSIA206)

This project is part of the TSIA206 course and focuses on separating different audio sources from a mixed audio signal. The aim is to implement and apply signal processing algorithms to isolate individual sound components, such as vocals and instruments, from an audio mixture.

## Project Description

The project uses various signal processing methods to perform audio source separation. These techniques include frequency domain transformations, Independent Component Analysis (ICA), and blind source separation. The project explores how to apply these techniques to real-world audio signals, separating different sound sources for further analysis or enhancement.

## Project Structure

The repository includes the following key files and directories:

- **main.py**: The main script that contains the implementation of the audio separation algorithms.
- **audio_samples/**: A directory with sample audio files used for testing the separation algorithms.
- **separation.py**: A module with functions that apply different source separation techniques.
- **notebooks/**: Jupyter notebooks for experimenting with and visualizing the audio separation results.
- **requirements.txt**: A file containing the necessary dependencies to run the project.
- **README.md**: This file with detailed project information.

## How to Use

### Prerequisites

- Python 3.x
- Required libraries: NumPy, SciPy, librosa, Matplotlib

Install the necessary dependencies by running:

```bash
pip install -r requirements.txt
```

### Running the Project

To separate the audio sources, follow these steps:

1. Prepare or select a mixed audio file from the `audio_samples/` directory.
2. Run the main script to process the audio file:

    ```bash
    python main.py
    ```

3. The output will be the separated audio sources, saved in the `output/` directory, along with graphical representations of the frequency spectrums of the separated sources.

### Key Steps in the Process

1. **Load Audio Signal**: Load the mixed audio file from the `audio_samples/` directory.
2. **Apply Frequency Transformations**: Convert the time-domain audio signal into the frequency domain using Short-Time Fourier Transform (STFT).
3. **Source Separation**: Use techniques such as Independent Component Analysis (ICA) or Non-negative Matrix Factorization (NMF) to isolate individual sources.
4. **Reconstruct Audio**: Convert the separated frequency components back into the time domain to generate separate audio tracks for each source.
5. **Visualize Results**: Plot the spectrograms and waveforms of the original and separated signals for analysis.

## Purpose

The project aims to provide insights into audio source separation techniques and their applications in various fields, such as music production, audio enhancement, and noise reduction. By implementing different algorithms, it demonstrates how to extract specific sound components from a mixed audio signal.

## Technologies

- **Language**: Python
- **Libraries**: NumPy, SciPy, librosa, Matplotlib
- **Tools**: Jupyter Notebooks for experimenting with and visualizing audio data
