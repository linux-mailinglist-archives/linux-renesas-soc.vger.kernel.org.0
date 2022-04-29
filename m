Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A81065158F0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Apr 2022 01:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381596AbiD2X1P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 19:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381663AbiD2X1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 19:27:13 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA93C74A5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 16:23:53 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id x23so2809050pff.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 16:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=K0f9BjfA+ZIxmePExhW/lLK14fYKecXwIF765vn0dOI=;
        b=wHYAMRX33jxLm4LtCimkbH5o3m3FItlrb9Veg9D1/WuptVWGE4K6AxbMsNFioESCSa
         3kgzL9+juEPxWiJljPYlFh8BSclXp1b02O/akOTUNZC5TuAqpGjyhF4XFvXyc5WmPacr
         JEmddwOTCKSmJKz5cgy3yEg/QPR5CwbDmq4ScTcTIMp/X7IOKa7CBt51GpjKCMFai8JK
         O6rjYcEjvKxp5nk/MYoitWeVt8cyaeP84w/secfG7Df6sKEBuiPsORehC+sNYnFqdNTN
         BF/EYXGWLtaLBg5hyGbVqYZT3dM5UrU/USTgl4zyKB5y0fSh57XRmJjrJHJGPMCZBqYJ
         mOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=K0f9BjfA+ZIxmePExhW/lLK14fYKecXwIF765vn0dOI=;
        b=qI1r+K/14a8YsNtBp1EIi3u2nIfWnR7B6pUqCHwN9sCEJNb7WiQzjSQ5VTZh5L6yEN
         VD/2nf7r4LWWetDEhbbK8gmPXLHrK3PFx3TBm7y/n81iA6yxmzQWOEXupeDSmWrfSK2Z
         /kJ4/Njbg7jyeTAWC4rT10i7jMqo46gkbF/7gK5ltiMobBS2VXOKG39VZW0lDZ1bCiMB
         Wjy61C4b0PPJTfczhPd3mPzr/zXqXH1cLBFVVK6Jx0LrbU6yopSb2WCY9PCXRFZ5DsnX
         ZXCH3N2Ac4YH5L3dsuyDTmHc7TOdIqX8gKI7OtLCIFEbvbJhu8wHZi6QBTWWZfaV/erL
         sQLQ==
X-Gm-Message-State: AOAM530R8XKqscsW8c0PHiNcYyxn9z0q97Zki7tQMeCsx2Xy7pUsQduu
        rKfCNRPHMXDRN+l6IzLpAMTpIMds2PGXg4T/7p4=
X-Google-Smtp-Source: ABdhPJzTBpa7I/AfC72q86+ofZ3uE1I0kKrVPQC7wV9A4vYgk9C6u2wu3oQXCardrbGz6TFEWKwanQ==
X-Received: by 2002:a65:42cc:0:b0:3a9:f71f:33f9 with SMTP id l12-20020a6542cc000000b003a9f71f33f9mr1192960pgp.391.1651274633298;
        Fri, 29 Apr 2022 16:23:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v8-20020aa78508000000b0050dc7628145sm218428pfn.31.2022.04.29.16.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 16:23:52 -0700 (PDT)
Message-ID: <626c7388.1c69fb81.d79a5.0c47@mx.google.com>
Date:   Fri, 29 Apr 2022 16:23:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-04-29-v5.18-rc4
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 318 runs,
 4 regressions (renesas-devel-2022-04-29-v5.18-rc4)
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

renesas/master baseline: 318 runs, 4 regressions (renesas-devel-2022-04-29-=
v5.18-rc4)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
am57xx-beagle-x15 | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+d=
ebug     | 1          =

jetson-tk1        | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_AR=
M_LPAE=3Dy | 1          =

odroid-xu3        | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_=
KERNEL=3Dy | 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-29-v5.18-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-29-v5.18-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      32b87add13fcbd8b384a969924720c0f2b30893a =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
am57xx-beagle-x15 | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+d=
ebug     | 1          =


  Details:     https://kernelci.org/test/plan/id/626c445dd54b5a9c30bf5fe0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseli=
ne-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseli=
ne-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626c445dd54b5a9c30bf5=
fe1
        new failure (last pass: renesas-devel-2022-04-13-v5.18-rc2) =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
jetson-tk1        | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_AR=
M_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/626c402476fb2ac965bf5fe9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626c402476fb2ac965bf5=
fea
        new failure (last pass: renesas-devel-2022-04-13-v5.18-rc2) =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
odroid-xu3        | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_=
KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/626c59abbd33a976a7bf6008

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626c59abbd33a976a7bf6=
009
        failing since 38 days (last pass: renesas-devel-2022-03-08-v5.17-rc=
7, first fail: renesas-devel-2022-03-21-v5.17) =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/626c3fe6e85c3d01c5bf5fe1

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-29-v5.18-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/626c3fe6e85c3d01c5bf6003
        failing since 52 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-04-29T19:43:04.184344  /lava-6210932/1/../bin/lava-test-case
    2022-04-29T19:43:04.195622  <8>[   33.572596] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
