Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA83355013
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 11:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244910AbhDFJhC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 05:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244892AbhDFJg4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 05:36:56 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768D7C06175F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Apr 2021 02:36:47 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id z16so2543370pga.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Apr 2021 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iwxTVHkK0B6JLNo1v6vc4XZgLrRaaowAISuwqlXKLe0=;
        b=NwT6tto3QsclULtcanc3qC4uvGUjfJgWnTrNOWujtEBP+ST9QER0CuzEp/KfIfCt9w
         mMpmwu4t1F/64MRFo798XjNw4qRUT11rZd4BlFZA8rqbGdhD8YPEjgrBIaF+i2MizP3t
         pL/Ww53k8cJAIRIbkasb9gAsdTwAg7jIwBh0RsEGlknQxmddbNMtOhoce9EL4EpA9h3N
         Jwbvp+C6fnb3bbGmWORC8dwPPIKXyEJxSkoGjdI3+BmpZx05QvMA5wUNI4pxotMCLEMR
         EvFOWeZkAARz2lUaQjhhsuz5djFLpZ/ge47rQgET323iQU0o+Lx8KFaOsrD9HfbY1Fbs
         WtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iwxTVHkK0B6JLNo1v6vc4XZgLrRaaowAISuwqlXKLe0=;
        b=ZLY8uAMLFcexxR6cU54MPdLNXlPWrJ3vfvGpxCQYlPBGMJKtEeIbmtnKQcPFFY41EA
         RviOr8V0Q2sWumS7cQYrn0Vx+UlqSheWG0upBYnGlr6x9YKLeZH/QCs/zYuSTTCKaoR1
         DRDXooMhsSjZuEzstWsyocOtU/gGjnNHbHyGnOa8+HRHJIHdBEa6Qpod9Y91xdZxFyIc
         46VQHQqq12OX+962Xbp62tEFO09rIyDW0UCu5i587MbMlidX3NAXz9BAtx/y0fOUPkeq
         nRSWLyn45HgXk+ea3EqKYtdJncSxwjfhEPxkWb5Padc6EqCD0kd11qjQeVhipfPyp8tx
         P4xg==
X-Gm-Message-State: AOAM533Ofvveci0k+SLu2/6b+zIt7OSveKtNl9Xh46sr4VL9aqq0Tv4T
        8AQvVslsnRy8CVeRisMntvd8EdWYnm9eEiJL
X-Google-Smtp-Source: ABdhPJx+vwXwLqO3OwGTacp2348oRsSUU3vJdtJuUoTvT02REBR+NQd9cD/v0/Z+te4QfAkSzWdWtA==
X-Received: by 2002:aa7:94ad:0:b029:1ef:2392:4ee8 with SMTP id a13-20020aa794ad0000b02901ef23924ee8mr27197480pfl.75.1617701806763;
        Tue, 06 Apr 2021 02:36:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d19sm1868020pjs.55.2021.04.06.02.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 02:36:46 -0700 (PDT)
Message-ID: <606c2bae.1c69fb81.d96f1.5840@mx.google.com>
Date:   Tue, 06 Apr 2021 02:36:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-04-05-v5.12-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 190 runs,
 4 regressions (renesas-devel-2021-04-05-v5.12-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 190 runs, 4 regressions (renesas-devel-2021-04-05-=
v5.12-rc6)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-05-v5.12-rc6/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-05-v5.12-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ea0aa7f2e67d781466efc1f9867e42062aa6e685 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606bf6aa1671f75a12dac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bay=
libre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606bf6aa1671f75a12dac=
6c0
        failing since 3 days (last pass: renesas-devel-2021-03-24-v5.12-rc4=
, first fail: renesas-devel-2021-04-02-v5.12-rc5) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606bf14175a08a90f7dac6d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606bf14175a08a90f7dac=
6d6
        failing since 139 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606bf143219bd925e2dac6d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606bf143219bd925e2dac=
6da
        failing since 139 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606bf0e668521cc6c0dac6d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606bf0e668521cc6c0dac=
6d6
        failing since 139 days (last pass: renesas-devel-2020-11-10-v5.10-r=
c3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
