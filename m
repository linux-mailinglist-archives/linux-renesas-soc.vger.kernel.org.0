Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C308948A08E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 20:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245128AbiAJTz0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 14:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245514AbiAJTzR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 14:55:17 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03871C06175A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jan 2022 11:55:17 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id z3so13600215plg.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jan 2022 11:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SMJYNXolKCwMYZSqIJ0uSsxLxIlkbvmrhJjceDCPfR8=;
        b=jrZ7zirlcJeoTkl2RYaMjl56mUSG8pnhK7NGm0phVxBEt9cBgnhvoc1KF6Q1H0pHJy
         0LnpNtuW/R8+u79bYlP6j6UEKZq0CVZbCzeTvocQN2CXSC+lBZaZ0Fc+Ru249uFUn32l
         2n0PEzZ2OzdyVitatzTx2iCNUpTlj281wQRV/vCEZlUP7IjQg0kw9wQMtJTgt35TFqxU
         /2OvTNl+q+2TwEqATFKOWnEhpKwhkU0s1RdPTeyB/7k4jjDY8q6bPnacQTcZhHvfuZ9+
         E3tFjecgUbE+bd/0r1T3RiRqnkT8liHb44gytOXcNsXKbJNFEIfw5Bl32VInp0WHVKHC
         jMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SMJYNXolKCwMYZSqIJ0uSsxLxIlkbvmrhJjceDCPfR8=;
        b=mFQc8URIklkFVbFsIAib/0mX60auoedaJsAdXs95ux0T5sSwrPqyKm/UjrJ3rNczxF
         6jAHJOK5BLqGkO3cwKvjqEMNzvkR02fOfLLhkF4sdoAgsf4FbdfVlw0TMeVmoleuGR3x
         xlxDbDRK+2wtqBN6y8+1j7Vf2JH5pQfkDTx0V8VBzkj4l99RAmi1ACi7L7HeW3KdFZcm
         APosd1ziXQ0dLnYZy76FWbeq2DzChmobp6KdaNomencmCPrA+9AfBx9ch4Q0iAKY2Ke6
         XLSTBvxKxIqpCcBCNtA4489TMHVpsQ2WrorDChKTXFULZUfggkoQWb1pgU5KoQ0dcMkV
         3hig==
X-Gm-Message-State: AOAM533EKU3Esoreo6S3fRYOgviDZVyp4c5S2BweTdunKERDSxOMrBaq
        T2d++ApVDW6ASl9vfM+eqEAYWWsMjIshx/Zi
X-Google-Smtp-Source: ABdhPJyHpq+1SPgjSOpEs6OMMG3E5COk2eO5AnDn/R+noWSr3U0RV3QYRgaKRhXU/ln5R10/NU4C+w==
X-Received: by 2002:a17:902:c410:b0:149:ba80:4662 with SMTP id k16-20020a170902c41000b00149ba804662mr1198258plk.73.1641844516376;
        Mon, 10 Jan 2022 11:55:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ng18sm8145990pjb.36.2022.01.10.11.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 11:55:16 -0800 (PST)
Message-ID: <61dc8f24.1c69fb81.3c30b.5526@mx.google.com>
Date:   Mon, 10 Jan 2022 11:55:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-01-10-v5.16
X-Kernelci-Branch: master
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-devel-2022-01-10-v5.16)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (renesas-devel-2022-=
01-10-v5.16)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-10-v5.16/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-10-v5.16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      20430dcf04d1ee6f9b5af4b2b23fe6e097006565

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  15df505835e60dbdb9ddcbd800a4fab3120328f1 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/61dc7f0b281ad9b27eef673d

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-10-v5.16/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfros=
t-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-10-v5.16/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-panfros=
t-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20211224.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/61dc7f0b281ad9b27eef6740
        new failure (last pass: renesas-devel-2022-01-03-v5.16-rc8)

    2022-01-10T18:46:18.486460  <6>[   14.587445] Console: switching to col=
our dummy device 80x30
    2022-01-10T18:46:18.486959  <14>[   14.594115] [IGT] panfrost_submit: e=
xecuting
    2022-01-10T18:46:18.498141  IGT-Version: 1.26-g15df505 (arm) (Linux: 5.=
16.0 armv7l)
    2022-01-10T18:46:18.503856  <14>[   14.602999] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2022-01-10T18:46:18.504380  Starting subtest: pan-unhandled-pagefault
    2022-01-10T18:46:18.630150  (panfrost_submit:281) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:178:
    2022-01-10T18:46:18.644682  (panfrost_submit:281) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), 0, NULL)
    2022-01-10T18:46:18.645198  Stack trace:
    2022-01-10T18:46:18.645637    #0 ../lib/igt_core.c:1752 __igt_fail_asse=
rt()
    2022-01-10T18:46:18.656679  <14>[   14.751197] [IGT] panfrost_submit: e=
xiting, ret=3D98 =

    ... (13 line(s) more)  =

 =20
