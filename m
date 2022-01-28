Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4645D49FEBB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jan 2022 18:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239099AbiA1RO1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 12:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350491AbiA1ROX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 12:14:23 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5B0C06173B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 09:14:22 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id u11so6541362plh.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 09:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aaue1yn/lwiJvdbREjqSLxPhPbxQSlFI7hZMTY3QY9o=;
        b=hzrAB1EYrAsth7ZZItW2Ll4ecB9C3D6soqT2lExen+zWys19Y3rhGN0HrVKaPvTAo1
         0OOrlUtPkhbDhVi1gfSIDqABlfI1ciOxXJ4+NukLqvGwu6X0JaiE7puD5JR57adS380t
         AvR578YFa0ig7O8hQ3qhut6eqwIAx39GOcfOdxkhFfVozCo/JWavHLDmb6AiCNgYR6an
         IuFUzIRsuPb+CML55JDF/KiqOI21/DQIvyXqkSCrAv5ZrzZtbM309J+ir7wR7Ni82UkI
         W2RmoC/a8TAkOTpV2wr+XUWGGzi39aYp9TycoJ4Svd9ufWleJebMk3S8T+2LfPXd24MY
         iKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aaue1yn/lwiJvdbREjqSLxPhPbxQSlFI7hZMTY3QY9o=;
        b=MmVxJOuaUyO7C1D1hdFpAC4NNRqBMelHQRdwXFf6aKSyIWGIV5YNWWL6T7UR0zAvYu
         LCd8Fu3UoqBOkFJJxvWcMU2i7cpQRVac8RKWtRekjZ1naGiQaqPcLTYOlh8byT07XvN6
         iWAFmUX0VWlV9do3uQtBHIWFKQre8UInAIFlhZyOc1JUi0P4yGJbbpjBBIZ4pD+P+Uuy
         tow9IK/1WPsXZ6M+KPa6BgN+biJCZ+AZg/mqRCHkc1M+kKJqmCLSR0MG60anI9KZoVSQ
         puNuNHb5L1/zaHsWozN4Gqrek0A/a4f+/b2u+IyU36TUogdFrq015feek/5jwRO3y3gA
         Awvw==
X-Gm-Message-State: AOAM531Wh6bs645RS4cYha5xEcpaawIC3fD+TApOvv7fMZV87ja2GvTt
        +vuJeMplok1REHX7ywnRqXABJgldxIGBZzFh
X-Google-Smtp-Source: ABdhPJyruUj2EBsondAch3yqFTm6AsEms4UkQgxQJ+mXj2nySb73eUiPKNVKOHTcPS7gxV3WHtOstw==
X-Received: by 2002:a17:903:22d2:: with SMTP id y18mr9193335plg.155.1643390061677;
        Fri, 28 Jan 2022 09:14:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p4sm720243pfw.86.2022.01.28.09.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 09:14:21 -0800 (PST)
