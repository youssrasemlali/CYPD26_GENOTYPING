Last login: Mon Oct 20 13:45:02 on ttys000

The default interactive shell is now zsh.
To update your account to use zsh, please run `chsh -s /bin/zsh`.
For more details, please visit https://support.apple.com/kb/HT208050.
(base) Youssras-MacBook-Air:~ youssrasemlali$ ssh student47@129.16.45.154
The authenticity of host '129.16.45.154 (129.16.45.154)' can't be established.
ED25519 key fingerprint is SHA256:KDS7ETZ5jZpLLV/1kfPuDHJ/Si/8Fi90n76PXYCMDxA.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '129.16.45.154' (ED25519) to the list of known hosts.
student47@129.16.45.154's password: 
Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 4.15.0-213-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

student47@ox:~$ mkdir NGS_Tutorial
student47@ox:~$ cd NGS_Tutorial
student47@ox:~/NGS_Tutorial$ wget https://raw.githubusercontent.com/zelezniak-lab/7BBG1002/refs/heads/main/seq_tech/sequencing_technologies_tutorial.Rmd 
--2025-10-20 14:58:33--  https://raw.githubusercontent.com/zelezniak-lab/7BBG1002/refs/heads/main/seq_tech/sequencing_technologies_tutorial.Rmd
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.111.133, 185.199.109.133, 185.199.110.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5643 (5,5K) [text/plain]
Saving to: ‘sequencing_technologies_tutorial.Rmd’

sequencing_technolo 100%[===================>]   5,51K  --.-KB/s    in 0s      

2025-10-20 14:58:33 (25,0 MB/s) - ‘sequencing_technologies_tutorial.Rmd’ saved [5643/5643]

student47@ox:~/NGS_Tutorial$ wget https://raw.githubusercontent.com/zelezniak-lab/7BBG1002/refs/heads/main/seq_tech/data.zip 
--2025-10-20 14:58:56--  https://raw.githubusercontent.com/zelezniak-lab/7BBG1002/refs/heads/main/seq_tech/data.zip
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.111.133, 185.199.109.133, 185.199.110.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 28957183 (28M) [application/zip]
Saving to: ‘data.zip’

data.zip            100%[===================>]  27,62M  97,7MB/s    in 0,3s    

2025-10-20 14:58:57 (97,7 MB/s) - ‘data.zip’ saved [28957183/28957183]

student47@ox:~/NGS_Tutorial$ unzip data.zip
Archive:  data.zip
   creating: data/
   creating: data/ref/
  inflating: data/.DS_Store          
  inflating: __MACOSX/data/._.DS_Store  
   creating: data/seq/
  inflating: data/ref/.DS_Store      
  inflating: __MACOSX/data/ref/._.DS_Store  
  inflating: data/ref/varicella.gb   
  inflating: data/seq/varicella_mut2.fastq  
  inflating: data/seq/varicella_l2.fastq  
  inflating: data/seq/varicella1.fastq  
  inflating: data/seq/varicella_mut1.fastq  
  inflating: data/seq/varicella_l1.fastq  
  inflating: data/seq/varicella2.fastq  
student47@ox:~/NGS_Tutorial$ conda install -c conda-forge tree
-bash: conda: command not found
student47@ox:~/NGS_Tutorial$ ls
data  data.zip	__MACOSX  sequencing_technologies_tutorial.Rmd
student47@ox:~/NGS_Tutorial$ ls -la
total 28304
drwxr-xr-x 4 student47 students     4096 okt 20 14:59 .
drwxr-xr-x 8 student47 students     4096 okt 20 14:58 ..
drwxrwxr-x 4 student47 students     4096 jan 24  2021 data
-rw-r--r-- 1 student47 students 28957183 okt 20 14:58 data.zip
drwxr-xr-x 3 student47 students     4096 okt 20 14:59 __MACOSX
-rw-r--r-- 1 student47 students     5643 okt 20 14:58 sequencing_technologies_tutorial.Rmd
student47@ox:~/NGS_Tutorial$ tree data
data
├── ref
│   └── varicella.gb
└── seq
    ├── varicella1.fastq
    ├── varicella2.fastq
    ├── varicella_l1.fastq
    ├── varicella_l2.fastq
    ├── varicella_mut1.fastq
    └── varicella_mut2.fastq

2 directories, 7 files
student47@ox:~/NGS_Tutorial$ find data -type f -print0 | xargs -0 chmod ugo-w
student47@ox:~/NGS_Tutorial$ mkdir results
student47@ox:~/NGS_Tutorial$ find data -type f -print0 | xargs -0 chmod ugo-w
student47@ox:~/NGS_Tutorial$ mkdir results
mkdir: cannot create directory ‘results’: File exists
student47@ox:~/NGS_Tutorial$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
--2025-10-20 15:04:41--  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
Resolving repo.anaconda.com (repo.anaconda.com)... 104.16.191.158, 104.16.32.241, 2606:4700::6810:bf9e, ...
Connecting to repo.anaconda.com (repo.anaconda.com)|104.16.191.158|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 162129736 (155M) [application/octet-stream]
Saving to: ‘Miniconda3-latest-Linux-x86_64.sh’

Miniconda3-latest-L 100%[===================>] 154,62M  30,6MB/s    in 4,5s    

2025-10-20 15:04:46 (34,3 MB/s) - ‘Miniconda3-latest-Linux-x86_64.sh’ saved [162129736/162129736]

student47@ox:~/NGS_Tutorial$ chmod u+x Miniconda3-latest-Linux-x86_64.sh
student47@ox:~/NGS_Tutorial$ chmod u+x Miniconda3-latest-Linux-x86_64.sh
student47@ox:~/NGS_Tutorial$ ./Miniconda3-latest-Linux-x86_64.sh

Welcome to Miniconda3 py313_25.7.0-2

In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue
>>> 
MINICONDA END USER LICENSE AGREEMENT

Copyright Notice: Miniconda(R) (C) 2015, Anaconda, Inc.
All rights reserved. Miniconda(R) is licensed, not sold.

Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this l
ist of conditions and the following disclaimer;

2. Redistributions in binary form must reproduce the above copyright notice, thi
s list of conditions and the following disclaimer in the documentation and/or ot
her materials provided with the distribution;

3. The name Anaconda, Inc. or Miniconda(R) may not be used to endorse or promote
 products derived from this software without specific prior written permission f
rom Anaconda, Inc.; and

4. Miniconda(R) may not be used to access or allow third parties to access Anaco
nda package repositories if such use would circumvent paid licensing requirement
s or is otherwise restricted by the Anaconda Terms of Service.

DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ANACONDA "AS IS" AND ANY EXPRESS OR IMP
LIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHA
NTABILITY, FITNESS FOR A PARTICULAR PURPOSE , AND NON-INFRINGEMENT ARE DISCLAIME
D. IN NO EVENT SHALL ANACONDA BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SP
ECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCU
REMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINE
SS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTR
ACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN AN
Y WAY OUT OF THE USE OF MINICONDA(R), EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 DAMAGE.


Do you accept the license terms? [yes|no]
>>> 
Please answer 'yes' or 'no':'
>>> 
Please answer 'yes' or 'no':'
>>> 
Please answer 'yes' or 'no':'
>>> 
Please answer 'yes' or 'no':'
>>> 
Please answer 'yes' or 'no':'
>>> 
Please answer 'yes' or 'no':'
>>> yes

Miniconda3 will now be installed into this location:
/home/student47/miniconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/student47/miniconda3] >>> 
PREFIX=/home/student47/miniconda3
Unpacking bootstrapper...
Unpacking payload...
                                                                                
Installing base environment...


Downloading and Extracting Packages:


