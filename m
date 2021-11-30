Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C540946335D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 12:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhK3LyC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 06:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhK3LyB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 06:54:01 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71250C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 03:50:42 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so16943478pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 03:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=McZ2+9MENZXuLVaJxjVIVhLvlRCu0essDre2Fg+yJIM=;
        b=ttJWc3wc3tNiDRrpIT5yPm5EKBnbvfcpaktvGsQQXgrX3LWZzVhDSF8mHBVTq9oy7L
         0mBTBdg5VAh6P1gQEUdm1+cH/sR+16aAntyOF8BSNJm7o27VnZTQ5/f0S97vbH3E20Nr
         EG2yW/Mwt8xfcnH8U+lOFfBQ5ifaKFtTjJeHSrBUTgp/8e96R9kOr+0hMbY1Fy/y/N37
         1PE29VYYKO0y6qZd0scZbaJyuOTrnCwxs9UVxoM88tlVDtQ4INqaKG6hf2DaLU+iDmy4
         8HlR4ygvFRFaSydxMuhWBd92rsB2/QpxtnXKT8CyQax8y06/uy64nrnRmXlYnp9IJiPK
         tAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=McZ2+9MENZXuLVaJxjVIVhLvlRCu0essDre2Fg+yJIM=;
        b=D5CnZ9VbAEqXtrvB1eKbABvZJ7UqsfMXR2WAutSZJOlubJvtyBEIk/Cc27cOMe20Go
         YFg2eLV6r2vCen9oBefcWMX7C1vvKZT9H3SAo3eZfJ4eGXSzN6wnKVGO0bp5UnVDuLe3
         lE7Bh8+2Fg5/tH10J8EQpoeFXZi246kVlnMn82lsk5qSO45icRiiJwwFjw5G0ivFNyoQ
         YejNs3gtnkL5Xh+rHkuEnvUOenLlP3ceD2l5gNxdbu8a3xAWxbCaUdtTYKSelwVjeYya
         DE9quOQqmAO3uCCPTaAlwGSMy5VZHYHryBVCsHSAlPisnXUPYGqmGX2v2CZjLTukKDhr
         zSsQ==
X-Gm-Message-State: AOAM531yPOD+oJ3BhhfoWiv2qymC2HlDVNFeZkhNtKY9XoUZAlTt3xhz
        8yzA8iQAq8BTuAS3lqickWAcNTG9XvlILte1
X-Google-Smtp-Source: ABdhPJx9WIVhNwtGygORCnNfJmk99Jop94ffIoCMv1tU8JrDv3mgJ9/0SrVhBqeHwy+s1qY23305Aw==
X-Received: by 2002:a17:902:9694:b0:143:6f27:29ad with SMTP id n20-20020a170902969400b001436f2729admr68226077plp.46.1638273041863;
        Tue, 30 Nov 2021 03:50:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id pc1sm2678750pjb.5.2021.11.30.03.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 03:50:41 -0800 (PST)
Message-ID: <61a61011.1c69fb81.41b74.6c69@mx.google.com>
Date:   Tue, 30 Nov 2021 03:50:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-11-30-v5.16-rc3
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-devel-2021-11-30-v5.16-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (renesas-devel-2021-=
11-30-v5.16-rc3)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-30-v5.16-rc3/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-30-v5.16-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4a8e6127a65a43320486091f9448d869aedb1dc8

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  bf11f87c27ad1cec3e60bd31c23080d19aa093f3 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/61a605115efd8e8f9b18f6e2

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-30-v5.16-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-30-v5.16-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20211126.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61a605115efd8e8f9b18f6e5
        failing since 34 days (last pass: renesas-devel-2021-10-18-v5.15-rc=
6, first fail: renesas-devel-2021-10-26-v5.15-rc7)

    2021-11-30T11:03:24.963857  <6>[   14.036846] Console: switching to col=
our dummy device 80x30
    2021-11-30T11:03:24.964302  <14>[   14.043549] [IGT] panfrost_submit: e=
xecuting
    2021-11-30T11:03:24.968865  IGT-Version: 1.26-gbf11f87 (arm) (Linux: 5.=
16.0-rc3 armv7l)
    2021-11-30T11:03:24.986536  <14>[   14.059449] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-11-30T11:03:24.986922  Starting subtest: pan-unhandled-pagefault
    2021-11-30T11:03:25.109971  (panfrost_submit:284) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178:
    2021-11-30T11:03:25.124066  (panfrost_submit:284) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), <14>[   14.195512] [IGT] panfrost_submit: exiting, ret=3D98
    2021-11-30T11:03:25.124538  0, NULL)
    2021-11-30T11:03:25.124826  Stack trace:
    2021-11-30T11:03:25.136066    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (8 line(s) more)  =

 =20
