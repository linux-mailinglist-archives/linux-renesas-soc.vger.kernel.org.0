Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354A0442F1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Nov 2021 14:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhKBNgR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Nov 2021 09:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhKBNgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 09:36:17 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3A6C061714
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Nov 2021 06:33:42 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id m14so19530083pfc.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Nov 2021 06:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6PX1Doo13ZqD/E9i5a2Gxr7F3xcXCooMbCa96enugr0=;
        b=iJW3uSt5P2D4qDsTbK9nPeBwcqdVO5R/970jbseRVtWkTMrMX9+W+beigPT+8MJbUn
         a9CBK/e/HxW/3D36eBzyzkxw1jRcB4zFsmDTSxRoDRbI/L32z/DDEyQHrEJ8syKS1pyu
         C4RWFiNxemK9SMr70Tt0QGfl1pnSBYe6cQrogTEGTH01HUazPoQdYDrnGUOrCSJuMC99
         BMaiUY4XMzvWfNKdsgquA1cuapmUo1FnF0Thxwyh4tmmmIlVIqBvSJdn8lwj6QfHE/Km
         kkqEienSiKwJqeGxWG3f1liQJeUC5FUbeZa7pSKo3BXRAYWpJjjkEYURgRMObvkPtmf2
         d+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6PX1Doo13ZqD/E9i5a2Gxr7F3xcXCooMbCa96enugr0=;
        b=Y2YHKi/INLAdSpZNpXDyNzREam1g8QOSO8XuHpfGw9QcbFgoUfuluFFhOAeXkzdTIb
         eZ23uD3JGIYxYzi2sJ5sBxnXCVgWk+5EWZA37hjeRynqT3VvGtyerNHEGK7Wl2oTVda0
         V6rqenfRH/O2yWki2O5jNPJIAq2H7B1UTUzLzbtAI4wVv469e1N6cQjn79zooVA0Xt54
         N2BYpopcr0VEz+gvmVhs4vgRr7QXblRMBiDzytQLrxXsq6T9ci46i6ZOxstr45rgtbqY
         DJD7Y5GnTRM2TQOeZdLZp+qZfhDots5PSx+/SVraESoXV++VwAVCVUdqrojH3xqSn7ZQ
         Hm8g==
X-Gm-Message-State: AOAM532Z2CiwW4egdlIguXM7AT4C9Mxbz3UHl4ts0oO7WIf62WQrTFH0
        J2HtyYW47DoZXEiwCMpmVoz1l4DwRv7FnEM6
X-Google-Smtp-Source: ABdhPJxhHr12J1b2aE9ApFJdKhOmAR6gbgXVMcefo33rsPh+3SqENKh7DVt6AeWWuDToQWwU9eu7yw==
X-Received: by 2002:a05:6a00:2410:b0:409:5fbd:cb40 with SMTP id z16-20020a056a00241000b004095fbdcb40mr36584639pfh.8.1635860022098;
        Tue, 02 Nov 2021 06:33:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id rj2sm3017213pjb.32.2021.11.02.06.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 06:33:41 -0700 (PDT)
Message-ID: <61813e35.1c69fb81.a8868.81dd@mx.google.com>
Date:   Tue, 02 Nov 2021 06:33:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-11-02-v5.15
X-Kernelci-Report-Type: test
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-devel-2021-11-02-v5.15)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (renesas-devel-2021-=
11-02-v5.15)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-02-v5.15/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-02-v5.15
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ee746325c55436cdf9cd64a0a06a190fe72678b5

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  3458490c14afe3cb8aa873fa9e520e1c815ea068 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/61812b745786089d3b3358e9

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-02-v5.15/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfros=
t-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-02-v5.15/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfros=
t-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20211030.2/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61812b745786089d3b3358ec
        failing since 6 days (last pass: renesas-devel-2021-10-18-v5.15-rc6=
, first fail: renesas-devel-2021-10-26-v5.15-rc7)

    2021-11-02T12:13:25.327369  <6>[   14.102994] Console: switching to col=
our dummy device 80x30
    2021-11-02T12:13:25.327873  <14>[   14.109562] [IGT] panfrost_submit: e=
xecuting
    2021-11-02T12:13:25.332427  IGT-Version: 1.26-g3458490 (arm) (Linux: 5.=
15.0 armv7l)
    2021-11-02T12:13:25.347351  <14>[   14.122154] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-11-02T12:13:25.347845  Starting subtest: pan-unhandled-pagefault
    2021-11-02T12:13:25.467868  (panfrost_submit:284) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:179:
    2021-11-02T12:13:25.480583  (panfrost_submit:284) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), <14>[   14.253918] [IGT] panfrost_submit: exiting, ret=3D98
    2021-11-02T12:13:25.481076  0, NULL)
    2021-11-02T12:13:25.481613  Stack trace:
    2021-11-02T12:13:25.493688    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (9 line(s) more)  =

 =20