## Package Plan ##

  environment location: /home/student47/miniconda3

  added / updated specs:
    - defaults/linux-64::_libgcc_mutex==0.1=main[md5=c3473ff8bdb3d124ed5ff11ec380d6f9]
    - defaults/linux-64::_openmp_mutex==5.1=1_gnu[md5=71d281e9c2192cb3fa425655a8defb85]
    - defaults/linux-64::anaconda-anon-usage==0.7.2=py313hfc0e8ea_100[md5=c6ea2f8456510ea049a5f05fead4b9b1]
    - defaults/linux-64::anaconda-auth==0.8.6=py313h06a4308_0[md5=1b575dad8e7084c59cfd8f8c4a2bd421]
    - defaults/linux-64::anaconda-cli-base==0.5.2=py313h06a4308_0[md5=d629fb0a0282b3adcf8f53ab82b63ad4]
    - defaults/linux-64::annotated-types==0.6.0=py313h06a4308_0[md5=4dc276db59e14eaf187426b0040eb209]
    - defaults/linux-64::boltons==25.0.0=py313h06a4308_0[md5=afd30cc40ab0edf4e246b901c8eca725]
    - defaults/linux-64::brotlicffi==1.0.9.2=py313h6a678d5_1[md5=256e218354e6ffcd32269368b5b9590d]
    - defaults/linux-64::bzip2==1.0.8=h5eee18b_6[md5=f21a3ff51c1b271977f53ce956a69297]
    - defaults/linux-64::c-ares==1.34.5=hef5626c_0[md5=4a0059c416e26b3c5e8a8fdf11dfa811]
    - defaults/linux-64::ca-certificates==2025.7.15=h06a4308_0[md5=a65eaddc4f9529b9c908f544ca50e7e0]
    - defaults/linux-64::certifi==2025.8.3=py313h06a4308_0[md5=1d24ffefc1375c97ae5c5175235aa724]
    - defaults/linux-64::cffi==1.17.1=py313h1fdaa30_1[md5=c5d4f727e7bccd4bd8d599e049853383]
    - defaults/linux-64::click==8.2.1=py313h06a4308_0[md5=a4fe8d908fee44662a5667b40506cba5]
    - defaults/linux-64::colorama==0.4.6=py313h06a4308_0[md5=9c0c672e71bd0523bdaa9376ea056ebd]
    - defaults/linux-64::conda-anaconda-tos==0.2.2=py313h06a4308_1[md5=48b92f96da51225fe57f3fe687eec943]
    - defaults/linux-64::conda-content-trust==0.2.0=py313h06a4308_1[md5=aefc551e21e13ecc1de44ee589aea77d]
    - defaults/linux-64::conda-package-handling==2.4.0=py313h06a4308_0[md5=76b17c263bc01eaffebcb8ba7ccd6ca9]
    - defaults/linux-64::conda-package-streaming==0.12.0=py313h06a4308_0[md5=adef8a1cc0462068a51c68144f05be3c]
    - defaults/linux-64::conda==25.7.0=py313h06a4308_0[md5=2137e3bdfcba2a2bef4531b76d2f07ea]
    - defaults/linux-64::cpp-expected==1.1.0=hdb19cb5_0[md5=3a195bcf47b691adb4a635a8b7f396f7]
    - defaults/linux-64::cryptography==45.0.5=py313hea9ce0a_0[md5=e70a5914e157eb138c4620aab7bc17d9]
    - defaults/linux-64::dbus==1.16.2=h5bd4931_0[md5=4c4aef417b613e7111d90cf2348b231a]
    - defaults/linux-64::distro==1.9.0=py313h06a4308_0[md5=1fd7ab065e9958e7bbd4d3fbf175742b]
    - defaults/linux-64::expat==2.7.1=h6a678d5_0[md5=269942a9f3f943e2e5d8a2516a861f7c]
    - defaults/linux-64::fmt==9.1.0=hdb19cb5_1[md5=4f12930203ff2d84df5d287af9b29858]
    - defaults/linux-64::frozendict==2.4.2=py313h06a4308_0[md5=31f7036f9bdd3592e660ecfc631f054f]
    - defaults/linux-64::icu==73.1=h6a678d5_0[md5=6d09df641fc23f7d277a04dc7ea32dd4]
    - defaults/linux-64::idna==3.7=py313h06a4308_0[md5=f3e7d3ba37b45ef8782dd643d7e9733b]
    - defaults/linux-64::jaraco.classes==3.4.0=py313h06a4308_0[md5=c4ea3f7208a811b569bbeae8c42c5b2d]
    - defaults/linux-64::jaraco.context==6.0.0=py313h06a4308_0[md5=568af8d43ff7c6e7ecdc725bdc860053]
    - defaults/linux-64::jaraco.functools==4.1.0=py313h06a4308_0[md5=472d048415f35e29b8b39a6cfc947ccd]
    - defaults/linux-64::jsonpatch==1.33=py313h06a4308_1[md5=8cb4b1755a4a8fd6a57883863236ef2b]
    - defaults/linux-64::jsonpointer==3.0.0=py313h06a4308_0[md5=af07fefbc353b9e3292ad9e0d563d9be]
    - defaults/linux-64::keyring==25.6.0=py313h06a4308_0[md5=611301eaa58f7a2c9eb37376dbd84fea]
    - defaults/linux-64::ld_impl_linux-64==2.40=h12ee557_0[md5=ee672b5f635340734f58d618b7bca024]
    - defaults/linux-64::libarchive==3.7.7=hfab0078_0[md5=c208e4f83c30250d659102b271e8d4e6]
    - defaults/linux-64::libcurl==8.14.1=hc1efc7f_1[md5=e2d948b1b2c79337d29d294bb3698e16]
    - defaults/linux-64::libev==4.33=h7f8727e_1[md5=5065620db4393fb549f30114a33897d1]
    - defaults/linux-64::libffi==3.4.4=h6a678d5_1[md5=70646cc713f0c43926cfdcfe9b695fe0]
    - defaults/linux-64::libgcc-ng==11.2.0=h1234567_1[md5=a87728dabf3151fb9cfa990bd2eb0464]
    - defaults/linux-64::libgomp==11.2.0=h1234567_1[md5=b372c0eea9b60732fdae4b817a63c8cd]
    - defaults/linux-64::libmamba==2.0.5=haf1ee3a_1[md5=0f1450592dc7555e315f5d684ce481eb]
    - defaults/linux-64::libmambapy==2.0.5=py313hdb19cb5_1[md5=c56ed0c34af1a360984e20bf13200007]
    - defaults/linux-64::libmpdec==4.0.0=h5eee18b_0[md5=feb10f42b1a7b523acbf85461be41a3e]
    - defaults/linux-64::libnghttp2==1.57.0=h2d74bed_0[md5=674871621300f54e7ffcf93e6e341638]
    - defaults/linux-64::libsolv==0.7.30=he621ea3_1[md5=6918c29c4b65f21c71aac679b49c02e4]
    - defaults/linux-64::libssh2==1.11.1=h251f7ec_0[md5=dd68c24355431c0543339dda1404129d]
    - defaults/linux-64::libstdcxx-ng==11.2.0=h1234567_1[md5=57623d10a70e09e1d048c2b2b6f4e2dd]
    - defaults/linux-64::libuuid==1.41.5=h5eee18b_0[md5=4a6a2354414c9080327274aa514e5299]
    - defaults/linux-64::libxcb==1.17.0=h9b100fa_0[md5=fdf0d380fa3809a301e2dbc0d5183883]
    - defaults/linux-64::libxml2==2.13.8=hfdd30dd_0[md5=6da89b526f12f128af101c3f70d12c6d]
    - defaults/linux-64::lz4-c==1.9.4=h6a678d5_1[md5=2ee58861f2b92b868ce761abb831819d]
    - defaults/linux-64::markdown-it-py==2.2.0=py313h06a4308_1[md5=0c3ee40437213e528c99bff0bcc5a942]
    - defaults/linux-64::mdurl==0.1.0=py313h06a4308_0[md5=5bca585008b9e6ce6997871309117479]
    - defaults/linux-64::menuinst==2.3.1=py313h06a4308_0[md5=215cd4c223b3ab647d025f347d35c058]
    - defaults/linux-64::more-itertools==10.3.0=py313h06a4308_0[md5=ee08e17a18339269f11ba3109f4fb225]
    - defaults/linux-64::ncurses==6.5=h7934f7d_0[md5=0abfc090299da4bb031b84c64309757b]
    - defaults/linux-64::nlohmann_json==3.11.2=h6a678d5_0[md5=36890f7abd98066b607211b1773e6343]
    - defaults/linux-64::openssl==3.0.17=h5eee18b_0[md5=c032152f4080dd61875d5047641c8bf2]
    - defaults/linux-64::packaging==25.0=py313h06a4308_0[md5=7396e4349c90a320cb4aa1edf684886d]
    - defaults/linux-64::pcre2==10.42=hebb0a14_1[md5=727e15c3cfa02b032da4eb0c1123e977]
    - defaults/linux-64::pkce==1.0.3=py313h06a4308_0[md5=a1e79da30a6c62c6398e9bb990ee9ed6]
    - defaults/linux-64::platformdirs==4.3.7=py313h06a4308_0[md5=6cdbb54f78166c07399004f961726487]
    - defaults/linux-64::pluggy==1.5.0=py313h06a4308_0[md5=ea142d52281afe8e9a79e4a33c023e41]
    - defaults/linux-64::pthread-stubs==0.3=h0ce48e5_1[md5=973a642312d2a28927aaf5b477c67250]
    - defaults/linux-64::pycosat==0.6.6=py313h5eee18b_2[md5=60ea7416e08d78563e31d16c333bd57f]
    - defaults/linux-64::pydantic-core==2.33.2=py313hc6f7160_0[md5=5d5a3d0469b467688a13f505e77639ef]
    - defaults/linux-64::pydantic-settings==2.6.1=py313h06a4308_0[md5=37546fa6cc30a5a794b9dd505368eb84]
    - defaults/linux-64::pydantic==2.11.7=py313h06a4308_0[md5=7c8e28d9eb0dbf8b3bea0aa9f28f8c17]
    - defaults/linux-64::pygments==2.19.1=py313h06a4308_0[md5=8fcbba71964f3d4d936e846c3bc9fb13]
    - defaults/linux-64::pyjwt==2.10.1=py313h06a4308_0[md5=2c17b6fb0a6100caada2e7ee72308bec]
    - defaults/linux-64::pysocks==1.7.1=py313h06a4308_0[md5=a493580ce366b942a8e1c00ee00c4182]
    - defaults/linux-64::python-dotenv==1.1.0=py313h06a4308_0[md5=33e2c8b6a83ba5bdbda0639bfb37496c]
    - defaults/linux-64::python==3.13.5=h4612cfd_100_cp313[md5=1adf42b71c42a4a540eae2c0026f02c3]
    - defaults/linux-64::python_abi==3.13=0_cp313[md5=d4009c49dd2b54ffded7f1365b5f6505]
    - defaults/linux-64::readchar==4.0.5=py313h06a4308_0[md5=42a02a52ac3364e165087e5c753b40ce]
    - defaults/linux-64::readline==8.3=hc2a1206_0[md5=8578e006d4ef5cb98a6cda232b3490f6]
    - defaults/linux-64::reproc-cpp==14.2.4=h6a678d5_2[md5=b03aa4903158279f003e7032ab9f5601]
    - defaults/linux-64::reproc==14.2.4=h6a678d5_2[md5=3c6dbc6c60b3897222d79359343e90fa]
    - defaults/linux-64::requests==2.32.4=py313h06a4308_0[md5=c1790ae25dc021a7c6073ace845d8f55]
    - defaults/linux-64::rich==13.9.4=py313h06a4308_0[md5=29573c0e57aea86c5d68759975638187]
    - defaults/linux-64::ruamel.yaml.clib==0.2.12=py313h5eee18b_0[md5=d9da5a7327cd6c9ee11d7b7ac1b7d082]
    - defaults/linux-64::ruamel.yaml==0.18.10=py313h5eee18b_0[md5=70c6985c0871d511a94afb1e8537943f]
    - defaults/linux-64::secretstorage==3.3.1=py313h06a4308_1[md5=bd9d99500717e83799f51f36825e6c2a]
    - defaults/linux-64::semver==3.0.2=py313h06a4308_1[md5=42fd2505022b95daa0061e091c9ddcda]
    - defaults/linux-64::setuptools==78.1.1=py313h06a4308_0[md5=8f8e1c1e3af9d2d371aaa0ee8316ae7c]
    - defaults/linux-64::shellingham==1.5.0=py313h06a4308_0[md5=fec77e08b241c9bae71940db00e14b65]
    - defaults/linux-64::simdjson==3.10.1=hdb19cb5_0[md5=7b2a4b5be590071e1b4dce77b413d26a]
    - defaults/linux-64::spdlog==1.11.0=hdb19cb5_0[md5=023cfe6341f1d90dee2016e608538537]
    - defaults/linux-64::sqlite==3.50.2=hb25bd0a_1[md5=6ac08aa6b5f14911039aa04b2b2c3350]
    - defaults/linux-64::tk==8.6.15=h54e0aa7_0[md5=1fa91e0c4fc9c9435eda3f1a25a676fd]
    - defaults/linux-64::tomli==2.2.1=py313h06a4308_0[md5=4ae62c3391e11617a9f6d9556d8062c7]
    - defaults/linux-64::tqdm==4.67.1=py313h7040dfc_0[md5=2efb4b3310f058cb95d326989bddc761]
    - defaults/linux-64::truststore==0.10.1=py313h06a4308_0[md5=fee67c1946f31ba7b45962c20b7b1d8c]
    - defaults/linux-64::typer==0.9.0=py313h06a4308_0[md5=7c1a4cd7cd5bc54f1460e0e2a8c5c0a3]
    - defaults/linux-64::typing-extensions==4.12.2=py313h06a4308_0[md5=f011fee76cd912d47567c6cedb0074c9]
    - defaults/linux-64::typing-inspection==0.4.0=py313h06a4308_0[md5=b9349b70ca836c55debbaa5b544b0c3c]
    - defaults/linux-64::typing_extensions==4.12.2=py313h06a4308_0[md5=e1a419944c11dc4592cdce114d0a3063]
    - defaults/linux-64::urllib3==2.5.0=py313h06a4308_0[md5=8739060177d7ed31cd7292efc5bcc91e]
    - defaults/linux-64::wheel==0.45.1=py313h06a4308_0[md5=29057e876eedce0e37c2388c138a19f9]
    - defaults/linux-64::xorg-libx11==1.8.12=h9b100fa_1[md5=6298b27afae6f49f03765b2a03df2fcb]
    - defaults/linux-64::xorg-libxau==1.0.12=h9b100fa_0[md5=a8005a9f6eb903e113cd5363e8a11459]
    - defaults/linux-64::xorg-libxdmcp==1.1.5=h9b100fa_0[md5=c284a09ddfba81d9c4e740110f09ea06]
    - defaults/linux-64::xorg-xorgproto==2024.1=h5eee18b_1[md5=412a0d97a7a51d23326e57226189da92]
    - defaults/linux-64::xz==5.6.4=h5eee18b_1[md5=3581505fa450962d631bd82b8616350e]
    - defaults/linux-64::yaml-cpp==0.8.0=h6a678d5_1[md5=015d2d74ad3c8e53eec3358637433718]
    - defaults/linux-64::zlib==1.2.13=h5eee18b_1[md5=92e42d8310108b0a440fb2e60b2b2a25]
    - defaults/linux-64::zstandard==0.23.0=py313h2c38b39_1[md5=5b4bd26f9d674331122482d3c2ac0afe]
    - defaults/linux-64::zstd==1.5.6=hc292b87_0[md5=78ae7abd3020b41f827b35085845e1b8]
    - defaults/noarch::archspec==0.2.3=pyhd3eb1b0_0[md5=13d01ee2d343d8539bb47055a6c0b5b2]
    - defaults/noarch::charset-normalizer==3.3.2=pyhd3eb1b0_0[md5=c6fea3691e85cf7f568b0618ec29fc4f]
    - defaults/noarch::conda-anaconda-telemetry==0.3.0=pyhd3eb1b0_1[md5=2ac481091c9cc4eec50cf2f0cc42744d]
    - defaults/noarch::conda-libmamba-solver==25.4.0=pyhd3eb1b0_0[md5=77ff27567894c7ea3eb908489e5d3e5c]
    - defaults/noarch::jeepney==0.7.1=pyhd3eb1b0_0[md5=f115ef0af90b59f35ef56743955979a4]
    - defaults/noarch::pip==25.1=pyhc872135_2[md5=2778327d2a700153fefe0e69438b18e1]
    - defaults/noarch::pybind11-abi==5=hd3eb1b0_0[md5=7f0df6639fdf60ccd3045ee6faedd32f]
    - defaults/noarch::pycparser==2.21=pyhd3eb1b0_0[md5=135a72ff2a31150a3a3ff0b1edd41ca9]
    - defaults/noarch::tzdata==2025b=h04d1e81_0[md5=1d027393db3427ab22a02aa44a56f143]


