Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9756439E076
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 17:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhFGPcV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 11:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbhFGPcP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 11:32:15 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35D2C061766
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 08:30:11 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id x73so13347606pfc.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 08:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uWIml3np30Yu78JP1sDFfB+3ShhkLvS1/BNla+3PQhg=;
        b=XrbAOKRn4pfcf7hkB/0WU6il+u6vWQ7Caeny9qsPPbpdk6HgqvnI5R9WXroiVBx1Zs
         0cWSe+BQEnMBx6dN8gSjJYm1HGU0hO9nvHRhpb34N2DqJc6QcE6sM0I5sJaRIM8+f05x
         3Cnv/M+igIRtJt0eff3GpnLmBq1sN3535u9dnfj6UsmF9MwFjUUCW9xjgWGi6l/H3WC9
         cM8nssXba5l+FAPFFoa16Ikj0HC3AWN/pab81W0I8jtMsNprWcs6sIu+9bcO829QX9eH
         CxO5wagSNi1Mk9CXL0z7uM+CWuLuIbFyqZ0hLmYTN4CKc5S9i6i5mEtmnTQwsDv8B/Ky
         Zgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uWIml3np30Yu78JP1sDFfB+3ShhkLvS1/BNla+3PQhg=;
        b=fi4cguZn/bg9exhNWDriaJA6GPovdHZs0EN77e/PaTKfeok7W4lT70cLZQen5KIBys
         2vaIg0rKkzBA1mSnBlyDErz4S6SZvciDk3+Z4qUexSmFQw/JLTBLY0XTCPWhm5DJaQZI
         UF+HtFPUk3FWrGR1xHWeP/fWIzfpiA94qtoQbithg2t9llAzufghjVbwzLcD9Xtjauq6
         VbGTaLIIDTv+cOzBBE4qwPypBZHROUiOVc82zsDZbJCK2IFlhH7xhuxVnrHBHWrCPsjH
         abzaGZ3xHm2chQcMM8+u1CQ2H2Gx+Di0VxhqxbZIGf1igAdreuNSHdkfRieoQ8SpMZye
         ML5w==
X-Gm-Message-State: AOAM532L2pFw/3T0i5K/6lW05sZlX5JoAY+trlY9lv6GeRowQhjg/g5e
        i1qY0nTY67TJK6pFcY91Zj4csg3/o+rofFZq
X-Google-Smtp-Source: ABdhPJxsMFmnAx2Uhl0JRUJjQHEW7e+t1BPkCJWGM7O6iXLlcsS9hB3T0QxjZ4y3SHk3ySAQT/WXaQ==
X-Received: by 2002:a05:6a00:a02:b029:2ec:a0a6:9c54 with SMTP id p2-20020a056a000a02b02902eca0a69c54mr13050682pfh.47.1623079810953;
        Mon, 07 Jun 2021 08:30:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k15sm13267212pjf.32.2021.06.07.08.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 08:30:10 -0700 (PDT)
Message-ID: <60be3b82.1c69fb81.278c7.7d67@mx.google.com>
Date:   Mon, 07 Jun 2021 08:30:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-06-07-v5.13-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 51 runs,
 6 regressions (renesas-devel-2021-06-07-v5.13-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 51 runs, 6 regressions (renesas-devel-2021-06-=
07-v5.13-rc5)

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

r8a77950-salvator-x       | arm64 | lab-baylibre    | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x       | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-07-v5.13-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-07-v5.13-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0dc27258c7ad2021418a2aa43fb14a9dda2dd46d =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60bdff9355556a8fae0c0df7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60bdff9355556a8fa=
e0c0df8
        failing since 41 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/60be24854e31fc640c0c0e90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60be24854e31fc640=
c0c0e91
        failing since 131 days (last pass: renesas-devel-2021-01-04-v5.11-r=
c2, first fail: renesas-devel-2021-01-26-v5.11-rc5) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x       | arm64 | lab-baylibre    | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60be05cdb377aa1ee60c0dfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bay=
libre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60be05cdb377aa1ee=
60c0dfb
        new failure (last pass: renesas-devel-2021-05-31-v5.13-rc4) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x       | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/60be147febdb7ad1de0c0e0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60be147febdb7ad1d=
e0c0e0e
        failing since 10 days (last pass: renesas-devel-2021-05-25-v5.13-rc=
3, first fail: renesas-devel-2021-05-27-v5.13-rc3) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60be098a56ea68416a0c0e2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60be098a56ea68416=
a0c0e2b
        failing since 37 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/60bdff2383ed66f2c00c0e20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60bdff2383ed66f2c=
00c0e21
        failing since 62 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
