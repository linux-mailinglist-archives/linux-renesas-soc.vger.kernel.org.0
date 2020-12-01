Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299EA2C94A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Dec 2020 02:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731109AbgLAB2t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 20:28:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730646AbgLAB2t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 20:28:49 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E6DC0613CF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 17:28:08 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id k5so169024plt.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 17:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kjJBbgodF9UPuE7NCtwca6Q39pPIdFMRDVgFJAalpJY=;
        b=GtTMyJeV+EDgksGs+ICoBDPdoGHWyGtRncl5I6UsxmP1v0a1oBi+66CgpmVXBbDnvT
         rRqpJkHb3e2viH9mgIxfk8urqxTUc6huhClT2R7UJzOciON7kelKTzyRu/kK6o2ZEra0
         gddxWm59BV170FLKkI2VTuNIUvfuH4lRLdeSllIR5qonmWs7P/qX5wPBgr3gNikD/L+N
         hlPr4x4uZXrRMUde81xxdK3GVzV8x58lsgUg//rbVxfdf+N5tP9pd4BVd+qAdhMnOQ8Z
         VBBHgS2ivcmiBr+zjD8AL6iBm+3vUB7N/4vWJ7JTVnoJjMmi1xz23D5UE8eytwABR5FE
         qqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kjJBbgodF9UPuE7NCtwca6Q39pPIdFMRDVgFJAalpJY=;
        b=AvEMRnNJAJdiTM15k1EaBdyrTPtFOOBwO8ApEwcKih1Nh4qWH/OsX9WNGpqVUoqgkj
         AMtZLroULmET26qUfn7w4mY/Nkky2w/AoKvy6kzJgMbKAMknF+rlOUPNgs54/qRArKS9
         NwlJLwccMu6ZhzvgYdvKfXRpWVVbZy1jTPIl7o1wAhjPGu1+QKeBEPYqdvYkZOQEZlgf
         VUL/kqE2xTMDy13tV4bEV01aZVOzCPHg9ViUd+PRG5XBZRHrEq9BrG8ovm5DSI2/xaC5
         T/cx6Z+b9UE3j8V+D+ucv92RV/n5yaob4FjoNQzLWDgO2Zlbker9TwyGVvNCjWuR/6v+
         DUeA==
X-Gm-Message-State: AOAM53166uU7nWn9JNHm7PNKi22MH311TzTABMEf/omx35OgHSQkkQTr
        oXwMuq3NFu+iW2RH1QD4hCfFHnOwCl+GdA==
X-Google-Smtp-Source: ABdhPJxmZTheUHLAz/8XlrDYIqyFHKBc4YADQOdxd3sTsc8GX8nLc3Rt6HHiOG7Nno2OuIQzI+lIhA==
X-Received: by 2002:a17:90a:1b44:: with SMTP id q62mr163733pjq.59.1606786087928;
        Mon, 30 Nov 2020 17:28:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v24sm298453pgi.61.2020.11.30.17.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 17:28:07 -0800 (PST)
Message-ID: <5fc59c27.1c69fb81.1798d.0fe4@mx.google.com>
Date:   Mon, 30 Nov 2020 17:28:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2020-11-30-v5.10-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 323 runs,
 5 regressions (renesas-devel-2020-11-30-v5.10-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 323 runs, 5 regressions (renesas-devel-2020-11-30-=
v5.10-rc6)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
               | 1          =

imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2020-11-30-v5.10-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2020-11-30-v5.10-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9b01f862523844081e7700b57633784e4ebbece8 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc56a6b1709ce3fcdc94cc7

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fc56a6b1709ce3f=
cdc94cca
        new failure (last pass: renesas-devel-2020-11-27-v5.10-rc5)
        1 lines

    2020-11-30 21:53:49.557000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-30 21:53:49.558000+00:00  (user:khilman) is already connected
    2020-11-30 21:54:04.971000+00:00  =00
    2020-11-30 21:54:04.972000+00:00  =

    2020-11-30 21:54:04.993000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-30 21:54:04.993000+00:00  =

    2020-11-30 21:54:04.993000+00:00  DRAM:  948 MiB
    2020-11-30 21:54:05.008000+00:00  RPI 3 Model B (0xa02082)
    2020-11-30 21:54:05.096000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-30 21:54:05.128000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (380 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc56954fe7ee4b4d4c94dcb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc56954fe7ee4b4d4c94=
dcc
        failing since 28 days (last pass: renesas-devel-2020-10-30-v5.10-rc=
1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc569aa2185367b75c94d25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fc569aa2185367b75c94=
d26
        failing since 28 days (last pass: renesas-devel-2020-10-30-v5.10-rc=
1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5fc56bd6db52826ae7c94cc3

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6=
q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6=
q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fc56bd6db52826=
ae7c94cc7
        failing since 3 days (last pass: renesas-devel-2020-11-23-v5.10-rc5=
, first fail: renesas-devel-2020-11-27-v5.10-rc5)
        4 lines

    2020-11-30 22:01:27.723000+00:00  kern  :alert : Unhandled fault: align=
ment exception (0x001) at 0xcec60217
    2020-11-30 22:01:27.724000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-11-30 22:01:27.724000+00:00  kern  :alert : [cec60217] *pgd=3D1ec1=
141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fc56bd6db52826=
ae7c94cc8
        failing since 3 days (last pass: renesas-devel-2020-11-23-v5.10-rc5=
, first fail: renesas-devel-2020-11-27-v5.10-rc5)
        26 lines

    2020-11-30 22:01:27.767000+00:00  kern  :emerg : Process kworker/3:1 (p=
id: 52, stack limit =3D 0x(ptrval))
    2020-11-30 22:01:27.767000+00:00  kern  :emerg : Stack: (0xc237beb0 to =
0xc237c000)
    2020-11-30 22:01:27.767000+00:00  kern  :emerg : bea0:                 =
                    c176a5c0 c238a274 00000000 cec60217
    2020-11-30 22:01:27.768000+00:00  kern  :emerg : bec0: 00000000 0000000=
0 00000003 00000000 00000000 22f72690 c3915040 cec6008f
    2020-11-30 22:01:27.768000+00:00  kern  :emerg : bee0: cec6020f ef7d540=
0 00000000 c09b4010 fffffc84 fffffc84 c3c68800 ef7d5400
    2020-11-30 22:01:27.809000+00:00  kern  :emerg : bf00: 00000000 c1a1ec6=
0 00000000 c09b44f8 c3c689a0 c2166080 ef7d21c0 c0360764
    2020-11-30 22:01:27.810000+00:00  kern  :emerg : bf20: c2408000 ef7d21c=
0 00000008 c2166080 c2166094 ef7d21c0 00000008 c1803d00
    2020-11-30 22:01:27.810000+00:00  kern  :emerg : bf40: ef7d21d8 ef7d21c=
0 ffffe000 c0360d50 c2408000 c1a1e357 c137fc64 c0360aa8
    2020-11-30 22:01:27.810000+00:00  kern  :emerg : bf60: c2166080 c224444=
0 c20eb040 00000000 c237a000 c0360aa8 c2166080 c215fea4
    2020-11-30 22:01:27.811000+00:00  kern  :emerg : bf80: c2244464 c0366ed=
0 00000001 c20eb040 c0366d80 00000000 00000000 00000000 =

    ... (15 line(s) more)  =

 =20
