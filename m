Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF953D838E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 00:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbhG0W7q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 18:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbhG0W7p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 18:59:45 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E343CC061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 15:59:44 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso7087575pjq.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 15:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YSuWQfor/woHN9qVFMw3dgfeSQm1O4HidAc2j+CtL3I=;
        b=va6hbhiX/EAMrQi2MMjuo4GOy2XCuSQNFJJLjkUBigkj76HuSGQ9+gQoDP/9WLZOqh
         iqMCVmWs87n+T2OW4WCjPXC1u5Yn0rF/jRFYCOO3FwGbVMshOvSGsUgoiE86OhnxVMGN
         2Dae2RrUl+ZbhW/wHlttF8MLDq17XCFVzwMtdVr4U3dhCgpQaYTRDrkDV2EFQNLd5eB/
         cEZywS3H0hiW0RZHqJDZnjEufmvqrPplFuFX8NBlGGegbmc0rGblbAmh5k5QYsUn3cTj
         P3D0ZQ7BJMHqHFMREbsoirOqjW205pCwiOvT5jqoKUYH1m1M6lTEau6uJNtSSvhZ3IkR
         xHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YSuWQfor/woHN9qVFMw3dgfeSQm1O4HidAc2j+CtL3I=;
        b=Pt7KQmWBCcaAQAe+lFU9uCp5pPOG2fn8mzd/zx023+C03eeCjWnvaERtDZRQLIkBcr
         GF+bm+ERz40BG6jWnpbl86yP3RjP6YtmJtkAZogUgGiGE5wU8k36KBq1F4+A+7w86azw
         LJ6KBW/VggqWxagGlWQLcKO0sLiM7zpDo3V3kOx5YXt05TZN32BRa7GH0xdSWIlgw6z2
         rHTnPEjuMXW8LKrjRaixsZXLKTnOkFDKW/Q1UmW3UjggvoNt+c5kjPVqliIFmRz79mKz
         O0Y2lfJTcHZFgcANocNwVjjref1B59O/JXfHyPKJbfuzjnWrmRWwvEuOMpWY/5mcni4d
         80Rw==
X-Gm-Message-State: AOAM533Ths2agx7x3MYeTo/NgHWzesCx9Uh9Qo0hhqfZK3njfOc4ZqkT
        kmFjSxVjtxqDy+yFDqbsL190zbO98vx5bS+t
X-Google-Smtp-Source: ABdhPJyzSiUf4TpDhn3LT4JtXdt+DlMm5vE7TyvvDOw5Pyw7yx8zVght9vE/U5TSdfT3mVQHcsAbog==
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id d23-20020a170902b717b029011afae3ba7cmr20180334pls.28.1627426784307;
        Tue, 27 Jul 2021 15:59:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s125sm4878577pfb.51.2021.07.27.15.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 15:59:44 -0700 (PDT)
Message-ID: <61008fe0.1c69fb81.e636f.046e@mx.google.com>
Date:   Tue, 27 Jul 2021 15:59:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-07-27-v5.14-rc1
Subject: renesas/next usb: 2 runs,
 1 regressions (renesas-next-2021-07-27-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 2 runs, 1 regressions (renesas-next-2021-07-27-v5.14-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-27-v5.14-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-27-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b1f6bead1fb4976611429f459a1865daadedbb48 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/610080f26c7d95708c501955

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-27-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/610080f26c7d95708=
c501957
        failing since 0 day (last pass: renesas-next-2021-07-19-v5.14-rc1, =
first fail: renesas-next-2021-07-26-v5.14-rc1)

    2021-07-27T21:50:43.357402  3: ID 0ea0:2168 Bus 003 Device 002: ID 05e3=
:0608 Bus 003 Device <8>[   13.616803] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dusb-presence RESULT=3Dpass>
    2021-07-27T21:50:43.357668  001: ID 1d6b:0002 \"
    2021-07-27T21:50:43.357811  + lsusb
    2021-07-27T21:50:43.357928  + awk {print $6}
    2021-07-27T21:50:43.358039  + sort
    2021-07-27T21:50:43.358145  + seq 1 3
    2021-07-27T21:50:43.358249  + /usr/sbin/rtcwake -d rtc0 -m freeze -s 1
    2021-07-27T21:50:43.358381  rtcwake: assuming RTC uses UTC ...
    2021-07-27T21:50:43.358482  rtcwake: wakeup from \"freeze\" using rtc0 =
at Tue Jul 27 21:50:45 2021
    2021-07-27T21:50:43.406482  <6>[   13.666064] PM: suspend entry (s2idle=
) =

    ... (131 line(s) more)  =

 =20
