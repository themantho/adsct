<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->

<a id="readme-top"></a>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/themmantho/adsct">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">ADSCT</h3>

  <p align="center">
    Alzheimer's Disease-Signature Cortical Thickness Calculation
    <br />
    <a href="https://github.com/themmantho/adsct"><strong>Explore the docs »</strong></a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

Alzheimer's disease (AD) symptoms - progressive memory, executive function, visuospatial, and language impairments - are related to neurodegeneration of specific brain regions, particularly in the paralimbic and association cortices. Neurodegeneration of these regions can be detected in the early stages of AD using AD-signature cortical thickness (ADSCT), a measure of select regional cortical thinning related to symptom severity in AD, including early stages of the disease.

Several versions of ADSCT have been proposed, including by Dickerson et al. (2009) [https://doi.org/10.1093/cercor/bhn113], Jack et al. (2015) [https://doi.org/10.1093/brain/awv283], and Schwarz et al. (2016) [https://doi.org/10.1016/j.nicl.2016.05.017].

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

<!-- - [![Next][Next.js]][Next-url]
- [![React][React.js]][React-url]
- [![Vue][Vue.js]][Vue-url]
- [![Angular][Angular.io]][Angular-url]
- [![Svelte][Svelte.dev]][Svelte-url]
- [![Laravel][Laravel.com]][Laravel-url]
- [![Bootstrap][Bootstrap.com]][Bootstrap-url]
- [![JQuery][JQuery.com]][JQuery-url] -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

### Prerequisites

- Input: FreeSurfer left and right hemisphere cortical thickness files
- Language: R

### Installation

1. Clone the repo

   ```sh
   git clone https://github.com/themmantho/adsct.git
   ```

   Alternatively, download this repo by clicking on the green "Code" button, then "Download ZIP". Unzip the file.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Usage

Example cortical thickness files can be found in `example_data`. There are separate files for left ('lh') and right ('rh') hemispheres. The prefix (lh/rh) of the columns indicates left and right hemisphere, respectively.

Column key: <br />
`*h.aparc.thickness` subject ID <br />
`*h_<region name>_thickness` Regional cortical thickness (millimeters) for the Desikan-Killiany atlas (default in FreeSurfer). <br />

`lh_MeanThickness_thickness` Mean cortical thickness <br />
`BrainSegVolNotVent` Brain Segmentation Volume Without Ventricles <br />
`eTIV` Estimated Total Intracranial Volume <br />

`calc_adsct.R` accepts three arguments: <br />
lhct -- a data.frame containing FreeSurfer's aparcstats2table cortical thickness output for the left hemisphere.

rhct -- a data.frame containing FreeSurfer's aparcstats2table cortical thickness output for the right hemisphere.

type -- the research group that proposed the AD-signature index; one of c("jack", "schwarz", "dickerson")

```r
# Load the cortical thickness data for each hemisphere separately
lhct = read_table(list.files(subdirs$data, pattern = "lh"), show_col_types = FALSE)
rhct = read_table(list.files(subdirs$data, pattern = "rh"), show_col_types = FALSE)

# Set the ADSCT version to calculate

adsct_type = "jack"

# Calculate ADSCT
adsct <- calc_adsct(lhct, rhct, type = adsct_type)
```

### ADSCT Versions

#### Dickerson et al.

The original version that includes bilateral entorhinal cortex, inferior temporal, middle temporal, temporal pole, inferior parietal, superior parietal, superior frontal, inferior frontal, and precuneus regions. <br />
Original paper: https://doi.org/10.1093/cercor/bhn113.

#### Jack et al.

A pared down version that includes bilateral entorhinal cortex, fusiform gyrus, and inferior and middle temporal gyri. This version is sensitive to neurodegeneration in medial temporal regions susceptible to AD pathology in the earliest stages of the disease. <br />
Original paper: https://doi.org/10.1093/brain/awv283.

#### Schwarz et al.

An updated version that includes bilateral entorhinal cortex, inferior temporal, mid-temporal, inferior parietal, fusiform, and precuneus regions. <br />
Original paper: https://doi.org/10.1016/j.nicl.2016.05.017

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->

## Roadmap

- [ ] Feature 1
- [ ] Feature 2
- [ ] Feature 3
  - [ ] Nested Feature

See the [open issues](https://github.com/themmantho/adsct/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the project_license. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Mia Anthony - email@email_client.com

Project Link: [https://github.com/themmantho/adsct](https://github.com/themmantho/adsct)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

- []()
- []()
- []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/themmantho/adsct.svg?style=for-the-badge
[contributors-url]: https://github.com/themmantho/adsct/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/themmantho/adsct.svg?style=for-the-badge
[forks-url]: https://github.com/themmantho/adsct/network/members
[stars-shield]: https://img.shields.io/github/stars/themmantho/adsct.svg?style=for-the-badge
[stars-url]: https://github.com/themmantho/adsct/stargazers
[issues-shield]: https://img.shields.io/github/issues/themmantho/adsct.svg?style=for-the-badge
[issues-url]: https://github.com/themmantho/adsct/issues
[license-shield]: https://img.shields.io/github/license/themmantho/adsct.svg?style=for-the-badge
[license-url]: https://github.com/themmantho/adsct/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com
