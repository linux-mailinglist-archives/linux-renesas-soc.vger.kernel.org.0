Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B5A2F315F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 14:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbhALNSh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 08:18:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387953AbhALNSg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 08:18:36 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3F5C061794
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 05:17:56 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d2so1380751pfq.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OHnAyFt2B6tW+KMLFrsdOvg1rKwbSJ93K0WZAt2g4k4=;
        b=FyMLjKsV+RMnOIWe9aj6r6kto1D5aSazgp32JuTDm2VfMZCFz3vDDZzpbnqXQon5sN
         ADXwVi+Mnzjr+/uf/VmoqgvsAr4jeml68Dt0plkTdS70jR8HfI0ORLDXY0Ly1TSnLztq
         OtN79zcV9SBH03m6C+a9e/rVG5O7CfgoY3G2piQ/VcC72XuAW6QO1Bte9RL2IU1mBIAz
         2BxifpMfLguuHUIqiGvc4opv2dd6U9eMrKAP2fZDhHWpUj9l1//u3tJDk2Vng52E7XvI
         9vSXrBz9PgCl3jlrTlNyCHyEOr8BiKW4ROYeKjM4hAdf8rwLk1d+RpGm+cS2Bxmn285h
         OSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OHnAyFt2B6tW+KMLFrsdOvg1rKwbSJ93K0WZAt2g4k4=;
        b=h2WjvWzR5xXByfqAeLdsVQ4B7v9sUzTgRLw8R7ho1nICSDeTq1hnuPG87CY4BuQIE1
         xpGPehj1TLZ1NdaGss3058dO3LLF9JGEq+hU1St6I9+tAlP9U+uilKkgVmyfrLTx/ZBQ
         S1T9No94kDjOGim36cWR4Csa81lb+/f/Q2+bH8fbk/2jfjonPr1MqAu75jGh2GRqHkck
         50AZBVFtzzqdmkEkDic3N9VOS5DU/VxuF1prKTUx0azNw94R3hYsclVwCZOEXe4MjO7/
         qLWt9ToL7O2cGVc81zS5UjFMDlPATm0Ho7MtnBj8P6EGSQ/gq5HHyBwnpfLl/9K2ggiq
         gPUA==
X-Gm-Message-State: AOAM532ht01LjG+5c41932gXOwPe4h8kFpRwzNdTkgIvjvDjVNg7Rblv
        T2FgElBYx4o3LZvuLO40SV/5hMHpz7BRuQ==
X-Google-Smtp-Source: ABdhPJxowO7/MGjI4h31J0LyXWkLLKrI8gbwhw0B0P9s271Tf635xIeGQY9ualAJWMGFEeCMyMsF4Q==
X-Received: by 2002:aa7:9307:0:b029:1ae:6b43:e3e3 with SMTP id 7-20020aa793070000b02901ae6b43e3e3mr4726678pfj.57.1610457475674;
        Tue, 12 Jan 2021 05:17:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z23sm3531016pfj.143.2021.01.12.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 05:17:54 -0800 (PST)
Message-ID: <5ffda182.1c69fb81.93a27.7a2a@mx.google.com>
Date:   Tue, 12 Jan 2021 05:17:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-01-11-v5.11-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next ltp-ipc: 18 runs,
 1 regressions (renesas-next-2021-01-11-v5.11-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 18 runs, 1 regressions (renesas-next-2021-01-11-v5.11=
-rc1)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig          | re=
gressions
----------------+------+---------------+----------+--------------------+---=
---------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1 =
         =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-01-11-v5.11-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-01-11-v5.11-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ffb284986e56791dcd815b16c03adad3e2f36cbf

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  b7ca00a6faa75fee42cb63d40f709cbfe65ec378 =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig          | re=
gressions
----------------+------+---------------+----------+--------------------+---=
---------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/5ffd9b4a7b15a6c127c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-11-v5.11-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20201221.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/5ffd9b4a7b15a6c127c94c=
ba
        failing since 6 days (last pass: renesas-next-2020-11-30-v5.10-rc1,=
 first fail: renesas-next-2020-12-28-v5.11-rc1) =

 =20