Message-ID: <61f4246d.1c69fb81.e16d9.2135@mx.google.com>
Date:   Fri, 28 Jan 2022 09:14:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 428 runs,
 16 regressions (renesas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 428 runs, 16 regressions (renesas-devel-2022-01-25=
-v5.17-rc1-11-gba94d205dc711)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk    | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defconfi=
g          | 1          =

imx8mn-ddr4-evk     | arm64 | lab-nxp       | gcc-10   | defconfig         =
           | 2          =

imx8mn-ddr4-evk     | arm64 | lab-nxp       | gcc-10   | defconfig+ima     =
           | 2          =

imx8mn-ddr4-evk     | arm64 | lab-nxp       | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 2          =

imx8mn-ddr4-evk     | arm64 | lab-nxp       | gcc-10   | defconfig+crypto  =
           | 2          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

tegra124-nyan-big   | arm   | lab-collabora | gcc-10   | multi_v7_defconfig=
+ima       | 1          =

tegra124-nyan-big   | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =

tegra124-nyan-big   | arm   | lab-collabora | gcc-10   | multi_v7_defconfig=
           | 1          =

tegra124-nyan-big   | arm   | lab-collabora | gcc-10   | multi_v7_defconfig=
+crypto    | 1          =

tegra124-nyan-big   | arm   | lab-collabora | gcc-10   | tegra_defconfig   =
           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-25-v5.17-rc1-11-gba94d205dc711
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ba94d205dc71120401744a925da52c4098644e40 =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f3f1be07fcfc9d22abbd97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig+CONFIG_THUMB2_=
KERNEL=3Dy/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig+CONFIG_THUMB2_=
KERNEL=3Dy/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f3f1be07fcfc9d22abb=
d98
        failing since 73 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
imx6ul-14x14-evk    | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/61f3e9be7d59b2caa5abbd1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/imx_v6_v7_defconfig/gcc-10/lab-nx=
p/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/imx_v6_v7_defconfig/gcc-10/lab-nx=
p/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f3e9be7d59b2caa5abb=
d1d
        new failure (last pass: renesas-devel-2022-01-11-v5.16) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
imx8mn-ddr4-evk     | arm64 | lab-nxp       | gcc-10   | defconfig         =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/61f3e833b10ff1af76abbd24

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig/gcc-10/lab-nxp/baseli=
ne-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig/gcc-10/lab-nxp/baseli=
ne-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f3e833b10ff1a=
f76abbd2b
        failing since 3 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: v5.17-rc1-611-g4ccda2778be0)
        12 lines

    2022-01-28T12:56:58.014191  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.650562] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-28T12:56:58.014500  0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f3e833b10ff1a=
f76abbd2c
        failing since 3 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: v5.17-rc1-611-g4ccda2778be0)
        2 lines

    2022-01-28T12:56:58.015571  kern  :alert : Mem abort info:
    2022-01-28T12:56:58.015903  kern  :alert :   ESR =3D 0x96000006
    2022-01-28T12:56:58.016090  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-28T12:56:58.016247  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-28T12:56:58.016431  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-28T12:56:58.016578  kern  :alert :<8>[   14.678816] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-01-28T12:56:58.016720     FSC =3D 0x06: level 2 translatio<8>[   1=
4.690635] <LAVA_SIGNAL_ENDRUN 0_dmesg 817197_1.5.2.4.1>
    2022-01-28T12:56:58.016855  n fault
    2022-01-28T12:56:58.017058  kern  :alert : Data abort info:   =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
imx8mn-ddr4-evk     | arm64 | lab-nxp       | gcc-10   | defconfig+ima     =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/61f3e9974d3538520cabbd1c

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+ima/gcc-10/lab-nxp/ba=
seline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+ima/gcc-10/lab-nxp/ba=
seline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f3e9974d35385=
20cabbd23
        failing since 3 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: v5.17-rc1-611-g4ccda2778be0)
        12 lines

    2022-01-28T13:02:45.658427  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.469122] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-28T13:02:45.658662  at virtual address 0000000000000000
    2022-01-28T13:02:45.658811  kern  :alert : Mem abort info:
    2022-01-28T13:02:45.658953  kern  :alert :   ESR =3D 0x96000006
    2022-01-28T13:02:45.659155  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-28T13:02:45.659333  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f3e9974d35385=
20cabbd24
        failing since 3 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: v5.17-rc1-611-g4ccda2778be0)
        2 lines

    2022-01-28T13:02:45.660250  kern  :alert :   EA<8>[   15.495978] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-28T13:02:45.660373   =3D 0, S1PTW =3D 0   =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
imx8mn-ddr4-evk     | arm64 | lab-nxp       | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f3ef94d9d3e24a48abbd58

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+CONFIG_RANDOMIZE_BASE=
=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+CONFIG_RANDOMIZE_BASE=
=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f3ef94d9d3e24=
a48abbd5f
        failing since 2 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: renesas-devel-2022-01-25-v5.17-rc1)
        12 lines

    2022-01-28T13:28:38.886269  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   19.773240] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-28T13:28:38.886485  0000
    2022-01-28T13:28:38.886596  kern  :alert : Mem abort info:
    2022-01-28T13:28:38.886701  kern  :alert :   ESR =3D 0x96000006
    2022-01-28T13:28:38.886805  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-28T13:28:38.886916  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-28T13:28:38.887019  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f3ef94d9d3e24=
