Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A962A427232
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 22:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhJHU1w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 16:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242193AbhJHU1w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 16:27:52 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66C1C061755
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Oct 2021 13:25:56 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id kk10so8446020pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Oct 2021 13:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fhnSc7LBvL1Ft/IiYW5e4FFkWJaJecS/B5GQZCPxke0=;
        b=HVWgkPSHb8rV4gwCKQFLwIZdIZGDZsJll/O8zcL2r7n8cZunln5z0wDGZI+MqCL7gx
         yNwtI2pFljw01fvbCaLT90PB0lKFNuhxDghsiEg7L54lMfpLQXDpBVlaxnKMvlHuv0bY
         fsH1NQbWp7dT1+WycasHlIeZWmY6yVMr37L+FebFULd1tioC8pbx85Nh6ch/vw3UKT5z
         n1Ov/Ms9DWHLFTwDgP1MUrXq6Jr/pJSZP0IEhLuPrRgCIF39skbUG0uzo+GmPrAJnVqS
         OcAKDxi9dZBAgezxDNFlbHyMvGOG+WJYoc1bGcDbgyKVHDTtcTUB+hSzeg3ErFp8uNdS
         OKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fhnSc7LBvL1Ft/IiYW5e4FFkWJaJecS/B5GQZCPxke0=;
        b=urDS1PuyS6/OCZKrbV70yJR02NaluaPUx31ceb6IXOXdHLHYhf77I+QMLWkn7wj9pb
         O9HApj3hU22lq1Q/9+Ty4T0AYVCGtFwKDJjk1vCSDIix5FKIeHQtCo1ca6QVhWMxl/TO
         XLwJZ3UngMc1BCWq3QGuO/8WJJfQPNTTjIfxHkJ6KvYEqu7u7URvXri/1ss1K7vRWolt
         AsYK8y2GysvQUIRB1QM+7a7M/sPwXZn8Nb16lWaAkx5kN9IaqcJtajGfKkCvs0P1MWk4
         1GdSzIzTS2io57PTB/vV3W7YsJVD98wj6h0raBYSymR00ZYldq2S3Hq4pQLABs7bpZAj
         U+9g==
X-Gm-Message-State: AOAM531Qe6zHgMzbG1o0yMA8ozvwICOMIYWotY+/oCgdAX9etbA0xjA4
        ULsmV/392Y9EdwrcyQ5wDQzvWnYci2QsgQbM
X-Google-Smtp-Source: ABdhPJxFc0dZM6osCumVY+MPQ05f109E8UYWKfHa9D8yZ3AhlOnbLWZDQK7kvZiDWqlVei4AZpsTUw==
X-Received: by 2002:a17:902:7783:b0:13d:fee6:8095 with SMTP id o3-20020a170902778300b0013dfee68095mr11262283pll.7.1633724756085;
        Fri, 08 Oct 2021 13:25:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p9sm177217pfh.162.2021.10.08.13.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:25:55 -0700 (PDT)
Message-ID: <6160a953.1c69fb81.6f2a5.0cee@mx.google.com>
Date:   Fri, 08 Oct 2021 13:25:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-10-08-v5.15-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master ltp-ipc: 8 runs,
 2 regressions (renesas-devel-2021-10-08-v5.15-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 8 runs, 2 regressions (renesas-devel-2021-10-08-v5.=
15-rc4)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig             =
       | 1          =

mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-08-v5.15-rc4/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-08-v5.15-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c2a19dc748287f470b9f2117e1b50206988efa8f

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  37fa90294a830ccc2860b5c7378b821a686b6ca0 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig             =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/6160924fafe08f131299a30a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-=
hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig/gcc-8/lab-collabora/ltp-ipc-mt8173-elm-=
hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6160924fafe08f131299a3=
0b
        failing since 24 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6160961777f8fe7a8699a306

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/ltp-ipc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-08-v5.15-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-col=
labora/ltp-ipc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210913.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6160961777f8fe7a8699a3=
07
        failing since 16 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: renesas-devel-2021-09-20-v5.15-rc2) =

 =20
