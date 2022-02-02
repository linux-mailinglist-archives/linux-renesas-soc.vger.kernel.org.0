Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432804A72C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 15:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344806AbiBBONN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 09:13:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233774AbiBBONN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 09:13:13 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64593C061714
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 06:13:13 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id k17so18449090plk.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 06:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kUqP1lLQjyopwRSDjPQdx/h3zdwr4IpSieHu3T+zuvI=;
        b=wKlBUaiPbRV+SmL0O6GYRG0WwvW3GH3i/44R5jBC9G1A9GrosOx75wv3Xb3QmKxVGM
         LB0Tz0MUCkYKZOjoEeFf3axCYCLQFnRsNJmI1dF3B3wZnFkI1alvBejlATLXEdpuwV6E
         8a4HKa1OZFdE+KOe/vTyi4FqBX/K+z8OJOv+U5A+n4eZbNHgqcEVacB58DALcd2777eY
         2QTUn3jBGctmKdYAaf0JKoyfOaPI2rusyzom3Aw7qU36s/XxRQ5dj1/O2ukZJG4e6gum
         x8Ctu5nkHf8Y6A0smNcPjOMqideMYEgmT3ZFFaUQBjXPtbtpN8YUch7pet+Ci8+Xz29B
         RJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kUqP1lLQjyopwRSDjPQdx/h3zdwr4IpSieHu3T+zuvI=;
        b=kFfjpD/VeuvaX6p+tjawTD7IBOHIZ+YOWC7WxlogW3gwLmshTY/ivmW465N6S4QpmY
         N+FDK5h1W2KGsyvO2VQBNcNCDRhHxunNEP8H0WBEf+IG7nbx+8EVPh3fy5B9whemH7kP
         OLjq9R62FlSjSgJvP9NS9A5RT2owrLp8InkAGEFYs76sTTSYWn7d8Tfeo603i6yYogqt
         qj6c4jUP+AGVpiIU9MiOFpwVDTyDYG1rgLhaJ7L2xkbuXC2PTaVBKqlLLSUg5928m+Zi
         neHOIUixsF3mkqSDm7FvapFjy3z+bPcqx8YBeWElhSzlqRtE525BTsjW6RfHKnM8jLKQ
         WUag==
X-Gm-Message-State: AOAM530MQT6njx7QxfyaR3oZ3WfZdf3yC8xR/8O/14vXnucZ1M2KfsSM
        TxoFmMCx+tyTu/5AIqdA6ca5qhL87jcnOwSR
X-Google-Smtp-Source: ABdhPJzT9A+5zr0qwx0ZaMhPVK/rOC1tydeM6etxNPt5nrcxu24cMDGpUOIPBZllYZIRNpPrKwfTMA==
X-Received: by 2002:a17:902:e54c:: with SMTP id n12mr30207850plf.78.1643811192721;
        Wed, 02 Feb 2022 06:13:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g12sm24857910pfm.119.2022.02.02.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 06:13:12 -0800 (PST)
Message-ID: <61fa9178.1c69fb81.91546.0f0d@mx.google.com>
Date:   Wed, 02 Feb 2022 06:13:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-02-02-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
Subject: renesas/next baseline: 367 runs,
 9 regressions (renesas-next-2022-02-02-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 367 runs, 9 regressions (renesas-next-2022-02-02-v5.=
17-rc1)

Regressions Summary
-------------------

platform         | arch  | lab     | compiler | defconfig                  =
  | regressions
-----------------+-------+---------+----------+----------------------------=
--+------------
imx6ul-14x14-evk | arm   | lab-nxp | gcc-10   | imx_v6_v7_defconfig        =
  | 1          =

imx8mn-ddr4-evk  | arm64 | lab-nxp | gcc-10   | defconfig+crypto           =
  | 2          =

imx8mn-ddr4-evk  | arm64 | lab-nxp | gcc-10   | defconfig                  =
  | 2          =

imx8mn-ddr4-evk  | arm64 | lab-nxp | gcc-10   | defconfig+CON...OMIZE_BASE=
=3Dy | 2          =

imx8mn-ddr4-evk  | arm64 | lab-nxp | gcc-10   | defconfig+ima              =
  | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-02-v5.17-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-02-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c3b08f12c71900ef2e92cc8f778f3073afe69f4c =



Test Regressions
---------------- =



platform         | arch  | lab     | compiler | defconfig                  =
  | regressions
-----------------+-------+---------+----------+----------------------------=
--+------------
imx6ul-14x14-evk | arm   | lab-nxp | gcc-10   | imx_v6_v7_defconfig        =
  | 1          =


  Details:     https://kernelci.org/test/plan/id/61fa57a889cb991ec85d6eff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fa57a889cb991ec85d6=
f00
        failing since 8 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: v5.17-rc1-18-g925b6371c834) =

 =



