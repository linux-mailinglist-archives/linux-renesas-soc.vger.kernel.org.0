Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8437B49BC8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 20:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbiAYT64 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 14:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiAYT6t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 14:58:49 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC12C061751
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 11:58:45 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d18so7698866plg.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 11:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LFvYvr9D1Gj7pVZjV+ld6UVKWiSnzls/1DAVQdhfN/s=;
        b=Gtvcg75UYkmoH9ZVSbFl2ekfafTJwm4fe7PoKjq0w0wlUfi0azD4qskoy1rd55JYVB
         v5lwo2a5gSMJXknsFpu2gEwWwoDsrPw3b5GLCBfr7+tuoLmK1MgZLQRNlAY98StJRbsT
         AUrVOGD1czvEVIN0weRxnuunHBWD6Ri/bOb8awuER6EfITS4XW4STuPDUu3OFsXim3zA
         4sEl1r50GiyLCWynkOfdHMO8iD4uh0j63gbWkguyQffuKde1+wc1IW4BWcmVFzeb8mB2
         bOP2pPNvrUuLHjvYQX/TMo9d3t+9zt3PZkLn0Djpg/Zet98XKMsvbf/VRhFbRbNp782w
         5GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LFvYvr9D1Gj7pVZjV+ld6UVKWiSnzls/1DAVQdhfN/s=;
        b=RwELD/smlEXeHE/suixGC+mV39ewN6bw8rLZR/bW+5QVCLroZfkcmMbXebatBU6nSq
         m2xSgmSzVCclIg11CM8EgZmQYIv6m2u9h2Yv5h7Q69UnfyMhLxfd0eHDVUcOtBP8Y8dX
         YqrE/S7oQqaOzQQL1Nb0hUbBl0oarzZGb+K4wz84sps9FOiRH+l3GJ+Fr1YQxgvJ5Rx0
         8980npdNu1CHiZN6IIYZVBh6MEAyBdDSwR4FDqzw43LNMpoSKD0UxDiSqCqePYAU1d+j
         L3SkhPyj7irSRayHPcBIYOeGFGYyxF5Ri1QUdxzTw9e4/zQK3QIomcoqciwb+uyPYGWR
         wM6w==
X-Gm-Message-State: AOAM530ZsWSwPffT9BG6ZqBom/uHc3SZeQDWpO3dAJgFy2a7ynQp2FIp
        wfY3aELUwYRaWKUKCbD9byVlyjOBoHQsxgpg
X-Google-Smtp-Source: ABdhPJzzd5oKoeQBbW8ErjEA94MR9R+rXJgUF3rtk9M4vdAijAjfKrGE1uL61+GCKxmMmfCl3inBDA==
X-Received: by 2002:a17:90b:4c0f:: with SMTP id na15mr5158747pjb.156.1643140724878;
        Tue, 25 Jan 2022 11:58:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e6sm15624914pgi.43.2022.01.25.11.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 11:58:44 -0800 (PST)
