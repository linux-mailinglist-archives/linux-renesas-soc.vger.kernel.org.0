Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2755F2DFF53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 19:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgLUSIW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 13:08:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgLUSIV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 13:08:21 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A293C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 10:07:41 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id v2so6890198pfm.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 10:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XzvMh5tfRy0HIGfFH/GovknnlbuLVZpo/zLn1QWOG6s=;
        b=M1/tGCk6uoA72HoCfY/nDSpkeSqUtJdgNZiBkHrS9OzG3PxNAX2M8axSKo+wXWCuYl
         /srM78KXPxq7FyRF6GMcsAN8BIBtI6FVi1pXzQvr5CdIgqSFCRcMhlDfbSBZeSN/WZyP
         4dUb5ddmrfT5rXIlLbPY+ZxXlL2GL7bSW5OJlLcsbnxLsA3ceXrJJ8fTXx/XtX34PsmY
         CqAXDzBCKQ1qqKiQi2zRJmoWlczfQEFDNRlR1Ld3w9/fiP8/Tbme/+985pQUuN8SZymX
         QP8ydmUQmmfW8tPm9SA/bH7HW8G8YbZhiL5BANxTPOQbcirnCa2hd2O0uQuMdkEhu2nk
         iOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XzvMh5tfRy0HIGfFH/GovknnlbuLVZpo/zLn1QWOG6s=;
        b=XnKCyUf5w0Xgv5mO//P0opvEDWDZT8SGqU3feeXNydhrHvlHTPKx2F1y8pP6yQ/Vf5
         XYq17TyCRFF4dPZJzjkBGNGi+hcYplIH6+LaTea2qoatSKAXFgdVEpAukf0avxz4aABr
         M5yjV9H+syf0vRQkclCv7+3pwL1zj7h2j64cXkY4OXFOH1GVKFXee7UhLqYyigOYv1fG
         gcK5fpnFwcit0gQYebcVaIB2bK2DfK7atTR8bQyGUj4weyzCOXXvQnzHWp7j6/q8tj0p
         /JxI86SFA96paGyFyX7ipp11Rcku8E4LeM2TcbtGU9SC2hX7PJVlBUr5of7+hVzGAkj1
         NNeA==
X-Gm-Message-State: AOAM532n9WCL4XE4SJsocbKhjYm7Gfl/cBsSh+NQBq21ugpsWgGpBjsY
        8rxNEDad51sn9Xh7fwaQsmPZk+pJJ+0UzQ==
X-Google-Smtp-Source: ABdhPJwjGrZjOV9J+5OKanqFs3BH38OHV77YwoVMuNPkZsh/trZht01TTVHoCYqM6MjDIhQ5pGhHow==
X-Received: by 2002:a62:1b16:0:b029:19e:238:8627 with SMTP id b22-20020a621b160000b029019e02388627mr15345003pfb.52.1608559164868;
        Mon, 21 Dec 2020 05:59:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 19sm16412945pfn.133.2020.12.21.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 05:59:23 -0800 (PST)
Message-ID: <5fe0aa3b.1c69fb81.20f90.fd4d@mx.google.com>
Date:   Mon, 21 Dec 2020 05:59:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2020-12-21-v5.10
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 295 runs,
 9 regressions (renesas-devel-2020-12-21-v5.10)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 295 runs, 9 regressions (renesas-devel-2020-12-21-=
v5.10)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-sabresd            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =

meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 2          =

qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2020-12-21-v5.10/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2020-12-21-v5.10
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a0d9f5cfe680c9afb8a9bb2d57b6a1c707da9c3a =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-sabresd            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe074834fb002747fc94cd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabres=
d.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabres=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fe074834fb002747fc94=
cd8
        failing since 48 days (last pass: renesas-devel-2020-10-30-v5.10-rc=
1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe07600ddf9c865d7c94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fe07600ddf9c865d7c94=
cc7
        failing since 48 days (last pass: renesas-devel-2020-10-30-v5.10-rc=
1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe073e12c4b4545eac94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fe073e12c4b4545eac94=
cba
        new failure (last pass: renesas-devel-2020-12-14-v5.10) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe070ea45f4e1e9c1c94cd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fe070ea45f4e1e9c1c94=
cd3
        new failure (last pass: renesas-devel-2020-12-14-v5.10) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/5fe06f6c14c3df7188c94ccd

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fe06f6c14c3df7=
188c94cd1
        new failure (last pass: renesas-devel-2020-12-14-v5.10)
        10 lines

    2020-12-21 09:48:23.130000+00:00  kern  :alert : Mem abort info:
    2020-12-21 09:48:23.130000+00:00  kern  :alert :   ESR =3D 0x96000004
    2020-12-21 09:48:23.171000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-12-21 09:48:23.171000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-12-21 09:48:23.172000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-12-21 09:48:23.172000+00:00  kern  :alert : Data abort info:
    2020-12-21 09:48:23.172000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004
    2020-12-21 09:48:23.172000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-12-21 09:48:23.172000+00:00  kern  :alert : [00020000400400a0] add=
ress between user and kernel address ranges   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fe06f6c14c3df7=
188c94cd2
        new failure (last pass: renesas-devel-2020-12-14-v5.10)
        2 lines

    2020-12-21 09:48:23.173000+00:00  kern  :emerg : Code: 97f4c44b 9100e3e=
0 97f4c59d b4000280 (f9403000) =

    2020-12-21 09:48:23.198000+00:00  + set +x   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe06fa62db02fdc10c94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fe06fa62db02fdc10c94=
cdb
        failing since 33 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe06f970cb3f09033c94cea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fe06f970cb3f09033c94=
ceb
        failing since 33 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe06f635f7827092ac94cf6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fe06f635f7827092ac94=
cf7
        failing since 33 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