platform         | arch  | lab     | compiler | defconfig                  =
  | regressions
-----------------+-------+---------+----------+----------------------------=
--+------------
imx8mn-ddr4-evk  | arm64 | lab-nxp | gcc-10   | defconfig+crypto           =
  | 2          =


  Details:     https://kernelci.org/test/plan/id/61fa5af238ab676f235d6eea

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fa5af238ab676=
f235d6ef1
        failing since 8 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: v5.17-rc1-18-g925b6371c834)
        12 lines

    2022-02-02T10:19:54.377415  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   19.093090] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-02T10:19:54.377638  0000
    2022-02-02T10:19:54.377783  kern  :alert : Mem abort info:
    2022-02-02T10:19:54.377902  kern  :alert :   ESR =3D 0x96000006
    2022-02-02T10:19:54.378026  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-02T10:19:54.378134  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-02T10:19:54.378239  kern  :alert :   EA<8>[   19.120051] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fa5af238ab676=
f235d6ef2
        failing since 8 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: v5.17-rc1-18-g925b6371c834)
        2 lines =

 =



platform         | arch  | lab     | compiler | defconfig                  =
  | regressions
-----------------+-------+---------+----------+----------------------------=
--+------------
imx8mn-ddr4-evk  | arm64 | lab-nxp | gcc-10   | defconfig                  =
  | 2          =


  Details:     https://kernelci.org/test/plan/id/61fa5bbc73502f7c2d5d6ef5

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fa5bbc73502f7=
c2d5d6efc
        failing since 7 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: renesas-next-2022-01-25-v5.17-rc1)
        12 lines

    2022-02-02T10:23:41.017086  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.776174] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-02T10:23:41.017361  0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fa5bbc73502f7=
c2d5d6efd
        failing since 7 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: renesas-next-2022-01-25-v5.17-rc1)
        2 lines

    2022-02-02T10:23:41.018480  kern  :alert : Mem abort info:
    2022-02-02T10:23:41.018624  kern  :alert :   ESR =3D 0x96000006
    2022-02-02T10:23:41.018763  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-02T10:23:41.018901  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-02T10:23:41.019037  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-02-02T10:23:41.019172  kern  :alert :<8>[   14.803511] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform         | arch  | lab     | compiler | defconfig                  =
  | regressions
-----------------+-------+---------+----------+----------------------------=
--+------------
imx8mn-ddr4-evk  | arm64 | lab-nxp | gcc-10   | defconfig+CON...OMIZE_BASE=
=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61fa5bf38c3b64ce9b5d6ef2

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/b=
aseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/b=
aseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fa5bf38c3b64c=
e9b5d6ef9
        failing since 7 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: renesas-next-2022-01-25-v5.17-rc1)
        12 lines

    2022-02-02T10:24:08.588490  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   14.431723] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fa5bf38c3b64c=
e9b5d6efa
        failing since 7 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: renesas-next-2022-01-25-v5.17-rc1)
        2 lines

    2022-02-02T10:24:08.589536  at virtual address 0000000000000000
    2022-02-02T10:24:08.589698  kern  :alert : Mem abort info:
    2022-02-02T10:24:08.589835  kern  :alert :   ESR =3D 0x96000006
    2022-02-02T10:24:08.589957  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-02T10:24:08.590097  kern  :alert :   SET =3D 0, FnV =3D 0   =

 =



platform         | arch  | lab     | compiler | defconfig                  =
  | regressions
-----------------+-------+---------+----------+----------------------------=
--+------------
imx8mn-ddr4-evk  | arm64 | lab-nxp | gcc-10   | defconfig+ima              =
  | 2          =


  Details:     https://kernelci.org/test/plan/id/61fa5c8340940143f05d6f23

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61fa5c834094014=
3f05d6f2a
        failing since 7 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: renesas-next-2022-01-25-v5.17-rc1)
        12 lines

    2022-02-02T10:26:56.835333  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.427357] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-02-02T10:26:56.835611  at virtual address 0000000000000000
    2022-02-02T10:26:56.835769  kern  :alert : Mem abort info:
    2022-02-02T10:26:56.835923  kern  :alert :   ESR =3D 0x96000006
    2022-02-02T10:26:56.836072  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61fa5c834094014=
3f05d6f2b
        failing since 7 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: renesas-next-2022-01-25-v5.17-rc1)
        2 lines

    2022-02-02T10:26:56.836999  kern  :alert :   SET =3D <8>[   15.451980] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-02-02T10:26:56.837156  0, FnV =3D 0   =

 =20
