Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E652C49BD37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 21:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbiAYUde (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 15:33:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbiAYUdd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 15:33:33 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308C5C06173B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 12:33:33 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id g11-20020a17090a7d0b00b001b2c12c7273so1937002pjl.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 12:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=brH3YvDWWz/oolCpugAOAei962nIioaEX+QW06iV/OI=;
        b=w5rOo9L8YE45R6ho3X3yHfSTkNBvXIlkO3ivWv7MSEB7QI2yqJe5tCHJKouTcOJhQZ
         DBc6418NhZnQtpir1AXltxBezjtIYzbfCjNadcs0Eg+ZLWRbbPwkz0jACMOkysCNa8wG
         YxWjtktmYSPCNLq7ACW0Qk+HuYP21SBWTgDe1bo54Fx6tOjcXIIa2aJD6ZLQ650ZnMFM
         P4N4wLE4h8x6FyC54g/zcwwIvyN0h+oSNS60eQwhUhCF8Zj9xj2BCCtDCCJU8b6qDqek
         PVpQS5jbwDrIkWJpG17JconlGt3pz3tSAKgOoTVH1Wk7/c38gAxQ2oaOEoFJL4dV+nme
         oWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=brH3YvDWWz/oolCpugAOAei962nIioaEX+QW06iV/OI=;
        b=KT6IqsxLW7Y+sL3IusYQaKOzIw0q3eV4LCeoDFNjKCORTmMRI/RzrgBR1WWxfa993b
         OTsKtexYwThJ/LJZVKppQwn+lskoPT/AcEKDC6Zlu3BSM7v5R1bTBIoMfalpIeWFXrOb
         uJ8mOB5jeappND7cCXNwUjJSEmITHuJxIp2LPEBfTU5vExT/dWXpMGPcZC6xj7gEwDCP
         DL18eyQO13/QLWbRRm2gYFDk2U3wOuYODidji0XGwVfCE37360aEQnlfCY3p4HtSiTtR
         WoPy+toLnoYrjp7X+zpFebGUzNxcYEMoTfHwXyA8v1knCkabjxIK5UNx9keXX7lGoLWe
         IBcw==
X-Gm-Message-State: AOAM533Zi4CN05MicphnOr77ERfpP0NTE8VNDSWkvkLjxfAXG+XvGmc/
        R37ZH/ZuEx98Lwb0GXaBkxU4uVYOS062qoOE
X-Google-Smtp-Source: ABdhPJyEDY+ZuXTHzAbqEjeoWmVFLjfQQ72uFm//8vgUT2N8ZYTCwQnFEnU7sHEPW/hhhlfpKWIndg==
X-Received: by 2002:a17:902:b181:b0:149:90e2:896a with SMTP id s1-20020a170902b18100b0014990e2896amr20152976plr.149.1643142812450;
        Tue, 25 Jan 2022 12:33:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y128sm21799810pfb.75.2022.01.25.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 12:33:32 -0800 (PST)
Message-ID: <61f05e9c.1c69fb81.26395.a9d7@mx.google.com>
Date:   Tue, 25 Jan 2022 12:33:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-01-25-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 263 runs,
 14 regressions (renesas-devel-2022-01-25-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 263 runs, 14 regressions (renesas-devel-2022-01-25=
-v5.17-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
+crypto             | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
+ima                | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 2          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-25-v5.17-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-25-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ac6604366d67f174f4ba9d29aab00854ab78cb61 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f0280a82fd4e0595abbd31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f0280a82fd4e0595abb=
d32
        failing since 70 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61f025cb5b75455ef5abbd2d

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f025cb5b75455=
ef5abbd34
        new failure (last pass: renesas-devel-2021-12-27-v5.16-rc7)
        12 lines

    2022-01-25T16:30:36.083026  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.119382] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T16:30:36.083329  at virtual address 0000000000000000
    2022-01-25T16:30:36.083578  kern  :alert : Mem abort info:
    2022-01-25T16:30:36.083812  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f025cb5b75455=
ef5abbd35
        new failure (last pass: renesas-devel-2021-12-27-v5.16-rc7)
        2 lines

    2022-01-25T16:30:36.085097  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T16:30:36.085336  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T16:30:36.085561  kern  :alert :   EA<8>[   15.145904] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-25T16:30:36.085787   =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f02772de75b983dcabbd33

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nx=
p/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nx=
p/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f02772de75b98=
3dcabbd3a
        new failure (last pass: renesas-devel-2022-01-11-v5.16)
        12 lines

    2022-01-25T16:37:47.178467  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.431841] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T16:37:47.178637  at virtual address 0000000000000000
    2022-01-25T16:37:47.178746  kern  :alert : Mem abort info:
    2022-01-25T16:37:47.178850  kern  :alert :   ESR =3D 0x96000006
    2022-01-25T16:37:47.178952  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f02772de75b98=
3dcabbd3b
        new failure (last pass: renesas-devel-2022-01-11-v5.16)
        2 lines

    2022-01-25T16:37:47.179632  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T16:37:47.179735  kern  :alert :   EA<8>[   15.458456] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-25T16:37:47.179836   =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61f027e81de95ed0a5abbd46

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f027e81de95ed=
0a5abbd4d
        failing since 0 day (last pass: renesas-devel-2022-01-11-v5.16, fir=
st fail: v5.17-rc1-611-g4ccda2778be0)
        12 lines

    2022-01-25T16:39:38.964438  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.276276] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f027e81de95ed=