The following NEW packages will be INSTALLED:

  _libgcc_mutex      pkgs/main/linux-64::_libgcc_mutex-0.1-main 
  _openmp_mutex      pkgs/main/linux-64::_openmp_mutex-5.1-1_gnu 
  anaconda-anon-usa~ pkgs/main/linux-64::anaconda-anon-usage-0.7.2-py313hfc0e8ea_100 
  anaconda-auth      pkgs/main/linux-64::anaconda-auth-0.8.6-py313h06a4308_0 
  anaconda-cli-base  pkgs/main/linux-64::anaconda-cli-base-0.5.2-py313h06a4308_0 
  annotated-types    pkgs/main/linux-64::annotated-types-0.6.0-py313h06a4308_0 
  archspec           pkgs/main/noarch::archspec-0.2.3-pyhd3eb1b0_0 
  boltons            pkgs/main/linux-64::boltons-25.0.0-py313h06a4308_0 
  brotlicffi         pkgs/main/linux-64::brotlicffi-1.0.9.2-py313h6a678d5_1 
  bzip2              pkgs/main/linux-64::bzip2-1.0.8-h5eee18b_6 
  c-ares             pkgs/main/linux-64::c-ares-1.34.5-hef5626c_0 
  ca-certificates    pkgs/main/linux-64::ca-certificates-2025.7.15-h06a4308_0 
  certifi            pkgs/main/linux-64::certifi-2025.8.3-py313h06a4308_0 
  cffi               pkgs/main/linux-64::cffi-1.17.1-py313h1fdaa30_1 
  charset-normalizer pkgs/main/noarch::charset-normalizer-3.3.2-pyhd3eb1b0_0 
  click              pkgs/main/linux-64::click-8.2.1-py313h06a4308_0 
  colorama           pkgs/main/linux-64::colorama-0.4.6-py313h06a4308_0 
  conda              pkgs/main/linux-64::conda-25.7.0-py313h06a4308_0 
  conda-anaconda-te~ pkgs/main/noarch::conda-anaconda-telemetry-0.3.0-pyhd3eb1b0_1 
  conda-anaconda-tos pkgs/main/linux-64::conda-anaconda-tos-0.2.2-py313h06a4308_1 
  conda-content-tru~ pkgs/main/linux-64::conda-content-trust-0.2.0-py313h06a4308_1 
  conda-libmamba-so~ pkgs/main/noarch::conda-libmamba-solver-25.4.0-pyhd3eb1b0_0 
  conda-package-han~ pkgs/main/linux-64::conda-package-handling-2.4.0-py313h06a4308_0 
  conda-package-str~ pkgs/main/linux-64::conda-package-streaming-0.12.0-py313h06a4308_0 
  cpp-expected       pkgs/main/linux-64::cpp-expected-1.1.0-hdb19cb5_0 
  cryptography       pkgs/main/linux-64::cryptography-45.0.5-py313hea9ce0a_0 
  dbus               pkgs/main/linux-64::dbus-1.16.2-h5bd4931_0 
  distro             pkgs/main/linux-64::distro-1.9.0-py313h06a4308_0 
  expat              pkgs/main/linux-64::expat-2.7.1-h6a678d5_0 
  fmt                pkgs/main/linux-64::fmt-9.1.0-hdb19cb5_1 
  frozendict         pkgs/main/linux-64::frozendict-2.4.2-py313h06a4308_0 
  icu                pkgs/main/linux-64::icu-73.1-h6a678d5_0 
  idna               pkgs/main/linux-64::idna-3.7-py313h06a4308_0 
  jaraco.classes     pkgs/main/linux-64::jaraco.classes-3.4.0-py313h06a4308_0 
  jaraco.context     pkgs/main/linux-64::jaraco.context-6.0.0-py313h06a4308_0 
  jaraco.functools   pkgs/main/linux-64::jaraco.functools-4.1.0-py313h06a4308_0 
  jeepney            pkgs/main/noarch::jeepney-0.7.1-pyhd3eb1b0_0 
  jsonpatch          pkgs/main/linux-64::jsonpatch-1.33-py313h06a4308_1 
  jsonpointer        pkgs/main/linux-64::jsonpointer-3.0.0-py313h06a4308_0 
  keyring            pkgs/main/linux-64::keyring-25.6.0-py313h06a4308_0 
  ld_impl_linux-64   pkgs/main/linux-64::ld_impl_linux-64-2.40-h12ee557_0 
  libarchive         pkgs/main/linux-64::libarchive-3.7.7-hfab0078_0 
  libcurl            pkgs/main/linux-64::libcurl-8.14.1-hc1efc7f_1 
  libev              pkgs/main/linux-64::libev-4.33-h7f8727e_1 
  libffi             pkgs/main/linux-64::libffi-3.4.4-h6a678d5_1 
  libgcc-ng          pkgs/main/linux-64::libgcc-ng-11.2.0-h1234567_1 
  libgomp            pkgs/main/linux-64::libgomp-11.2.0-h1234567_1 
  libmamba           pkgs/main/linux-64::libmamba-2.0.5-haf1ee3a_1 
  libmambapy         pkgs/main/linux-64::libmambapy-2.0.5-py313hdb19cb5_1 
  libmpdec           pkgs/main/linux-64::libmpdec-4.0.0-h5eee18b_0 
  libnghttp2         pkgs/main/linux-64::libnghttp2-1.57.0-h2d74bed_0 
  libsolv            pkgs/main/linux-64::libsolv-0.7.30-he621ea3_1 
  libssh2            pkgs/main/linux-64::libssh2-1.11.1-h251f7ec_0 
  libstdcxx-ng       pkgs/main/linux-64::libstdcxx-ng-11.2.0-h1234567_1 
  libuuid            pkgs/main/linux-64::libuuid-1.41.5-h5eee18b_0 
  libxcb             pkgs/main/linux-64::libxcb-1.17.0-h9b100fa_0 
  libxml2            pkgs/main/linux-64::libxml2-2.13.8-hfdd30dd_0 
  lz4-c              pkgs/main/linux-64::lz4-c-1.9.4-h6a678d5_1 
  markdown-it-py     pkgs/main/linux-64::markdown-it-py-2.2.0-py313h06a4308_1 
  mdurl              pkgs/main/linux-64::mdurl-0.1.0-py313h06a4308_0 
  menuinst           pkgs/main/linux-64::menuinst-2.3.1-py313h06a4308_0 
  more-itertools     pkgs/main/linux-64::more-itertools-10.3.0-py313h06a4308_0 
  ncurses            pkgs/main/linux-64::ncurses-6.5-h7934f7d_0 
  nlohmann_json      pkgs/main/linux-64::nlohmann_json-3.11.2-h6a678d5_0 
  openssl            pkgs/main/linux-64::openssl-3.0.17-h5eee18b_0 
  packaging          pkgs/main/linux-64::packaging-25.0-py313h06a4308_0 
  pcre2              pkgs/main/linux-64::pcre2-10.42-hebb0a14_1 
  pip                pkgs/main/noarch::pip-25.1-pyhc872135_2 
  pkce               pkgs/main/linux-64::pkce-1.0.3-py313h06a4308_0 
  platformdirs       pkgs/main/linux-64::platformdirs-4.3.7-py313h06a4308_0 
  pluggy             pkgs/main/linux-64::pluggy-1.5.0-py313h06a4308_0 
  pthread-stubs      pkgs/main/linux-64::pthread-stubs-0.3-h0ce48e5_1 
  pybind11-abi       pkgs/main/noarch::pybind11-abi-5-hd3eb1b0_0 
  pycosat            pkgs/main/linux-64::pycosat-0.6.6-py313h5eee18b_2 
  pycparser          pkgs/main/noarch::pycparser-2.21-pyhd3eb1b0_0 
  pydantic           pkgs/main/linux-64::pydantic-2.11.7-py313h06a4308_0 
  pydantic-core      pkgs/main/linux-64::pydantic-core-2.33.2-py313hc6f7160_0 
  pydantic-settings  pkgs/main/linux-64::pydantic-settings-2.6.1-py313h06a4308_0 
  pygments           pkgs/main/linux-64::pygments-2.19.1-py313h06a4308_0 
  pyjwt              pkgs/main/linux-64::pyjwt-2.10.1-py313h06a4308_0 
  pysocks            pkgs/main/linux-64::pysocks-1.7.1-py313h06a4308_0 
  python             pkgs/main/linux-64::python-3.13.5-h4612cfd_100_cp313 
  python-dotenv      pkgs/main/linux-64::python-dotenv-1.1.0-py313h06a4308_0 
  python_abi         pkgs/main/linux-64::python_abi-3.13-0_cp313 
  readchar           pkgs/main/linux-64::readchar-4.0.5-py313h06a4308_0 
  readline           pkgs/main/linux-64::readline-8.3-hc2a1206_0 
  reproc             pkgs/main/linux-64::reproc-14.2.4-h6a678d5_2 
  reproc-cpp         pkgs/main/linux-64::reproc-cpp-14.2.4-h6a678d5_2 
  requests           pkgs/main/linux-64::requests-2.32.4-py313h06a4308_0 
  rich               pkgs/main/linux-64::rich-13.9.4-py313h06a4308_0 
  ruamel.yaml        pkgs/main/linux-64::ruamel.yaml-0.18.10-py313h5eee18b_0 
  ruamel.yaml.clib   pkgs/main/linux-64::ruamel.yaml.clib-0.2.12-py313h5eee18b_0 
  secretstorage      pkgs/main/linux-64::secretstorage-3.3.1-py313h06a4308_1 
  semver             pkgs/main/linux-64::semver-3.0.2-py313h06a4308_1 
  setuptools         pkgs/main/linux-64::setuptools-78.1.1-py313h06a4308_0 
  shellingham        pkgs/main/linux-64::shellingham-1.5.0-py313h06a4308_0 
  simdjson           pkgs/main/linux-64::simdjson-3.10.1-hdb19cb5_0 
  spdlog             pkgs/main/linux-64::spdlog-1.11.0-hdb19cb5_0 
  sqlite             pkgs/main/linux-64::sqlite-3.50.2-hb25bd0a_1 
  tk                 pkgs/main/linux-64::tk-8.6.15-h54e0aa7_0 
  tomli              pkgs/main/linux-64::tomli-2.2.1-py313h06a4308_0 
  tqdm               pkgs/main/linux-64::tqdm-4.67.1-py313h7040dfc_0 
  truststore         pkgs/main/linux-64::truststore-0.10.1-py313h06a4308_0 
  typer              pkgs/main/linux-64::typer-0.9.0-py313h06a4308_0 
  typing-extensions  pkgs/main/linux-64::typing-extensions-4.12.2-py313h06a4308_0 
  typing-inspection  pkgs/main/linux-64::typing-inspection-0.4.0-py313h06a4308_0 
  typing_extensions  pkgs/main/linux-64::typing_extensions-4.12.2-py313h06a4308_0 
  tzdata             pkgs/main/noarch::tzdata-2025b-h04d1e81_0 
  urllib3            pkgs/main/linux-64::urllib3-2.5.0-py313h06a4308_0 
  wheel              pkgs/main/linux-64::wheel-0.45.1-py313h06a4308_0 
  xorg-libx11        pkgs/main/linux-64::xorg-libx11-1.8.12-h9b100fa_1 
  xorg-libxau        pkgs/main/linux-64::xorg-libxau-1.0.12-h9b100fa_0 
  xorg-libxdmcp      pkgs/main/linux-64::xorg-libxdmcp-1.1.5-h9b100fa_0 
  xorg-xorgproto     pkgs/main/linux-64::xorg-xorgproto-2024.1-h5eee18b_1 
  xz                 pkgs/main/linux-64::xz-5.6.4-h5eee18b_1 
  yaml-cpp           pkgs/main/linux-64::yaml-cpp-0.8.0-h6a678d5_1 
  zlib               pkgs/main/linux-64::zlib-1.2.13-h5eee18b_1 
  zstandard          pkgs/main/linux-64::zstandard-0.23.0-py313h2c38b39_1 
  zstd               pkgs/main/linux-64::zstd-1.5.6-hc292b87_0 



Downloading and Extracting Packages:

Preparing transaction: done
Executing transaction: done
installation finished.
Do you wish to update your shell profile to automatically initialize conda?
This will activate conda on startup and change the command prompt when activated.
If you'd prefer that conda's base environment not be activated on startup,
   run the following command when conda is activated:

conda config --set auto_activate_base false

You can undo this by running `conda init --reverse $SHELL`? [yes|no]
[no] >>> yes
no change     /home/student47/miniconda3/condabin/conda
no change     /home/student47/miniconda3/bin/conda
no change     /home/student47/miniconda3/bin/conda-env
no change     /home/student47/miniconda3/bin/activate
no change     /home/student47/miniconda3/bin/deactivate
no change     /home/student47/miniconda3/etc/profile.d/conda.sh
no change     /home/student47/miniconda3/etc/fish/conf.d/conda.fish
no change     /home/student47/miniconda3/shell/condabin/Conda.psm1
no change     /home/student47/miniconda3/shell/condabin/conda-hook.ps1
no change     /home/student47/miniconda3/lib/python3.13/site-packages/xontrib/conda.xsh
no change     /home/student47/miniconda3/etc/profile.d/conda.csh
modified      /home/student47/.bashrc

==> For changes to take effect, close and re-open your current shell. <==

Thank you for installing Miniconda3!
student47@ox:~/NGS_Tutorial$ source ~/miniconda3/bin/activate
(base) student47@ox:~/NGS_Tutorial$ conda init --all
no change     /home/student47/miniconda3/condabin/conda
no change     /home/student47/miniconda3/bin/conda
no change     /home/student47/miniconda3/bin/conda-env
no change     /home/student47/miniconda3/bin/activate
no change     /home/student47/miniconda3/bin/deactivate
no change     /home/student47/miniconda3/etc/profile.d/conda.sh
no change     /home/student47/miniconda3/etc/fish/conf.d/conda.fish
no change     /home/student47/miniconda3/shell/condabin/Conda.psm1
no change     /home/student47/miniconda3/shell/condabin/conda-hook.ps1
no change     /home/student47/miniconda3/lib/python3.13/site-packages/xontrib/conda.xsh
no change     /home/student47/miniconda3/etc/profile.d/conda.csh
no change     /home/student47/.bashrc
modified      /home/student47/.zshrc
modified      /home/student47/.config/fish/config.fish
modified      /home/student47/.xonshrc
modified      /home/student47/.tcshrc

==> For changes to take effect, close and re-open your current shell. <==

(base) student47@ox:~/NGS_Tutorial$ conda config --add channels defaults
Warning: 'defaults' already in 'channels' list, moving to the top
(base) student47@ox:~/NGS_Tutorial$ conda config --add channels bioconda
(base) student47@ox:~/NGS_Tutorial$ conda config --add channels conda-forge
(base) student47@ox:~/NGS_Tutorial$ conda create --name sequencing -y

CondaToSNonInteractiveError: Terms of Service have not been accepted for the following channels. Please accept or remove them before proceeding:
    - https://repo.anaconda.com/pkgs/main
    - https://repo.anaconda.com/pkgs/r

To accept these channels' Terms of Service, run the following commands:
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

For information on safely removing channels from your conda configuration,
please see the official documentation:

    https://www.anaconda.com/docs/tools/working-with-conda/channels

(base) student47@ox:~/NGS_Tutorial$ source ~/.bashrc 
student47@ox [15:15] : ~/NGS_Tutorial $ conda activate sequencingconda activate sequencing



     
ArgumentError: activate does not accept more than one argument:
['sequencingconda', 'sequencing']


student47@ox [15:21] : ~/NGS_Tutorial $ conda install samtools bowtie2 breseq abyss bcftools wgsim emboss tree -y

CondaToSNonInteractiveError: Terms of Service have not been accepted for the following channels. Please accept or remove them before proceeding:
    - https://repo.anaconda.com/pkgs/main
    - https://repo.anaconda.com/pkgs/r

To accept these channels' Terms of Service, run the following commands:
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

For information on safely removing channels from your conda configuration,
please see the official documentation:

    https://www.anaconda.com/docs/tools/working-with-conda/channels

student47@ox [15:21] : ~/NGS_Tutorial $ 
student47@ox [15:21] : ~/NGS_Tutorial $ 
student47@ox [15:21] : ~/NGS_Tutorial $ conda activate sequencing


    
EnvironmentNameNotFound: Could not find conda environment: sequencing
You can list all discoverable environments with `conda info --envs`.


student47@ox [15:22] : ~/NGS_Tutorial $ 
student47@ox [15:22] : ~/NGS_Tutorial $ 
student47@ox [15:22] : ~/NGS_Tutorial $ conda activate sequencing

EnvironmentNameNotFound: Could not find conda environment: sequencing
You can list all discoverable environments with `conda info --envs`.


student47@ox [15:23] : ~/NGS_Tutorial $ conda install samtools bowtie2 breseq abyss bcftools wgsim emboss tree -y

CondaToSNonInteractiveError: Terms of Service have not been accepted for the following channels. Please accept or remove them before proceeding:
    - https://repo.anaconda.com/pkgs/main
    - https://repo.anaconda.com/pkgs/r

To accept these channels' Terms of Service, run the following commands:
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

For information on safely removing channels from your conda configuration,
please see the official documentation:

    https://www.anaconda.com/docs/tools/working-with-conda/channels

student47@ox [15:23] : ~/NGS_Tutorial $ conda activate sequencing

EnvironmentNameNotFound: Could not find conda environment: sequencing
You can list all discoverable environments with `conda info --envs`.


student47@ox [15:24] : ~/NGS_Tutorial $ conda activate sequencing

EnvironmentNameNotFound: Could not find conda environment: sequencing
You can list all discoverable environments with `conda info --envs`.


student47@ox [15:25] : ~/NGS_Tutorial $ conda install samtools bowtie2 breseq abyss bcftools wgsim emboss tree -y

CondaToSNonInteractiveError: Terms of Service have not been accepted for the following channels. Please accept or remove them before proceeding:
    - https://repo.anaconda.com/pkgs/main
    - https://repo.anaconda.com/pkgs/r

To accept these channels' Terms of Service, run the following commands:
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

For information on safely removing channels from your conda configuration,
please see the official documentation:

    https://www.anaconda.com/docs/tools/working-with-conda/channels

student47@ox [15:25] : ~/NGS_Tutorial $  conda create --name sequencing
Do you accept the Terms of Service (ToS) for https://repo.anaconda.com/pkgs/main? [(a)ccept/(r)eject/(v)iew]: a 
Do you accept the Terms of Service (ToS) for https://repo.anaconda.com/pkgs/r? [(a)ccept/(r)eject/(v)iew]: a
2 channel Terms of Service accepted
Retrieving notices: done
Channels:
 - conda-forge
 - bioconda
 - defaults
Platform: linux-64
Collecting package metadata (repodata.json): - 
done                              
Solving environment: done


