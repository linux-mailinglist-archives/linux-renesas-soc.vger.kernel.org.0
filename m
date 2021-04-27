Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E448A36BF1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Apr 2021 08:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhD0GJy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Apr 2021 02:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhD0GJw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 02:09:52 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5C1C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 23:09:10 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id p12so41620099pgj.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 23:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YcwpwPWsK2BhtZcYqW211HW+mmAOU6BQ//DU7cipbyU=;
        b=Px2ZiMf+16P02MTOYkV8z5eJ1IxoHAhTxAenTSKF00kOBrGQJM6syHBVqeixw6Sztq
         J7E4UCY1lW6JtMrikpuhFtStHjM8C+LFEoMqbB8P/JHsVMTwRPrzilEhiWgrMUnYNDHi
         31/QGT7WVAdK9yyT9CcDGEuoRGCgLuoxLv4P05Z8q0a640RcBPI2XqTpEfXl4CnrJxk6
         idD3zbI3mlSxX5R3lgm0f7QmUq/W1kBapClHtTTtSdTgbS3Nvrvp/f9giAJtz3QeGKmJ
         3+Gu9BR3e0HCLqTaCORWrffFjX8QkvmBUn8/YieGAq+//qGlTff2Jn3IMxqS0rJ4juxE
         wMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YcwpwPWsK2BhtZcYqW211HW+mmAOU6BQ//DU7cipbyU=;
        b=Xf5USlaQbulZozpJEbrJJ3Auf+eOba6tNYrXRFXkDU+x6H3LgQgdL+T0uAQmLYIHu5
         Iq2gEKVdGB+VqL6Viythhdscs6G/tISUs8rFvWcBAwK6UfX09PSkIgmHNKD3rQpk1yUR
         L6AArE2oU4MaI1fayXVuSXhziR1Unl+T/plPnSDwHN6fmH+nlgFt7azuFJIuq+svE+rs
         3AdUTZ9/E7cLcQIgtfyEGt4rxTYIRd1jptZjg9slqf0GfTPyiRLCzgYSfTHN38Bf2XQ5
         JzjIMJ+OQF89FUBiU9bZ8UxVmrnuoVL6y75UGYP2eLpq1UtlDyqTcbDQaa3Eqdo9wAq1
         bR+w==
X-Gm-Message-State: AOAM533iulYuG59YlydmjJ3wJ5Od/jylrDelaS40xXaC4hsoP6YCiLWC
        /NlARQwWB4NtK/+QeO+sR411NnRTZMtlPaGk
X-Google-Smtp-Source: ABdhPJywfIXHT8mgNzY1ZE4EfA1/2dAxDB+39nnmcRaF+ACOUC2WTNoCDrXMF3DpKLccJSKVcjLIjA==
X-Received: by 2002:a63:9d4e:: with SMTP id i75mr19900020pgd.443.1619503749484;
        Mon, 26 Apr 2021 23:09:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i126sm1346240pfc.20.2021.04.26.23.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 23:09:09 -0700 (PDT)
Message-ID: <6087aa85.1c69fb81.6482e.51cc@mx.google.com>
Date:   Mon, 26 Apr 2021 23:09:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-451-gae657abc971d2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 265 runs,
 3 regressions (v5.12-451-gae657abc971d2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 265 runs, 3 regressions (v5.12-451-gae657abc971d2)

Regressions Summary
-------------------

platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-baylibre | gcc-8    | versatile_defconfig=
 | 1          =

qemu_arm-versatilepb | arm  | lab-broonie  | gcc-8    | versatile_defconfig=
 | 1          =

qemu_arm-versatilepb | arm  | lab-cip      | gcc-8    | versatile_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
2-451-gae657abc971d2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: v5.12-451-gae657abc971d2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ae657abc971d2b6cc75a35bee45fe7486ccd9c42 =



Test Regressions
---------------- =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-baylibre | gcc-8    | versatile_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6087740e42d8827b169b77be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-451-gae65=
7abc971d2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-451-gae65=
7abc971d2/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087740e42d8827b169b7=
7bf
        failing since 159 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-broonie  | gcc-8    | versatile_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6087741642d8827b169b77cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-451-gae65=
7abc971d2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-451-gae65=
7abc971d2/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087741642d8827b169b7=
7ce
        failing since 159 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-cip      | gcc-8    | versatile_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6087747207ddc0f81f9b77b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-451-gae65=
7abc971d2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatile=
pb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-451-gae65=
7abc971d2/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatile=
pb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6087747207ddc0f81f9b7=
7b6
        failing since 159 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
