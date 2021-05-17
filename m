Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7450B383B8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 19:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbhEQRp4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 13:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236047AbhEQRp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 13:45:56 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6015C061573
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 10:44:38 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 10so5481671pfl.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kwlinzlbcMSTvJxbZHjq7vlcwjFuoN5a8cu3ICoAqR4=;
        b=NZi62C14qTT9Ii0VTArSgzd7HYgnWL18S05XRkPPEzdafg0tFt+Tf0/xt6Qs2Q9kBS
         UUO3sd58mKeo9cgUP12u14veQQASh5DEVgtrljEbNHs+b+jNeZ3wgT8sQSnDMGsy7avY
         ODD2IuUqtTizMScnoQ00qhEsKB3KDZxK1ArEoUc+B86Ya34ef2Zue72PSxh8B1f6VgGr
         t1OrxT9ZaqjGTEFnv3JulgaY06CDrtf4ZJm+s45DPr3uRLqidAZkPGMSJ1hIz5FzWsyH
         EAvEEuEJYl4O/36tkyqEBcfTjRnunDf/SKN1sDgtvpOkFL0CNgklGf0HPtDNwFiCTVjm
         ugkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kwlinzlbcMSTvJxbZHjq7vlcwjFuoN5a8cu3ICoAqR4=;
        b=D1bEy5+53YSEZjQJSSH2cp9++Q5z0iezX2C9Wu2Ltv2uNagoyS24blnwviheos3DS6
         aTPUSaixKSWNMJSAd9p9qsFMsFV6doab8K9NG+d9WG6XWm/JTQvFiMmUAhfcExzHPXav
         UIJdhj6Aw0pummkyfjXNRXLYcxSaCMpdWcnMX51ivB4wZT6zeydY8bViTgd7m5yPdQhi
         1L7fq52qm7qZy49uQZct7HmnI8nzfXzUwznkdKrPZI5EAXGjIb6M8Z6ElC6uScWY8HeP
         CI8O3swC2Ts+xrUxEYeZmGrHCcc9HEFC/MfCamGwdE7vz/PI0kK70nqQ5E/euAtEZrxb
         SF2w==
X-Gm-Message-State: AOAM5301/ztpnQdza/X8V975DMmOdnr1PiPb7dxZN+DMETFM8ULt0WKw
        oiMPdYURAsR1KbWVi6g1okotCiJ0jd6sIxx7
X-Google-Smtp-Source: ABdhPJxyJsmzoZ+m1slKZxH9bDA12p+6xJajp4+YtFcMLMfHyNvVgEC3eO0z2kBMYgt2e+bWIp2ERg==
X-Received: by 2002:a63:f74b:: with SMTP id f11mr652531pgk.327.1621273477918;
        Mon, 17 May 2021 10:44:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a79sm10242239pfa.166.2021.05.17.10.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 10:44:37 -0700 (PDT)
Message-ID: <60a2ab85.1c69fb81.6b18b.21bb@mx.google.com>
Date:   Mon, 17 May 2021 10:44:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-17-v5.13-rc2
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 14 runs,
 4 regressions (renesas-devel-2021-05-17-v5.13-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 14 runs, 4 regressions (renesas-devel-2021-05-=
17-v5.13-rc2)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig | 1          =

meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
         | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-17-v5.13-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-17-v5.13-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9febaddc47f6accce3d4acf45821a8c948e47549 =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60a27671fde879457fb3afe5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60a27671fde879457=
fb3afe6
        failing since 20 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/60a27a990a7c6e837fb3afa6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60a27a990a7c6e837=
fb3afa7
        failing since 111 days (last pass: renesas-devel-2021-01-04-v5.11-r=
c2, first fail: renesas-devel-2021-01-26-v5.11-rc5) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60a2989f0e7f152943b3afa7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60a2989f0e7f15294=
3b3afa8
        failing since 16 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: v5.12-451-gae657abc971d2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60a294f3e162cc07d1b3afaf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-17-v5.13-rc2/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60a294f3e162cc07d=
1b3afb0
        failing since 41 days (last pass: renesas-devel-2021-04-02-v5.12-rc=
5, first fail: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