==> WARNING: A newer version of conda exists. <==
    current version: 25.7.0
    latest version: 25.9.1

Please update conda by running

    $ conda update -n base -c defaults conda



## Package Plan ##

  environment location: /home/student47/miniconda3/envs/sequencing



Proceed ([y]/n)? 

Downloading and Extracting Packages:

Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate sequencing
#
# To deactivate an active environment, use
#
#     $ conda deactivate

student47@ox [15:36] : ~/NGS_Tutorial $ conda activate sequencing
(sequencing) student47@ox [15:36] : ~/NGS_Tutorial $ conda install samtools bowtie2 breseq abyss bcftools wgsim emboss tree -y
2 channel Terms of Service accepted
Channels:
 - conda-forge
 - bioconda
 - defaults
Platform: linux-64
Collecting package metadata (repodata.json): / conda activate sequencing
done  
Solving environment: done


==> WARNING: A newer version of conda exists. <==
    current version: 25.7.0
    latest version: 25.9.1

Please update conda by running

    $ conda update -n base -c defaults conda



## Package Plan ##

  environment location: /home/student47/miniconda3/envs/sequencing

  added / updated specs:
    - abyss
    - bcftools
    - bowtie2
    - breseq
    - emboss
    - samtools
    - tree
    - wgsim


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    _libgcc_mutex-0.1          |      conda_forge           3 KB  conda-forge
    _openmp_mutex-4.5          |            2_gnu          23 KB  conda-forge
    _r-mutex-1.0.1             |      anacondar_1           3 KB  conda-forge
    abyss-2.3.10               |       hf316886_2         1.9 MB  bioconda
    bcftools-1.22              |       h3a4d415_1         1.0 MB  bioconda
    binutils_impl_linux-64-2.44|       hdf8817f_2         3.6 MB  conda-forge
    boost-cpp-1.85.0           |       h3c6214e_4          18 KB  conda-forge
    bowtie2-2.5.4              |       he96a11b_6        14.3 MB  bioconda
    breseq-0.39.0              |       h077b44d_3         2.5 MB  bioconda
    btllib-1.7.5               |  py312h1b2be2e_0         3.2 MB  bioconda
    bwidget-1.10.1             |       ha770c72_1         127 KB  conda-forge
    bzip2-1.0.8                |       hda65f42_8         254 KB  conda-forge
    c-ares-1.34.5              |       hb9d3cd8_0         202 KB  conda-forge
    ca-certificates-2025.10.5  |       hbd8a1cb_0         152 KB  conda-forge
    cairo-1.18.4               |       h3394656_0         955 KB  conda-forge
    curl-8.14.1                |       h332b0f4_0         176 KB  conda-forge
    emboss-6.6.0               |      h0f19ade_14       157.3 MB  bioconda
    font-ttf-dejavu-sans-mono-2.37|       hab24e00_0         388 KB  conda-forge
    font-ttf-inconsolata-3.000 |       h77eed37_0          94 KB  conda-forge
    font-ttf-source-code-pro-2.038|       h77eed37_0         684 KB  conda-forge
    font-ttf-ubuntu-0.83       |       h77eed37_3         1.5 MB  conda-forge
    fontconfig-2.15.0          |       h7e30c49_1         259 KB  conda-forge
    fonts-conda-ecosystem-1    |                0           4 KB  conda-forge
    fonts-conda-forge-1        |                0           4 KB  conda-forge
    freetype-2.14.1            |       ha770c72_0         169 KB  conda-forge
    fribidi-1.0.16             |       hb03c661_0          60 KB  conda-forge
    gcc_impl_linux-64-15.2.0   |       hcacfade_7        74.2 MB  conda-forge
    gfortran_impl_linux-64-15.2.0|       h1b0a18f_7        17.6 MB  conda-forge
    graphite2-1.3.14           |       hecca717_2          97 KB  conda-forge
    gsl-2.7                    |       he838d99_0         3.2 MB  conda-forge
    gxx_impl_linux-64-15.2.0   |       h54ccb8d_7        15.5 MB  conda-forge
    harfbuzz-12.1.0            |       h15599e2_0         2.0 MB  conda-forge
    htslib-1.22.1              |       h566b1c6_0         3.1 MB  bioconda
    icu-75.1                   |       he02047a_0        11.6 MB  conda-forge
    kernel-headers_linux-64-3.10.0|      he073ed8_18         921 KB  conda-forge
    keyutils-1.6.3             |       hb9d3cd8_0         131 KB  conda-forge
    krb5-1.21.3                |       h659f571_0         1.3 MB  conda-forge
    ld_impl_linux-64-2.44      |       ha97dd6f_2         730 KB  conda-forge
    lerc-4.0.0                 |       h0aef613_1         258 KB  conda-forge
    libblas-3.9.0              |37_h4a7cf45_openblas          17 KB  conda-forge
    libboost-1.85.0            |       h0ccab89_4         2.7 MB  conda-forge
    libboost-devel-1.85.0      |       h00ab1b0_4          40 KB  conda-forge
    libboost-headers-1.85.0    |       ha770c72_4        13.3 MB  conda-forge
    libcblas-3.9.0             |37_h0358290_openblas          17 KB  conda-forge
    libcurl-8.14.1             |       h332b0f4_0         439 KB  conda-forge
    libdeflate-1.24            |       h86f0d12_0          71 KB  conda-forge
    libedit-3.1.20250104       | pl5321h7949ede_0         132 KB  conda-forge
    libev-4.33                 |       hd590300_2         110 KB  conda-forge
    libexpat-2.7.1             |       hecca717_0          73 KB  conda-forge
    libffi-3.4.6               |       h2dba641_1          56 KB  conda-forge
    libfreetype-2.14.1         |       ha770c72_0           7 KB  conda-forge
    libfreetype6-2.14.1        |       h73754d4_0         378 KB  conda-forge
    libgcc-15.2.0              |       h767d61c_7         803 KB  conda-forge
    libgcc-devel_linux-64-15.2.0|     h73f6952_107         2.6 MB  conda-forge
    libgcc-ng-15.2.0           |       h69a702a_7          29 KB  conda-forge
    libgd-2.3.3                |      h6f5c62b_11         173 KB  conda-forge
    libgfortran-15.2.0         |       h69a702a_7          29 KB  conda-forge
    libgfortran-ng-15.2.0      |       h69a702a_7          29 KB  conda-forge
    libgfortran5-15.2.0        |       hcd61629_7         1.5 MB  conda-forge
    libglib-2.86.0             |       h1fed272_0         3.8 MB  conda-forge
    libgomp-15.2.0             |       h767d61c_7         437 KB  conda-forge
    libharu-2.4.5              |       h943b412_0         586 KB  conda-forge
    libiconv-1.18              |       h3b78370_2         772 KB  conda-forge
    libjpeg-turbo-3.1.0        |       hb9d3cd8_0         614 KB  conda-forge
    liblapack-3.9.0            |37_h47877c9_openblas          17 KB  conda-forge
    liblzma-5.8.1              |       hb9d3cd8_2         110 KB  conda-forge
    liblzma-devel-5.8.1        |       hb9d3cd8_2         430 KB  conda-forge
    libnghttp2-1.67.0          |       had1ee68_0         651 KB  conda-forge
    libnsl-2.0.1               |       hb9d3cd8_1          33 KB  conda-forge
    libopenblas-0.3.30         |pthreads_h94d23a6_2         5.7 MB  conda-forge
    libpng-1.6.50              |       h421ea60_1         310 KB  conda-forge
    libsanitizer-15.2.0        |       hb13aed2_7         4.9 MB  conda-forge
    libsqlite-3.50.4           |       h0c1763c_0         911 KB  conda-forge
    libssh2-1.11.1             |       hcf80075_0         298 KB  conda-forge
    libstdcxx-15.2.0           |       h8f9b012_7         3.7 MB  conda-forge
    libstdcxx-devel_linux-64-15.2.0|     h73f6952_107        13.0 MB  conda-forge
    libstdcxx-ng-15.2.0        |       h4852527_7          29 KB  conda-forge
    libtiff-4.7.1              |       h8261f1e_0         427 KB  conda-forge
    libuuid-2.41.2             |       he9a06e4_0          36 KB  conda-forge
    libwebp-base-1.6.0         |       hd42ef1d_0         419 KB  conda-forge
    libxcb-1.17.0              |       h8a09558_0         387 KB  conda-forge
    libxcrypt-4.4.36           |       hd590300_1          98 KB  conda-forge
    libzlib-1.3.1              |       hb9d3cd8_2          60 KB  conda-forge
    lrzip-0.651                |       h32784b6_1         200 KB  bioconda
    lz4-c-1.9.4                |       hcb278e6_0         140 KB  conda-forge
    lzo-2.10                   |    h280c20c_1002         187 KB  conda-forge
    make-4.4.1                 |       hb9d3cd8_2         501 KB  conda-forge
    mpi-1.0                    |          openmpi           4 KB  conda-forge
    ncurses-6.5                |       h2d0b736_3         871 KB  conda-forge
    openmpi-4.1.6              |     hc5af2df_101         3.9 MB  conda-forge
    openssl-3.5.4              |       h26f9b46_0         3.0 MB  conda-forge
    pango-1.56.4               |       hadf4263_0         445 KB  conda-forge
    pcre2-10.46                |       h1321c63_0         1.2 MB  conda-forge
    perl-5.32.1                | 7_hd590300_perl5        12.7 MB  conda-forge
    pip-25.2                   |     pyh8b19718_0         1.1 MB  conda-forge
    pixman-0.46.4              |       h54a6638_1         440 KB  conda-forge
    pthread-stubs-0.4          |    hb9d3cd8_1002           8 KB  conda-forge
    python-3.12.12             |hfe2f287_0_cpython        30.1 MB  conda-forge
    python_abi-3.12            |          8_cp312           7 KB  conda-forge
    r-base-4.5.1               |       h14df4e6_3        26.0 MB  conda-forge
    r-cairo-1.6_5              |    r45h29dcd67_1         110 KB  conda-forge
    readline-8.2               |       h8c095d6_2         276 KB  conda-forge
    samtools-1.22.1            |       h96c455f_0         488 KB  bioconda
    sed-4.9                    |       h6688a6e_0         224 KB  conda-forge
    setuptools-80.9.0          |     pyhff2d567_0         731 KB  conda-forge
    sysroot_linux-64-2.17      |      h0157908_18        14.5 MB  conda-forge
    tk-8.6.13                  |noxft_hd72426e_102         3.1 MB  conda-forge
    tktable-2.10               |       h8d826fa_7          90 KB  conda-forge
    tree-2.2.1                 |       hb9d3cd8_0          51 KB  conda-forge
    tzdata-2025b               |       h78e105d_0         120 KB  conda-forge
    util-linux-2.40.4          |  py312h0278cd3_0         3.2 MB  conda-forge
    wgsim-1.0                  |      h577a1d6_10          21 KB  bioconda
    wheel-0.45.1               |     pyhd8ed1ab_1          61 KB  conda-forge
    xorg-libice-1.1.2          |       hb9d3cd8_0          57 KB  conda-forge
    xorg-libsm-1.2.6           |       he73a12e_0          27 KB  conda-forge
    xorg-libx11-1.8.12         |       h4f16b4b_0         816 KB  conda-forge
    xorg-libxau-1.0.12         |       hb9d3cd8_0          14 KB  conda-forge
    xorg-libxdmcp-1.1.5        |       hb9d3cd8_0          19 KB  conda-forge
    xorg-libxext-1.3.6         |       hb9d3cd8_0          49 KB  conda-forge
    xorg-libxrender-0.9.12     |       hb9d3cd8_0          32 KB  conda-forge
    xorg-libxt-1.3.1           |       hb9d3cd8_0         371 KB  conda-forge
    xz-5.8.1                   |       hbcc6ac9_2          23 KB  conda-forge
    xz-gpl-tools-5.8.1         |       hbcc6ac9_2          33 KB  conda-forge
    xz-tools-5.8.1             |       hb9d3cd8_2          94 KB  conda-forge
    zlib-1.3.1                 |       hb9d3cd8_2          90 KB  conda-forge
    zstd-1.5.7                 |       hb8e6e7a_2         554 KB  conda-forge
    ------------------------------------------------------------
                                           Total:       485.1 MB

