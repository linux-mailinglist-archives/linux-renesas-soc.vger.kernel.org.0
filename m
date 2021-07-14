Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CD93C7B85
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 04:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237401AbhGNCO6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 22:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237450AbhGNCO6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 22:14:58 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E25C0613DD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 19:12:07 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id d9-20020a17090ae289b0290172f971883bso2727922pjz.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 19:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4lo7BRDpYSJapLY8wjit3Y3ljAIxdqt/BMwKoyllZ9M=;
        b=pY5UfcJedMT86qB2us148OU6s79T8/VHKMWNuRuyMcfhpWElylZgLi+qC07F0RuTGW
         1ogon5Py21h0xFmPN6ZUlb3kpsdyTO8HthPpD8PyeWOJGvpDaE09FaUfB8wPfJZzmeH4
         hm0/NyOzFjpTvw+9rAn6u6i1e2abxdn6CwdHFeMEHApgNbJjg5wM2epoaEaiW2lyRof0
         yqnt2G/Ce9+NYOTx9LFcNfkHrc+XqyBpncki0d5VExG4u5lREoBs8e9m4rw6wtDPylmM
         4FW72tgs7eL5yh1fBdvm6/JLojkCTaxWgRCyeGvhxwaw9YLxtVAdWCE2trZ+aM1RoblF
         FFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4lo7BRDpYSJapLY8wjit3Y3ljAIxdqt/BMwKoyllZ9M=;
        b=pH0gG4X0H+xZC4TGkXKUxOQpXrOvD7nv/7Q1bBpI8QLqVumcCNK+SbH43Lx9VR2LSQ
         47vgKHwQFjyaDT6cqXqgzpRCDV4fnT4JzW2l0sEM2A8KLhKJEdbyy7SkTXVEUOMkbe+9
         9UTgGjT7afLVYUUhulBa01nFq3+lVnY7U4lpPxwdndTVrY1nLMum7iQSAZ+0fUE5n0Mq
         ouA0CjutUcP697HwEKkDC0OBBrCnwk3/K9y9kCqXvcbRrGKrCRgOZvSnsYbJsp+LE5lY
         YiUYrvTDNyqX1/ToceWHCq1MPNwEjqNu/bZKC2REj+uCVR+1zmK8hJf62uu/zZzdwnBB
         Jt1g==
X-Gm-Message-State: AOAM530wOEvQvroi4E/aoWEv0saxbth2rwfDedyR2WIhYid3KLxlkG+X
        Q7sFcSpHfGbK2t7fqom4dtgZTOHC5bztBQ==
X-Google-Smtp-Source: ABdhPJw+ddVDpP91NgvZxPDZ68sAPkmksQAH4z5/ijlIHb4rMuJaO7KTVSGU+xqlqpKP+cFnJo0u1A==
X-Received: by 2002:a17:90a:4d04:: with SMTP id c4mr1283133pjg.148.1626228726302;
        Tue, 13 Jul 2021 19:12:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x14sm422579pjc.4.2021.07.13.19.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:12:05 -0700 (PDT)
Message-ID: <60ee47f5.1c69fb81.efcae.256a@mx.google.com>
Date:   Tue, 13 Jul 2021 19:12:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2021-07-13-v5.14-rc1
Subject: renesas/next baseline-nfs: 54 runs,
 13 regressions (renesas-next-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 54 runs, 13 regressions (renesas-next-2021-07-13=
-v5.14-rc1)

Regressions Summary
-------------------

platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
beaglebone-black          | arm   | lab-cip       | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beaglebone-black          | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beaglebone-black          | arm   | lab-cip       | gcc-8    | omap2plus_de=
fconfig          | 1          =

beaglebone-black          | arm   | lab-collabora | gcc-8    | omap2plus_de=
fconfig          | 1          =

hip07-d05                 | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 1          =

hip07-d05                 | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200            | arm64 | lab-baylibre  | gcc-8    | defconfig   =
                 | 1          =

rk3288-veyron-jaq         | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 2          =

rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-13-v5.14-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      51832d6b6211d53dd4145b477a0b0d0fc87d84cb =



Test Regressions
---------------- =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
beaglebone-black          | arm   | lab-cip       | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0e8e25aaa527238a93f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseli=
ne-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseli=
ne-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee0e8e25aaa5272=
38a93f5
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
beaglebone-black          | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee15f3b8f6086c998a93b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee15f3b8f6086c9=
98a93b7
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
beaglebone-black          | arm   | lab-cip       | gcc-8    | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0ef1daf388e8d98a93b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-nfs-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-nfs-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee0ef1daf388e8d=
98a93b5
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
beaglebone-black          | arm   | lab-collabora | gcc-8    | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee18bbb5de7aec648a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-nfs-b=
eaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-nfs-b=
eaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee18bbb5de7aec6=
48a939c
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
hip07-d05                 | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee1ea6cd674864e88a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee1ea6cd674864e=
88a939c
        failing since 5 days (last pass: renesas-next-2021-06-07-v5.13-rc1,=
 first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
hip07-d05                 | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee266a6d9aa104118a93cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee266a6d9aa1041=
18a93ce
        failing since 5 days (last pass: renesas-next-2021-06-07-v5.13-rc1,=
 first fail: renesas-next-2021-07-08-v5.13-rc1) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
meson-gxm-q200            | arm64 | lab-baylibre  | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee10036dda561bd18a93c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee10036dda561bd=
18a93c7
        failing since 102 days (last pass: renesas-next-2020-10-26-v5.10-rc=
1, first fail: renesas-next-2021-04-02-v5.12-rc2) =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq         | arm   | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee233b1eceadc03a8a939b

  Results:     68 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case=
/id/60ee233c1eceadc03a8a93db
        new failure (last pass: v5.14-rc1-17-gcd117793e1ac)

    2021-07-13T23:35:11.159266  /lava-4192914/1/../bin/lava-test-case
    2021-07-13T23:35:11.210176  <8>[   29.856853] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee1f8d4ff416b4158a939b

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/60ee1f8d4ff416b4158a93a5
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-13T23:19:19.560006  /lava-4192842/1/../bin/lava-test-case
    2021-07-13T23:19:19.601885  <8>[   45.337822] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/60ee1f8d4ff416b4158a93a6
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-13T23:19:18.467738  /lava-4192842/1/../bin/lava-test-case
    2021-07-13T23:19:18.508646  <8>[   44.244833] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin          | arm64 | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee27c857b5d3949c8a93b3

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test=
/case/id/60ee27c857b5d3949c8a93bd
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-13T23:54:42.742215  /lava-4193013/1/../bin/lava-test-case
    2021-07-13T23:54:42.784198  <8>[   45.030065] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline-nfs.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test=
/case/id/60ee27c857b5d3949c8a93be
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac)

    2021-07-13T23:54:41.649213  /lava-4193013/1/../bin/lava-test-case
    2021-07-13T23:54:41.690393  <8>[   43.935600] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                  | arch  | lab           | compiler | defconfig   =
                 | regressions
--------------------------+-------+---------------+----------+-------------=
-----------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee2292f16048f4c98a93a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60ee2292f16048f4c=
98a93a2
        failing since 74 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
