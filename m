Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366E949FFB7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jan 2022 18:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235131AbiA1RnN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 12:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbiA1RnM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 12:43:12 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F080C061714
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 09:43:12 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id c9so6685085plg.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 09:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6QpkxygqsienFXA4+BeLv4CLMyrT72A0w8+soHUgITA=;
        b=B1tmFAdXW5zsKI3zPGQ7UleD4uFA1xtJCH+0vDeRHAUMI3lpswGmwNr3uZ6pDC3+5R
         mcPvZqXzzT1e02uDv6ovY7VUtbOGsWXsKfKW2FN3MdwWK0govsNB28hdvi4RkG0VO4R6
         5V2zrIQ3BC/3nMmnPXhcPyDd3M7JGvncNdyctkbEQWHaUG2cx+zVLhYOUL/IkawsoLcF
         lm542rPLhzer50zxGFB3p0FiBlCwF/YU82LUBEL/hK6YXQ49W+Vmutlymsd9udODalCo
         pJFgeCmmlKK4eSy1yaimDgLsLPntNkd56h3hbC7e7RT9Ud8+zF4ZdNFvka9s9HUIT7by
         J/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6QpkxygqsienFXA4+BeLv4CLMyrT72A0w8+soHUgITA=;
        b=zZYZBSPXFLpTKucb+WA4uMiEqwJgsq82O7kbO0nmSjgkNwrAJrTRTZ+CC6WYvviDkx
         qtdnQ5yR8Q4s/oESbgE3upiCelP2aTMQsBjIUv5yDBPSKTBqEJ6JPzac6057GtI4Orxy
         olx4U1C6Pi0ajBp30YuIQwI/xgnuRWtJ0JLRBlVWkXwa1wExYKLJFAxvV0XrxN7f2reW
         P2wNITNbJH8twvZ7ZpnSx3A922i5oufAA+Ri8hDnd4KxSlrBTvK2enLp2GWbKMC3lUfR
         RW6Zm4VmXJjuBfJhtWQeI9JEMXaj3y+LaPLLVkE01xsWgYNeA5m5DSJbOKMhzrgnNmfy
         zAPg==
X-Gm-Message-State: AOAM5338NfNJV5ZMi1r6K2W3yAAYa7jOVkuJdNMX7yjKXoySLrbmlRZY
        DlL/Sd6V63UaHaltDRUlHuhxxwDH9CFUIOTe
X-Google-Smtp-Source: ABdhPJyx8uxaIVwSDzWP3U9Y6fR5hbvlN1JI+4SjpCQVdassojjaizaP2Bc+m0nlXyRY0My1EmW5Xw==
X-Received: by 2002:a17:902:ed82:: with SMTP id e2mr9781791plj.55.1643391791767;
        Fri, 28 Jan 2022 09:43:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b23sm2878093pjz.34.2022.01.28.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 09:43:11 -0800 (PST)
Message-ID: <61f42b2f.1c69fb81.1d2fd.7c95@mx.google.com>
Date:   Fri, 28 Jan 2022 09:43:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-01-28-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 304 runs,
 7 regressions (renesas-next-2022-01-28-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 304 runs, 7 regressions (renesas-next-2022-01-28-v5.=
17-rc1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
imx6ul-14x14-evk  | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defconfig =
         | 1          =

imx8mn-ddr4-evk   | arm64 | lab-nxp       | gcc-10   | defconfig+ima       =
         | 2          =

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_=
KERNEL=3Dy | 1          =

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
         | 1          =

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig+c=
rypto    | 1          =

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | tegra_defconfig     =
         | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-01-28-v5.17-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-01-28-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7fb968536682d96db805b040a0d8376c36c718a5 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
imx6ul-14x14-evk  | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/61f3f48e3cca929db9abbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f3f48e3cca929db9abb=
d12
        failing since 3 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: v5.17-rc1-18-g925b6371c834) =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
imx8mn-ddr4-evk   | arm64 | lab-nxp       | gcc-10   | defconfig+ima       =
         | 2          =


  Details:     https://kernelci.org/test/plan/id/61f3f243e204a36d81abbd3d

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f3f243e204a36=
d81abbd44
        failing since 2 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: renesas-next-2022-01-25-v5.17-rc1)
        12 lines

    2022-01-28T13:39:57.501709  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   14.637627] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-28T13:39:57.501858  at virtual address 0000000000000000
    2022-01-28T13:39:57.501988  kern  :alert : Mem abort info:
    2022-01-28T13:39:57.502105  kern  :alert :   ESR =3D 0x96000006
    2022-01-28T13:39:57.502239  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-28T13:39:57.502354  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61f3f243e204a36=
d81abbd45
        failing since 2 days (last pass: renesas-next-2021-12-16-v5.16-rc1,=
 first fail: renesas-next-2022-01-25-v5.17-rc1)
        2 lines

    2022-01-28T13:39:57.503072  kern  :alert :   EA<8>[   14.662798] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-01-28T13:39:57.503186   =3D 0, S1PTW =3D 0   =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_=
KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f4058ce93c82f519abbd19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f4058ce93c82f519abb=
d1a
        new failure (last pass: renesas-next-2021-11-26-v5.16-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/61f4061a24ba036dc5abbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra=
124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra=
124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f4061a24ba036dc5abb=
d12
        failing since 2 days (last pass: renesas-next-2021-11-30-v5.16-rc1,=
 first fail: v5.17-rc1-18-g925b6371c834) =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig+c=
rypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61f40b800da577121cabbd2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f40b800da577121cabb=
d2b
        failing since 2 days (last pass: renesas-next-2021-11-26-v5.16-rc1,=
 first fail: v5.17-rc1-18-g925b6371c834) =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | tegra_defconfig     =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/61f40c490e4da0b89fabbd13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f40c490e4da0b89fabb=
d14
        failing since 2 days (last pass: renesas-next-2021-11-30-v5.16-rc1,=
 first fail: v5.17-rc1-18-g925b6371c834) =

 =20
