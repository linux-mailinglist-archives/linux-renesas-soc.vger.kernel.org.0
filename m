Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D76F67DB07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 02:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbjA0BEu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 20:04:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjA0BEt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 20:04:49 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD353F2A5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 17:04:46 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id t12-20020a17090aae0c00b00229f4cff534so7016908pjq.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 17:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KEyoI4J89ykVcuiUHiUV6qZqauFndOhCajONujA+bFY=;
        b=lJoWrwzHeJ54T9Axtp3AvhdeFTjNO70L4o+dq0mcpsvKC1bhM+0OF8O5VsLTq8wK/a
         +E+/IXdrsbuTZS7FEMCjMMkZkhUaXYZlde2F5BNvad24i3+lxMowaxY5CK1xcNWKS2xY
         15zTV9UjfSmpSk/Fv+hsSC9GtNIihS6Iw82sFTu8C6jmE4bfp21v3oEq63qkkAI75Ssx
         kVHe9YubCoQrZaXvW68lcJ2qGGZG+ekWzKg4cK1rgvcLMhOHhmWT7+ElfX2DGlayBEtW
         GSC8rOxP2JC5j2WILZvcqpvTFrzxzkkX243fpknvdh9LWZoAI8jPkVT2z/jYQPUCTKSU
         tzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEyoI4J89ykVcuiUHiUV6qZqauFndOhCajONujA+bFY=;
        b=DSvPkNwHr5OB7b+eA8TizcgxOSGvWEpIY5ykX7QOEsDbtvC++c/IHigck7Sd225MFL
         XegoYQp/MweSp5UX0OODp0zSVVT7A2nFsgudCAtk0Bc4slE94UwWnmIdO1lUCk8///Ro
         40C6s6VdHyXj/8w8IfUBBps+bpqCcMV7ITjAA+faEblwS1JWsdM6ko1uzQmGqY+LM4Vq
         /XmLgTYpK0etNyCzgOE3DPGeN4mXPjqNeCHfcIxHHSbqSgiCBEQiSNh0NfVNWuJibVo6
         61Fw7uTQw7981RYTUrkO/UWUmSdc58t6MNclOO4G6kk5iQ9pdgiT0U3KlnoDmUcB0uuS
         YV4w==
X-Gm-Message-State: AO0yUKVCsZptsXKWab9XNiwEcBu7Ldb+NIv743Lee+XnxZ5v3KPKyQpj
        uxRdlrQIhTJ75yLRNy9h90PvuBgrf6taAGDnTwM=
X-Google-Smtp-Source: AK7set9omNqu+3HW+9eY9lUsGuMPR22EZ6xCGcADUZqYuvxV9ckP/vlqILchu3fXAR88FMfyCIEJNg==
X-Received: by 2002:a05:6a21:8dc2:b0:b8:78dd:5fa2 with SMTP id ti2-20020a056a218dc200b000b878dd5fa2mr3516573pzb.52.1674781485212;
        Thu, 26 Jan 2023 17:04:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902d4cc00b00189c536c72asm1569637plg.148.2023.01.26.17.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 17:04:44 -0800 (PST)
Message-ID: <63d3232c.170a0220.be95.2e5a@mx.google.com>
Date:   Thu, 26 Jan 2023 17:04:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2023-01-26-v6.2-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 225 runs,
 24 regressions (renesas-devel-2023-01-26-v6.2-rc5)
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

