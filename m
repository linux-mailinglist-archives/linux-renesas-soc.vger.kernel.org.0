Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974F846C6FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 22:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237529AbhLGV7Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 16:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232542AbhLGV7Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 16:59:16 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84333C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Dec 2021 13:55:45 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id r138so253120pgr.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Dec 2021 13:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wa4b0j1m3JJAdJB/WTZ0C9/aUtBW8P4oXiIk17fd8KQ=;
        b=nIrFaKEKcgzHMDZ5fwjMpWHuSh1Qck6yJesmzUw1941aLiWJSgkltAfSgFZXnIwY2h
         VM3z7gKpm3HUs06RTxf7mrRDRppbdOG8w55JM6zJYexk1k5v+9ozIrTxR8aWhQYMC7Rm
         TIRTOMCkLeqOu9HswdsqwcywDTkfp6QpAtJYtDK4m54JEoubvtGFoCOhaeEs7I7PVPyY
         QEn7luolbSYadr35ScPnVU6gm+cK3kI4TIP8F++orestSoVvAVyt5pLtmj3bDf6UUghA
         VUHI6SJAKSsZEoEQFydylCSlEewO51V7cFBfx0CmKVc+XRMwrib6jFI6VgqX/eCSGG0I
         j3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wa4b0j1m3JJAdJB/WTZ0C9/aUtBW8P4oXiIk17fd8KQ=;
        b=XfyVUQJ97BL7F1V3YEW9rgNeQJfxCLCGx4KYF4EFgnlSTGxW0EYE+didHOLFDTYuGn
         kQine+wf7YdHAaHHMlcA2MWa/1DORKC80JQXG+6Xut4WfZrkFkWwqxdjyIVc9jpxIob0
         4uTy+a0soCe3LcS50Co4zfsY8OVfQI8nLxY8UT9dNGVVYP372ZEprhkaHRiH/+oL625d
         gttBQzAc60FO1Aav6AEvn+hkAKXLtCbyUCNscyjrL9/iw60T7qHcPp5wObGt213kDkdw
         7CVl+m5NNkr0C+b3bHPENfGJ2oA05dcsVRawwJFhLLpjGXD5hf0Ml/3nvMyHiWvELEN+
         PQ2w==
X-Gm-Message-State: AOAM531fz9eLiNt7chw6ZpbgQ+t7XJO05k/+nQQ9dm5dOW6cH3vEcqcu
        I9kOrlXqseV/vXnRhMiDwv70wZTkYGJ2rct/
X-Google-Smtp-Source: ABdhPJzJkH5qUtaM/kKZ4kCMsbNRIUQD1LKeTqhtaWidlFz8mbD0vBTCjJ4a8RN8ZbEX0sCHDxrwCw==
X-Received: by 2002:a63:161f:: with SMTP id w31mr5842984pgl.14.1638914144880;
        Tue, 07 Dec 2021 13:55:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z14sm753428pfh.60.2021.12.07.13.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 13:55:44 -0800 (PST)
Message-ID: <61afd860.1c69fb81.2b398.30cd@mx.google.com>
Date:   Tue, 07 Dec 2021 13:55:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 507 runs,
 2 regressions (renesas-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 507 runs, 2 regressions (renesas-next-2021-11-30-v5.=
16-rc1-14-g0940300f8e1d)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+ima     =
           | 1          =

rk3288-rock2-square | arm   | lab-collabora | gcc-10   | multi_v7_defc...G_=
ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0940300f8e1df4451b3a5c9e079a74cacc6b854d =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+ima     =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/61afa2d9a2eec9d1cb1a94d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1-14-g0940300f8e1d/arm64/defconfig+ima/gcc-10/lab-baylibre/b=
aseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1-14-g0940300f8e1d/arm64/defconfig+ima/gcc-10/lab-baylibre/b=
aseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61afa2d9a2eec9d1cb1a9=
4d2
        new failure (last pass: renesas-next-2021-11-26-v5.16-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3288-rock2-square | arm   | lab-collabora | gcc-10   | multi_v7_defc...G_=
ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61afa0622a518b68a61a948f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1-14-g0940300f8e1d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CON=
FIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1-14-g0940300f8e1d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CON=
FIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61afa0622a518b68a61a9=
490
        failing since 21 days (last pass: renesas-next-2021-10-18-v5.15-rc1=
, first fail: renesas-next-2021-11-15-v5.16-rc1) =

 =20
