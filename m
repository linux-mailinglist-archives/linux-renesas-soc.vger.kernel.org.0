Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65DD8474DF5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 23:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232640AbhLNWht (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 17:37:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhLNWhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 17:37:48 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8D5C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 14:37:48 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id x5so19104637pfr.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 14:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Rq9MoJ+dn0CH3hWryx8HZb+pf9x2Owp6PUiopSxBrRk=;
        b=Dv0MOzcpxo+blocwdF7Z7B9stMOQi2blxLIfPLiraAK/JAhOqB1XaKHU1sgdV8aAPp
         GQ5ZtgrCm3ekBv6XhLsR2b/MAJrhoBewrqFDJft1R2UgTakMrIByzJczvzwkplvBiLUm
         Y1UdQTgq32w7Yuefi48BsqUWIsMIZeVIMw6ayJGhPz6hTqc1zDDrQSsCa4q8ED00myU1
         PVqzkbAoDlCq/l8tOvT9mOoUUi8X7lFq4YKGK6oV2wOOSVFMpBFyWChh7OQNntciJ3xR
         Jywtnwluhp9mqCW2Ltk6q9WhOeVexcb+M90P158T9IP5GoF585TlZbttmMUSFeRL8eMy
         elug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Rq9MoJ+dn0CH3hWryx8HZb+pf9x2Owp6PUiopSxBrRk=;
        b=n5CnU3xt+NMeXGwk2lAHKHa5xtYWUQ+x8fB6riAp9EAWX3aPV88+jtLEkx6zViAc/c
         5OFIWeMVqwxr484rQ/0nUDUPM/DFlxI6596s3R8ePalzN5lPuSwlq30NMjtbZV45TYV+
         0hsoa9LeVVIFmRWJydxY5Eycac4pfnbu/s1WS3eDcmsuUuhhvoIQxru4IK4QM23Anh6q
         5m9PtwHGETz3vhmJjVd7IQJeKwdQECTMool4LQk671yP/mYpRUa1oxlECkektyQKydcp
         tohkimVKw/kZyxA+duB1lqOAvukcH1J+YU9FgizUU6T2s8XOMtIiMfNDn7RJxXCgNO4T
         frYA==
X-Gm-Message-State: AOAM531q+aGDxF+VL71ainBL/q0dwCSUibD9l0OHRLarLJMuGoyPmDCa
        t/3pVGoTQRUWIV6Kf+g9Zu3o7qiqIrnGeXoT
X-Google-Smtp-Source: ABdhPJw/Op8gbyj8bcC9DQjUJK3KmR3UgJXkKFmSWcv9JTvgko3FprUBl5no7lnX7rOe3UZ/etk72w==
X-Received: by 2002:a62:7a54:0:b0:494:6e78:994b with SMTP id v81-20020a627a54000000b004946e78994bmr6323889pfc.5.1639521467983;
        Tue, 14 Dec 2021 14:37:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k70sm66819pgd.19.2021.12.14.14.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 14:37:47 -0800 (PST)
Message-ID: <61b91cbb.1c69fb81.fc96e.0534@mx.google.com>
Date:   Tue, 14 Dec 2021 14:37:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-14-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 447 runs,
 3 regressions (renesas-devel-2021-12-14-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 447 runs, 3 regressions (renesas-devel-2021-12-14-=
v5.16-rc5)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-14-v5.16-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-14-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4061f230d33da18a476809abc03f2fa94eda6c56 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8e4f6ff34e1efbe397184

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-14-v5.16-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-14-v5.16-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8e4f6ff34e1efbe397=
185
        failing since 28 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8e6bf317fbfde8639711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-14-v5.16-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-14-v5.16-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8e6bf317fbfde86397=
11f
        new failure (last pass: renesas-devel-2021-12-13-v5.16-rc5) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8e755456d01a993397136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-14-v5.16-rc5/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/bas=
eline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-14-v5.16-rc5/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/bas=
eline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b8e755456d01a993397=
137
        new failure (last pass: renesas-devel-2021-12-06-v5.16-rc4-15-g9f95=
ae4ce1f1) =

 =20