renesas/master baseline-nfs: 225 runs, 24 regressions (renesas-devel-2023-0=
1-26-v6.2-rc5)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | tegra_=
defconfig              | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-26-v6.2-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-26-v6.2-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      635b2020aa8744f7174ce492c342357cb34c9e86 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2ebc43cd5bd4210915f52

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d2ebc43cd5bd4210915f57
        failing since 2 days (last pass: renesas-devel-2022-11-21-v6.1-rc6,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-01-26T21:08:09.097287  + set +x
    2023-01-26T21:08:09.101509  <8>[   50.060000] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3220367_1.6.2.4.1>
    2023-01-26T21:08:09.223723  / # #
    2023-01-26T21:08:09.325265  export SHELL=3D/bin/sh
    2023-01-26T21:08:09.325771  #
    2023-01-26T21:08:09.426789  / # export SHELL=3D/bin/sh. /lava-3220367/e=
nvironment
    2023-01-26T21:08:09.427224  =

    2023-01-26T21:08:09.528526  / # . /lava-3220367/environment/lava-322036=
7/bin/lava-test-runner /lava-3220367/1
    2023-01-26T21:08:09.529202  =

    2023-01-26T21:08:09.533968  / # /lava-3220367/bin/lava-test-runner /lav=
a-3220367/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f1276be4ce4206915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f1276be4ce420=
6915ebc
        new failure (last pass: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f1f01b8fe29cfb915f2b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
nfs-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
nfs-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d2f1f01b8fe29cfb915f30
        failing since 2 days (last pass: renesas-devel-2022-11-21-v6.1-rc6,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5)

    2023-01-26T21:34:26.586619  + set +x
    2023-01-26T21:34:26.590777  <8>[   55.429814] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3220524_1.6.2.4.1>
    2023-01-26T21:34:26.720681  / # #
    2023-01-26T21:34:26.823528  export SHELL=3D/bin/sh
    2023-01-26T21:34:26.824510  #
    2023-01-26T21:34:26.926400  / # export SHELL=3D/bin/sh. /lava-3220524/e=
nvironment
    2023-01-26T21:34:26.927169  =

    2023-01-26T21:34:27.028962  / # . /lava-3220524/environment/lava-322052=
4/bin/lava-test-runner /lava-3220524/1
    2023-01-26T21:34:27.030243  =

    2023-01-26T21:34:27.034805  / # /lava-3220524/bin/lava-test-runner /lav=
a-3220524/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2ed85cf5a0a1ea1915ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/amd64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2ed85cf5a0a1ea=
1915ec5
        new failure (last pass: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2ec5a754e84916e915f28

  Results:     17 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/amd64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/63d2ec5a754=
e84916e915f3b
        new failure (last pass: renesas-devel-2023-01-24-v6.2-rc5)
        1 lines

    2023-01-26T21:10:40.662608  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector
    2023-01-26T21:10:40.677989  <8>[   17.101994] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2e92485397caa6d915ec6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d2e92485397caa6d915ecb
        new failure (last pass: renesas-devel-2023-01-24-v6.2-rc5)

    2023-01-26T20:56:44.828419  + set[   34.633980] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 888749_1.6.2.3.1>
    2023-01-26T20:56:44.828596   +x
    2023-01-26T20:56:44.938784  #
    2023-01-26T20:56:45.040329  / # #export SHELL=3D/bin/sh
    2023-01-26T20:56:45.040710  =

    2023-01-26T20:56:45.141897  / # export SHELL=3D/bin/sh. /lava-888749/en=
vironment
    2023-01-26T20:56:45.142273  =

    2023-01-26T20:56:45.243432  / # . /lava-888749/environment/lava-888749/=
bin/lava-test-runner /lava-888749/1
    2023-01-26T20:56:45.243888  =

    2023-01-26T20:56:45.249310  / # /lava-888749/bin/lava-test-runner /lava=
-888749/1 =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f1306be4ce4206915ec6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d2f1306be4ce4206915ecb
        failing since 10 days (last pass: renesas-devel-2023-01-12-v6.2-rc3=
, first fail: renesas-devel-2023-01-16-v6.2-rc4)

    2023-01-26T21:31:06.881385  + set[   27.163261] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 888778_1.6.2.3.1>
    2023-01-26T21:31:06.881574   +x
    2023-01-26T21:31:06.992688  / # #
    2023-01-26T21:31:07.094312  export SHELL=3D/bin/sh
    2023-01-26T21:31:07.094705  #
    2023-01-26T21:31:07.195942  / # export SHELL=3D/bin/sh. /lava-888778/en=
vironment
    2023-01-26T21:31:07.196403  =

    2023-01-26T21:31:07.297609  / # . /lava-888778/environment/lava-888778/=
bin/lava-test-runner /lava-888778/1
    2023-01-26T21:31:07.298281  =

    2023-01-26T21:31:07.301531  / # /lava-888778/bin/lava-test-runner /lava=
-888778/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2ebdf08a471b475915ed6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2ebdf08a471b47=
5915ed7
        failing since 14 days (last pass: renesas-devel-2023-01-09-v6.2-rc3=
, first fail: renesas-devel-2023-01-12-v6.2-rc3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2e9a72bc703702d915f7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseli=
ne-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2e9a72bc703702=
d915f7b
        failing since 2 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2ed19a8d832e1ee915fac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2ed19a8d832e1e=
e915fad
        failing since 2 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2ef105eb72328f1915ec1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-=
jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2ef105eb72328f=
1915ec2
        failing since 2 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f02511e26912bb915ede

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f02511e26912b=
b915edf
        failing since 44 days (last pass: renesas-devel-2022-11-17-v6.1-rc5=
-5-gf68db0d22967, first fail: renesas-devel-2022-12-12-v6.1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f1407aa1d8d12d915ecb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f1407aa1d8d12=
d915ecc
        failing since 2 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | tegra_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2ebb181ed65b7f9915ec7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2ebb181ed65b7f=
9915ec8
        failing since 2 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f6cc50a506ce88915ec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-j=
uno-uboot.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-j=
uno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f6cc50a506ce8=
8915ec6
        failing since 2 days (last pass: renesas-devel-2023-01-09-v6.2-rc3,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2ec57754e84916e915f22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2ec57754e84916=
e915f23
        failing since 52 days (last pass: renesas-devel-2022-11-10-v6.1-rc4=
, first fail: v6.1-rc8-929-g112502470f50) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f0a5813f19b6b5915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f0a5813f19b6b=
5915ebb
        failing since 31 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f2219c0d9780d6915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f2219c0d9780d=
6915ed3
        failing since 2 days (last pass: renesas-devel-2022-12-12-v6.1, fir=
st fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f39e90c87f0e6d915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f39e90c87f0e6=
d915eba
        failing since 129 days (last pass: renesas-devel-2022-09-05-v6.0-rc=
4, first fail: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f6e6536c62c945915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nf=
s-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nf=
s-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f6e6536c62c94=
5915ebc
        new failure (last pass: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f24970cbae19ba915edc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f24970cbae19b=
a915edd
        new failure (last pass: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f4debc5e62b1b2915ec0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f4debc5e62b1b=
2915ec1
        failing since 2 days (last pass: renesas-devel-2023-01-09-v6.2-rc3,=
 first fail: renesas-devel-2023-01-24-v6.2-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f4557cccd42362915ed1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-s=
un50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-s=
un50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f4557cccd4236=
2915ed2
        failing since 31 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d2f1d21b8fe29cfb915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-26-v6.2-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d2f1d21b8fe29cf=
b915eba
        failing since 31 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2022-12-26-v6.2-rc1) =

 =20
