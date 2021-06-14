Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2BB93A6D4A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 19:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbhFNRjM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 13:39:12 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:34621 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235546AbhFNRjG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 13:39:06 -0400
Received: by mail-pl1-f179.google.com with SMTP id h1so6974250plt.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zSUzxpfMR4TK/XDUYKSvlrWx4cXJa9oTitXDHONu7Xw=;
        b=obGHS9+TW5jI75MlkwEvPZ8QXXUnrWXK2Zowa+WjbWaVySwvoBTCL+EgHLJgoImhLe
         isy68/8OrrUQfvJrT2KyJ8nxOn+Da5XlDjD3gy7JKMyt50J/cksvk0zse0xDZc1A3vhK
         EzGJxTK3AmCzOx7yeL6YwBuPD8+IpOO/xd7ubpwgxksnz73Ia0P0QOhoL6RTEORk3EnK
         ONDFEZsnZMKW/OL04q1af0A50qxxLjds0FKpXDWw8oF8vdNQi7M9NO3ZABvUls2rllPr
         2cucdZWP2M/dN3vNDJ8WzjaA0LtSt3UYih7l5uMpAw6/Q5WupqH8nn+f7LnDTXQMpsVV
         SuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zSUzxpfMR4TK/XDUYKSvlrWx4cXJa9oTitXDHONu7Xw=;
        b=YYiY2tcjxG8If5+0jBEI0SYQkWwg+Od/efrbdMuZ7oxGkwO23iwC2ceHTd801hevJ2
         h9UgSTHedLKiVsloGeGjVZ9fEYZ9dhFp0f22fCmoiqSKw40L/s9d543HL5/XDzXJA3I6
         16hIu0h7yPwFokjLOBx7vlzOpe72u+Kkw7/hS/ubO4If/olq3JHMrsbYxxqIEhTVjf6E
         5eZ/qv5unlW2RYcGIlmPgWbMDyNkRBIyEmRmh+8djY4HFbv8Cw2QsFn2FqLwhq0QLElC
         xZbRgb9RGsQA3U4UUVYOv4YdtH4zGYvcj9S8Cvhf/FIqM+cfXziCgGy9zjPvvRANBIso
         58wA==
X-Gm-Message-State: AOAM530h7aLIFVXk+Ei+uLKKc8QjzCt6JDyNg/CZOiEtX+Jyygy2Mukr
        lCrs1NB97oVsKPHLfcNH/q2114sE0Kw7/o/Y
X-Google-Smtp-Source: ABdhPJzdDh7iUXVkbGYVGO0M/FK5Dcw7ojf+q7cGmoBtehXjQhzZyKnCB48O3Vmd59cSBZZK3DjuEQ==
X-Received: by 2002:a17:90b:1285:: with SMTP id fw5mr236852pjb.35.1623692162639;
        Mon, 14 Jun 2021 10:36:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m16sm10076575pgb.92.2021.06.14.10.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 10:36:02 -0700 (PDT)
Message-ID: <60c79382.1c69fb81.e845f.b7f6@mx.google.com>
Date:   Mon, 14 Jun 2021 10:36:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-06-14-v5.13-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 56 runs,
 6 regressions (renesas-devel-2021-06-14-v5.13-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 56 runs, 6 regressions (renesas-devel-2021-06-=
14-v5.13-rc6)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 1          =

meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =

mt8173-elm-hana           | arm64 | lab-collabora   | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

odroid-xu3                | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-14-v5.13-rc6/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-14-v5.13-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      62ebef21d49093d77b84633283806c94630e3694 =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60c75d6ba41f76a4d2940f6b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c75d6ba41f76a4d=
2940f6c
        failing since 48 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/60c76a692840caf9fe9cd0b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c76a692840caf9f=
e9cd0b5
        failing since 139 days (last pass: renesas-devel-2021-01-04-v5.11-r=
c2, first fail: renesas-devel-2021-01-26-v5.11-rc5) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
mt8173-elm-hana           | arm64 | lab-collabora   | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60c75d66708e7eac08940f5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/baseline-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c75d66708e7eac0=
8940f5d
        new failure (last pass: renesas-devel-2021-06-10-v5.13-rc5) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
odroid-xu3                | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60c76abc311344218741f53c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c76abc311344218=
741f53d
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60c76abd03e0d8ddd141f51e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c76abd03e0d8ddd=
141f51f
        failing since 44 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/60c76a0d76c099906b9cd0cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60c76a0d76c099906=
b9cd0cc
        failing since 69 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
