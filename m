Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B012A49AB13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 05:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243742AbiAYEMU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 23:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1321040AbiAYDPf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 22:15:35 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00311C055A8B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 17:04:23 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id w12-20020a17090a528c00b001b276aa3aabso683358pjh.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 17:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HBdvwRNNLdoUiDLvdLiYLof5tBaFRQtmZrQwF2Ki/po=;
        b=hL1+6xqpQVRDcVtzfZcIGQWyrfZrjppL02Xz4Bc4BKRNfcCl1XF3M8q7j4YZl232Tv
         tAkvtmhrj1EY3ZRZVEmfQ0MJYpM3NaM/p71Q3wcoUe3QlPD7OpdvOqckqJFttJ4k4KkO
         N1fxJ4pYA+Lkeq/DSdudwZrvVfqiGYe7rS6uGJPxTocCUtR36FbLY4/0QlTyq4XZruxh
         gNtkfARtu1DXRieT5oYyhyGCPG5KvOAuBmIXG0G1IPDANPEHnsmnlLWR/ya7Sf8t3j/f
         xWQZ6pkdKB/KLne1XwJXZa2Qp8aYTF2L2Xgl4aTLk9gUp4LZgqLUZfe83Q0jDAeBWtT0
         oFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HBdvwRNNLdoUiDLvdLiYLof5tBaFRQtmZrQwF2Ki/po=;
        b=tyNyBV4ZgKPTTQWmsHBtLM0LlqnRX/gUwF7lbt40Ldz5gv18mEHARjWllXsEU2gBs5
         +EDl1dS6MzG8rdaAol7Ze04h8qBDKUTc+JxRJbewhKRdfk0ag83sAJYeVAz+03EFLFtG
         elFwQlnFYgDcGmOk3Wm7vLx5JgSLx7qhYBBGRvx6+5fvurznSd+ujP1RYCt8MzGROPk5
         DeDmgHjg1+5YRWTnFD6GPSAkafhsFgPUk6t2tKHLmo4pzsfjAiN5F6liyMk8d2wGWR/p
         7moLPi1Xi1yw75Eo4Tz5BlJTldbb5cgYMqvDElSPDz6HCQm+3eEG9tBEMf2BFZLHJt+H
         z1Qg==
X-Gm-Message-State: AOAM531Kpk9pCadtsgbzzqJSgDNaA5JDYVGb0o3TkW31ITagnzJCbrCX
        JD4GW5uIkGL2F0/bxBmFdVRcRc3u6VDaCbPE
X-Google-Smtp-Source: ABdhPJz9etQdDG0wMnGIH1V5JSzKwAUH4LfsumF8i9VCHLsv9uEzEE6QrQryZc5AzguQ2ZjhSK184Q==
X-Received: by 2002:a17:902:868d:b0:14a:d70d:a29a with SMTP id g13-20020a170902868d00b0014ad70da29amr16794983plo.5.1643072663180;
        Mon, 24 Jan 2022 17:04:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a38sm6627670pfx.46.2022.01.24.17.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 17:04:22 -0800 (PST)
Message-ID: <61ef4c96.1c69fb81.e9625.230d@mx.google.com>
Date:   Mon, 24 Jan 2022 17:04:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-611-g4ccda2778be0
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 283 runs,
 15 regressions (v5.17-rc1-611-g4ccda2778be0)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 283 runs, 15 regressions (v5.17-rc1-611-g4ccda2778=
be0)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
           | regressions
-----------------------+-------+---------------+----------+----------------=
-----------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig      =
           | 2          =

imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+ima  =
           | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
           | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
           | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
           | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
           | 2          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+crypto | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig        | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | tegra_defconfig=
           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
7-rc1-611-g4ccda2778be0/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: v5.17-rc1-611-g4ccda2778be0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4ccda2778be03d61d70b8c8da55ef54d69a7f3cd =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
           | regressions
-----------------------+-------+---------------+----------+----------------=
-----------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig      =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef157357a66807fbabbd25

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ef157357a6680=
7fbabbd2c
        new failure (last pass: renesas-devel-2022-01-11-v5.16)
        12 lines

    2022-01-24T21:08:40.427741  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.787519] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-24T21:08:40.427990  0000
    2022-01-24T21:08:40.428141  kern  :alert : Mem abort info:
    2022-01-24T21:08:40.428327  kern  :alert :   ESR =3D 0x96000006
    2022-01-24T21:08:40.428524  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-24T21:08:40.428643  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ef157357a6680=
7fbabbd2d
        new failure (last pass: renesas-devel-2022-01-11-v5.16)
        2 lines

    2022-01-24T21:08:40.429604  kern  :alert :   EA<8>[   14.814882] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-24T21:08:40.429750   =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
           | regressions
