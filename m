Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE8CF679FD3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 18:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233806AbjAXRME (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 12:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbjAXRMD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 12:12:03 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635C64C2C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:11:59 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so19260243pjg.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8IFbdeGQyqeCdAydziP6wrNnSeiB+xckTSLNHiw1JBU=;
        b=qvBVHg23gcgrAs+XmFH2SLD2VeFmaTYMotVClBVSa1lL2sBnZGyTUUQfIQNV/MkBQ4
         l+hRtgOpHCddFM7u8SJrp+32gRlRI8b89iQYEIVezZHI9wVkZtKD77KMS0S+skpgmY9T
         gpJZ6KCMjR056pX9IhiT1Tsl/MQPzVdzHoPSzySbugLLG1f8/eMcTMs4bM6NbxCk0tZ1
         BWS/hEcd5KmQwD3V9j8yVBXvywOtr4Tls+zIeLmhJwyhZh+n3uGHmb6l32ZBYrelTTL5
         1NwhrnKeVXgyrNstsrvIZWVW+R35E1/LR4p1u9M4TM/Y7fFmp+jcCbQXF0MORiYR154g
         +RlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IFbdeGQyqeCdAydziP6wrNnSeiB+xckTSLNHiw1JBU=;
        b=fqFc99tXEof84CLFe42It88HkItydA13rNJ7eLr2Hj/pr1s8tlrZNMdt7on+GCqTBV
         tPSH+rFP/C+0ZyMIJGihfnfay4L4TGhbBqthEkVCSPHiMygs9/aq64xBIOD+kP/hC7Vs
         zAfpgK4q/7VuuQmmI0eS7s+z4esZ9xn+EIm4qoj8f5lP6BllpITze4Pw2a7Lw/Fhfwyb
         6lYEwhi5eEPiAIoaY1E+RtHan8fxiUgCyCVPImb4IKg+Imhsct9zeJkOURA3jrQtZ2nA
         ilzOSgpXkgAclpDTFDGqwiUlPPwGIQciYuTKjDNYOSZZSRgQfKnpR5bKl4iUuzaf/sc4
         etWA==
X-Gm-Message-State: AFqh2ko/SsoTZO6zGGgi1NLIjLRC7h7gcAhOToRYt/rS+ItFwzJLA6TL
        7eeECbY5EEwhYkWrOd9HJqcaTTDYW7/AnUwl
X-Google-Smtp-Source: AMrXdXvw8S51tdjsNHiZiX8UdaQrHov2DIKXJXYZgi9ASjTwUgg/sM6Ex72hiDwwAPJiD/4sLVu0Rw==
X-Received: by 2002:a17:902:c10d:b0:193:3215:9621 with SMTP id 13-20020a170902c10d00b0019332159621mr29137997pli.33.1674580318469;
        Tue, 24 Jan 2023 09:11:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b00186acb14c4asm1921085pll.67.2023.01.24.09.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 09:11:58 -0800 (PST)
Message-ID: <63d0115e.170a0220.faa08.3cbd@mx.google.com>
Date:   Tue, 24 Jan 2023 09:11:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2023-01-24-v6.2-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 163 runs,
 18 regressions (renesas-next-2023-01-24-v6.2-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 163 runs, 18 regressions (renesas-next-2023-01-2=
4-v6.2-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | tegra_=
defconfig              | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-01-24-v6.2-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-01-24-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      29fea68a8aaad7d0cab07f538d02aa03ad75fb48 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfda140e62e9b5bd915ee5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63cfda140e62e9b5bd915eea
        failing since 11 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1)

    2023-01-24T13:15:55.928556  + set +x
    2023-01-24T13:15:55.935118  <8>[   21.419939] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 8854874_1.5.2.3.1>
    2023-01-24T13:15:56.045578  / # #
    2023-01-24T13:15:56.148423  export SHELL=3D/bin/sh
    2023-01-24T13:15:56.149330  #
    2023-01-24T13:15:56.251247  / # export SHELL=3D/bin/sh. /lava-8854874/e=
nvironment
    2023-01-24T13:15:56.252184  =

    2023-01-24T13:15:56.353888  / # . /lava-8854874/environment/lava-885487=
4/bin/lava-test-runner /lava-8854874/1
    2023-01-24T13:15:56.355300  =

    2023-01-24T13:15:56.360174  / # /lava-8854874/bin/lava-test-runner /lav=
a-8854874/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfd6c50d4ddb028b915f08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfd6c50d4ddb028=
b915f09
        new failure (last pass: renesas-next-2023-01-12-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfed6aa28c7c6741915ebe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63cfed6aa28c7c6741915ec3
        new failure (last pass: renesas-next-2023-01-12-v6.2-rc1)

    2023-01-24T14:38:22.710604  + set[   27.057414] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 886180_1.6.2.3.1>
    2023-01-24T14:38:22.710788   +x
    2023-01-24T14:38:22.817618  / # #
    2023-01-24T14:38:22.919052  export SHELL=3D/bin/sh
    2023-01-24T14:38:22.919435  #
    2023-01-24T14:38:23.020818  / # export SHELL=3D/bin/sh. /lava-886180/en=
vironment
    2023-01-24T14:38:23.021144  =

    2023-01-24T14:38:23.122289  / # . /lava-886180/environment/lava-886180/=
bin/lava-test-runner /lava-886180/1
    2023-01-24T14:38:23.122801  =

    2023-01-24T14:38:23.125619  / # /lava-886180/bin/lava-test-runner /lava=
-886180/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d00467cb7ec2fe0e915ef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx=
6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx=
6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d00467cb7ec2fe0=
e915ef5
        new failure (last pass: renesas-next-2023-01-12-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d0082612f9573c8d915ec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d0082612f9573c8=
d915ec6
        failing since 11 days (last pass: renesas-next-2022-09-18-v6.0-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d00365a9d800b813915f15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d00365a9d800b81=
3915f16
        new failure (last pass: renesas-next-2022-11-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d00b370962b17975915ecc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d00b370962b1797=
5915ecd
        failing since 70 days (last pass: renesas-next-2022-11-10-v6.1-rc1,=
 first fail: renesas-next-2022-11-15-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d00d32d93e6140bc915f22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d00d32d93e6140b=
c915f23
        new failure (last pass: renesas-next-2022-11-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d010496501ea2f0f915ee9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d010496501ea2f0=
f915eea
        new failure (last pass: renesas-next-2022-11-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | tegra_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d00651808e13e8b1915f0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d00651808e13e8b=
1915f0b
        new failure (last pass: renesas-next-2022-11-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfdff39a73ddfa66915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfdff39a73ddfa6=
6915eba
        failing since 127 days (last pass: renesas-next-2022-08-30-v6.0-rc1=
, first fail: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe28d104319802e915ecb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfe28d104319802=
e915ecc
        failing since 147 days (last pass: renesas-next-2022-08-29-v6.0-rc1=
, first fail: renesas-next-2022-08-30-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe5709d42df7ad8915ef0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfe5709d42df7ad=
8915ef1
        failing since 92 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-24-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfeb07c445ddabc8915f11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-m=
eson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-m=
eson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfeb07c445ddabc=
8915f12
        failing since 29 days (last pass: renesas-next-2022-11-10-v6.1-rc1,=
 first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe25d2c2e5f1745915edb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfe25d2c2e5f174=
5915edc
        new failure (last pass: renesas-next-2022-10-24-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe525843ebd89a3915ef1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfe525843ebd89a=
3915ef2
        new failure (last pass: renesas-next-2022-09-26-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe6cf0a8e28c7a9915f4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfe6cf0a8e28c7a=
9915f4f
        new failure (last pass: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfef657c054eb89e915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-m=
eson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-m=
eson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfef657c054eb89=
e915ebb
        new failure (last pass: renesas-next-2022-11-10-v6.1-rc1) =

 =20