The following NEW packages will be INSTALLED:

  _libgcc_mutex      conda-forge/linux-64::_libgcc_mutex-0.1-conda_forge 
  _openmp_mutex      conda-forge/linux-64::_openmp_mutex-4.5-2_gnu 
  _r-mutex           conda-forge/noarch::_r-mutex-1.0.1-anacondar_1 
  abyss              bioconda/linux-64::abyss-2.3.10-hf316886_2 
  bcftools           bioconda/linux-64::bcftools-1.22-h3a4d415_1 
  binutils_impl_lin~ conda-forge/linux-64::binutils_impl_linux-64-2.44-hdf8817f_2 
  boost-cpp          conda-forge/linux-64::boost-cpp-1.85.0-h3c6214e_4 
  bowtie2            bioconda/linux-64::bowtie2-2.5.4-he96a11b_6 
  breseq             bioconda/linux-64::breseq-0.39.0-h077b44d_3 
  btllib             bioconda/linux-64::btllib-1.7.5-py312h1b2be2e_0 
  bwidget            conda-forge/linux-64::bwidget-1.10.1-ha770c72_1 
  bzip2              conda-forge/linux-64::bzip2-1.0.8-hda65f42_8 
  c-ares             conda-forge/linux-64::c-ares-1.34.5-hb9d3cd8_0 
  ca-certificates    conda-forge/noarch::ca-certificates-2025.10.5-hbd8a1cb_0 
  cairo              conda-forge/linux-64::cairo-1.18.4-h3394656_0 
  curl               conda-forge/linux-64::curl-8.14.1-h332b0f4_0 
  emboss             bioconda/linux-64::emboss-6.6.0-h0f19ade_14 
  font-ttf-dejavu-s~ conda-forge/noarch::font-ttf-dejavu-sans-mono-2.37-hab24e00_0 
  font-ttf-inconsol~ conda-forge/noarch::font-ttf-inconsolata-3.000-h77eed37_0 
  font-ttf-source-c~ conda-forge/noarch::font-ttf-source-code-pro-2.038-h77eed37_0 
  font-ttf-ubuntu    conda-forge/noarch::font-ttf-ubuntu-0.83-h77eed37_3 
  fontconfig         conda-forge/linux-64::fontconfig-2.15.0-h7e30c49_1 
  fonts-conda-ecosy~ conda-forge/noarch::fonts-conda-ecosystem-1-0 
  fonts-conda-forge  conda-forge/noarch::fonts-conda-forge-1-0 
  freetype           conda-forge/linux-64::freetype-2.14.1-ha770c72_0 
  fribidi            conda-forge/linux-64::fribidi-1.0.16-hb03c661_0 
  gcc_impl_linux-64  conda-forge/linux-64::gcc_impl_linux-64-15.2.0-hcacfade_7 
  gfortran_impl_lin~ conda-forge/linux-64::gfortran_impl_linux-64-15.2.0-h1b0a18f_7 
  graphite2          conda-forge/linux-64::graphite2-1.3.14-hecca717_2 
  gsl                conda-forge/linux-64::gsl-2.7-he838d99_0 
  gxx_impl_linux-64  conda-forge/linux-64::gxx_impl_linux-64-15.2.0-h54ccb8d_7 
  harfbuzz           conda-forge/linux-64::harfbuzz-12.1.0-h15599e2_0 
  htslib             bioconda/linux-64::htslib-1.22.1-h566b1c6_0 
  icu                conda-forge/linux-64::icu-75.1-he02047a_0 
  kernel-headers_li~ conda-forge/noarch::kernel-headers_linux-64-3.10.0-he073ed8_18 
  keyutils           conda-forge/linux-64::keyutils-1.6.3-hb9d3cd8_0 
  krb5               conda-forge/linux-64::krb5-1.21.3-h659f571_0 
  ld_impl_linux-64   conda-forge/linux-64::ld_impl_linux-64-2.44-ha97dd6f_2 
  lerc               conda-forge/linux-64::lerc-4.0.0-h0aef613_1 
  libblas            conda-forge/linux-64::libblas-3.9.0-37_h4a7cf45_openblas 
  libboost           conda-forge/linux-64::libboost-1.85.0-h0ccab89_4 
  libboost-devel     conda-forge/linux-64::libboost-devel-1.85.0-h00ab1b0_4 
  libboost-headers   conda-forge/linux-64::libboost-headers-1.85.0-ha770c72_4 
  libcblas           conda-forge/linux-64::libcblas-3.9.0-37_h0358290_openblas 
  libcurl            conda-forge/linux-64::libcurl-8.14.1-h332b0f4_0 
  libdeflate         conda-forge/linux-64::libdeflate-1.24-h86f0d12_0 
  libedit            conda-forge/linux-64::libedit-3.1.20250104-pl5321h7949ede_0 
  libev              conda-forge/linux-64::libev-4.33-hd590300_2 
  libexpat           conda-forge/linux-64::libexpat-2.7.1-hecca717_0 
  libffi             conda-forge/linux-64::libffi-3.4.6-h2dba641_1 
  libfreetype        conda-forge/linux-64::libfreetype-2.14.1-ha770c72_0 
  libfreetype6       conda-forge/linux-64::libfreetype6-2.14.1-h73754d4_0 
  libgcc             conda-forge/linux-64::libgcc-15.2.0-h767d61c_7 
  libgcc-devel_linu~ conda-forge/noarch::libgcc-devel_linux-64-15.2.0-h73f6952_107 
  libgcc-ng          conda-forge/linux-64::libgcc-ng-15.2.0-h69a702a_7 
  libgd              conda-forge/linux-64::libgd-2.3.3-h6f5c62b_11 
  libgfortran        conda-forge/linux-64::libgfortran-15.2.0-h69a702a_7 
  libgfortran-ng     conda-forge/linux-64::libgfortran-ng-15.2.0-h69a702a_7 
  libgfortran5       conda-forge/linux-64::libgfortran5-15.2.0-hcd61629_7 
  libglib            conda-forge/linux-64::libglib-2.86.0-h1fed272_0 
  libgomp            conda-forge/linux-64::libgomp-15.2.0-h767d61c_7 
  libharu            conda-forge/linux-64::libharu-2.4.5-h943b412_0 
  libiconv           conda-forge/linux-64::libiconv-1.18-h3b78370_2 
  libjpeg-turbo      conda-forge/linux-64::libjpeg-turbo-3.1.0-hb9d3cd8_0 
  liblapack          conda-forge/linux-64::liblapack-3.9.0-37_h47877c9_openblas 
  liblzma            conda-forge/linux-64::liblzma-5.8.1-hb9d3cd8_2 
  liblzma-devel      conda-forge/linux-64::liblzma-devel-5.8.1-hb9d3cd8_2 
  libnghttp2         conda-forge/linux-64::libnghttp2-1.67.0-had1ee68_0 
  libnsl             conda-forge/linux-64::libnsl-2.0.1-hb9d3cd8_1 
  libopenblas        conda-forge/linux-64::libopenblas-0.3.30-pthreads_h94d23a6_2 
  libpng             conda-forge/linux-64::libpng-1.6.50-h421ea60_1 
  libsanitizer       conda-forge/linux-64::libsanitizer-15.2.0-hb13aed2_7 
  libsqlite          conda-forge/linux-64::libsqlite-3.50.4-h0c1763c_0 
  libssh2            conda-forge/linux-64::libssh2-1.11.1-hcf80075_0 
  libstdcxx          conda-forge/linux-64::libstdcxx-15.2.0-h8f9b012_7 
  libstdcxx-devel_l~ conda-forge/noarch::libstdcxx-devel_linux-64-15.2.0-h73f6952_107 
  libstdcxx-ng       conda-forge/linux-64::libstdcxx-ng-15.2.0-h4852527_7 
  libtiff            conda-forge/linux-64::libtiff-4.7.1-h8261f1e_0 
  libuuid            conda-forge/linux-64::libuuid-2.41.2-he9a06e4_0 
  libwebp-base       conda-forge/linux-64::libwebp-base-1.6.0-hd42ef1d_0 
  libxcb             conda-forge/linux-64::libxcb-1.17.0-h8a09558_0 
  libxcrypt          conda-forge/linux-64::libxcrypt-4.4.36-hd590300_1 
  libzlib            conda-forge/linux-64::libzlib-1.3.1-hb9d3cd8_2 
  lrzip              bioconda/linux-64::lrzip-0.651-h32784b6_1 
  lz4-c              conda-forge/linux-64::lz4-c-1.9.4-hcb278e6_0 
  lzo                conda-forge/linux-64::lzo-2.10-h280c20c_1002 
  make               conda-forge/linux-64::make-4.4.1-hb9d3cd8_2 
  mpi                conda-forge/linux-64::mpi-1.0-openmpi 
  ncurses            conda-forge/linux-64::ncurses-6.5-h2d0b736_3 
  openmpi            conda-forge/linux-64::openmpi-4.1.6-hc5af2df_101 
  openssl            conda-forge/linux-64::openssl-3.5.4-h26f9b46_0 
  pango              conda-forge/linux-64::pango-1.56.4-hadf4263_0 
  pcre2              conda-forge/linux-64::pcre2-10.46-h1321c63_0 
  perl               conda-forge/linux-64::perl-5.32.1-7_hd590300_perl5 
  pip                conda-forge/noarch::pip-25.2-pyh8b19718_0 
  pixman             conda-forge/linux-64::pixman-0.46.4-h54a6638_1 
  pthread-stubs      conda-forge/linux-64::pthread-stubs-0.4-hb9d3cd8_1002 
  python             conda-forge/linux-64::python-3.12.12-hfe2f287_0_cpython 
  python_abi         conda-forge/noarch::python_abi-3.12-8_cp312 
  r-base             conda-forge/linux-64::r-base-4.5.1-h14df4e6_3 
  r-cairo            conda-forge/linux-64::r-cairo-1.6_5-r45h29dcd67_1 
  readline           conda-forge/linux-64::readline-8.2-h8c095d6_2 
  samtools           bioconda/linux-64::samtools-1.22.1-h96c455f_0 
  sed                conda-forge/linux-64::sed-4.9-h6688a6e_0 
  setuptools         conda-forge/noarch::setuptools-80.9.0-pyhff2d567_0 
  sysroot_linux-64   conda-forge/noarch::sysroot_linux-64-2.17-h0157908_18 
  tk                 conda-forge/linux-64::tk-8.6.13-noxft_hd72426e_102 
  tktable            conda-forge/linux-64::tktable-2.10-h8d826fa_7 
  tree               conda-forge/linux-64::tree-2.2.1-hb9d3cd8_0 
  tzdata             conda-forge/noarch::tzdata-2025b-h78e105d_0 
  util-linux         conda-forge/linux-64::util-linux-2.40.4-py312h0278cd3_0 
  wgsim              bioconda/linux-64::wgsim-1.0-h577a1d6_10 
  wheel              conda-forge/noarch::wheel-0.45.1-pyhd8ed1ab_1 
  xorg-libice        conda-forge/linux-64::xorg-libice-1.1.2-hb9d3cd8_0 
  xorg-libsm         conda-forge/linux-64::xorg-libsm-1.2.6-he73a12e_0 
  xorg-libx11        conda-forge/linux-64::xorg-libx11-1.8.12-h4f16b4b_0 
  xorg-libxau        conda-forge/linux-64::xorg-libxau-1.0.12-hb9d3cd8_0 
  xorg-libxdmcp      conda-forge/linux-64::xorg-libxdmcp-1.1.5-hb9d3cd8_0 
  xorg-libxext       conda-forge/linux-64::xorg-libxext-1.3.6-hb9d3cd8_0 
  xorg-libxrender    conda-forge/linux-64::xorg-libxrender-0.9.12-hb9d3cd8_0 
  xorg-libxt         conda-forge/linux-64::xorg-libxt-1.3.1-hb9d3cd8_0 
  xz                 conda-forge/linux-64::xz-5.8.1-hbcc6ac9_2 
  xz-gpl-tools       conda-forge/linux-64::xz-gpl-tools-5.8.1-hbcc6ac9_2 
  xz-tools           conda-forge/linux-64::xz-tools-5.8.1-hb9d3cd8_2 
  zlib               conda-forge/linux-64::zlib-1.3.1-hb9d3cd8_2 
  zstd               conda-forge/linux-64::zstd-1.5.7-hb8e6e7a_2 



Downloading and Extracting Packages:
                                                                                                                         
Preparing transaction: done                                                                                              
Verifying transaction: done                                                                                              
Executing transaction: |                                                                                                 
For Linux 64, Open MPI is built with CUDA awareness but this support is disabled by default.                             
To enable it, please set the environment variable OMPI_MCA_opal_cuda_support=true before                                 
launching your MPI processes. Equivalently, you can set the MCA parameter in the command line:                           
mpiexec --mca opal_cuda_support 1 ...                                                                                    
                                                                                                                         
