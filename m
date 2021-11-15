Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7616451551
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 21:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346020AbhKOUe7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 15:34:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350483AbhKOUX4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 15:23:56 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32C2C061208
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Nov 2021 12:20:10 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so231326pja.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Nov 2021 12:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Dh06O/veDjnzJdaftgMgLWIETo4/eXGg8988BwFGADk=;
        b=ROhV8sIPnPqPfY35vK8VMS7OTrClksedmKpMIqosaGlUxVdCdINeD0Ecmd7eXwbdzy
         Bbx3qAPIPkmsCZU12EOH4o31Ec6ca7sDxm2I0tunrnKsNtcygWu3VQTREiI6kA+C0T55
         G4YBFT2nQbxt7WFqRAdfNG9K6mLERk/th4K+ztWA71ZnvOBZHIViGzwhCktNvWap84fc
         bD7vKhvDtUuxb3zQXmKefy4XOFZQFmd6R4sjn7TmBKOsAYpPiiXO2l6NQNq4NExlsiJ+
         n1XyJlJjPQt3xbSfMXOxmQ3M8Du6LTO6WRfis7PKXn/lM+t9Lnpv8Ryh0F8Se6urJV5y
         jgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Dh06O/veDjnzJdaftgMgLWIETo4/eXGg8988BwFGADk=;
        b=TTYz5bGvgVuTdl+bV6bKAc4CM3aXHsRfKolpQNfnlfb39ICgnviLakHbQZHthIvH/y
         sFVmKEJ7Whqm66MZ376NWtHPtPAH5+7j4Yzycmjjmlyo4ODgk8Bmft3Oi+1QiggXPvT1
         JKfqQLLl/NHnh6bTjSA0rEh7lhL7/BKyDZZePvlM6hWcMMU8d5I4WcRhp01n0nzj1pbC
         PqeS3c0FPRV6zfhWMEWvLZTevKdjgY76JwdGFSgCUBVd0YFpf7Dt4Um5ye2G/Nlog0SH
         MB50nDBukJwmRURqwGRRMdDPhowQw+mPWyPg+G5e+2kqptfhMJupkF5MRiQTE7iqdy5x
         GOKg==
X-Gm-Message-State: AOAM532t5jt6kJAC45qXhnb4HUW9/iSV5A34BdM+UadU85vtYXlSrR7J
        DmM7RCpbPLdwsNkW46XuPk+vR7N8ULspEAVh
X-Google-Smtp-Source: ABdhPJyhEoCQgYduSvG5Ni4alyoGluUzRaAhI+c25o5PaMZqIj1EbGtYtizMlocEefFjOAuY5w4j7A==
X-Received: by 2002:a17:90a:df01:: with SMTP id gp1mr1673581pjb.28.1637007610340;
        Mon, 15 Nov 2021 12:20:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w129sm15711049pfd.61.2021.11.15.12.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 12:20:10 -0800 (PST)
Message-ID: <6192c0fa.1c69fb81.7ea81.df60@mx.google.com>
Date:   Mon, 15 Nov 2021 12:20:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-11-15-v5.16-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master igt-gpu-panfrost: 2 runs,
 1 regressions (renesas-devel-2021-11-15-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-gpu-panfrost: 2 runs, 1 regressions (renesas-devel-2021-=
11-15-v5.16-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-15-v5.16-rc1/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-15-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      fd3659fd4309cfa765464c92978ee507e04f7710

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  246bfd31dba6bf184b26b170d91d72c90a54be6b =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/6192ba893d475a8abc335916

  Results:     15 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-15-v5.16-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-15-v5.16-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-gpu-pan=
frost-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20211112.0/armhf/rootfs.cpio.gz =



  * igt-gpu-panfrost.panfrost_submit.pan-unhandled-pagefault: https://kerne=
lci.org/test/case/id/6192ba893d475a8abc335919
        failing since 20 days (last pass: renesas-devel-2021-10-18-v5.15-rc=
6, first fail: renesas-devel-2021-10-26-v5.15-rc7)

    2021-11-15T19:52:21.592414  <6>[   14.006661] Console: switching to col=
our dummy device 80x30
    2021-11-15T19:52:21.592935  <14>[   14.013252] [IGT] panfrost_submit: e=
xecuting
    2021-11-15T19:52:21.598169  IGT-Version: 1.26-g246bfd3 (arm) (Linux: 5.=
16.0-rc1 armv7l)
    2021-11-15T19:52:21.614683  <14>[   14.030805] [IGT] panfrost_submit: s=
tarting subtest pan-unhandled-pagefault
    2021-11-15T19:52:21.615204  Starting subtest: pan-unhandled-pagefault
    2021-11-15T19:52:21.737920  (panfrost_submit:283) CRITICAL: Test assert=
ion failure function __igt_unique____real_main65, file ../tests/panfrost_su=
bmit.c:179:
    2021-11-15T19:52:21.750969  (panfrost_submit:283) CRITICAL: Failed asse=
rtion: syncobj_wait(fd, &submit->args->out_sync, 1, abs_timeout(SHORT_TIME_=
NSEC), <14>[   14.165799] [IGT] panfrost_submit: exiting, ret=3D98
    2021-11-15T19:52:21.751496  0, NULL)
    2021-11-15T19:52:21.752170  Stack trace:
    2021-11-15T19:52:21.763905    #0 ../lib/igt_core.c:1745 __igt_fail_asse=
rt() =

    ... (8 line(s) more)  =

 =20
