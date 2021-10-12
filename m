Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357CE42AD8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 22:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhJLUF1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 16:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJLUF1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 16:05:27 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FEAC061570
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 13:03:25 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id m21so125138pgu.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 13:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AUbIGHB2wuXeCZyn4EX6MEULRpx9vJqDVkSxejOrkmI=;
        b=lXBXQOhNmu5IITqAAAqS8Ky08+J+kV9UN/2BeshZGyXAFbKmd37T52GprXa8g5GVam
         LYwwGIMrhv/3npgvOjaW52EO1SR5GyKYbk9hsWVC/M+gNtLJY5GHbzh251/g//lYKecU
         HoRvrp1sdgc4bPIhBssgQybrTeNTO1zkjKjWpgLrIpKAB7c+FogbacY90qW/xcvSRXF3
         CBL6gJeysk25Rsh/6LZnWuGGfE2oAl3M+aTUip+FtGtSqjU/Hn5HSbxom9GjDPLodRv3
         4ZGEEMT656b0s6JkEfq0xc0uMb7hqUTOTswZmN3ySW8dxQuVRLCEC9IOFZ7cri+exNqG
         2gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AUbIGHB2wuXeCZyn4EX6MEULRpx9vJqDVkSxejOrkmI=;
        b=WD4Ri7zOTAUfzh5Vy1cScq4KfENqE5AYLiKKOqeess9XcqgKjm2SUylp8PXFbouz9M
         nPfk+wZHMsjYQhFYpUzzWjhbkwavcum5Pp+7lifRURsbN+/h8CZBwXqHq6eGHMkBY97k
         8w9TWNruWuDJn/pwh8sVI6xcE3kisicum8LAymvddZnS/q3qOQt3swS0TgPB5NzwVn/M
         7dKbL4fEYmJ7g94ucHF/EammwAglLur4PwgwkVHtw2jabLOgbrgb0IF6oLHTQIBB8hxh
         vUtpmAEpg1rwYV2kVHMY+Gk8rmf999z1TvKjFrCeUK5xeFGQw3jJDvmBkUYvcHpnldfk
         S7Aw==
X-Gm-Message-State: AOAM530GJdGM3xzCNWHtnKgzcNwe+0cYDV2RYLeJC4Yo5d3RCjWMLPbq
        xhW3Ls1NpwF4h7FgW9rqgM6xihMn5U881XVl
X-Google-Smtp-Source: ABdhPJys4jpuAe8EQkPjlK95k0dGVa92JXzEBomne63THNlo1ldB6Do7bgLYhLdu0EA20RsMk5Ldxw==
X-Received: by 2002:a05:6a00:2388:b0:44d:4b5d:d5e with SMTP id f8-20020a056a00238800b0044d4b5d0d5emr2541316pfc.80.1634069004551;
        Tue, 12 Oct 2021 13:03:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s2sm3732310pjs.56.2021.10.12.13.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 13:03:24 -0700 (PDT)
Message-ID: <6165ea0c.1c69fb81.7f2f2.b578@mx.google.com>
Date:   Tue, 12 Oct 2021 13:03:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-10-11-v5.15-rc5
Subject: renesas/master baseline-nfs: 34 runs,
 10 regressions (renesas-devel-2021-10-11-v5.15-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 34 runs, 10 regressions (renesas-devel-2021-10=
-11-v5.15-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+ima       | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-11-v5.15-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-11-v5.15-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6e602e69ec04a3e0887e4fd9189250b4e7ee7e23 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6165b8185bafbdeebb08fac6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6165b8185bafbdeeb=
b08fac7
        failing since 91 days (last pass: renesas-devel-2021-06-28-v5.13, f=
irst fail: v5.14-rc1-477-g3c037963715c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6165b5c4326e99bda708faaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6165b5c4326e99bda=
708faab
        failing since 20 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6165b6b0f7d5f6be5d08fb2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6165b6b0f7d5f6be5=
d08fb2d
        new failure (last pass: renesas-devel-2021-10-08-v5.15-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6165aa9b84c9cd153e08fac9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6165aa9b84c9cd153=
e08faca
        failing since 60 days (last pass: renesas-devel-2021-08-10-v5.14-rc=
5, first fail: renesas-devel-2021-08-12-v5.14-rc5) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6165af90845717ebf708faab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6165af90845717ebf=
708faac
        failing since 3 days (last pass: renesas-devel-2021-10-04-v5.15-rc4=
, first fail: renesas-devel-2021-10-08-v5.15-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6165b1c1d2659779ec08fad6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-8/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6165b1c1d2659779e=
c08fad7
        failing since 20 days (last pass: v5.15-rc1-564-ge23d26d2dc9a, firs=
t fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6165b5febf8f7df19408fae0

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/6165b5febf8f7df19408faea
        failing since 91 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-10-12T16:21:03.916196  [   42.588217] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-10-12T16:21:04.959877  /lava-4702709/1/../bin/lava-test-case
    2021-10-12T16:21:04.994596  [   43.667333] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/6165b5febf8f7df19408faeb
        failing since 91 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: v5.14-rc1-477-g3c037963715c)

    2021-10-12T16:21:02.833081  [   41.503127] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-10-12T16:21:03.881215  /lava-4702709/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6165db246a5559460f08fab1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6165db246a5559460=
f08fab2
        failing since 164 days (last pass: renesas-devel-2021-04-02-v5.12-r=
c5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6165dcc85cff05c51308fb03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6165dcc85cff05c51=
308fb04
        failing since 189 days (last pass: renesas-devel-2021-04-02-v5.12-r=
c5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