-----------------------+-------+---------------+----------+----------------=
-----------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+ima  =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef17f6fe7a1a74a0abbe37

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ef17f6fe7a1a7=
4a0abbe3e
        new failure (last pass: renesas-devel-2022-01-11-v5.16)
        12 lines

    2022-01-24T21:19:26.614733  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.157180] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-24T21:19:26.614899  at virtual address 0000000000000000
    2022-01-24T21:19:26.615009  kern  :alert : Mem abort info:
    2022-01-24T21:19:26.615114  kern  :alert :   ESR =3D 0x96000006
    2022-01-24T21:19:26.615216  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ef17f6fe7a1a7=
4a0abbe3f
        new failure (last pass: renesas-devel-2022-01-11-v5.16)
        2 lines

    2022-01-24T21:19:26.615900  kern  :alert :   SET =3D <8>[   15.182264] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-01-24T21:19:26.616005  0, FnV =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
           | regressions
-----------------------+-------+---------------+----------+----------------=
-----------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef185ecde4c742d1abbd12

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef185fcde4c742d1abbd53
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:21:07.666111  /lava-83078/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f185fcde4c742d1abbd54
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:21:07.669208  <8>[   16.658770] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T21:21:08.718309  /lava-83078/1/../bin/lava-test-case
    2022-01-24T21:21:08.718769  <8>[   17.677476] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T21:21:08.719052  /lava-83078/1/../bin/lava-test-case
    2022-01-24T21:21:08.719348  <8>[   17.694648] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-24T21:21:08.719623  /lava-83078/1/../bin/lava-test-case
    2022-01-24T21:21:08.719881  <8>[   17.711800] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-24T21:21:08.720141  /lava-83078/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
           | regressions
-----------------------+-------+---------------+----------+----------------=
-----------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef196210588fdfe7abbd1b

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef196310588fdfe7abbd5c
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:25:30.370248  /lava-83085/1/../bin/lava-test-case
    2022-01-24T21:25:30.391304  <8>[   16.434381] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f196310588fdfe7abbd5d
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:25:31.438861  /lava-83085/1/../bin/lava-test-case
    2022-01-24T21:25:31.439308  <8>[   17.453842] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T21:25:31.439675  /lava-83085/1/../bin/lava-test-case
    2022-01-24T21:25:31.439890  <8>[   17.469810] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
           | regressions
-----------------------+-------+---------------+----------+----------------=
-----------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef15cadd0dca74b6abbd12

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef15cbdd0dca74b6abbd5a
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:10:27.461627  /lava-83075/1/../bin/lava-test-case
    2022-01-24T21:10:27.464762  <8>[   13.502298] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f15cbdd0dca74b6abbd5b
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:10:28.513447  /lava-83075/1/../bin/lava-test-case
    2022-01-24T21:10:28.513848  <8>[   14.521031] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T21:10:28.514090  /lava-83075/1/../bin/lava-test-case
    2022-01-24T21:10:28.514314  <8>[   14.536500] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
           | regressions
-----------------------+-------+---------------+----------+----------------=
-----------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
           | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef16f64cafedd7afabbd40

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef16f64cafedd7afabbd88
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:15:14.531763  /lava-83082/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f16f64cafedd7afabbd89
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:15:14.534926  <8>[   13.549409] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T21:15:15.581460  /lava-83082/1/../bin/lava-test-case
    2022-01-24T21:15:15.581858  <8>[   14.568605] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T21:15:15.582099  /lava-83082/1/../bin/lava-test-case
    2022-01-24T21:15:15.582325  <8>[   14.584305] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
           | regressions
-----------------------+-------+---------------+----------+----------------=
-----------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+crypto | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef449fbe4cf4c414abbd13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-te=
gra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-te=
gra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ef449fbe4cf4c414abb=
d14
        new failure (last pass: renesas-devel-2022-01-11-v5.16) =

 =



platform               | arch  | lab           | compiler | defconfig      =
           | regressions
-----------------------+-------+---------------+----------+----------------=
-----------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig        | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef47bd1bcdbb429babbd26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-=
nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-=
nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ef47bd1bcdbb429babb=
d27
        new failure (last pass: renesas-devel-2022-01-11-v5.16) =

 =



platform               | arch  | lab           | compiler | defconfig      =
           | regressions
-----------------------+-------+---------------+----------+----------------=
-----------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | tegra_defconfig=
           | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef442575fc149688abbd34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nya=
n-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nya=
n-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ef442575fc149688abb=
d35
        new failure (last pass: renesas-devel-2022-01-11-v5.16) =

 =20
