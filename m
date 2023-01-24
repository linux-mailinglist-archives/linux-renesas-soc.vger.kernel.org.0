Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF2667A0A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 18:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233756AbjAXR5B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 12:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbjAXR5A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 12:57:00 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6583423642
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:56:57 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id 88so4223052pjo.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BEUyKq73gyWBo2X64WWfg0nzZUTgIUDEX0hnmJXk7Vo=;
        b=PyMFMN2ox31xdvDK9EXtoP+GHqWRwGoY723vJWu2bV1/r16K64tNhf0Ee8gq7cPkxP
         HOIeCmf8RCKOiCCM/wzxOtZLMjT47SJFH5b6Hb5B+uZWyO96ZPp0gaxtYwhvE3Yfw+KV
         Qd1ggGkRQywBOQ7jluKmhw7Qd5r4UqJLtOi03rA2ZmrFomiogxqjfAEmTFzKJOZQlpw4
         pJAXECfarJwnBv8O4HFxUd8jTe6QQX1T6ITHFJaCUhfWF6HEsTCwkLF2xwlbYiInhXL7
         /NlJzBC8iho5zwQYEoJpeW0f5sby2sRfON+HsSEUHijmoT4h7yiLlFmfF+MAOVCyMsTL
         Xf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEUyKq73gyWBo2X64WWfg0nzZUTgIUDEX0hnmJXk7Vo=;
        b=cQg3ai02iknEFrzHYmJY021V9xN58dJ0zVQJmKiNmaS+4w8u10x+cKlKsxBy6ZeFR8
         uH7XyVbR+Faf2ADq61+b02JrPxVotPKf5c9LzANkGEf+HwysF3KY9/P76wc3rTuyCneH
         oTZ69pxFs04OovzRMQHF74RsTsKVjYDRbjvoVUFutwMDKU6axsdN1dAXdNYlh3fBah6V
         FrYIFjtoHqj99T35JGRIcSKA8DbxYfGLW6FPPaWckEft8+W0nW5fOGUQf/IcusjibexO
         KbXILMolamhl5PlfBpX+QHZkt2RZz+SIO1oeULQxKXWna/x9hZl+CKT5u6XWf8bGdeTK
         RqbQ==
X-Gm-Message-State: AO0yUKXNDVxnpmNk/axYhVP3aNy9teTvbhv47yOrmN7GbljNPyfjxZ+z
        BQ9PN4zoMw/KOybJVjgmprSFXrW44eILR0tR3pI=
X-Google-Smtp-Source: AK7set/hcELok63mHwUd+nqxoJW2H2F/lqRhb5Bz5aXuYvMNflOYGX0xg0zKkxk6nUt8J7BgPmqdpQ==
X-Received: by 2002:a17:902:da81:b0:196:e77:f07b with SMTP id j1-20020a170902da8100b001960e77f07bmr6002101plx.39.1674583016511;
        Tue, 24 Jan 2023 09:56:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f24-20020a170902ab9800b00189fdadef9csm1951557plr.107.2023.01.24.09.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 09:56:56 -0800 (PST)
Message-ID: <63d01be8.170a0220.3d4ac.45b0@mx.google.com>
Date:   Tue, 24 Jan 2023 09:56:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-24-v6.2-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 181 runs,
 15 regressions (renesas-devel-2023-01-24-v6.2-rc5)
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

