Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7253D49A5EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 03:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3418112AbiAYCMy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 21:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3414881AbiAYAwv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 19:52:51 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C651C0E5311
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 14:34:22 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id z10-20020a17090acb0a00b001b520826011so385055pjt.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 14:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GPn/s0dF7Wk19RrQHNAKm+aLva0tklRfaT/Qdvqqe4w=;
        b=v5RpraN+qvtFbfndGoTSnpXFjDWEE0pSEjPIQJZoOozzl40rmDhs09NNXKYtE6M8ee
         iowtioMCqBXS06uJ6snKdh6hTVpxlSqZhN7x989gN550lUirBP9UH6Zs85zNMbdcOeps
         cQPvuyLZQvfe9kLjYaclnez4T4becejmbIKYCSkUd3REJIcy6VFMmy4qMUHgeSejFgk4
         +YZM/C1tMA82ZkvepDnXCbm/qkBP/IA146YDgeZehiIj6hDkU8rm/kvDwwiC7Xx8UZWV
         sXcEBsjOS3dKxd+Y+5idZ3hIjuiPaGh5VCOtAlG6/fKeCjAeXXxOoMiOxmWwP9uL4sdj
         jaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GPn/s0dF7Wk19RrQHNAKm+aLva0tklRfaT/Qdvqqe4w=;
        b=4ybXcGi3gdKS7Fp1VHXOe+XgWT8M1LH4vw/v1d8olWSGbO7p7mJ0fO8A40EVRzIWQB
         EkqX4OAErZ26g+ZoLRVhTtaIRy6yUKQ0LD5YMOZXktfhyWaMG+jfqXVHzz9IU3sECwKU
         QbIoeAOTrUyxZ4oT1pnhOWmM6yYtlzlyIH40L8sir2wr1c1Zm2aWgc0Ipgj2J8ybEpvL
         jh2lc1MBCJMW6CG99GfHYqhUmaNIXam8fP995+Ok027d1vZMogMGoq2rOqJK7uUlMNch
         YigdLRESLj/I50S14XRYCMHXiBmiMtcY0tMj5RmeP7npbkJClyddFJ0JEqxOlpWdZzE9
         4fKA==
X-Gm-Message-State: AOAM533O3NAO6/vJEN1ynjUF3+XO2qBh2EEkuNla76/nrkVx6AhE/ZcI
        donSk1VkrVgE6LI4mWwYa9tqlRYNqKTi27aK
X-Google-Smtp-Source: ABdhPJy7bKkGjL8UbmAHNNFfPlLMjZMPwUxeU8+MXeRnyHPaTgwU6eg09caoG3wipA7Sf9Uwn5+78A==
X-Received: by 2002:a17:90b:68c:: with SMTP id m12mr380591pjz.137.1643063661574;
        Mon, 24 Jan 2022 14:34:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y128sm17992371pfb.75.2022.01.24.14.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:34:21 -0800 (PST)
Message-ID: <61ef296d.1c69fb81.26395.0d9a@mx.google.com>
Date:   Mon, 24 Jan 2022 14:34:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-611-g4ccda2778be0
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (v5.17-rc1-611-g4ccda2778be0)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (v5.17-rc1-611-g4ccd=
a2778be0)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
7-rc1-611-g4ccda2778be0/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: v5.17-rc1-611-g4ccda2778be0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4ccda2778be03d61d70b8c8da55ef54d69a7f3cd

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  f73008bac9a8db0779264b170f630483e9165764 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/61ef22db46384a55c2abbd12

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfrost-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfrost-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220121.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61ef22db46384a55c2abbd15
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T22:05:57.577013  <6>[   15.367095] Console: switching to col=
our dummy device 80x30
    2022-01-24T22:05:57.577512  <14>[   15.373919] [IGT] panfrost_submit: e=
xecuting
    2022-01-24T22:05:57.582754  IGT-Version: 1.26-gf73008b (arm) (Linux: 5.=
17.0-rc1 armv7l)
    2022-01-24T22:05:57.605040  <14>[   15.394652] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-01-24T22:05:57.605539  Starting subtest: pan-unhandled-pagefault
    2022-01-24T22:05:57.731596  (panfrost_submit:283) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178:
    2022-01-24T22:05:57.745132  (panfrost_submit:283) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-01-24T22:05:57.745626  Stack trace:
    2022-01-24T22:05:57.746085    #0 ../lib/igt_core.c:1752 __igt_fail_asse=
rt()
    2022-01-24T22:05:57.758315  <14>[   15.541701] [IGT] panfrost_submit: e=
xiting, ret=3D98 =

    ... (12 line(s) more)  =

 =20
