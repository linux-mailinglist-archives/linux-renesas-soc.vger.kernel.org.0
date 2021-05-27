Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6D03935F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 21:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232891AbhE0TLE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 15:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhE0TLD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 15:11:03 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51400C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 12:09:30 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id y15so1298038pfn.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 12:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mZqeEHs2YYOoXSynbqLCJj9/WozuotPmsa2CgPLvYTk=;
        b=pb7WZe96yXoHH5MUr188SQjXM51xF8xyEr9CGDZB4aCZlrzg9kgKFQNhVvjxXOnYvI
         uWE+W2qS43gKKp8+jwfWuE4ST1XdlxkrdoUV0PXXlejDmHHtFGoeN0TAryDQOMni5AHH
         3N2BqLEsI/IRqwQrNtGDJ1q03iEzAIbR0BE86Vlcukp+DiBFJyFbykEgiWeuvOkBDVu4
         GL84jrw3jDMzPmVpCoOIJ0feyUpRx3m+TYhKBMY+EoYSmSHhIvYXQ4GiY1jkIDEagvTh
         Lc/0emV//+/W9kuzLVp+4QY84fBfwFXwxPnnEYfkWa7z2GpJZsniMcC36F1By3LL4Ejf
         FIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mZqeEHs2YYOoXSynbqLCJj9/WozuotPmsa2CgPLvYTk=;
        b=JC7eN13C4rAYKS6mR+1rOwaJAGpg/fBdl+RkABQomkLBGuI+y0Vx4Ixk9Qyw+0W8WP
         YM5wMCwrqcQd9AclVuEMzkfTDYyZq0AnSUUILMWKHEqI+SN2nTf4gEB+omT4LqBS271G
         w9vv3ltltpuE3JyFbHDfV1lZUjJ7b4+/R9WPd7/jV/eBfPxo0yJhbcdBRa9tcxKD0d9a
         ELfkVJLsObW+dY1hJnPO+ocwg8BnMQV+6otEiwRJNIvII6Z4NunIGQbjByjqYZob/pT4
         DajGHyC/Stenghpn835rs7zNY5SmTLUG+ZSzgUP6dJsxXN/ErlTp6CusZ1/QdtTMJBLb
         uSGQ==
X-Gm-Message-State: AOAM532nJk4t/CoAQac+Xwuc9mwWMoJZjdWn2EdHlkhvqJmN1cbGRs/C
        Gj6wPaGkAQZ47Pge27XQ2DPdnV4yHK1a5g==
X-Google-Smtp-Source: ABdhPJyyRTlhoS48G2g2/kTx/FB17mTf8Y+I9J6jJh4rezvY9IcKpnGAS2nbpNSEEw+Fj8tJB4e+sQ==
X-Received: by 2002:a62:ac1a:0:b029:2db:7c55:7f4 with SMTP id v26-20020a62ac1a0000b02902db7c5507f4mr5104972pfe.26.1622142568867;
        Thu, 27 May 2021 12:09:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f3sm2381137pjo.3.2021.05.27.12.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 12:09:27 -0700 (PDT)
Message-ID: <60afee67.1c69fb81.36e1a.8f82@mx.google.com>
Date:   Thu, 27 May 2021 12:09:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-27-v5.13-rc3
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 21 runs,
 4 regressions (renesas-devel-2021-05-27-v5.13-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 21 runs, 4 regressions (renesas-devel-2021-05-=
27-v5.13-rc3)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig | 1          =

r8a77950-salvator-x       | arm64 | lab-baylibre    | gcc-8    | defconfig =
         | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-27-v5.13-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-27-v5.13-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      526d21d2400220747c84b171477371984e3d1671 =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60afb7677ae95640d4b3afaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60afb7677ae95640d=
4b3afab
        failing since 30 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
r8a77950-salvator-x       | arm64 | lab-baylibre    | gcc-8    | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/60afb743434aa41c12b3afa8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60afb743434aa41c1=
2b3afa9
        new failure (last pass: renesas-devel-2021-05-25-v5.13-rc3) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60afbfabdf002a5e8cb3afbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60afbfabdf002a5e8=
cb3afbe
        failing since 26 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60afbc1235c699db8cb3af9c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-27-v5.13-rc3/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60afbc1235c699db8=
cb3af9d
        failing since 51 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