0a5abbd4e
        failing since 0 day (last pass: renesas-devel-2022-01-11-v5.16, fir=
st fail: v5.17-rc1-611-g4ccda2778be0)
        2 lines

    2022-01-25T16:39:39.005119  at virtual address 0000000000000000
    2022-01-25T16:39:39.005365  kern  :alert : Mem abort info:
    2022-01-25T16:39:39.005494  kern  :alert :   ESR =3D 0x96000006
    2022-01-25T16:39:39.005823  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T16:39:39.005936  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T16:39:39.006071  kern  :alert :   EA<8>[   15.302202] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-25T16:39:39.006198   =3D 0, S1PTW =3D 0
    2022-01-25T16:39:39.006316  kern  :alert :  <8>[   15.314181] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 810670_1.5.2.4.1>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61f0274308a470bb13abbd11

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f0274308a470bb13abbd52
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-25T16:37:17.143200  /lava-83521/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
0274308a470bb13abbd53
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-25T16:37:17.146422  <8>[   16.578396] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T16:37:18.193769  /lava-83521/1/../bin/lava-test-case
    2022-01-25T16:37:18.194183  <8>[   17.597142] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T16:37:18.194425  /lava-83521/1/../bin/lava-test-case
    2022-01-25T16:37:18.194651  <8>[   17.614287] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f027bbf5ca5f847babbd1a

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ko=
ntron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ko=
ntron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f027bbf5ca5f847babbd5b
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-25T16:39:05.733072  /lava-83523/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
027bbf5ca5f847babbd5c
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-25T16:39:05.736149  <8>[   16.588701] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T16:39:06.781608  /lava-83523/1/../bin/lava-test-case
    2022-01-25T16:39:06.782013  <8>[   17.606798] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61f0295f17ca63fa41abbd3c

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f0295f17ca63fa41abbd7d
        failing since 0 day (last pass: renesas-devel-2022-01-11-v5.16, fir=
st fail: v5.17-rc1-611-g4ccda2778be0)

    2022-01-25T16:46:06.344683  /lava-83528/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
0295f17ca63fa41abbd7e
        failing since 0 day (last pass: renesas-devel-2022-01-11-v5.16, fir=
st fail: v5.17-rc1-611-g4ccda2778be0)

    2022-01-25T16:46:06.347772  <8>[   17.766604] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T16:46:07.353865  /lava-83528/1/../bin/lava-test-case
    2022-01-25T16:46:07.356982  <8>[   18.785930] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61f02e841590807113abbd1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-25-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f02e841590807113abb=
d1d
        new failure (last pass: v5.17-rc1-611-g4ccda2778be0) =

 =20