In addition, the UCX support is also built but disabled by default.                                                      
To enable it, first install UCX (conda install -c conda-forge ucx). Then, set the environment                            
variables OMPI_MCA_pml="ucx" OMPI_MCA_osc="ucx" before launching your MPI processes.                                     
Equivalently, you can set the MCA parameters in the command line:                                                        
mpiexec --mca pml ucx --mca osc ucx ...                                                                                  
Note that you might also need to set UCX_MEMTYPE_CACHE=n for CUDA awareness via UCX.                                     
Please consult UCX's documentation for detail.                                                                           
                                                                                                                         
                                                                                                                         
done                                                                                                                     
(sequencing) student47@ox [15:42] : ~/NGS_Tutorial $ conda activate sequencing                                           
(sequencing) student47@ox [15:42] : ~/NGS_Tutorial $ conda activate sequencing                                           
(sequencing) student47@ox [15:43] : ~/NGS_Tutorial $ conda list                                                          
# packages in environment at /home/student47/miniconda3/envs/sequencing:                                                 
#                                                                                                                        
# Name                       Version          Build                 Channel                                              
_libgcc_mutex                0.1              conda_forge           conda-forge                                          
_openmp_mutex                4.5              2_gnu                 conda-forge                                          
_r-mutex                     1.0.1            anacondar_1           conda-forge                                          
abyss                        2.3.10           hf316886_2            bioconda                                             
bcftools                     1.22             h3a4d415_1            bioconda                                             
binutils_impl_linux-64       2.44             hdf8817f_2            conda-forge                                          
boost-cpp                    1.85.0           h3c6214e_4            conda-forge                                          
bowtie2                      2.5.4            he96a11b_6            bioconda
breseq                       0.39.0           h077b44d_3            bioconda
btllib                       1.7.5            py312h1b2be2e_0       bioconda
bwidget                      1.10.1           ha770c72_1            conda-forge
bzip2                        1.0.8            hda65f42_8            conda-forge
c-ares                       1.34.5           hb9d3cd8_0            conda-forge
ca-certificates              2025.10.5        hbd8a1cb_0            conda-forge
cairo                        1.18.4           h3394656_0            conda-forge
curl                         8.14.1           h332b0f4_0            conda-forge
emboss                       6.6.0            h0f19ade_14           bioconda
font-ttf-dejavu-sans-mono    2.37             hab24e00_0            conda-forge
font-ttf-inconsolata         3.000            h77eed37_0            conda-forge
font-ttf-source-code-pro     2.038            h77eed37_0            conda-forge
font-ttf-ubuntu              0.83             h77eed37_3            conda-forge
fontconfig                   2.15.0           h7e30c49_1            conda-forge
fonts-conda-ecosystem        1                0                     conda-forge
fonts-conda-forge            1                0                     conda-forge
freetype                     2.14.1           ha770c72_0            conda-forge
fribidi                      1.0.16           hb03c661_0            conda-forge
gcc_impl_linux-64            15.2.0           hcacfade_7            conda-forge
gfortran_impl_linux-64       15.2.0           h1b0a18f_7            conda-forge
graphite2                    1.3.14           hecca717_2            conda-forge
gsl                          2.7              he838d99_0            conda-forge
gxx_impl_linux-64            15.2.0           h54ccb8d_7            conda-forge
harfbuzz                     12.1.0           h15599e2_0            conda-forge
htslib                       1.22.1           h566b1c6_0            bioconda
icu                          75.1             he02047a_0            conda-forge
kernel-headers_linux-64      3.10.0           he073ed8_18           conda-forge
keyutils                     1.6.3            hb9d3cd8_0            conda-forge
krb5                         1.21.3           h659f571_0            conda-forge
ld_impl_linux-64             2.44             ha97dd6f_2            conda-forge
lerc                         4.0.0            h0aef613_1            conda-forge
libblas                      3.9.0            37_h4a7cf45_openblas  conda-forge
libboost                     1.85.0           h0ccab89_4            conda-forge
libboost-devel               1.85.0           h00ab1b0_4            conda-forge
libboost-headers             1.85.0           ha770c72_4            conda-forge
libcblas                     3.9.0            37_h0358290_openblas  conda-forge
libcurl                      8.14.1           h332b0f4_0            conda-forge
libdeflate                   1.24             h86f0d12_0            conda-forge
libedit                      3.1.20250104     pl5321h7949ede_0      conda-forge
libev                        4.33             hd590300_2            conda-forge
libexpat                     2.7.1            hecca717_0            conda-forge
libffi                       3.4.6            h2dba641_1            conda-forge
libfreetype                  2.14.1           ha770c72_0            conda-forge
libfreetype6                 2.14.1           h73754d4_0            conda-forge
libgcc                       15.2.0           h767d61c_7            conda-forge
libgcc-devel_linux-64        15.2.0           h73f6952_107          conda-forge
libgcc-ng                    15.2.0           h69a702a_7            conda-forge
libgd                        2.3.3            h6f5c62b_11           conda-forge
libgfortran                  15.2.0           h69a702a_7            conda-forge
libgfortran-ng               15.2.0           h69a702a_7            conda-forge
libgfortran5                 15.2.0           hcd61629_7            conda-forge
libglib                      2.86.0           h1fed272_0            conda-forge
libgomp                      15.2.0           h767d61c_7            conda-forge
libharu                      2.4.5            h943b412_0            conda-forge
libiconv                     1.18             h3b78370_2            conda-forge
libjpeg-turbo                3.1.0            hb9d3cd8_0            conda-forge
liblapack                    3.9.0            37_h47877c9_openblas  conda-forge
liblzma                      5.8.1            hb9d3cd8_2            conda-forge
liblzma-devel                5.8.1            hb9d3cd8_2            conda-forge
libnghttp2                   1.67.0           had1ee68_0            conda-forge
libnsl                       2.0.1            hb9d3cd8_1            conda-forge
libopenblas                  0.3.30           pthreads_h94d23a6_2   conda-forge
libpng                       1.6.50           h421ea60_1            conda-forge
libsanitizer                 15.2.0           hb13aed2_7            conda-forge
libsqlite                    3.50.4           h0c1763c_0            conda-forge
libssh2                      1.11.1           hcf80075_0            conda-forge
libstdcxx                    15.2.0           h8f9b012_7            conda-forge
libstdcxx-devel_linux-64     15.2.0           h73f6952_107          conda-forge
libstdcxx-ng                 15.2.0           h4852527_7            conda-forge
libtiff                      4.7.1            h8261f1e_0            conda-forge
libuuid                      2.41.2           he9a06e4_0            conda-forge
libwebp-base                 1.6.0            hd42ef1d_0            conda-forge
libxcb                       1.17.0           h8a09558_0            conda-forge
libxcrypt                    4.4.36           hd590300_1            conda-forge
libzlib                      1.3.1            hb9d3cd8_2            conda-forge
lrzip                        0.651            h32784b6_1            bioconda
lz4-c                        1.9.4            hcb278e6_0            conda-forge
lzo                          2.10             h280c20c_1002         conda-forge
make                         4.4.1            hb9d3cd8_2            conda-forge
mpi                          1.0              openmpi               conda-forge
ncurses                      6.5              h2d0b736_3            conda-forge
openmpi                      4.1.6            hc5af2df_101          conda-forge
openssl                      3.5.4            h26f9b46_0            conda-forge
pango                        1.56.4           hadf4263_0            conda-forge
pcre2                        10.46            h1321c63_0            conda-forge
perl                         5.32.1           7_hd590300_perl5      conda-forge
pip                          25.2             pyh8b19718_0          conda-forge
pixman                       0.46.4           h54a6638_1            conda-forge
pthread-stubs                0.4              hb9d3cd8_1002         conda-forge
python                       3.12.12          hfe2f287_0_cpython    conda-forge
python_abi                   3.12             8_cp312               conda-forge
r-base                       4.5.1            h14df4e6_3            conda-forge
r-cairo                      1.6_5            r45h29dcd67_1         conda-forge
readline                     8.2              h8c095d6_2            conda-forge
samtools                     1.22.1           h96c455f_0            bioconda
sed                          4.9              h6688a6e_0            conda-forge
setuptools                   80.9.0           pyhff2d567_0          conda-forge
sysroot_linux-64             2.17             h0157908_18           conda-forge
tk                           8.6.13           noxft_hd72426e_102    conda-forge
tktable                      2.10             h8d826fa_7            conda-forge
tree                         2.2.1            hb9d3cd8_0            conda-forge
tzdata                       2025b            h78e105d_0            conda-forge
util-linux                   2.40.4           py312h0278cd3_0       conda-forge
wgsim                        1.0              h577a1d6_10           bioconda
wheel                        0.45.1           pyhd8ed1ab_1          conda-forge
xorg-libice                  1.1.2            hb9d3cd8_0            conda-forge
xorg-libsm                   1.2.6            he73a12e_0            conda-forge
xorg-libx11                  1.8.12           h4f16b4b_0            conda-forge
xorg-libxau                  1.0.12           hb9d3cd8_0            conda-forge
xorg-libxdmcp                1.1.5            hb9d3cd8_0            conda-forge
xorg-libxext                 1.3.6            hb9d3cd8_0            conda-forge
xorg-libxrender              0.9.12           hb9d3cd8_0            conda-forge
xorg-libxt                   1.3.1            hb9d3cd8_0            conda-forge
xz                           5.8.1            hbcc6ac9_2            conda-forge
xz-gpl-tools                 5.8.1            hbcc6ac9_2            conda-forge
xz-tools                     5.8.1            hb9d3cd8_2            conda-forge
zlib                         1.3.1            hb9d3cd8_2            conda-forge
zstd                         1.5.7            hb8e6e7a_2            conda-forge
(sequencing) student47@ox [15:43] : ~/NGS_Tutorial $ hhhbgRead from remote host 129.16.45.154: Operation timed out
Connection to 129.16.45.154 closed.
client_loop: send disconnect: Broken pipe
(base) Youssras-MacBook-Air:~ youssrasemlali$ ssh student47@129.16.45.154
student47@129.16.45.154's password: 
Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 4.15.0-213-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

			 ====#### !! WARNING: LESS THAN 100 GB free on /home !! #### ====

Last login: Mon Oct 20 14:48:08 2025 from 31.94.56.119
student47@ox:~$ cd NGS_Tutorial
student47@ox:~/NGS_Tutorial$ tree data
data
├── ref
│   └── varicella.gb
└── seq
    ├── varicella1.fastq
    ├── varicella2.fastq
    ├── varicella_l1.fastq
    ├── varicella_l2.fastq
    ├── varicella_mut1.fastq
    └── varicella_mut2.fastq

2 directories, 7 files
student47@ox:~/NGS_Tutorial$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
--2025-10-20 16:07:36--  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
Resolving repo.anaconda.com (repo.anaconda.com)... 104.16.191.158, 104.16.32.241, 2606:4700::6810:20f1, ...
Connecting to repo.anaconda.com (repo.anaconda.com)|104.16.191.158|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 162129736 (155M) [application/octet-stream]
Saving to: ‘Miniconda3-latest-Linux-x86_64.sh.1’

Miniconda3-latest-Linux-x86_64 100%[=================================================>] 154,62M   110MB/s    in 1,4s    

2025-10-20 16:07:38 (110 MB/s) - ‘Miniconda3-latest-Linux-x86_64.sh.1’ saved [162129736/162129736]

student47@ox:~/NGS_Tutorial$ chmod u+x Miniconda3-latest-Linux-x86_64.sh
student47@ox:~/NGS_Tutorial$ ./Miniconda3-latest-Linux-x86_64.sh

Welcome to Miniconda3 py313_25.7.0-2

In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue
>>> 
MINICONDA END USER LICENSE AGREEMENT

Copyright Notice: Miniconda(R) (C) 2015, Anaconda, Inc.
All rights reserved. Miniconda(R) is licensed, not sold.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the followin
g conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following discl
aimer;

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following di
sclaimer in the documentation and/or other materials provided with the distribution;

3. The name Anaconda, Inc. or Miniconda(R) may not be used to endorse or promote products derived from this software with
out specific prior written permission from Anaconda, Inc.; and

4. Miniconda(R) may not be used to access or allow third parties to access Anaconda package repositories if such use woul
d circumvent paid licensing requirements or is otherwise restricted by the Anaconda Terms of Service.

DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ANACONDA "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMIT
ED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE , AND NON-INFRINGEMENT ARE DISCLAIMED.
 IN NO EVENT SHALL ANACONDA BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS I
NTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEG
LIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF MINICONDA(R), EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAG
E.


Do you accept the license terms? [yes|no]
>>> yes

Miniconda3 will now be installed into this location:
/home/student47/miniconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/student47/miniconda3] >>> 
ERROR: File or directory already exists: '/home/student47/miniconda3'
If you want to update an existing installation, use the -u option.
student47@ox:~/NGS_Tutorial$ source ~/miniconda3/bin/activate
(base) student47@ox:~/NGS_Tutorial$ conda init --all
no change     /home/student47/miniconda3/condabin/conda
no change     /home/student47/miniconda3/bin/conda
no change     /home/student47/miniconda3/bin/conda-env
no change     /home/student47/miniconda3/bin/activate
no change     /home/student47/miniconda3/bin/deactivate
no change     /home/student47/miniconda3/etc/profile.d/conda.sh
no change     /home/student47/miniconda3/etc/fish/conf.d/conda.fish
no change     /home/student47/miniconda3/shell/condabin/Conda.psm1
no change     /home/student47/miniconda3/shell/condabin/conda-hook.ps1
no change     /home/student47/miniconda3/lib/python3.13/site-packages/xontrib/conda.xsh
no change     /home/student47/miniconda3/etc/profile.d/conda.csh
no change     /home/student47/.bashrc
no change     /home/student47/.zshrc
no change     /home/student47/.config/fish/config.fish
no change     /home/student47/.xonshrc
no change     /home/student47/.tcshrc
No action taken.
(base) student47@ox:~/NGS_Tutorial$ conda config --add channels defaults
Warning: 'defaults' already in 'channels' list, moving to the top
(base) student47@ox:~/NGS_Tutorial$ 
(base) student47@ox:~/NGS_Tutorial$ conda config --add channels bioconda
Warning: 'bioconda' already in 'channels' list, moving to the top
(base) student47@ox:~/NGS_Tutorial$ conda config --add channels conda-forge
Warning: 'conda-forge' already in 'channels' list, moving to the top
(base) student47@ox:~/NGS_Tutorial$ conda create --name sequencing
2 channel Terms of Service accepted
WARNING: A conda environment already exists at '/home/student47/miniconda3/envs/sequencing'

Remove existing environment?
This will remove ALL directories contained within this specified prefix directory, including any other conda environments.

 (y/[n])? y

Channels:
 - conda-forge
 - bioconda
 - defaults
Platform: linux-64
Collecting package metadata (repodata.json): done
Solving environment: done


==> WARNING: A newer version of conda exists. <==
    current version: 25.7.0
    latest version: 25.9.1

Please update conda by running

    $ conda update -n base -c defaults conda



## Package Plan ##

  environment location: /home/student47/miniconda3/envs/sequencing



Proceed ([y]/n)? y


Downloading and Extracting Packages:

Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate sequencing
#
# To deactivate an active environment, use
#
#     $ conda deactivate

(base) student47@ox:~/NGS_Tutorial$ conda activate sequencing
(sequencing) student47@ox:~/NGS_Tutorial$ conda install samtools bowtie2 breseq abyss bcftools wgsim emboss tree -y
2 channel Terms of Service accepted
Channels:
 - conda-forge
 - bioconda
 - defaults
Platform: linux-64
Collecting package metadata (repodata.json): done
Solving environment: done


==> WARNING: A newer version of conda exists. <==
    current version: 25.7.0
    latest version: 25.9.1

Please update conda by running

    $ conda update -n base -c defaults conda



## Package Plan ##

  environment location: /home/student47/miniconda3/envs/sequencing

  added / updated specs:
    - abyss
    - bcftools
    - bowtie2
    - breseq
    - emboss
    - samtools
    - tree
    - wgsim


