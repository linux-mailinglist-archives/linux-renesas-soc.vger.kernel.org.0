Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472323A382E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 02:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhFKACk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 20:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhFKACk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 20:02:40 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02184C0617A6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 17:00:31 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id mp5-20020a17090b1905b029016dd057935fso4744982pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 17:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1bX6tHq35ZR7cpMCYnxqQ9NCycHCzLNHDri9+q7bPGs=;
        b=UI4tBXsYnTlVxOql9pNHQvDrOefpO2LH+gpkLNOAAtLLgVnWuhWsv/cBgDCeJGD7hA
         JpjdHrXBWZ/mvkPpPWaJIniyHUY2Zz3NsaNQitnA/2aqYGP1QPfFQvJBrurkKwBhO8zB
         561dy12izhnXY1evF8LDON1yOdKrumCV6a+Z52IrdiQ0Sjxhf+nqCltLNasxCHfl8d50
         IBOqEe5L5eUA/CfczyxZb22U+qq8508b98Y8Vd4RWP0FNt/yFJ2SDwzNyXCPYszlH4/b
         eoGFSxwPC/49mHOEKRoa2JmUwF5iBCbdG9x2t0Ehh35Ah+9wLxJZ//XgXRDb2tuyypXi
         7low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1bX6tHq35ZR7cpMCYnxqQ9NCycHCzLNHDri9+q7bPGs=;
        b=Ce8kQMNSRe2c+5O1upAsW41VBspUwU9o/+bk2eGN6hcTns0lU2Td85uQm6fwCjzYqt
         ZZ8dE9QHvUeqrpmyuASz9ucdaLFOIi/fiWmX/0X5dAnBQNDa9zkfulM2DqzEPbl+N7PM
         Ui5qcbA6HJUmSv6rZDhwqyK/Qc/I5fy3uFXdu0D/4nCvxWpsjTBBSe2FuKcx2stCIEmO
         l+NlPOz7ctvROwJ70Zdnxql5lVtlfS2x6LVscReR+joNVLmQOx9iOJh8HJcdF8doMxft
         q3XWfeY+ZBOp2I9WTZj/mA+iwsLQedZwMioWGkYN+zMQ95zYgojYUQwbPKjolXexFLWy
         3Zeg==
X-Gm-Message-State: AOAM530O65/x4ymYxzvDGXfME9ssV6+aNE2P9NlAhh0Ojuf2S93tmFcR
        Jd7XdxAxJZYnCWAk9+2gVlXU2GefgxzDwTe6
X-Google-Smtp-Source: ABdhPJzu+S9EDXkcAG5uLFq34cGccZgPgcRRgGxZq2oR8qjK8+QcaHtRFW4uA7ftmosHDOXECI7g0g==
X-Received: by 2002:a17:90a:f085:: with SMTP id cn5mr6026151pjb.141.1623369628580;
        Thu, 10 Jun 2021 17:00:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i16sm3340005pji.30.2021.06.10.17.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 17:00:28 -0700 (PDT)
Message-ID: <60c2a79c.1c69fb81.ba50d.b1a5@mx.google.com>
Date:   Thu, 10 Jun 2021 17:00:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-06-10-v5.13-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master usb: 3 runs,
 1 regressions (renesas-devel-2021-06-10-v5.13-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 3 runs, 1 regressions (renesas-devel-2021-06-10-v5.13-r=
c5)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-10-v5.13-rc5/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-10-v5.13-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f432b447a92822b48f7e674cec725b179c1fbde =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60c29394d9886977260c0e2f

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60c29394d98869772=
60c0e32
        failing since 10 days (last pass: renesas-devel-2021-05-27-v5.13-rc=
3, first fail: renesas-devel-2021-05-31-v5.13-rc4)

    2021-06-10 22:29:57.759000+00:00  <6>[   16.117102] PM: suspend entry (=
s2idle)
    2021-06-10 22:29:57.759000+00:00  <6>[   16.121681] Filesystems sync: 0=
.000 seconds
    2021-06-10 22:29:57.759000+00:00  <6>[   16.129799] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-06-10 22:29:57.759000+00:00  <6>[   16.139195] OOM killer disabled.
    2021-06-10 22:29:57.760000+00:00  <6>[   16.143103] Freezing remaining =
freezable tasks ... (elapsed 0.001 seconds) done.
    2021-06-10 22:29:57.760000+00:00  <6>[   16.152824] printk: Suspending =
console(s) (use no_console_suspend to debug)
    2021-06-10 22:30:00.652000+00:00  <6>[   16.216023] rk_gmac-dwmac ff290=
000.ethernet eth0: Link is Down
    2021-06-10 22:30:00.652000+00:00  <6>[   18.095722] rk_gmac-dwmac ff290=
000.ethernet: init for RGMII
    2021-06-10 22:30:00.652000+00:00  <6>[   18.095757] rk_gmac-dwmac ff290=
000.ethernet eth0: configuring for phy/rgmii link mode
    2021-06-10 22:30:00.653000+00:00  <6>[   18.100964] rk_gmac-dwmac ff290=
000.ethernet eth0: No Safety Features support found =

    ... (106 line(s) more)  =

 =20
