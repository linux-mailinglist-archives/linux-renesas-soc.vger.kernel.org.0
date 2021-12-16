Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFAF3477B34
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 19:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238081AbhLPSCJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 13:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237874AbhLPSCJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 13:02:09 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758DFC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 10:02:09 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id z9-20020a17090a7b8900b001b13558eadaso1687513pjc.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 10:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=x0tcMAFN5CPTsq6iDdAhQohHDk/3NwQQNM3c+Swg7Y8=;
        b=fNujyGnyUOikYuIYo2hy1sMvI734ZpG8q+r4fPMy1711m2R8P3/ephBkCudCX0zNpt
         Bpv16v41riuGEX7f+O0WUKnbUcc/y0QKRqIPtplfIQM5DNm0Yajw+WxjcZmva7ru0rp9
         C30kJ2RUO6deRuOAI2gIMgY1hgjz2oe7zfQECEA7qh4/OO7pVSo7bVQmMNyMkwc+tprL
         4eW2GH3W3mFGGmJA4Ny4tyBASg9v+SMd2G1Mv6P1hvRmv6HVOD0RnJUajUJrX9UPhoFH
         1On5prvCghT3JvToiJrNQ/EUAhoJe0RgHO3vC/BRTHEJNQiBaAc+jCO37Sghx34Kdccv
         /2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=x0tcMAFN5CPTsq6iDdAhQohHDk/3NwQQNM3c+Swg7Y8=;
        b=QJmZbmSo21XMgfiThYsCxGHTkHRwZ3ub2tutyy4/2WPc/BT2CXCxs2tm+1j5kbOBbd
         yfRW9NDFoXiWN5+6obKiSeYlAOkfZKGFJ9eBCbLEQ/1QnwZgLyuZNBwCvQXAHnp41ZUC
         HCcqC7jQL111A8tQ0hMhx6vZMwstALJ6IvXq+//relxEm2YVpYu4qlbGfnlG9x7j8PzE
         C72fPiRyOxsvcUY6kS/Bkge+9TF9Pgu98yFAq09nkoA7KaiWytVtHbxPSgJz4bPfzN0m
         NHsxl4s2mctwDd9D25+e6dSIYOVN2bS+9wAwtH3QwhzeronE97WNojS8Yytgg9Gx/KBn
         iHOg==
X-Gm-Message-State: AOAM531qOGLvSzc5Qm8Dmur7lfmccX5BBlx8iXuIqDc9jjjJuJRbQ34G
        w5sSQQ3Nkgm4av6Xqb212kKK811mKX0iDcq4
X-Google-Smtp-Source: ABdhPJweILz8CzWgnzvraeBCEiSKgPDWuxCGaDTfiwf7M1l8tcvlUES0o+kAI4wqeDRIIhxlN32O+g==
X-Received: by 2002:a17:90b:380d:: with SMTP id mq13mr7411342pjb.110.1639677728860;
        Thu, 16 Dec 2021 10:02:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 59sm5937429pjz.34.2021.12.16.10.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 10:02:08 -0800 (PST)
Message-ID: <61bb7f20.1c69fb81.48594.039c@mx.google.com>
Date:   Thu, 16 Dec 2021 10:02:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-16-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2021-12-16-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2021-=
12-16-v5.16-rc5)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-16-v5.16-rc5/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-16-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b33e75b3e597788be243c04aba22d39431b9ecfb

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  136258e86a093fdb50a7a341de1c09ac9a076fea =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61bb70837b79669d7d39714b

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/arm64/defconfig/gcc-10/lab-collabora/igt-gpu-panfrost-r=
k3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/arm64/defconfig/gcc-10/lab-collabora/igt-gpu-panfrost-r=
k3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20211210.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61bb70837b79669d7d39714e
        new failure (last pass: renesas-devel-2021-12-14-v5.16-rc5)

    2021-12-16T16:59:41.268429  <6>[   24.009415] Console: switching to col=
our dummy device 80x25
    2021-12-16T16:59:41.273839  <14>[   24.016891] [IGT] panfrost_submit: e=
xecuting
    2021-12-16T16:59:41.280950  IGT-Version: 1.26-g136258e (aarch64) (Linux=
: 5.16.0-rc5 aarch64)
    2021-12-16T16:59:41.291977  <14>[   24.031821] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-12-16T16:59:41.296732  Starting subtest: pan-unhandled-pagefault
    2021-12-16T16:59:41.416081  (panfrost_submit:338) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178<14>[   24.154683] [IGT] panfrost_submit: exiting, ret=3D98
    2021-12-16T16:59:41.416830  :
    2021-12-16T16:59:41.429922  (panfrost_submit:338) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2021-12-16T16:59:41.431255  Stack trace:
    2021-12-16T16:59:41.435573    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (14 line(s) more)  =

 =20