a48abbd60
        failing since 2 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: renesas-devel-2022-01-25-v5.17-rc1)
        2 lines

    2022-01-28T13:28:38.887955  kern  :alert :<8>[   19.800914] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
imx8mn-ddr4-evk     | arm64 | lab-nxp       | gcc-10   | defconfig+crypto  =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/61f3f09979b510b449abbd75

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+crypto/gcc-10/lab-nxp=
/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+crypto/gcc-10/lab-nxp=
/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f3f09979b510b=
449abbd7c
        failing since 2 days (last pass: renesas-devel-2021-12-27-v5.16-rc7=
, first fail: renesas-devel-2022-01-25-v5.17-rc1)
        12 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f3f09979b510b=
449abbd7d
        failing since 2 days (last pass: renesas-devel-2021-12-27-v5.16-rc7=
, first fail: renesas-devel-2022-01-25-v5.17-rc1)
        2 lines

    2022-01-28T13:32:46.400468  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.541668] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-28T13:32:46.400584  at virtual address 0000000000000000
    2022-01-28T13:32:46.400700  kern  :alert : Mem abort info:
    2022-01-28T13:32:46.400835  kern  :alert :   ESR =3D 0x96000006
    2022-01-28T13:32:46.400962  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-28T13:32:46.401081  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-28T13:32:46.401389  kern  :alert :   EA<8>[   15.567561] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-28T13:32:46.401503   =3D 0, S1PTW =3D 0   =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f3f0a50b4f3c9c5cabbd2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+CONFIG_RANDOMIZE_BASE=
=3Dy/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm64/defconfig+CONFIG_RANDOMIZE_BASE=
=3Dy/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f3f0a50b4f3c9c5cabb=
d2e
        new failure (last pass: renesas-devel-2022-01-25-v5.17-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
tegra124-nyan-big   | arm   | lab-collabora | gcc-10   | multi_v7_defconfig=
+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61f3fd80f47fcb43e5abbd2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig+ima/gcc-10/lab=
-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig+ima/gcc-10/lab=
-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f3fd80f47fcb43e5abb=
d2f
        new failure (last pass: renesas-devel-2022-01-11-v5.16) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
tegra124-nyan-big   | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f3fe3093038f62ceabbd12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig+CONFIG_THUMB2_=
KERNEL=3Dy/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig+CONFIG_THUMB2_=
KERNEL=3Dy/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f3fe3093038f62ceabb=
d13
        new failure (last pass: renesas-devel-2022-01-11-v5.16) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
tegra124-nyan-big   | arm   | lab-collabora | gcc-10   | multi_v7_defconfig=
           | 1          =


  Details:     https://kernelci.org/test/plan/id/61f4009267200fad16abbd14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig/gcc-10/lab-col=
labora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig/gcc-10/lab-col=
labora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f4009267200fad16abb=
d15
        failing since 3 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: v5.17-rc1-611-g4ccda2778be0) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
tegra124-nyan-big   | arm   | lab-collabora | gcc-10   | multi_v7_defconfig=
+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61f40500f36af1b674abbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig+crypto/gcc-10/=
lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/multi_v7_defconfig+crypto/gcc-10/=
lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f40500f36af1b674abb=
d12
        failing since 3 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: v5.17-rc1-611-g4ccda2778be0) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
tegra124-nyan-big   | arm   | lab-collabora | gcc-10   | tegra_defconfig   =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/61f3fed7de08d03d4eabbd15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/tegra_defconfig/gcc-10/lab-collab=
ora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1-11-gba94d205dc711/arm/tegra_defconfig/gcc-10/lab-collab=
ora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f3fed7de08d03d4eabb=
d16
        failing since 3 days (last pass: renesas-devel-2022-01-11-v5.16, fi=
rst fail: v5.17-rc1-611-g4ccda2778be0) =

 =20