Message-ID: <61f05674.1c69fb81.e276b.b0d7@mx.google.com>
Date:   Tue, 25 Jan 2022 11:58:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-01-25-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 467 runs,
 19 regressions (renesas-next-2022-01-25-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 467 runs, 19 regressions (renesas-next-2022-01-25-v5=
.17-rc1)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx6ul-14x14-evk      | arm   | lab-nxp      | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

imx8mn-ddr4-evk       | arm64 | lab-nxp      | gcc-10   | defconfig        =
            | 2          =

imx8mn-ddr4-evk       | arm64 | lab-nxp      | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

imx8mn-ddr4-evk       | arm64 | lab-nxp      | gcc-10   | defconfig+ima    =
            | 2          =

imx8mn-ddr4-evk       | arm64 | lab-nxp      | gcc-10   | defconfig+crypto =
            | 2          =

kontron-kbox-a-230-ls | arm64 | lab-kontron  | gcc-10   | defconfig        =
            | 2          =

kontron-kbox-a-230-ls | arm64 | lab-kontron  | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls | arm64 | lab-kontron  | gcc-10   | defconfig+ima    =
            | 2          =

kontron-kbox-a-230-ls | arm64 | lab-kontron  | gcc-10   | defconfig+crypto =
            | 2          =

meson-g12b-odroid-n2  | arm64 | lab-baylibre | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2  | arm64 | lab-baylibre | gcc-10   | defconfig+crypto =
            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-01-25-v5.17-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-01-25-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1d26428af3fa29a0ab6986cee5a0ed32ea43e975 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx6ul-14x14-evk      | arm   | lab-nxp      | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61f01b170c3b13739babbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f01b170c3b13739babb=
d12
        failing since 0 day (last pass: renesas-next-2021-12-16-v5.16-rc1, =
first fail: v5.17-rc1-18-g925b6371c834) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx8mn-ddr4-evk       | arm64 | lab-nxp      | gcc-10   | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/61f01d332557c3005fabbd2d

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f01d332557c30=
05fabbd34
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        12 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f01d332557c30=
05fabbd35
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        2 lines

    2022-01-25T15:54:05.448055  at virtual address 0000000000000000
    2022-01-25T15:54:05.448324  kern  :alert : Mem abort info:
    2022-01-25T15:54:05.448493  kern  :alert :   ESR =3D 0x96000006
    2022-01-25T15:54:05.448645  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T15:54:05.449028  kern  :alert :   SET =3D <8>[   13.986230] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-01-25T15:54:05.449174  0, FnV =3D 0
    2022-01-25T15:54:05.449304  kern  :alert :   EA =3D<8>[   13.997132] <L=
AVA_SIGNAL_ENDRUN 0_dmesg 810453_1.5.2.4.1>
    2022-01-25T15:54:05.449422   0, S1PTW =3D 0   =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx8mn-ddr4-evk       | arm64 | lab-nxp      | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f01e60ea3e9c1b34abbd9d

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/b=
aseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/b=
aseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f01e60ea3e9c1=
b34abbda4
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        12 lines

    2022-01-25T15:59:01.954045  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.986435] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-25T15:59:01.954296  0000
    2022-01-25T15:59:01.954513  kern  :alert : Mem abort info:
    2022-01-25T15:59:01.954684  kern  :alert :   ESR =3D 0x96000006
    2022-01-25T15:59:01.954841  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T15:59:01.955010  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T15:59:01.955175  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f01e60ea3e9c1=
b34abbda5
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        2 lines

    2022-01-25T15:59:01.956065  kern  :alert :<8>[   15.014301] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx8mn-ddr4-evk       | arm64 | lab-nxp      | gcc-10   | defconfig+ima    =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/61f01ec56b44ddcecfabbd29

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f01ec56b44ddc=
ecfabbd30
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        12 lines

    2022-01-25T16:00:49.027889  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.375302] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T16:00:49.028384  at virtual address 0000000000000000
    2022-01-25T16:00:49.028775  kern  :alert : Mem abort info:
    2022-01-25T16:00:49.029206  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f01ec56b44ddc=
ecfabbd31
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        2 lines

    2022-01-25T16:00:49.030964  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T16:00:49.031280  kern  :alert :   SET =3D <8>[   15.400659] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-01-25T16:00:49.031521  0, FnV =3D 0   =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
imx8mn-ddr4-evk       | arm64 | lab-nxp      | gcc-10   | defconfig+crypto =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/61f020df504207682babbd30

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f020df5042076=
82babbd37
        failing since 0 day (last pass: renesas-next-2021-12-16-v5.16-rc1, =
first fail: v5.17-rc1-18-g925b6371c834)
        12 lines

    2022-01-25T16:09:37.910284  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   15.701982] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-01-25T16:09:37.910545  0000
    2022-01-25T16:09:37.910749  kern  :alert : Mem abort info:
    2022-01-25T16:09:37.910940  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f020df5042076=
