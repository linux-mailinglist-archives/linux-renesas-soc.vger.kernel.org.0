Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64F2A379ADA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 01:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhEJXkS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 19:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhEJXkQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 19:40:16 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AFBC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 16:39:10 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id a5so7692109pfa.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PuI03njYCyvtS1eLorQ/SW3zEeWTAUFW1+XQX6bbibo=;
        b=KycHvsGhp4b4NzcbxEiz81qABoL4t2OFLAF67xI4H5u7jFdYB6pog315lN9O67C01v
         M12IrKHO7OKo0OH+NymSDDXhBqW3bf9wH2Mo4l10K1Yu4HttNg7d+66TOGhsO++F1fdF
         7vkBksNvxVkq0732OtcIrunzTI/EHuq/m9X3OLOL5oLwR8elIwygIjqImBdUwDG+1Uxe
         DChH8dXfBoCLzclDQmZLvYCKfviLbcL/X6HmL0gikyhAeMoVV2/06i/19DMpRpTvLVeq
         S42Oy2mP2m4L1SrN5w7wqBe54OaSD8RpczR8HlttnZ/Y7q4ogqjtsxQzZvECaL2oMb0h
         M5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PuI03njYCyvtS1eLorQ/SW3zEeWTAUFW1+XQX6bbibo=;
        b=srNCYsHiEu1ZtLt6R+si6xxLz/FoGsU1heAZrnzHOxG9hxsRZFdN5QegbEhs/Gm53p
         kOeIlgb+eWuMFF6Fu92zKHnMypydjWHW4HxftHl2BRyYALbVFulmOkcW9jYg+AsJAy7y
         LYISKVKygJuZgsFCzCPBq7SXUNgLHTzU61sp4a1U5+LiHuW70ahKjoVDbWsbFWmFRwsN
         TDebfSBzaWbZNSoQzT4YOk1PGObngJigz4jE2h8E4TCZUgtYlqXPHI8NFG4eXu+LAOym
         Lr4HVgC5ydSI+Jny2n9RduRjy6w6MWN4FfeXAnUPRMz3z04+DEgRhjFTZJ7azRD5Vtg1
         otYQ==
X-Gm-Message-State: AOAM531Y5kGyjThL9Kbm5CzF+XfBWgYDi5Rmzgm8Pav0bqlF2wyc8Mj+
        X2XpWKUkmekoz+aM41WnGSxscaHT3JtzKXAa
X-Google-Smtp-Source: ABdhPJz3zml2+jnMnXsvpGHwscwaPqZbUhZGR2hV8WhEyyx2BRude2vLO4ubtP7v1IcUWD5ykfQGcA==
X-Received: by 2002:a63:6486:: with SMTP id y128mr27336809pgb.414.1620689949643;
        Mon, 10 May 2021 16:39:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b15sm1819613pfi.100.2021.05.10.16.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 16:39:09 -0700 (PDT)
Message-ID: <6099c41d.1c69fb81.a8355.596e@mx.google.com>
Date:   Mon, 10 May 2021 16:39:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-10-v5.13-rc1
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 22 runs,
 3 regressions (renesas-devel-2021-05-10-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 22 runs, 3 regressions (renesas-devel-2021-05-=
10-v5.13-rc1)

Regressions Summary
-------------------

platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
dove-cubox          | arm   | lab-pengutronix | gcc-8    | multi_v7_defconf=
ig | 1          =

meson-gxm-q200      | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-10-v5.13-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-10-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dcf2613335bced4d60b8b8e10134d2f9153d298c =



Test Regressions
---------------- =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
dove-cubox          | arm   | lab-pengutronix | gcc-8    | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/609990305ccde267ec6f5486

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/609990305ccde267e=
c6f5487
        failing since 13 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
meson-gxm-q200      | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/60999eea6067ccd6b96f5494

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-10-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-10-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60999eea6067ccd6b=
96f5495
        failing since 104 days (last pass: renesas-devel-2021-01-04-v5.11-r=
c2, first fail: renesas-devel-2021-01-26-v5.11-rc5) =

 =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/6099929db5b4b189b46f5490

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-10-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-10-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6099929db5b4b189b=
46f5491
        new failure (last pass: v5.12-451-gae657abc971d2) =

 =20
