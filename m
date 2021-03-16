Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF2EF33D639
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 15:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237627AbhCPO4B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 10:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhCPOzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 10:55:33 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1178C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 07:55:32 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so3731440pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4wZ+aehPrnj5CCJ3FcWCMoQpxYV/Dht88qHhefYfkiY=;
        b=KWUM9QnWRsq0FCX6YBZKqEy50Kh0t43hhEueTh78Fg88ZisU/Zr4+SeP6HobScCKwt
         kDfnaNQL7EaJJ5r+VQ6AbdYZXeoRZRlsxjoCK26OFGmFa0TydmvGGsesd5HLvKkQu+6i
         CIFGosbpziX/Qd2IiyRxWIfEG0zTk7dh4etFfe173WTTwfGi/TC3FiVAzy/G3yLUtqYr
         VOxHV4P/vIRcWekvk015n9s2/wQavP7/sT+RgblHWD4bNKb4HQuOHm9HTbXq1W8jHgMd
         cJ7BP7GYtdZm/yZbB8EBFRpRtMogk/ImEl8z46yFEziu3iRForkdLO3JH7r4XRQQYEaF
         /GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4wZ+aehPrnj5CCJ3FcWCMoQpxYV/Dht88qHhefYfkiY=;
        b=N8gu7EDI3P6824yhy1BdCWrf59Mi8dzkWxbAXDvskB88CHet2isyFeKXe7Y+gRA8hU
         BCOI4WMqfPHqj6xxCvW7l2QPNfXBR6IT2XfEcM7syM1zt+/oBorHzh90zQwYCs78MZXi
         eX6pVMfEtz4HFZ7pE6kGjafJxPwEae2sq6ff6sidSv7jZEbUdI+fbV7Bxxnf4zW4xVOc
         0JrjWmzTj0/2Phxse0QrcPVx4vAAlpymHej9+/VbOyZ1Rwg61jr2V99Z9/QxMX3iOVNz
         Tn/pHaw7KX7b6n9GTl1FJb/EIK/Snrgd0IhfYTtP4tic5dSCB50Q7v5b0srkGxF54BQh
         XZSQ==
X-Gm-Message-State: AOAM53216ITdxB/PikNgy+8xCKY99MSPN4xFNMLReE+xs/KxpuIG0cKJ
        SUohWYpcydje0cVlZqdE86SmlDHRqqC8kA==
X-Google-Smtp-Source: ABdhPJzut9rYuV0khoxUdDfikCMnyUbRLFEBliKGKs3hnZl70TmZ/SfVfM8IBvWT2tcHHbz5xpkzRw==
X-Received: by 2002:a17:902:d487:b029:e4:a950:6df2 with SMTP id c7-20020a170902d487b02900e4a9506df2mr16404897plg.79.1615906531995;
        Tue, 16 Mar 2021 07:55:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v14sm3376842pju.19.2021.03.16.07.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 07:55:31 -0700 (PDT)
Message-ID: <6050c6e3.1c69fb81.d387f.82a2@mx.google.com>
Date:   Tue, 16 Mar 2021 07:55:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-03-16-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline: 113 runs,
 3 regressions (renesas-next-2021-03-16-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 113 runs, 3 regressions (renesas-next-2021-03-16-v5.=
12-rc2)

Regressions Summary
-------------------

platform             | arch | lab           | compiler | defconfig         =
  | regressions
---------------------+------+---------------+----------+-------------------=
--+------------
qemu_arm-versatilepb | arm  | lab-broonie   | gcc-8    | versatile_defconfi=
g | 1          =

qemu_arm-versatilepb | arm  | lab-cip       | gcc-8    | versatile_defconfi=
g | 1          =

qemu_arm-versatilepb | arm  | lab-collabora | gcc-8    | versatile_defconfi=
g | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-16-v5.12-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-16-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ca7b445e2e7b0cd757c5c29249f37baf9ca71747 =



Test Regressions
---------------- =



platform             | arch | lab           | compiler | defconfig         =
  | regressions
---------------------+------+---------------+----------+-------------------=
--+------------
qemu_arm-versatilepb | arm  | lab-broonie   | gcc-8    | versatile_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/60508d7ccc044d7187addcc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-16-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-16-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60508d7ccc044d7187add=
cc5
        failing since 112 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch | lab           | compiler | defconfig         =
  | regressions
---------------------+------+---------------+----------+-------------------=
--+------------
qemu_arm-versatilepb | arm  | lab-cip       | gcc-8    | versatile_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/60508d6da439b87b45addd17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-16-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-16-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60508d6da439b87b45add=
d18
        failing since 112 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =



platform             | arch | lab           | compiler | defconfig         =
  | regressions
---------------------+------+---------------+----------+-------------------=
--+------------
qemu_arm-versatilepb | arm  | lab-collabora | gcc-8    | versatile_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/60508d13b419b7c851addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-16-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-16-v5.12-rc2/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60508d13b419b7c851add=
cb2
        failing since 112 days (last pass: renesas-next-2020-11-10-v5.10-rc=
1, first fail: renesas-next-2020-11-23-v5.10-rc1) =

 =20
