Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7854F3E82DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 20:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbhHJSVr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 14:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236945AbhHJSVd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 14:21:33 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807B9C09B124
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 11:04:42 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id e19so8775033pla.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 11:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ocrMPdSCfxnrpnPfpPZbWBwoEwRqpsGuY4hjxvMaA34=;
        b=JZm8GY+qIX0w4eyJ3/Ep2bVz2Oyw8VzeeYQe8doHuX4SNmOh174VYWDlrdtOFuk5wl
         yb2YwPS4+f1JTMLea7MGrXIXe0IQ8bcB0gtYRREW/yOoAY6T/juNnvjRguLsZqdiVifR
         OdvQunCMZ+jEm1C9vf969xZ7Byp3M25/8NTloDD8WwBC3dHEzzDUajMs8GS/erGu/kYC
         d1P6UnJyot9I8XhTuS04lGhuU8PRgfOb2jtIMt4BwHy90I07owI5gtssF1OjCyz6+CT4
         eeb/EwsZr/jGKQbVrjvaDh66lbYz8qoXceOMkkRQJdF6IAVGQiy/X9UQquEKEexX4+O3
         qZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ocrMPdSCfxnrpnPfpPZbWBwoEwRqpsGuY4hjxvMaA34=;
        b=Y80hD0QjR14k8Yy2wBjFcXyUTPbokuWT/fTuQss58dPwLq+kFe1StwAmJKdVHMvZia
         2bSt29TiLE+0jYCggAhT6B3VHHhXLGFtTcIInvaBi3MWAQqUbUxhmYTTLHRAhLTPyQ/u
         BzehaNx8/D2x6pYf4c9/yYdt76141mTKC0EqTt+4/nkHcODSjRDke4657vtRZKTNjdG3
         wcjc3pWXBYhjrAbTpJR9mEE7Wn9tBr+IOgSL7iBCQCuxccKd5zU6srgzRYYnuwTqTXxl
         CxpNDQMZUcQo0MNnW/kQ9peyX0E8Aq9IFWyDC5K+wTPDtEsrxckmCCT2BphWSXGyIBM7
         MiTQ==
X-Gm-Message-State: AOAM533gZzUSiUFXRydxAl80HaX7x2dBuBrOai9ZZ7vpvbEDD5NHAwwA
        EeGDKH5KSyyuoQXioUXEEoE6tWGtj6Qg3zw/
X-Google-Smtp-Source: ABdhPJxZHl69tU0FXEBCcuydLbUNF22NgYxyX1P4jHc95KEUCZsuo1m9kO8zzkr6nhzD4CKbieJNUA==
X-Received: by 2002:a17:90a:7d05:: with SMTP id g5mr6063512pjl.14.1628618681847;
        Tue, 10 Aug 2021 11:04:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g22sm15596597pfo.164.2021.08.10.11.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 11:04:41 -0700 (PDT)
Message-ID: <6112bfb9.1c69fb81.e31d1.bc1f@mx.google.com>
Date:   Tue, 10 Aug 2021 11:04:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-08-10-v5.14-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2021-08-10-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2021-08-=
10-v5.14-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-08-10-v5.14-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-08-10-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3d3aec53bf89e3aebe1b92e693fe78efd5f49978

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  4ac7d6bf5dd1d7aae893fafee98a309d357e5bd6
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  6135b9cc319ed965e3aafb5b2ae2abf4762a06b2 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/6112b1dd99824d8045b13661

  Results:     92 PASS, 3 FAIL, 140 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-08-10-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210730.2/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/6112b1dd99824d8045b136e7
        failing since 77 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-08-10T17:03:47.903998  <14>[  156.357859] [IGT] kms_vblank: execut=
ing
    2021-08-10T17:03:47.904237  IGT-Version: 1.26-g6135b9c (arm) (Linux: 5.=
14.0-rc2 armv7l)
    2021-08-10T17:03:47.909908  <14>[  156.364596] [IGT] kms_vblank: starti=
ng subtest pipe-A-ts-continuation-suspend
    2021-08-10T17:03:47.915304  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-08-10T17:03:48.010868  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-08-10T17:03:48.047870  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-08-10T17:03:48.048135  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Aug 10 17:04:04 2021
    2021-08-10T17:03:48.066979  <6>[  156.523090] PM: suspend entry (deep)
    2021-08-10T17:03:48.067216  <6>[  156.527648] Filesystems sync: 0.000 s=
econds
    2021-08-10T17:03:48.081990  <6>[  156.533845] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done. =

    ... (99 line(s) more)  =

 =20
