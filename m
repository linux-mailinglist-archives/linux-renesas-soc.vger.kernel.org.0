Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99C5469929
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 15:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244928AbhLFOlm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 09:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344364AbhLFOll (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 09:41:41 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEACC061746
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Dec 2021 06:38:12 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id i12so10335596pfd.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Dec 2021 06:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qSm01b/R3QO1+IiJn8cp9f3ibME5iSPz64qd4drfE/s=;
        b=qyrH0nBSX8xTvkNjOJ14P8mNtmiReYKkYdKoSohFYeCnsX7xG22w9ZSZscsfvxjxZr
         GpCg/vTmpocewuBz5iwoYIfYjTUtTPitwZlubacHqogD7w+bvRl/79QxTFLemTc5hvpt
         ssXU+L0oTwlxAo5QdnyRG/9B4hSeXZ1oZNaQhLTF4kRRcmR9B7BTD4SKMpLMT6lvevet
         rr4EwfcbTK5Cm0Q8HBvNeRIRMSkwn8O6Raj3Dn+Sy+1cNnaz9MczYATl0gHH1uaKyLHo
         /cgYX8zNGUkhotbNbNGRAGKiUDfm/wgvROWc5wHakGOsYRnhWCk+sGy6hArYTFbjIKz3
         21hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qSm01b/R3QO1+IiJn8cp9f3ibME5iSPz64qd4drfE/s=;
        b=fk47d8d482O1UfY/Aq/VvM+W8HeomDVbr11OsOcZscLWdJPAQ8LQjznvpOxgDeLLz9
         Bjnw3qcZi25P6f4HGRZnwRvc64kFZIYay4osCXk2/AoLCMreYQUEXqLDAMRaRDR+Cg6g
         lsFGh9zXVb1iEIe0iVOu9k+oFLhxmohsJOjeM0GYixwmrGeN1QbAv65SKG9N/BZnoAIX
         2xazbN/I3xyjQ7tjN7JPojOXet175qqEXzXWtEq1SB3XpAFbCKA8lDVQ5FRxIhlRpw/T
         RQFjyTgByZ9p3tFiPPGm3vCXo1uII6L4F1hh/fZmUVIVchDh2xKhQ6U5bjxqdUCGRHxR
         UPxQ==
X-Gm-Message-State: AOAM532SBhTJ4dSqG2rrEtnhAYsmAK4WC+Zwaqe1S7jeoLynlEH7UY5+
        Fsz6s+BzKXL862tN6eXHVAZw4b8jKIHD1ywd
X-Google-Smtp-Source: ABdhPJzEB7FUNzdJFIEOh2WRo3BsBIf30g4q1ka1YmEfJnh5nLiKhJLQ/QALaOAI8oQ8fRNMczI8KQ==
X-Received: by 2002:a63:2212:: with SMTP id i18mr18853960pgi.586.1638801491870;
        Mon, 06 Dec 2021 06:38:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q8sm429562pfk.152.2021.12.06.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 06:38:11 -0800 (PST)
Message-ID: <61ae2053.1c69fb81.73454.1188@mx.google.com>
Date:   Mon, 06 Dec 2021 06:38:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-12-06-v5.16-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 295 runs,
 3 regressions (renesas-devel-2021-12-06-v5.16-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 295 runs, 3 regressions (renesas-devel-2021-12-06-=
v5.16-rc4)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =

meson-gxbb-p200     | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig         =
           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-06-v5.16-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-06-v5.16-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8feef3cda1f4673737514cb20366eeeb69cc0be2 =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61adeb6ea6b980bc601a9486

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61adeb6ea6b980bc601a9=
487
        failing since 20 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
meson-gxbb-p200     | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ade35b1d625f96d31a9482

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ade35b1d625f96d31a9=
483
        failing since 5 days (last pass: renesas-devel-2021-11-29-v5.16-rc3=
, first fail: renesas-devel-2021-11-30-v5.16-rc3) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/61ade79722290d06fb1a9485

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ade79722290d06fb1a9=
486
        new failure (last pass: renesas-devel-2021-11-30-v5.16-rc3) =

 =20