The following NEW packages will be INSTALLED:

  _libgcc_mutex      conda-forge/linux-64::_libgcc_mutex-0.1-conda_forge 
  _openmp_mutex      conda-forge/linux-64::_openmp_mutex-4.5-2_gnu 
  _r-mutex           conda-forge/noarch::_r-mutex-1.0.1-anacondar_1 
  abyss              bioconda/linux-64::abyss-2.3.10-hf316886_2 
  bcftools           bioconda/linux-64::bcftools-1.22-h3a4d415_1 
  binutils_impl_lin~ conda-forge/linux-64::binutils_impl_linux-64-2.44-hdf8817f_2 
  boost-cpp          conda-forge/linux-64::boost-cpp-1.85.0-h3c6214e_4 
  bowtie2            bioconda/linux-64::bowtie2-2.5.4-he96a11b_6 
  breseq             bioconda/linux-64::breseq-0.39.0-h077b44d_3 
  btllib             bioconda/linux-64::btllib-1.7.5-py312h1b2be2e_0 
  bwidget            conda-forge/linux-64::bwidget-1.10.1-ha770c72_1 
  bzip2              conda-forge/linux-64::bzip2-1.0.8-hda65f42_8 
  c-ares             conda-forge/linux-64::c-ares-1.34.5-hb9d3cd8_0 
  ca-certificates    conda-forge/noarch::ca-certificates-2025.10.5-hbd8a1cb_0 
  cairo              conda-forge/linux-64::cairo-1.18.4-h3394656_0 
  curl               conda-forge/linux-64::curl-8.14.1-h332b0f4_0 
  emboss             bioconda/linux-64::emboss-6.6.0-h0f19ade_14 
  font-ttf-dejavu-s~ conda-forge/noarch::font-ttf-dejavu-sans-mono-2.37-hab24e00_0 
  font-ttf-inconsol~ conda-forge/noarch::font-ttf-inconsolata-3.000-h77eed37_0 
  font-ttf-source-c~ conda-forge/noarch::font-ttf-source-code-pro-2.038-h77eed37_0 
  font-ttf-ubuntu    conda-forge/noarch::font-ttf-ubuntu-0.83-h77eed37_3 
  fontconfig         conda-forge/linux-64::fontconfig-2.15.0-h7e30c49_1 
  fonts-conda-ecosy~ conda-forge/noarch::fonts-conda-ecosystem-1-0 
  fonts-conda-forge  conda-forge/noarch::fonts-conda-forge-1-0 
  freetype           conda-forge/linux-64::freetype-2.14.1-ha770c72_0 
  fribidi            conda-forge/linux-64::fribidi-1.0.16-hb03c661_0 
  gcc_impl_linux-64  conda-forge/linux-64::gcc_impl_linux-64-15.2.0-hcacfade_7 
  gfortran_impl_lin~ conda-forge/linux-64::gfortran_impl_linux-64-15.2.0-h1b0a18f_7 
  graphite2          conda-forge/linux-64::graphite2-1.3.14-hecca717_2 
  gsl                conda-forge/linux-64::gsl-2.7-he838d99_0 
  gxx_impl_linux-64  conda-forge/linux-64::gxx_impl_linux-64-15.2.0-h54ccb8d_7 
  harfbuzz           conda-forge/linux-64::harfbuzz-12.1.0-h15599e2_0 
  htslib             bioconda/linux-64::htslib-1.22.1-h566b1c6_0 
  icu                conda-forge/linux-64::icu-75.1-he02047a_0 
  kernel-headers_li~ conda-forge/noarch::kernel-headers_linux-64-3.10.0-he073ed8_18 
  keyutils           conda-forge/linux-64::keyutils-1.6.3-hb9d3cd8_0 
  krb5               conda-forge/linux-64::krb5-1.21.3-h659f571_0 
  ld_impl_linux-64   conda-forge/linux-64::ld_impl_linux-64-2.44-ha97dd6f_2 
  lerc               conda-forge/linux-64::lerc-4.0.0-h0aef613_1 
  libblas            conda-forge/linux-64::libblas-3.9.0-37_h4a7cf45_openblas 
  libboost           conda-forge/linux-64::libboost-1.85.0-h0ccab89_4 
  libboost-devel     conda-forge/linux-64::libboost-devel-1.85.0-h00ab1b0_4 
  libboost-headers   conda-forge/linux-64::libboost-headers-1.85.0-ha770c72_4 
  libcblas           conda-forge/linux-64::libcblas-3.9.0-37_h0358290_openblas 
  libcurl            conda-forge/linux-64::libcurl-8.14.1-h332b0f4_0 
  libdeflate         conda-forge/linux-64::libdeflate-1.24-h86f0d12_0 
  libedit            conda-forge/linux-64::libedit-3.1.20250104-pl5321h7949ede_0 
  libev              conda-forge/linux-64::libev-4.33-hd590300_2 
  libexpat           conda-forge/linux-64::libexpat-2.7.1-hecca717_0 
  libffi             conda-forge/linux-64::libffi-3.4.6-h2dba641_1 
  libfreetype        conda-forge/linux-64::libfreetype-2.14.1-ha770c72_0 
  libfreetype6       conda-forge/linux-64::libfreetype6-2.14.1-h73754d4_0 
  libgcc             conda-forge/linux-64::libgcc-15.2.0-h767d61c_7 
  libgcc-devel_linu~ conda-forge/noarch::libgcc-devel_linux-64-15.2.0-h73f6952_107 
  libgcc-ng          conda-forge/linux-64::libgcc-ng-15.2.0-h69a702a_7 
  libgd              conda-forge/linux-64::libgd-2.3.3-h6f5c62b_11 
  libgfortran        conda-forge/linux-64::libgfortran-15.2.0-h69a702a_7 
  libgfortran-ng     conda-forge/linux-64::libgfortran-ng-15.2.0-h69a702a_7 
  libgfortran5       conda-forge/linux-64::libgfortran5-15.2.0-hcd61629_7 
  libglib            conda-forge/linux-64::libglib-2.86.0-h1fed272_0 
  libgomp            conda-forge/linux-64::libgomp-15.2.0-h767d61c_7 
  libharu            conda-forge/linux-64::libharu-2.4.5-h943b412_0 
  libiconv           conda-forge/linux-64::libiconv-1.18-h3b78370_2 
  libjpeg-turbo      conda-forge/linux-64::libjpeg-turbo-3.1.0-hb9d3cd8_0 
  liblapack          conda-forge/linux-64::liblapack-3.9.0-37_h47877c9_openblas 
  liblzma            conda-forge/linux-64::liblzma-5.8.1-hb9d3cd8_2 
  liblzma-devel      conda-forge/linux-64::liblzma-devel-5.8.1-hb9d3cd8_2 
  libnghttp2         conda-forge/linux-64::libnghttp2-1.67.0-had1ee68_0 
  libnsl             conda-forge/linux-64::libnsl-2.0.1-hb9d3cd8_1 
  libopenblas        conda-forge/linux-64::libopenblas-0.3.30-pthreads_h94d23a6_2 
  libpng             conda-forge/linux-64::libpng-1.6.50-h421ea60_1 
  libsanitizer       conda-forge/linux-64::libsanitizer-15.2.0-hb13aed2_7 
  libsqlite          conda-forge/linux-64::libsqlite-3.50.4-h0c1763c_0 
  libssh2            conda-forge/linux-64::libssh2-1.11.1-hcf80075_0 
  libstdcxx          conda-forge/linux-64::libstdcxx-15.2.0-h8f9b012_7 
  libstdcxx-devel_l~ conda-forge/noarch::libstdcxx-devel_linux-64-15.2.0-h73f6952_107 
  libstdcxx-ng       conda-forge/linux-64::libstdcxx-ng-15.2.0-h4852527_7 
  libtiff            conda-forge/linux-64::libtiff-4.7.1-h8261f1e_0 
  libuuid            conda-forge/linux-64::libuuid-2.41.2-he9a06e4_0 
  libwebp-base       conda-forge/linux-64::libwebp-base-1.6.0-hd42ef1d_0 
  libxcb             conda-forge/linux-64::libxcb-1.17.0-h8a09558_0 
  libxcrypt          conda-forge/linux-64::libxcrypt-4.4.36-hd590300_1 
  libzlib            conda-forge/linux-64::libzlib-1.3.1-hb9d3cd8_2 
  lrzip              bioconda/linux-64::lrzip-0.651-h32784b6_1 
  lz4-c              conda-forge/linux-64::lz4-c-1.9.4-hcb278e6_0 
  lzo                conda-forge/linux-64::lzo-2.10-h280c20c_1002 
  make               conda-forge/linux-64::make-4.4.1-hb9d3cd8_2 
  mpi                conda-forge/linux-64::mpi-1.0-openmpi 
  ncurses            conda-forge/linux-64::ncurses-6.5-h2d0b736_3 
  openmpi            conda-forge/linux-64::openmpi-4.1.6-hc5af2df_101 
  openssl            conda-forge/linux-64::openssl-3.5.4-h26f9b46_0 
  pango              conda-forge/linux-64::pango-1.56.4-hadf4263_0 
  pcre2              conda-forge/linux-64::pcre2-10.46-h1321c63_0 
  perl               conda-forge/linux-64::perl-5.32.1-7_hd590300_perl5 
  pip                conda-forge/noarch::pip-25.2-pyh8b19718_0 
  pixman             conda-forge/linux-64::pixman-0.46.4-h54a6638_1 
  pthread-stubs      conda-forge/linux-64::pthread-stubs-0.4-hb9d3cd8_1002 
  python             conda-forge/linux-64::python-3.12.12-hfe2f287_0_cpython 
  python_abi         conda-forge/noarch::python_abi-3.12-8_cp312 
  r-base             conda-forge/linux-64::r-base-4.5.1-h14df4e6_3 
  r-cairo            conda-forge/linux-64::r-cairo-1.6_5-r45h29dcd67_1 
  readline           conda-forge/linux-64::readline-8.2-h8c095d6_2 
  samtools           bioconda/linux-64::samtools-1.22.1-h96c455f_0 
  sed                conda-forge/linux-64::sed-4.9-h6688a6e_0 
  setuptools         conda-forge/noarch::setuptools-80.9.0-pyhff2d567_0 
  sysroot_linux-64   conda-forge/noarch::sysroot_linux-64-2.17-h0157908_18 
  tk                 conda-forge/linux-64::tk-8.6.13-noxft_hd72426e_102 
  tktable            conda-forge/linux-64::tktable-2.10-h8d826fa_7 
  tree               conda-forge/linux-64::tree-2.2.1-hb9d3cd8_0 
  tzdata             conda-forge/noarch::tzdata-2025b-h78e105d_0 
  util-linux         conda-forge/linux-64::util-linux-2.40.4-py312h0278cd3_0 
  wgsim              bioconda/linux-64::wgsim-1.0-h577a1d6_10 
  wheel              conda-forge/noarch::wheel-0.45.1-pyhd8ed1ab_1 
  xorg-libice        conda-forge/linux-64::xorg-libice-1.1.2-hb9d3cd8_0 
  xorg-libsm         conda-forge/linux-64::xorg-libsm-1.2.6-he73a12e_0 
  xorg-libx11        conda-forge/linux-64::xorg-libx11-1.8.12-h4f16b4b_0 
  xorg-libxau        conda-forge/linux-64::xorg-libxau-1.0.12-hb9d3cd8_0 
  xorg-libxdmcp      conda-forge/linux-64::xorg-libxdmcp-1.1.5-hb9d3cd8_0 
  xorg-libxext       conda-forge/linux-64::xorg-libxext-1.3.6-hb9d3cd8_0 
  xorg-libxrender    conda-forge/linux-64::xorg-libxrender-0.9.12-hb9d3cd8_0 
  xorg-libxt         conda-forge/linux-64::xorg-libxt-1.3.1-hb9d3cd8_0 
  xz                 conda-forge/linux-64::xz-5.8.1-hbcc6ac9_2 
  xz-gpl-tools       conda-forge/linux-64::xz-gpl-tools-5.8.1-hbcc6ac9_2 
  xz-tools           conda-forge/linux-64::xz-tools-5.8.1-hb9d3cd8_2 
  zlib               conda-forge/linux-64::zlib-1.3.1-hb9d3cd8_2 
  zstd               conda-forge/linux-64::zstd-1.5.7-hb8e6e7a_2 



Downloading and Extracting Packages:

Preparing transaction: done
Verifying transaction: done
Executing transaction: \  
For Linux 64, Open MPI is built with CUDA awareness but this support is disabled by default.
To enable it, please set the environment variable OMPI_MCA_opal_cuda_support=true before
launching your MPI processes. Equivalently, you can set the MCA parameter in the command line:
mpiexec --mca opal_cuda_support 1 ...
 
In addition, the UCX support is also built but disabled by default.
To enable it, first install UCX (conda install -c conda-forge ucx). Then, set the environment
variables OMPI_MCA_pml="ucx" OMPI_MCA_osc="ucx" before launching your MPI processes.
Equivalently, you can set the MCA parameters in the command line:
mpiexec --mca pml ucx --mca osc ucx ...
Note that you might also need to set UCX_MEMTYPE_CACHE=n for CUDA awareness via UCX.
Please consult UCX's documentation for detail.
 