renesas/master baseline-nfs: 181 runs, 15 regressions (renesas-devel-2023-0=
1-24-v6.2-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-24-v6.2-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-24-v6.2-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f23ed7e4efa3e68c99d217f9dc00fc689c7e661d =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe30b1a984292a4915ec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfe30b1a984292a=
4915ec6
        new failure (last pass: renesas-devel-2023-01-16-v6.2-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cff616d14f186e92915ebd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63cff616d14f186e92915ec2
        new failure (last pass: renesas-devel-2023-01-16-v6.2-rc4)

    2023-01-24T15:15:23.394799  + set +x
    2023-01-24T15:15:23.394961  [   26.732337] <LAVA_SIGNAL_ENDRUN 0_dmesg =
886250_1.6.2.3.1>
    2023-01-24T15:15:23.501989  #
    2023-01-24T15:15:23.603882  / # #export SHELL=3D/bin/sh
    2023-01-24T15:15:23.604233  =

    2023-01-24T15:15:23.705361  / # export SHELL=3D/bin/sh. /lava-886250/en=
vironment
    2023-01-24T15:15:23.705736  =

    2023-01-24T15:15:23.806865  / # . /lava-886250/environment/lava-886250/=
bin/lava-test-runner /lava-886250/1
    2023-01-24T15:15:23.807324  =

    2023-01-24T15:15:23.810096  / # /lava-886250/bin/lava-test-runner /lava=
-886250/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cffab2823f1c1b6b915ede

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63cffab2823f1c1b6b915ee3
        failing since 8 days (last pass: renesas-devel-2023-01-12-v6.2-rc3,=
 first fail: renesas-devel-2023-01-16-v6.2-rc4)

    2023-01-24T15:35:01.607890  + set[   27.371431] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 886287_1.6.2.3.1>
    2023-01-24T15:35:01.608173   +x
    2023-01-24T15:35:01.725346  #
    2023-01-24T15:35:01.827133  / # #export SHELL=3D/bin/sh
    2023-01-24T15:35:01.827536  =

    2023-01-24T15:35:01.928729  / # export SHELL=3D/bin/sh. /lava-886287/en=
vironment
    2023-01-24T15:35:01.929227  =

    2023-01-24T15:35:02.030821  / # . /lava-886287/environment/lava-886287/=
bin/lava-test-runner /lava-886287/1
    2023-01-24T15:35:02.031381  =

    2023-01-24T15:35:02.034589  / # /lava-886287/bin/lava-test-runner /lava=
-886287/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d015ea2b57d68f07915ee3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d015ea2b57d68f0=
7915ee4
        failing since 11 days (last pass: renesas-devel-2023-01-09-v6.2-rc3=
, first fail: renesas-devel-2023-01-12-v6.2-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d017514f3ead9b29915f26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d017514f3ead9b2=
9915f27
        failing since 11 days (last pass: renesas-devel-2023-01-09-v6.2-rc3=
, first fail: renesas-devel-2023-01-12-v6.2-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cff28e4d379ce7fd915f57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cff28e4d379ce7f=
d915f58
        failing since 29 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2022-12-26-v6.2-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63cff3bf44a6980d41915f05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cff3bf44a6980d4=
1915f06
        new failure (last pass: renesas-devel-2022-12-12-v6.1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cff425f77f4acb1591615a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cff425f77f4acb1=
591615b
        failing since 127 days (last pass: renesas-devel-2022-09-05-v6.0-rc=
4, first fail: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63cff5b3f385fa653e915ed1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cff5b3f385fa653=
e915ed2
        failing since 50 days (last pass: renesas-devel-2022-11-10-v6.1-rc4=
, first fail: v6.1-rc8-929-g112502470f50) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cff3fcd1f50e506e915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cff3fcd1f50e506=
e915eba
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63cff51926ab6671ca915ec6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cff51926ab6671c=
a915ec7
        failing since 42 days (last pass: renesas-devel-2022-11-10-v6.1-rc4=
, first fail: renesas-devel-2022-12-12-v6.1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cff698fe2ed51fe1915ec9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nf=
s-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nf=
s-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cff698fe2ed51fe=
1915eca
        new failure (last pass: renesas-devel-2022-12-12-v6.1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cffa8d63fcbc171d915ed8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cffa8d63fcbc171=
d915ed9
        new failure (last pass: renesas-devel-2022-12-12-v6.1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63cff004e703ec8ec0915f03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cff004e703ec8ec=
0915f04
        new failure (last pass: renesas-devel-2022-12-26-v6.2-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfe71ba11815febe915fa5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-24-v6.2-rc5/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63cfe71ba11815feb=
e915fa6
        new failure (last pass: renesas-devel-2023-01-16-v6.2-rc4) =

 =20
