Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA30681481
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 16:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235678AbjA3PPC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 10:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbjA3POx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 10:14:53 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6F22C672
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 07:14:31 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id r8so5076697pls.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 07:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VdnyF5NtluNOGEICzv9hPCZsIVy/HmNLTS0SXOIPErw=;
        b=pVg1sFK/xigeIedjrfKH5PoKrRy+oYOJ6gMchZyXo8aM84Zuo7ZX93qcYOLzUXBQIi
         rIcfMuFFOdYcgaK0ZEOqD3uLdXlED4Sojoo0acqC6bXjmn5oiSbGvLfJ0vQoVtxnvxxj
         luQrpF+ezcvuZKR1pGQ0ArhlT23YK9qyhYPqfvW9kK2p2aDIAO9VhB25O9f/eNf+e4Gt
         9POtMZfkFvla89aPTtOGH2W4fcmOSuSytgm0NAeJAaJUdCEYFonBeh6xa/2d6WnoBxrw
         yeSeXKj2824gwPdT8MiTnWMhcqzySBRvwLDXHvYccmqVXyoBU8r/3LP3EvkEo8Qch/FR
         Ehyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdnyF5NtluNOGEICzv9hPCZsIVy/HmNLTS0SXOIPErw=;
        b=OkYuvY8Jy6SBjTj746fXIwg07sxp+KGxeqYTrXM2EcIBPwOL3tb2lKz31wFuGOc+cV
         P2vxe89ihf/T8KRJmj3P7SaxwnKpDhz8feo0t8M6oloc1yw5cLau5VVvvcSOx+XXqFXq
         DX3Zc+PbP8TxIybS0yNqazAgiJkX7SLNvuYNqTCPfVtGhgXyRPL786Q/aW+bXHb5BpqI
         4yhYzRFVLLQ4EOo+81tMwdQJdmWZ43DYibanKek8HCDeTH1n4ya8DpVXbFBB77/Xvcjh
         B22+z0egtmScrSbeFaBPTU3wnwnChlJFpv8PtTad9aZ74SeDj0tDGrd+Z0gzs9g3RgGt
         P/uA==
X-Gm-Message-State: AFqh2kq5LBAsg5Sd+SayfSbf+OXmFCsUjyRL/swKV9j6rGuyH9zQQ7kv
        xnpYZ2BKgChZDhX1N43S9hTPd+22OGkt87MSxUY=
X-Google-Smtp-Source: AMrXdXufOzmLNsZGHflz65Q5QEpeOKHIYN4CM2cTnr2dp0W2MmTvb7/PmA+Nyl2nFEn5XhZWYgaTTQ==
X-Received: by 2002:a05:6a21:1646:b0:b1:f593:e738 with SMTP id no6-20020a056a21164600b000b1f593e738mr49181804pzb.28.1675091667806;
        Mon, 30 Jan 2023 07:14:27 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b0058d54960eccsm6393956pfo.151.2023.01.30.07.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:14:27 -0800 (PST)
Message-ID: <63d7ded3.a70a0220.c596f.a105@mx.google.com>
Date:   Mon, 30 Jan 2023 07:14:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2023-01-30-v6.2-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 173 runs,
 18 regressions (renesas-next-2023-01-30-v6.2-rc1)
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

renesas/next baseline-nfs: 173 runs, 18 regressions (renesas-next-2023-01-3=
0-v6.2-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | tegra_=
defconfig              | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-01-30-v6.2-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-01-30-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8dd3dae1705b14948974debe04021549519dfb0b =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a73081f6182bca915ebe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7a73081f6182bca915ec3
        failing since 17 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1)

    2023-01-30T11:16:43.070079  + set +x
    2023-01-30T11:16:43.076909  <8>[   20.555765] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 8933964_1.5.2.3.1>
    2023-01-30T11:16:43.182673  / # #
    2023-01-30T11:16:43.283756  export SHELL=3D/bin/sh
    2023-01-30T11:16:43.284005  <6>[   20.608207] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)
    2023-01-30T11:16:43.284096  #
    2023-01-30T11:16:43.385015  / # export SHELL=3D/bin/sh. /lava-8933964/e=
nvironment
    2023-01-30T11:16:43.385255  =

    2023-01-30T11:16:43.486228  / # . /lava-8933964/environment/lava-893396=
4/bin/lava-test-runner /lava-8933964/1
    2023-01-30T11:16:43.486560   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7a8b5cf98330fd7915f0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7a8b5cf98330fd=