82babbd38
        failing since 0 day (last pass: renesas-next-2021-12-16-v5.16-rc1, =
first fail: v5.17-rc1-18-g925b6371c834)
        2 lines

    2022-01-25T16:09:37.912000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T16:09:37.912178  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T16:09:37.912363  kern  :alert :   EA<8>[   15.729169] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-25T16:09:37.912533   =3D 0, S1PTW =3D 0   =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron  | gcc-10   | defconfig        =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/61f0222d12fec69a03abbd24

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f0222e12fec69a03abbd65
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-01-25T16:14:57.041303  /lava-83500/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
0222e12fec69a03abbd66
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-01-25T16:14:57.044517  <8>[   17.228947] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T16:14:58.092878  /lava-83500/1/../bin/lava-test-case
    2022-01-25T16:14:58.093275  <8>[   18.247983] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T16:14:58.093515  /lava-83500/1/../bin/lava-test-case
    2022-01-25T16:14:58.093741  <8>[   18.264351] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-25T16:14:58.093967  /lava-83500/1/../bin/lava-test-case
    2022-01-25T16:14:58.094186  <8>[   18.280772] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-25T16:14:58.094406  /lava-83500/1/../bin/lava-test-case   =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron  | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f023faaae36d2153abbd3d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f023faaae36d2153abbd7e
        failing since 0 day (last pass: renesas-next-2021-12-17-v5.16-rc1, =
first fail: v5.17-rc1-18-g925b6371c834)

    2022-01-25T16:23:04.381442  /lava-83506/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
023faaae36d2153abbd7f
        failing since 0 day (last pass: renesas-next-2021-12-17-v5.16-rc1, =
first fail: v5.17-rc1-18-g925b6371c834)

    2022-01-25T16:23:04.384619  <8>[   19.766149] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T16:23:05.433396  /lava-83506/1/../bin/lava-test-case
    2022-01-25T16:23:05.433756  <8>[   20.784835] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T16:23:05.433976  /lava-83506/1/../bin/lava-test-case
    2022-01-25T16:23:05.434183  <8>[   20.801909] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-25T16:23:05.434377  /lava-83506/1/../bin/lava-test-case
    2022-01-25T16:23:05.434567  <8>[   20.817848] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-25T16:23:05.434758  /lava-83506/1/../bin/lava-test-case   =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron  | gcc-10   | defconfig+ima    =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/61f02476458e3b41b1abbd11

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f02476458e3b41b1abbd52
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)

    2022-01-25T16:25:05.014408  /lava-83509/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
02476458e3b41b1abbd53
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)

    2022-01-25T16:25:05.017605  <8>[   19.011119] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T16:25:06.067123  /lava-83509/1/../bin/lava-test-case
    2022-01-25T16:25:06.067544  <8>[   20.029797] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T16:25:06.067791  /lava-83509/1/../bin/lava-test-case   =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron  | gcc-10   | defconfig+crypto =
            | 2          =


  Details:     https://kernelci.org/test/plan/id/61f0263e366bed91faabbd21

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f0263e366bed91faabbd62
        failing since 0 day (last pass: renesas-next-2021-12-16-v5.16-rc1, =
first fail: v5.17-rc1-18-g925b6371c834)

    2022-01-25T16:32:40.991031  /lava-83516/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
0263e366bed91faabbd63
        failing since 0 day (last pass: renesas-next-2021-12-16-v5.16-rc1, =
first fail: v5.17-rc1-18-g925b6371c834)

    2022-01-25T16:32:40.994136  <8>[   13.962557] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T16:32:42.044484  /lava-83516/1/../bin/lava-test-case
    2022-01-25T16:32:42.044864  <8>[   14.982098] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
meson-g12b-odroid-n2  | arm64 | lab-baylibre | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f01da09b9d2e941aabbd44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f01da09b9d2e941aabb=
d45
        new failure (last pass: v5.17-rc1-18-g925b6371c834) =

 =



platform              | arch  | lab          | compiler | defconfig        =
            | regressions
----------------------+-------+--------------+----------+------------------=
------------+------------
meson-g12b-odroid-n2  | arm64 | lab-baylibre | gcc-10   | defconfig+crypto =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/61f01f7e11b0fc7332abbd22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f01f7e11b0fc7332abb=
d23
        new failure (last pass: v5.17-rc1-18-g925b6371c834) =

 =20
