Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6A23C1B83
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jul 2021 00:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhGHWl3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jul 2021 18:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhGHWl3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 18:41:29 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009E4C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jul 2021 15:38:45 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id ie21so4705641pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jul 2021 15:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YbHHvOL3wLFtcQEKL8F0ph0JyH7EgOKoWYBmtlLsH7U=;
        b=iwQhzlXu52jsCH54jOMM5NyzTdNRl24djl6PHR1RsGqFewAvJGQa9gta3v6gpKjwVz
         EAvXCvLOM+Fu6VwvAI7f7agOFs24wlNaU8Qqf06K1C2uLayxhngkjQpLRd/tNYQqh7dg
         nlSU22uKEP/Pb/9BplkEEIIr9s/VdIw9tIhHJdkzMNoGZDk5XctRc+pJZ/ZUltL1fCIy
         GiPSBVGx/OjZOUZXi//QOzLVI/Azet2ZEGnhhYofWuouFZZKGWrilEiEXdsOVd1FeQgr
         NgKGYsikNIEhnyEskeOqFZmfcw8avIyxSf+JUzsdPIzQH8ZD4vH2V/ujstRiiYT/05zK
         C9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YbHHvOL3wLFtcQEKL8F0ph0JyH7EgOKoWYBmtlLsH7U=;
        b=jSxgbYA2KnMn69mn/MCunU5GRBOqQFnE3aawPdjfOt9olp9shDECwO8Qg7JipuEiM3
         dHKp5buzORVKeSQVS9GCHakr0xxTcixqg95Ad8QlvDgVG5bYs+hejuZgVTtqU6GUrkFf
         Py1jLP4C3yuANrLQXV4c6w0U6r5UAK18nflbrYxPVuqt3RIOEoJFQMta4OXEZe1o+fvN
         o6P9dNepDWeICCSs0EflR4/+mUrd35cGxzTYrfLorUbmeXXcvvfAC1Lk51+DFSO0S5NG
         5oR8fnVBx7lMeGgWWZ/at/PmBK7tcP1hzmH1g0Qcjzra83H5STpki85JdoC82b7Rx7Iu
         FemA==
X-Gm-Message-State: AOAM533gqWGVzAaW4O9k4RsFcFdayfB4rOpc7V3THIODeDZp+YKpvMvq
        nqYkY6yaq4Xh+PCHbSph//H4sEK7DXqpqHYf
X-Google-Smtp-Source: ABdhPJxJ7rUMYuWeZbsg8FxOSCt5ji/1gvV8jIntZLjOOVyI+W7j1bXOhB38qcEwJoAIH2XL0rZNvg==
X-Received: by 2002:a17:90b:30c4:: with SMTP id hi4mr5183905pjb.16.1625783925276;
        Thu, 08 Jul 2021 15:38:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ck22sm3501045pjb.26.2021.07.08.15.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 15:38:44 -0700 (PDT)
Message-ID: <60e77e74.1c69fb81.6c0e8.b035@mx.google.com>
Date:   Thu, 08 Jul 2021 15:38:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-07-08-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 61 runs,
 9 regressions (renesas-next-2021-07-08-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 61 runs, 9 regressions (renesas-next-2021-07-08-=
v5.13-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =

hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-gxm-q200               | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-08-v5.13-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-08-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eb9ec119eee98db6f908226234823a0fef906cd6 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7488ec0db3006a1117970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60e7488ec0db3006a=
1117971
        failing since 72 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60e757c893d3a356e911797b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-hip07-d05=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60e757c893d3a356e=
911797c
        new failure (last pass: renesas-next-2021-06-07-v5.13-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e759461d15c4c03f11796c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-nfs-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60e759461d15c4c03=
f11796d
        new failure (last pass: renesas-next-2021-06-07-v5.13-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60e76b0674727f86d3117977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60e76b0674727f86d=
3117978
        new failure (last pass: renesas-next-2021-06-07-v5.13-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60e75b5bc597503c3b11797a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60e75b5bc597503c3=
b11797b
        failing since 97 days (last pass: renesas-next-2020-10-26-v5.10-rc1=
, first fail: renesas-next-2021-04-02-v5.12-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e752620819067c6011797d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60e752620819067c6=
011797e
        failing since 27 days (last pass: renesas-next-2021-06-07-v5.13-rc1=
, first fail: renesas-next-2021-06-10-v5.13-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60e74d9b0bd86d709e1179a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60e74d9b0bd86d709=
e1179a5
        new failure (last pass: renesas-next-2021-06-07-v5.13-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7579a3d93c3c38611796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60e7579a3d93c3c38=
611796b
        failing since 108 days (last pass: v5.12-rc2-14-g6f56f6c26099, firs=
t fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/60e74dac98ba04a178117989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60e74dac98ba04a17=
811798a
        failing since 68 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
