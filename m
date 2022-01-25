Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00AD49AB11
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 05:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S249657AbiAYEMA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 23:12:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1312899AbiAYCq5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 21:46:57 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C76C055A8E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 18:14:12 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id z10-20020a17090acb0a00b001b520826011so754482pjt.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 18:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EyuRLJo4Jujr3vEydcptGZcPbc3pEoYYBCMgUJCHx6M=;
        b=zNkLuDtu45C6n/cVOGoe6HGtetlOQMkH7H9ppwJjPZgvaOCxiC1pWnXBWVWHDMqHpl
         zPfva12eUiFicMqemgzxiczT4yQCFrgsxIIADxEM//7/6dFDZoayjaTpLJswkL+KpUeh
         aXvLGX52BZr6CloadWq/9t16GbWze3L16wKZMkWcH45vcoPw718hvRuACqqOGL7TkDeG
         5mM69WGgo3QkXlJyVSQLFUJ6zba63oN2d2WbrLdHAlO/bvi6tdZUFolqneSd4TGfZjdw
         c8fXBEm75epwC1YZv/plUkllsYO/u2Q3MpxpncpQbVqhAn9aGi3/PsKrQ2UaaHogq/xk
         yWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EyuRLJo4Jujr3vEydcptGZcPbc3pEoYYBCMgUJCHx6M=;
        b=Ki0Agl6M5m9Q51uJIKmOLP+oh/jCBXDgIO6HqeYsXdS+ZNO2P56ToPtBWyuW4dOld5
         PClYXLYRMQvuDObHCFIrdxzCdihooJW2nl2k7AqyOnrNi/08S9/Xo1D14M8aoN4L72eO
         i2KPHis8psjiPqk+vakdj/T3P2U1xdCBp0FXxaychvOOD35o0MDLYALmbkVhgnC4E/4r
         2BxzLeSReq3tzWn8jPztfAapM0h1vqB4Adwoz3QHYcLx3turEkdBPx7p1a4rL7y8fJnw
         Lg6TdxVS+2mIixO92zS/4VdUMhEGhHUhEjwwydcgKpqT1hYdpLYzn0M/9uBDnmFlcrv6
         l8bQ==
X-Gm-Message-State: AOAM5326XVDXzid+xppJBUHyEDTMeVXzBwTE+L2cRQNpW7rpxu65RsI+
        QGSh5nsa/uuDfQx5VcGgNrFY7RHzsEXasYlg
X-Google-Smtp-Source: ABdhPJyyUP1N4sB0dajrn5yXaRks/OUIDuelOg5cdBfp1muPyJ3lB+dITUpQFGKsXUyzdr948UvYug==
X-Received: by 2002:a17:902:bcc2:b0:149:b095:6a75 with SMTP id o2-20020a170902bcc200b00149b0956a75mr16266684pls.163.1643076851964;
        Mon, 24 Jan 2022 18:14:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id nk11sm571064pjb.55.2022.01.24.18.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 18:14:11 -0800 (PST)
Message-ID: <61ef5cf3.1c69fb81.57543.2a69@mx.google.com>
Date:   Mon, 24 Jan 2022 18:14:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-18-g925b6371c834
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 365 runs,
 12 regressions (v5.17-rc1-18-g925b6371c834)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 365 runs, 12 regressions (v5.17-rc1-18-g925b6371c834)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

rk3288-veyron-jaq      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.17-=
rc1-18-g925b6371c834/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: v5.17-rc1-18-g925b6371c834
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      925b6371c8340f967fc54b8102fdf6b94e87013b =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef27d81b9cda3584abbd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.=
txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ef27d81b9cda3584abb=
d17
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx8mn-ddr4-evk        | arm64 | lab-nxp       | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef25ae342e859c6fabbd2b

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ef25ae342e859=
c6fabbd32
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        12 lines

    2022-01-24T22:17:55.853093  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.247072] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-24T22:17:55.853290  at virtual address 0000000000000000
    2022-01-24T22:17:55.853446  kern  :alert : Mem abort info:
    2022-01-24T22:17:55.853593  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ef25ae342e859=
c6fabbd33
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        2 lines

    2022-01-24T22:17:55.854488  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-24T22:17:55.854645  kern  :alert :   SET =3D <8>[   15.272407] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-01-24T22:17:55.854791  0, FnV =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef232aa9131800d7abbd2e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/base=
line-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/base=
line-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef232ba9131800d7abbd6f
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-01-24T22:07:14.707945  /lava-83103/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f232ba9131800d7abbd70
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-01-24T22:07:14.711585  <8>[   13.829232] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T22:07:15.758051  /lava-83103/1/../bin/lava-test-case
    2022-01-24T22:07:15.758453  <8>[   14.848295] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T22:07:15.758729  /lava-83103/1/../bin/lava-test-case
    2022-01-24T22:07:15.758954  <8>[   14.864448] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef24fac4842b099babbd23

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef24fac4842b099babbd64
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)

    2022-01-24T22:14:56.280461  <8>[   16.503658] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drcpm-probed RESULT=3Dpass>
    2022-01-24T22:14:57.294529  /lava-83109/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f24fac4842b099babbd65
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)

    2022-01-24T22:14:57.297663  <8>[   17.520120] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T22:14:58.346585  /lava-83109/1/../bin/lava-test-case
    2022-01-24T22:14:58.346983  <8>[   18.538361] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef22239e86fc9faaabbd32

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/base=
line-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/base=
line-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef22239e86fc9faaabbd7a
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-01-24T22:02:50.728199  /lava-83101/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f22239e86fc9faaabbd7b
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-01-24T22:02:50.731620  <8>[   13.555116] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T22:02:51.780270  /lava-83101/1/../bin/lava-test-case
    2022-01-24T22:02:51.780664  <8>[   14.574339] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T22:02:51.780901  /lava-83101/1/../bin/lava-test-case
    2022-01-24T22:02:51.781122  <8>[   14.591404] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ef24f76e602d4531abbd24

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ef24f76e602d4531abbd6c
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)

    2022-01-24T22:14:59.137067  /lava-83106/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
f24f76e602d4531abbd6d
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)

    2022-01-24T22:14:59.140350  <8>[   13.475253] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T22:15:00.186886  /lava-83106/1/../bin/lava-test-case
    2022-01-24T22:15:00.187312  <8>[   14.494087] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T22:15:00.187549  /lava-83106/1/../bin/lava-test-case
    2022-01-24T22:15:00.187771  <8>[   14.509977] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
rk3288-veyron-jaq      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef42e75ef5ec7a3babbd12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/=
lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/=
lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ef42e75ef5ec7a3babb=
d13
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1) =

 =20
