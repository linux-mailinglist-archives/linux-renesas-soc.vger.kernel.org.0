Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED36D42A75F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 16:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237271AbhJLOjc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 10:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237015AbhJLOjb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 10:39:31 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453E0C061570
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 07:37:30 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id o133so11474227pfg.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vPnDZEoYUxVtpC6I6lgvAE0Ek1ry9tXo5vgHRqEwiU0=;
        b=fahwsHO0pKL9VEVtA4U8AVUxlUJ5WtHS7rts5v420ck8TWiAfFHgR+loL4gsIkt/rq
         bTX8fmyiGqUHnznK7cijHK1C3Wk3kPGBhOpsH6eYCDmrVOvGT9oi3kG037klzV/oyK1a
         0dpd1M61odJI7k0uOZidSh3rCAq68fRhy1KEJPLNubF9p0YhFgJlLiHJDKQ9BQ1JIVym
         oWtB+yaJrP6cloGNq7W3cQVkEGh4nvzh6LjTHYQuYcwGGieC3MrzEyMCWo3+0CpYEp43
         R5/XO+LbhOddMCNWDPoyGYUZSrRr5XIiLjX8OxYDyk9DJXVi57hICkh5N9FhPnBgJA+s
         /F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vPnDZEoYUxVtpC6I6lgvAE0Ek1ry9tXo5vgHRqEwiU0=;
        b=BGK8Fo/pZ8659tlF2hGEILq9q3OSgnxy6h4KUUSaFwNSKjLPaFPksP4RuZ11nNRvH1
         X3b1NedsHb1hIWDSgwBcPsSPWj2t5Hch/ALqvi4xiC/AGe1zFR9IgqZ81qTXi8zHLXjC
         LC2lVbLBusxA6M3tyHB8UHYsBAOh2LG/hHqiUgccibU7JfhTxsbx/CzBWdjsoSTiDByA
         sDo7t7gZXJ6MVWarlx2iMI8vqvgZ/lXWQgnhk37wGUeeUMUEJUfRQVh66PCDyo/k9Efi
         SV/AwGfY474WctDGXxk3kg0mN+hQI4r24lKjSz9PaZwxSH+H3B1YGwY/Wnt91LOwucw7
         vYuQ==
X-Gm-Message-State: AOAM532WzZSItvPk3zZueMu4B9b83S7fyPjaH+w5qnaJZyPYUaFZEYDf
        vA9PEH/yJ2aktoDeFSNuIBpwXEasQdkZHj8Q
X-Google-Smtp-Source: ABdhPJzT6c39KuL3yO+XAGUovVkuSV0q/HeG2RT9h4+6XZ09o9w+AnDBvpzB3flUxFfZ6c09/v0NYQ==
X-Received: by 2002:a05:6a00:15c8:b0:441:b4f1:652e with SMTP id o8-20020a056a0015c800b00441b4f1652emr32350167pfu.74.1634049449491;
        Tue, 12 Oct 2021 07:37:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u20sm9332571pgf.11.2021.10.12.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 07:37:29 -0700 (PDT)
Message-ID: <61659da9.1c69fb81.ac105.a60a@mx.google.com>
Date:   Tue, 12 Oct 2021 07:37:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-10-11-v5.15-rc1
Subject: renesas/next baseline-nfs: 40 runs,
 15 regressions (renesas-next-2021-10-11-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 40 runs, 15 regressions (renesas-next-2021-10-11=
-v5.15-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+crypto    | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+ima       | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+crypto    | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+ima       | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 2          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-10-11-v5.15-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-11-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      321d106e70eb261bd55bee08d881cbd5468d9d64 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6165675e6a6dfd649208fae9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6165675e6a6dfd649=
208faea
        failing since 95 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/616564c4f456c0ce3e08fae2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-meson-g12=
b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-meson-g12=
b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/616564c4f456c0ce3=
e08fae3
        failing since 28 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/616564f9ab4b2c5b2508faa6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173-el=
m-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173-el=
m-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/616564f9ab4b2c5b2=
508faa7
        failing since 28 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61656cee10bc733dcd08fadb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61656cee10bc733dc=
d08fadc
        new failure (last pass: renesas-next-2021-10-08-v5.15-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61656f0b965169a06108fabd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline-nf=
s-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline-nf=
s-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61656f0b965169a06=
108fabe
        new failure (last pass: renesas-next-2021-10-08-v5.15-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616570bc00938b322b08fac4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/616570bc00938b322=
b08fac5
        new failure (last pass: renesas-next-2021-10-08-v5.15-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61655e88a8df6a719808faab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61655e88a8df6a719=
808faac
        failing since 28 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/616565edb1934be0c808fac6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline=
-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline=
-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/616565edb1934be0c=
808fac7
        failing since 28 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/616567616a6dfd649208faef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline-nf=
s-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline-nf=
s-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/616567616a6dfd649=
208faf0
        failing since 28 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61656872edc166cb2c08facd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-rk=
3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-rk=
3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61656872edc166cb2=
c08face
        failing since 20 days (last pass: renesas-next-2021-08-10-v5.14-rc1=
, first fail: renesas-next-2021-09-20-v5.15-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6165695ab5100be0b908fac5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6165695ab5100be0b=
908fac6
        failing since 28 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/616566bf29d6c61aad08fafe

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/616566bf29d6c61aad08fb08
        failing since 91 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-10-12T10:42:53.934393  /lava-4701108/1/../bin/lava-test-case   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/616566bf29d6c61aad08fb09
        failing since 91 days (last pass: renesas-next-2021-07-08-v5.13-rc1=
, first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-10-12T10:42:51.789641  <8>[   47.391818] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-10-12T10:42:52.838952  /lava-4701108/1/../bin/lava-test-case
    2021-10-12T10:42:52.883405  <8>[   48.486668] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616595dbb10dcc873e08fabf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/616595dbb10dcc873=
e08fac0
        failing since 203 days (last pass: v5.12-rc2-14-g6f56f6c26099, firs=
t fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/616585fb2fac1f816008faca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/616585fb2fac1f816=
008facb
        failing since 164 days (last pass: renesas-next-2021-04-02-v5.12-rc=
2, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
