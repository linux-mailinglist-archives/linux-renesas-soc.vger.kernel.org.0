Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E9F3C1A5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jul 2021 22:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhGHUL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jul 2021 16:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhGHUL3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 16:11:29 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6276EC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jul 2021 13:08:46 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id z2so843851plg.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jul 2021 13:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qtbvSzxvISV5XuMKtaiMLKUN0bWdaP45jUCmswBJAMs=;
        b=YZxh8qiwpLRnTGK6ywJBnY0z/RQcIMUN2ezbAeTTcYFs79FRySBVpV+eV4dJOBGdwP
         hTchCE5oDOwSDyMkE734/2tKBGMKwUwL+I1i3G+HWkNRiW9z2Lkk3YR5WM9QB90OMadi
         NkbF/B+GedTSIYiTlBlWc/aagF7OEpKwVK3qVXiItK7UuSFytKHh6dipw96mxbyrZpF3
         9Fw6AHfh9jBnRbZEdw5u2kojeEiwF+UB7bbdCqgwNqD49Q5vHFnInD+5SMK26N96gESv
         uUQOWb7edJCO270SZa/RxQxvEL6osExxdIv3OQbNmnPbV/oPOuHY/r5gjk7Twm5wcLfs
         Lcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qtbvSzxvISV5XuMKtaiMLKUN0bWdaP45jUCmswBJAMs=;
        b=TahyulbMNMNXW5PNQ3eIgcASdYcSNYnqFBDXxjVHR5DO2GgSk6FoABoN4sd4678Ec7
         yXxNWTjHFe4RlQGDfKlptSSNAAy9lNeFYp0iWFL4ITVKxTvgU6Y/ZS5va7BdEuS51IfA
         JMqQythMWDIBPXV8AkibQ5/4h+rwaLJ6vF97oewUWkiQnji46rjPvzMjTr3cyVsW+7fD
         JlG0aEq9i4q6gyEz2CocDU47xy7KuR8U2pDw3WG+b9DlPPwBSt0PlWhBv412afv95qJ7
         kquUOPRlpLgg16b3a25eKsXRBB5A6dfMi0NDU52OaOxuiiPF+g8Dpyb0T+kVf2YPSijs
         /p9Q==
X-Gm-Message-State: AOAM532SEKVbHTGWEg4XClEqKXaQE5SPijqRqyJdTzeK9/MjX6zEGGUN
        s4Ue6mFpP/EiIQ1PIF8dQPyvTSWP7+4PrlGV
X-Google-Smtp-Source: ABdhPJx62Rn98IrGt1ctk+/KNhcCp3F4Ly/r51y6mWTezxo+qkyIeYaL2UY2KbtZOevGvsMer+dffA==
X-Received: by 2002:a17:902:bd42:b029:123:1986:d0c3 with SMTP id b2-20020a170902bd42b02901231986d0c3mr27807326plx.74.1625774925840;
        Thu, 08 Jul 2021 13:08:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z8sm3856732pfc.155.2021.07.08.13.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 13:08:45 -0700 (PDT)
Message-ID: <60e75b4d.1c69fb81.b5f8b.b5a1@mx.google.com>
Date:   Thu, 08 Jul 2021 13:08:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-07-08-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 2 runs,
 1 regressions (renesas-next-2021-07-08-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 2 runs, 1 regressions (renesas-next-2021-07-=
08-v5.13-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-08-v5.13-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-08-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eb9ec119eee98db6f908226234823a0fef906cd6

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  5d97031e8aa717c83993fcdaa45b0812ddceb3b0
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  a63ceb48e6c3e733d04156b32fba3b4f4d5ad794 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/60e755009daac41ed91179f1

  Results:     92 PASS, 3 FAIL, 139 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210628.5/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60e755009daac41ed9117a78
        failing since 44 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-08T19:40:05.405640  <6>[  167.915978] Console: switching to col=
our dummy device 80x30
    2021-07-08T19:40:05.406026  <14>[  167.922604] [IGT] kms_vblank: execut=
ing
    2021-07-08T19:40:05.418630  IGT-Version: 1.26-ga63ceb4 (arm) (Linux: 5.=
13.0-rc3 armv7l)
    2021-07-08T19:40:05.424386  <14>[  167.928454] [IGT] kms_vblank: starti=
ng subtest pipe-A-ts-continuation-suspend
    2021-07-08T19:40:05.424638  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-07-08T19:40:05.481232  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-07-08T19:40:05.517355  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-07-08T19:40:05.517642  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Thu Jul  8 19:40:21 2021
    2021-07-08T19:40:05.541041  <6>[  168.048337] PM: suspend entry (deep)
    2021-07-08T19:40:05.541324  <6>[  168.052797] Filesystems sync: 0.000 s=
econds =

    ... (116 line(s) more)  =

 =20
