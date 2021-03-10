Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAFA33419E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 16:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbhCJPf6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 10:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbhCJPfj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 10:35:39 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F761C061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 07:35:39 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id e2so3387813pld.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 07:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IFHyaxOkgwJg44MC/EKCfJiOOfn7MkviKCyHWIOQwwc=;
        b=IHuMGxYuUE8QbRzpuDgyhUT8/MnWi3oPQGZJ36HSXEeIAoIxzrnu5t8YTKT7AKZcu+
         8TTB+jMuqAcHQ54BDGXMsZ6JqAXYPC07pojk1iZO13MtvxovT08KlXZ2x49wiVfAPBAH
         NaovQxLNJGyvlLf0gAMIWF89+b9Wj+WtZXYwP2exo822Ebq+ECw1gM/eHK5iNBCp2IsY
         qFbt5rZq6BzzDduDfSlLHlJoVOeK23A1PwffuSWrJRIGF58PlQBDC/rl7NBabZFUWD7b
         VhNMCdDp0x2BSlE0hyzaWcI0VpRUiS2JW3bIjcGbq1Awv3Px4Vx9TIkyeWz8AACSO96l
         oZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IFHyaxOkgwJg44MC/EKCfJiOOfn7MkviKCyHWIOQwwc=;
        b=CsW431EKNKkidFQ7Uk8+T7GfIGSeJUReZcyuTbbCuyyqne8KTwV6B3aqcOU0P1yj5D
         1wUAwcv4KZqSbpH6kG0UtAb4LP36B4xmfJ7+myUl3hTD6sqmc/tvvRstDzLMt6ExUQW6
         ZsStJnuRQJIHN4JqBBhhqfcGHlV8u728Fj7j1ZXCg5Q+fbBpLpb2xs8042+LNIn3XSXS
         uNd78s05uXVKaGctNOVZzqi2Db0vLtScEZVjPyQEy2Jd4r4/FlXZYd+MH9kgfmXDST1l
         YnHpetAFtQlnY3T4MLrcd7w5PA82llChxHTPWqe+CcOsBrSUgLKaGYz/C9X5Mv5LFgdO
         1QHg==
X-Gm-Message-State: AOAM531GSwyefjhZfWHSq278fAR7jlfNJI3cmRq7B6DfAP1P/RqJOH5G
        8R4aYcUZVSfJnF5WapzZEdcrf5ZIWQuHkhzB
X-Google-Smtp-Source: ABdhPJyoAEZSflo5gVHVpLBbqnpIhSH9d7tVkkCO8YFEsQ5sQCRqwXn8yMVc+QKvvtvH2BtPMq3xBg==
X-Received: by 2002:a17:903:31c6:b029:e5:d0a4:97cc with SMTP id v6-20020a17090331c6b02900e5d0a497ccmr3439955ple.52.1615390538887;
        Wed, 10 Mar 2021 07:35:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t6sm16272366pgp.57.2021.03.10.07.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 07:35:38 -0800 (PST)
Message-ID: <6048e74a.1c69fb81.ca55.8ad7@mx.google.com>
Date:   Wed, 10 Mar 2021 07:35:38 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-402-g439caa20adad
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 167 runs,
 3 regressions (v5.12-rc2-402-g439caa20adad)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 167 runs, 3 regressions (v5.12-rc2-402-g439caa20ad=
ad)

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


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
2-rc2-402-g439caa20adad/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: v5.12-rc2-402-g439caa20adad
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      439caa20adad0b30e626d9bc776057f3a124a4e2 =



Test Regressions
---------------- =



platform             | arch | lab           | compiler | defconfig         =
  | regressions
---------------------+------+---------------+----------+-------------------=
--+------------
qemu_arm-versatilepb | arm  | lab-broonie   | gcc-8    | versatile_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/6048b4450d15771dc5addcc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-402-g=
439caa20adad/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-402-g=
439caa20adad/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6048b4450d15771dc5add=
cc6
        failing since 112 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab           | compiler | defconfig         =
  | regressions
---------------------+------+---------------+----------+-------------------=
--+------------
qemu_arm-versatilepb | arm  | lab-cip       | gcc-8    | versatile_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/6048ae55ce14c219deaddccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-402-g=
439caa20adad/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versat=
ilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-402-g=
439caa20adad/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versat=
ilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6048ae55ce14c219deadd=
cd0
        failing since 112 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab           | compiler | defconfig         =
  | regressions
---------------------+------+---------------+----------+-------------------=
--+------------
qemu_arm-versatilepb | arm  | lab-collabora | gcc-8    | versatile_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/6048aa2e8e1e1ab56faddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-402-g=
439caa20adad/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-402-g=
439caa20adad/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6048aa2e8e1e1ab56fadd=
cb2
        failing since 112 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
