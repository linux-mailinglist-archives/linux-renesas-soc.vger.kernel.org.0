Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724FB45F767
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Nov 2021 01:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343790AbhK0AVQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 19:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbhK0ATQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 19:19:16 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0C7C06173E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 16:15:59 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id p13so2641562pfw.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 16:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=y895rBhgo5es91RFaMfNUOolDnwMLBnuGWS8VMm8H4c=;
        b=i4lGVcM3MOjOslwPXR2ue1UHsqRtML/7crrXuRaQ1z8GYuzggX1LmCPO2daiaum3zD
         o69eukL9ViSBWZcVWR9Uw2Xhg9Uqt/t9MYAc+0ZGOMGcy5AfFvtW//hrQE1/HZFcmEMV
         51iNP73rjK/vDgGxxJ+WyNELHy4qMKBWxnZfMm5mSZJyCanDnepZ6+Vpo6Kz92tO8Dfp
         Qmu3OzGTPWUynfmZF5neIBQAUrvzF2nQXOGbxyeXy+EvfeBYOlExcIAnQLEWcqDQm2ke
         yLStOOqcAYpQ8Imp5xESEg0Fa2c03o/Uaj51crteIVR12nD9FKpVgQ6Uma1PovK2JwiA
         Widg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=y895rBhgo5es91RFaMfNUOolDnwMLBnuGWS8VMm8H4c=;
        b=NeS8KvrNJ7+FB1CbmnGMPNiueg2GJC9CBZj4l0QYq6hOc1qexx5VHPdLxsSQ3v8R/J
         yN4P62unwdFe/7d5e6YbxLugB6UWbyKoVSBrkCGQUzRYYaiAuhzV0fT1eE+iCmcrupnI
         KPE57ScPMk3H3KpFtgjsDPjn9xg6FWrslBZu3icNoRlbat/Ws2vRrxSBIEprqDaUGKq8
         SErUAcL+pelMk2SV29ZDazqcX/XeW0rDyjuKw6v033mpyJa9M5oN70DCk2F30Q6W8Eei
         shSnxrZ1d/JZxcF4EHmzh+UMEKFCcy6c71Gl2jfJP0UrDVAuUiXToqSvTtFzMJznmFvj
         JNFg==
X-Gm-Message-State: AOAM533cKfkwgbRNfupzyR5iBavB1mlSsIeFjyBFpoXazESu33jh/41j
        OdIMjEr/ntet2MqxzFrvU+ThEJkuHdvbF4GS
X-Google-Smtp-Source: ABdhPJxocPd5Gn4yKGsLvA3tYU3l+wQGIvo9dq+P7rS2vOWUe2vUIK9YFB0qFPShFDhQqeNCHt8mcg==
X-Received: by 2002:a63:5308:: with SMTP id h8mr23667017pgb.287.1637972159008;
        Fri, 26 Nov 2021 16:15:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b10sm8291542pfl.200.2021.11.26.16.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 16:15:58 -0800 (PST)
Message-ID: <61a178be.1c69fb81.89691.7b36@mx.google.com>
Date:   Fri, 26 Nov 2021 16:15:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-11-26-v5.16-rc2
Subject: renesas/master igt-gpu-panfrost: 1 runs,
 1 regressions (renesas-devel-2021-11-26-v5.16-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 1 runs, 1 regressions (renesas-devel-2021-=
11-26-v5.16-rc2)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-26-v5.16-rc2/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-26-v5.16-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e6857b805826e5d6f698ac92f4db69feb43afb4c

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  2e0355faad5c2e81cd6705b76e529ce526c7c9bf =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/61a169fd7ab298c89c18f6cd

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-26-v5.16-rc2/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-26-v5.16-rc2/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20211118.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61a169fd7ab298c89c18f6d0
        failing since 31 days (last pass: renesas-devel-2021-10-18-v5.15-rc=
6, first fail: renesas-devel-2021-10-26-v5.15-rc7)

    2021-11-26T23:12:42.228066  <6>[   14.247428] Console: switching to col=
our dummy device 80x30
    2021-11-26T23:12:42.228553  <14>[   14.254076] [IGT] panfrost_submit: e=
xecuting
    2021-11-26T23:12:42.240336  IGT-Version: 1.26-g2e0355f (arm) (Linux: 5.=
16.0-rc2 armv7l)
    2021-11-26T23:12:42.246742  <14>[   14.261631] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-11-26T23:12:42.247240  Starting subtest: pan-unhandled-pagefault
    2021-11-26T23:12:42.362620  (panfrost_submit:286) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:179:
    2021-11-26T23:12:42.381029  (panfrost_submit:286) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), <14>[   14.401187] [IGT] panfrost_submit: exiting, ret=3D98
    2021-11-26T23:12:42.381616  0, NULL)
    2021-11-26T23:12:42.382054  Stack trace:
    2021-11-26T23:12:42.394734    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (9 line(s) more)  =

 =20