7915f0c
        failing since 5 days (last pass: renesas-next-2023-01-12-v6.2-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7d21806ffd31288915ec2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7d21806ffd31288915ec7
        failing since 5 days (last pass: renesas-next-2022-11-21-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1)

    2023-01-30T14:20:00.301282  <8>[   38.841050] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3245555_1.6.2.4.1>
    2023-01-30T14:20:00.434640  / # #
    2023-01-30T14:20:00.538178  export SHELL=3D/bin/sh
    2023-01-30T14:20:00.539609  #
    2023-01-30T14:20:00.642245  / # export SHELL=3D/bin/sh. /lava-3245555/e=
nvironment
    2023-01-30T14:20:00.643164  =

    2023-01-30T14:20:00.745333  / # . /lava-3245555/environment/lava-324555=
5/bin/lava-test-runner /lava-3245555/1
    2023-01-30T14:20:00.747134  =

    2023-01-30T14:20:00.751904  / # /lava-3245555/bin/lava-test-runner /lav=
a-3245555/1
    2023-01-30T14:20:01.048499  + export TESTRUN_ID=3D1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7d3f8f8411458c9915ec0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-nfs-cubietruck.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-nfs-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7d3f8f8411458c9915ec5
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)

    2023-01-30T14:27:46.454233  + set +x[   43.550227] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3245637_1.6.2.4.1>
    2023-01-30T14:27:46.455003  =

    2023-01-30T14:27:46.584220  / # #
    2023-01-30T14:27:46.687296  export SHELL=3D/bin/sh
    2023-01-30T14:27:46.688251  #
    2023-01-30T14:27:46.790396  / # export SHELL=3D/bin/sh. /lava-3245637/e=
nvironment
    2023-01-30T14:27:46.791695  =

    2023-01-30T14:27:46.894323  / # . /lava-3245637/environment/lava-324563=
7/bin/lava-test-runner /lava-3245637/1
    2023-01-30T14:27:46.896279  =

    2023-01-30T14:27:46.901473  / # /lava-3245637/bin/lava-test-runner /lav=
a-3245637/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7abd2f5baacca85915ec4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7abd2f5baacca85915ec9
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1)

    2023-01-30T11:36:41.561066  + set[   26.235338] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 891818_1.6.2.3.1>
    2023-01-30T11:36:41.561251   +x
    2023-01-30T11:36:41.670837  / # #
    2023-01-30T11:36:41.772724  export SHELL=3D/bin/sh
    2023-01-30T11:36:41.773421  #
    2023-01-30T11:36:41.874721  / # export SHELL=3D/bin/sh. /lava-891818/en=
vironment
    2023-01-30T11:36:41.875399  =

    2023-01-30T11:36:41.976711  / # . /lava-891818/environment/lava-891818/=
bin/lava-test-runner /lava-891818/1
    2023-01-30T11:36:41.977493  =

    2023-01-30T11:36:41.980241  / # /lava-891818/bin/lava-test-runner /lava=
-891818/1 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7aaae532aa0421a915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7aaae532aa0421=
a915eba
        failing since 5 days (last pass: renesas-next-2022-11-17-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7ac530621c20868915ede

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7ac530621c2086=
8915edf
        failing since 5 days (last pass: renesas-next-2022-11-17-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7ad6abb60cfae4c915ecb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7ad6abb60cfae4=
c915ecc
        failing since 5 days (last pass: renesas-next-2022-11-17-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b13e6cb29da1d9915ec2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7b13e6cb29da1d=
9915ec3
        failing since 75 days (last pass: renesas-next-2022-11-10-v6.1-rc1,=
 first fail: renesas-next-2022-11-15-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b3e88ebc3a6288915eed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7b3e88ebc3a628=
8915eee
        failing since 5 days (last pass: renesas-next-2022-11-17-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | tegra_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b74c60d17f6ed4915ec7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7b74c60d17f6ed=
4915ec8
        failing since 5 days (last pass: renesas-next-2022-11-17-v6.1-rc1, =
first fail: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/63d7c5b795a99d2a69915f2b

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-nfs-kontron=
-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-nfs-kontron=
-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63d7c5b795a99d2a69915f2e
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1)

    2023-01-30T13:27:00.281182  / # #
    2023-01-30T13:27:00.383147  export SHELL=3D/bin/sh
    2023-01-30T13:27:00.383650  #
    2023-01-30T13:27:00.485160  / # export SHELL=3D/bin/sh. /lava-260215/en=
vironment
    2023-01-30T13:27:00.485712  =

    2023-01-30T13:27:00.587217  / # . /lava-260215/environment/lava-260215/=
bin/lava-test-runner /lava-260215/1
    2023-01-30T13:27:00.588023  =

    2023-01-30T13:27:00.592906  / # /lava-260215/bin/lava-test-runner /lava=
-260215/1
    2023-01-30T13:27:00.841941  + export TESTRUN_ID=3D1_bootrr
    2023-01-30T13:27:00.845064  + cd /lava-260215/1/tests/1_bootrr =

    ... (12 line(s) more)  =


  * baseline-nfs.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id=
/63d7c5b795a99d2a69915f3e
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1)

    2023-01-30T13:27:04.965532  /lava-260215/1/../bin/lava-test-case
    2023-01-30T13:27:05.026463  [   22.412671] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7acd706340f50a9915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7acd706340f50a=
9915ed3
        failing since 153 days (last pass: renesas-next-2022-08-29-v6.0-rc1=
, first fail: renesas-next-2022-08-30-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b31b1dfc763cec915f2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-m=
eson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-m=
eson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7b31b1dfc763ce=
c915f2d
        failing since 34 days (last pass: renesas-next-2022-11-10-v6.1-rc1,=
 first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7b69ac6ee0ad83f915ee1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7b69ac6ee0ad83=
f915ee2
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7aad7532aa0421a915ecd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7aad7532aa0421=
a915ece
        new failure (last pass: renesas-next-2022-08-30-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d7ccd9b8e220d913915ecb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-30-v6.2-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230120.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63d7ccd9b8e220d91=
3915ecc
        failing since 34 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =20