done
(sequencing) student47@ox:~/NGS_Tutorial$ conda activate sequencing
(sequencing) student47@ox:~/NGS_Tutorial$ conda list
# packages in environment at /home/student47/miniconda3/envs/sequencing:
#
# Name                       Version          Build                 Channel
_libgcc_mutex                0.1              conda_forge           conda-forge
_openmp_mutex                4.5              2_gnu                 conda-forge
_r-mutex                     1.0.1            anacondar_1           conda-forge
abyss                        2.3.10           hf316886_2            bioconda
bcftools                     1.22             h3a4d415_1            bioconda
binutils_impl_linux-64       2.44             hdf8817f_2            conda-forge
boost-cpp                    1.85.0           h3c6214e_4            conda-forge
bowtie2                      2.5.4            he96a11b_6            bioconda
breseq                       0.39.0           h077b44d_3            bioconda
btllib                       1.7.5            py312h1b2be2e_0       bioconda
bwidget                      1.10.1           ha770c72_1            conda-forge
bzip2                        1.0.8            hda65f42_8            conda-forge
c-ares                       1.34.5           hb9d3cd8_0            conda-forge
ca-certificates              2025.10.5        hbd8a1cb_0            conda-forge
cairo                        1.18.4           h3394656_0            conda-forge
curl                         8.14.1           h332b0f4_0            conda-forge
emboss                       6.6.0            h0f19ade_14           bioconda
font-ttf-dejavu-sans-mono    2.37             hab24e00_0            conda-forge
font-ttf-inconsolata         3.000            h77eed37_0            conda-forge
font-ttf-source-code-pro     2.038            h77eed37_0            conda-forge
font-ttf-ubuntu              0.83             h77eed37_3            conda-forge
fontconfig                   2.15.0           h7e30c49_1            conda-forge
fonts-conda-ecosystem        1                0                     conda-forge
fonts-conda-forge            1                0                     conda-forge
freetype                     2.14.1           ha770c72_0            conda-forge
fribidi                      1.0.16           hb03c661_0            conda-forge
gcc_impl_linux-64            15.2.0           hcacfade_7            conda-forge
gfortran_impl_linux-64       15.2.0           h1b0a18f_7            conda-forge
graphite2                    1.3.14           hecca717_2            conda-forge
gsl                          2.7              he838d99_0            conda-forge
gxx_impl_linux-64            15.2.0           h54ccb8d_7            conda-forge
harfbuzz                     12.1.0           h15599e2_0            conda-forge
htslib                       1.22.1           h566b1c6_0            bioconda
icu                          75.1             he02047a_0            conda-forge
kernel-headers_linux-64      3.10.0           he073ed8_18           conda-forge
keyutils                     1.6.3            hb9d3cd8_0            conda-forge
krb5                         1.21.3           h659f571_0            conda-forge
ld_impl_linux-64             2.44             ha97dd6f_2            conda-forge
lerc                         4.0.0            h0aef613_1            conda-forge
libblas                      3.9.0            37_h4a7cf45_openblas  conda-forge
libboost                     1.85.0           h0ccab89_4            conda-forge
libboost-devel               1.85.0           h00ab1b0_4            conda-forge
libboost-headers             1.85.0           ha770c72_4            conda-forge
libcblas                     3.9.0            37_h0358290_openblas  conda-forge
libcurl                      8.14.1           h332b0f4_0            conda-forge
libdeflate                   1.24             h86f0d12_0            conda-forge
libedit                      3.1.20250104     pl5321h7949ede_0      conda-forge
libev                        4.33             hd590300_2            conda-forge
libexpat                     2.7.1            hecca717_0            conda-forge
libffi                       3.4.6            h2dba641_1            conda-forge
libfreetype                  2.14.1           ha770c72_0            conda-forge
libfreetype6                 2.14.1           h73754d4_0            conda-forge
libgcc                       15.2.0           h767d61c_7            conda-forge
libgcc-devel_linux-64        15.2.0           h73f6952_107          conda-forge
libgcc-ng                    15.2.0           h69a702a_7            conda-forge
libgd                        2.3.3            h6f5c62b_11           conda-forge
libgfortran                  15.2.0           h69a702a_7            conda-forge
libgfortran-ng               15.2.0           h69a702a_7            conda-forge
libgfortran5                 15.2.0           hcd61629_7            conda-forge
libglib                      2.86.0           h1fed272_0            conda-forge
libgomp                      15.2.0           h767d61c_7            conda-forge
libharu                      2.4.5            h943b412_0            conda-forge
libiconv                     1.18             h3b78370_2            conda-forge
libjpeg-turbo                3.1.0            hb9d3cd8_0            conda-forge
liblapack                    3.9.0            37_h47877c9_openblas  conda-forge
liblzma                      5.8.1            hb9d3cd8_2            conda-forge
liblzma-devel                5.8.1            hb9d3cd8_2            conda-forge
libnghttp2                   1.67.0           had1ee68_0            conda-forge
libnsl                       2.0.1            hb9d3cd8_1            conda-forge
libopenblas                  0.3.30           pthreads_h94d23a6_2   conda-forge
libpng                       1.6.50           h421ea60_1            conda-forge
libsanitizer                 15.2.0           hb13aed2_7            conda-forge
libsqlite                    3.50.4           h0c1763c_0            conda-forge
libssh2                      1.11.1           hcf80075_0            conda-forge
libstdcxx                    15.2.0           h8f9b012_7            conda-forge
libstdcxx-devel_linux-64     15.2.0           h73f6952_107          conda-forge
libstdcxx-ng                 15.2.0           h4852527_7            conda-forge
libtiff                      4.7.1            h8261f1e_0            conda-forge
libuuid                      2.41.2           he9a06e4_0            conda-forge
libwebp-base                 1.6.0            hd42ef1d_0            conda-forge
libxcb                       1.17.0           h8a09558_0            conda-forge
libxcrypt                    4.4.36           hd590300_1            conda-forge
libzlib                      1.3.1            hb9d3cd8_2            conda-forge
lrzip                        0.651            h32784b6_1            bioconda
lz4-c                        1.9.4            hcb278e6_0            conda-forge
lzo                          2.10             h280c20c_1002         conda-forge
make                         4.4.1            hb9d3cd8_2            conda-forge
mpi                          1.0              openmpi               conda-forge
ncurses                      6.5              h2d0b736_3            conda-forge
openmpi                      4.1.6            hc5af2df_101          conda-forge
openssl                      3.5.4            h26f9b46_0            conda-forge
pango                        1.56.4           hadf4263_0            conda-forge
pcre2                        10.46            h1321c63_0            conda-forge
perl                         5.32.1           7_hd590300_perl5      conda-forge
pip                          25.2             pyh8b19718_0          conda-forge
pixman                       0.46.4           h54a6638_1            conda-forge
pthread-stubs                0.4              hb9d3cd8_1002         conda-forge
python                       3.12.12          hfe2f287_0_cpython    conda-forge
python_abi                   3.12             8_cp312               conda-forge
r-base                       4.5.1            h14df4e6_3            conda-forge
r-cairo                      1.6_5            r45h29dcd67_1         conda-forge
readline                     8.2              h8c095d6_2            conda-forge
samtools                     1.22.1           h96c455f_0            bioconda
sed                          4.9              h6688a6e_0            conda-forge
setuptools                   80.9.0           pyhff2d567_0          conda-forge
sysroot_linux-64             2.17             h0157908_18           conda-forge
tk                           8.6.13           noxft_hd72426e_102    conda-forge
tktable                      2.10             h8d826fa_7            conda-forge
tree                         2.2.1            hb9d3cd8_0            conda-forge
tzdata                       2025b            h78e105d_0            conda-forge
util-linux                   2.40.4           py312h0278cd3_0       conda-forge
wgsim                        1.0              h577a1d6_10           bioconda
wheel                        0.45.1           pyhd8ed1ab_1          conda-forge
xorg-libice                  1.1.2            hb9d3cd8_0            conda-forge
xorg-libsm                   1.2.6            he73a12e_0            conda-forge
xorg-libx11                  1.8.12           h4f16b4b_0            conda-forge
xorg-libxau                  1.0.12           hb9d3cd8_0            conda-forge
xorg-libxdmcp                1.1.5            hb9d3cd8_0            conda-forge
xorg-libxext                 1.3.6            hb9d3cd8_0            conda-forge
xorg-libxrender              0.9.12           hb9d3cd8_0            conda-forge
xorg-libxt                   1.3.1            hb9d3cd8_0            conda-forge
xz                           5.8.1            hbcc6ac9_2            conda-forge
xz-gpl-tools                 5.8.1            hbcc6ac9_2            conda-forge
xz-tools                     5.8.1            hb9d3cd8_2            conda-forge
zlib                         1.3.1            hb9d3cd8_2            conda-forge
zstd                         1.5.7            hb8e6e7a_2            conda-forge
(sequencing) student47@ox:~/NGS_Tutorial$ conda activate sequencing
(sequencing) student47@ox:~/NGS_Tutorial$ conda install samtools bowtie2 breseq abyss bcftools wgsim emboss tree -y
2 channel Terms of Service accepted
Channels:
 - conda-forge
 - bioconda
 - defaults
Platform: linux-64
Collecting package metadata (repodata.json): done
Solving environment: done


==> WARNING: A newer version of conda exists. <==
    current version: 25.7.0
    latest version: 25.9.1

Please update conda by running

    $ conda update -n base -c defaults conda



# All requested packages already installed.

(sequencing) student47@ox:~/NGS_Tutorial$ conda activate sequencing
(sequencing) student47@ox:~/NGS_Tutorial$ conda list
# packages in environment at /home/student47/miniconda3/envs/sequencing:
#
# Name                       Version          Build                 Channel
_libgcc_mutex                0.1              conda_forge           conda-forge
_openmp_mutex                4.5              2_gnu                 conda-forge
_r-mutex                     1.0.1            anacondar_1           conda-forge
abyss                        2.3.10           hf316886_2            bioconda
bcftools                     1.22             h3a4d415_1            bioconda
binutils_impl_linux-64       2.44             hdf8817f_2            conda-forge
boost-cpp                    1.85.0           h3c6214e_4            conda-forge
bowtie2                      2.5.4            he96a11b_6            bioconda
breseq                       0.39.0           h077b44d_3            bioconda
btllib                       1.7.5            py312h1b2be2e_0       bioconda
bwidget                      1.10.1           ha770c72_1            conda-forge
bzip2                        1.0.8            hda65f42_8            conda-forge
c-ares                       1.34.5           hb9d3cd8_0            conda-forge
ca-certificates              2025.10.5        hbd8a1cb_0            conda-forge
cairo                        1.18.4           h3394656_0            conda-forge
curl                         8.14.1           h332b0f4_0            conda-forge
emboss                       6.6.0            h0f19ade_14           bioconda
font-ttf-dejavu-sans-mono    2.37             hab24e00_0            conda-forge
font-ttf-inconsolata         3.000            h77eed37_0            conda-forge
font-ttf-source-code-pro     2.038            h77eed37_0            conda-forge
font-ttf-ubuntu              0.83             h77eed37_3            conda-forge
fontconfig                   2.15.0           h7e30c49_1            conda-forge
fonts-conda-ecosystem        1                0                     conda-forge
fonts-conda-forge            1                0                     conda-forge
freetype                     2.14.1           ha770c72_0            conda-forge
fribidi                      1.0.16           hb03c661_0            conda-forge
gcc_impl_linux-64            15.2.0           hcacfade_7            conda-forge
gfortran_impl_linux-64       15.2.0           h1b0a18f_7            conda-forge
graphite2                    1.3.14           hecca717_2            conda-forge
gsl                          2.7              he838d99_0            conda-forge
gxx_impl_linux-64            15.2.0           h54ccb8d_7            conda-forge
harfbuzz                     12.1.0           h15599e2_0            conda-forge
htslib                       1.22.1           h566b1c6_0            bioconda
icu                          75.1             he02047a_0            conda-forge
kernel-headers_linux-64      3.10.0           he073ed8_18           conda-forge
keyutils                     1.6.3            hb9d3cd8_0            conda-forge
krb5                         1.21.3           h659f571_0            conda-forge
ld_impl_linux-64             2.44             ha97dd6f_2            conda-forge
lerc                         4.0.0            h0aef613_1            conda-forge
libblas                      3.9.0            37_h4a7cf45_openblas  conda-forge
libboost                     1.85.0           h0ccab89_4            conda-forge
libboost-devel               1.85.0           h00ab1b0_4            conda-forge
libboost-headers             1.85.0           ha770c72_4            conda-forge
libcblas                     3.9.0            37_h0358290_openblas  conda-forge
libcurl                      8.14.1           h332b0f4_0            conda-forge
libdeflate                   1.24             h86f0d12_0            conda-forge
libedit                      3.1.20250104     pl5321h7949ede_0      conda-forge
libev                        4.33             hd590300_2            conda-forge
libexpat                     2.7.1            hecca717_0            conda-forge
libffi                       3.4.6            h2dba641_1            conda-forge
libfreetype                  2.14.1           ha770c72_0            conda-forge
libfreetype6                 2.14.1           h73754d4_0            conda-forge
libgcc                       15.2.0           h767d61c_7            conda-forge
libgcc-devel_linux-64        15.2.0           h73f6952_107          conda-forge
libgcc-ng                    15.2.0           h69a702a_7            conda-forge
libgd                        2.3.3            h6f5c62b_11           conda-forge
libgfortran                  15.2.0           h69a702a_7            conda-forge
libgfortran-ng               15.2.0           h69a702a_7            conda-forge
libgfortran5                 15.2.0           hcd61629_7            conda-forge
libglib                      2.86.0           h1fed272_0            conda-forge
libgomp                      15.2.0           h767d61c_7            conda-forge
libharu                      2.4.5            h943b412_0            conda-forge
libiconv                     1.18             h3b78370_2            conda-forge
libjpeg-turbo                3.1.0            hb9d3cd8_0            conda-forge
liblapack                    3.9.0            37_h47877c9_openblas  conda-forge
liblzma                      5.8.1            hb9d3cd8_2            conda-forge
liblzma-devel                5.8.1            hb9d3cd8_2            conda-forge
libnghttp2                   1.67.0           had1ee68_0            conda-forge
libnsl                       2.0.1            hb9d3cd8_1            conda-forge
libopenblas                  0.3.30           pthreads_h94d23a6_2   conda-forge
libpng                       1.6.50           h421ea60_1            conda-forge
libsanitizer                 15.2.0           hb13aed2_7            conda-forge
libsqlite                    3.50.4           h0c1763c_0            conda-forge
libssh2                      1.11.1           hcf80075_0            conda-forge
libstdcxx                    15.2.0           h8f9b012_7            conda-forge
libstdcxx-devel_linux-64     15.2.0           h73f6952_107          conda-forge
libstdcxx-ng                 15.2.0           h4852527_7            conda-forge
libtiff                      4.7.1            h8261f1e_0            conda-forge
libuuid                      2.41.2           he9a06e4_0            conda-forge
libwebp-base                 1.6.0            hd42ef1d_0            conda-forge
libxcb                       1.17.0           h8a09558_0            conda-forge
libxcrypt                    4.4.36           hd590300_1            conda-forge
libzlib                      1.3.1            hb9d3cd8_2            conda-forge
lrzip                        0.651            h32784b6_1            bioconda
lz4-c                        1.9.4            hcb278e6_0            conda-forge
lzo                          2.10             h280c20c_1002         conda-forge
make                         4.4.1            hb9d3cd8_2            conda-forge
mpi                          1.0              openmpi               conda-forge
ncurses                      6.5              h2d0b736_3            conda-forge
openmpi                      4.1.6            hc5af2df_101          conda-forge
openssl                      3.5.4            h26f9b46_0            conda-forge
pango                        1.56.4           hadf4263_0            conda-forge
pcre2                        10.46            h1321c63_0            conda-forge
perl                         5.32.1           7_hd590300_perl5      conda-forge
pip                          25.2             pyh8b19718_0          conda-forge
pixman                       0.46.4           h54a6638_1            conda-forge
pthread-stubs                0.4              hb9d3cd8_1002         conda-forge
python                       3.12.12          hfe2f287_0_cpython    conda-forge
python_abi                   3.12             8_cp312               conda-forge
r-base                       4.5.1            h14df4e6_3            conda-forge
r-cairo                      1.6_5            r45h29dcd67_1         conda-forge
readline                     8.2              h8c095d6_2            conda-forge
samtools                     1.22.1           h96c455f_0            bioconda
sed                          4.9              h6688a6e_0            conda-forge
setuptools                   80.9.0           pyhff2d567_0          conda-forge
sysroot_linux-64             2.17             h0157908_18           conda-forge
tk                           8.6.13           noxft_hd72426e_102    conda-forge
tktable                      2.10             h8d826fa_7            conda-forge
tree                         2.2.1            hb9d3cd8_0            conda-forge
tzdata                       2025b            h78e105d_0            conda-forge
util-linux                   2.40.4           py312h0278cd3_0       conda-forge
wgsim                        1.0              h577a1d6_10           bioconda
wheel                        0.45.1           pyhd8ed1ab_1          conda-forge
xorg-libice                  1.1.2            hb9d3cd8_0            conda-forge
xorg-libsm                   1.2.6            he73a12e_0            conda-forge
xorg-libx11                  1.8.12           h4f16b4b_0            conda-forge
xorg-libxau                  1.0.12           hb9d3cd8_0            conda-forge
xorg-libxdmcp                1.1.5            hb9d3cd8_0            conda-forge
xorg-libxext                 1.3.6            hb9d3cd8_0            conda-forge
xorg-libxrender              0.9.12           hb9d3cd8_0            conda-forge
xorg-libxt                   1.3.1            hb9d3cd8_0            conda-forge
xz                           5.8.1            hbcc6ac9_2            conda-forge
xz-gpl-tools                 5.8.1            hbcc6ac9_2            conda-forge
xz-tools                     5.8.1            hb9d3cd8_2            conda-forge
zlib                         1.3.1            hb9d3cd8_2            conda-forge
zstd                         1.5.7            hb8e6e7a_2            conda-forge
(sequencing) student47@ox:~/NGS_Tutorial$ 
