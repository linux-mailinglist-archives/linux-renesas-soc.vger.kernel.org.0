Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318403A3809
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 01:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhFJXqo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 19:46:44 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:35574 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhFJXqn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 19:46:43 -0400
Received: by mail-pf1-f182.google.com with SMTP id h12so2932170pfe.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 16:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qLqQkHPPNn0p8ya5MvqgaJ3SYo3aIWm64Zr+YXkwGaI=;
        b=0VtUzN0DnImjci/vRO7NY076lbs6ndCE+/4qNZINsfibLuFk83A2Z0tFg2AXUogyrE
         A7Zh8g00Bj9T9QjJtZqmWIzRqHDidCVqq8x0VZEKU6Rh9g4yGAt7je7MsQoeiVbMRHVn
         FMDUFPPbfQyHSXLuQo0Sr9S5FmEcONUydex8OKJ8FnZxlQLRxt4KY6D+Y0tuppbEYSGw
         fblgmrWvI50FmwWvydeGP0hAcdwQbSTWpUawKTL5KdAa4ifgCbML5leKttovsFzW/bc1
         L0jKV7dzNpN62iytrpbYAR/uglaPqOnBIoRkhSMpaqr317EiudXc0unU8K/6UVvddHnG
         fp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qLqQkHPPNn0p8ya5MvqgaJ3SYo3aIWm64Zr+YXkwGaI=;
        b=G/EaVTBh6mGxBALywjMJq55m+Ib26TQzzTvgkr398BPiLrPlref/5wGIYKsR9+pQd4
         u5kfDXGwLQI+GrTRGjbDF8wmAAFdPF+vjl3lnwOcB/j+kTmDtZqaItOZX1hoP9qaxuEU
         KxnBgjzNOW41qHgMBxlHaDl2s8htV2RB5xMpqn3GMmynmJPF5neTD5LiEKblqf9Ogzxw
         FA05Vy9JuDXY4MzY+xCK5FEuAzJ0sRG4UCGE48mdxpFF0gIXqxlo+l7nzHdBE9E+jilA
         yNATeHI+Umbohkg0ddI1NnYMhUghltzc9hpSnOQBR7u+2CWHRXVUz3dPuQCwKS55HTzw
         JSwg==
X-Gm-Message-State: AOAM532b/P80Q836ZWtH8i7+8DNyc4V2GFx+MaO7TZbzvcRQs0T/z9sj
        j4lye6xqxC74wnkNeuee9yFvsDmp1eV1M7al
X-Google-Smtp-Source: ABdhPJwWBxsmQbEx2kwrCSHADaDBwdgGOeDXQFTt0pdC5fcNfkxJ14oxmMacyZbsYpEe0Earxn9ymw==
X-Received: by 2002:a65:654e:: with SMTP id a14mr789311pgw.332.1623368613738;
        Thu, 10 Jun 2021 16:43:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o7sm3722839pgs.45.2021.06.10.16.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 16:43:33 -0700 (PDT)
Message-ID: <60c2a3a5.1c69fb81.12cbd.c97a@mx.google.com>
Date:   Thu, 10 Jun 2021 16:43:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-06-10-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2021-06-10-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2021-06-=
10-v5.13-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-06-10-v5.13-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-06-10-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      23df6d1f09712871dfba619729a8a165f147c17e

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  4c8365183ec52e9309ecae45c725aa315562854d
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  8eeb9c130e75d4063d0dc2ed69c8acde66b6b5d0 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/60c2905bee302a0d7f0c0e2b

  Results:     92 PASS, 3 FAIL, 139 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchi=
p-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210520.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60c2905bee302a0d7f0c0e9c
        failing since 16 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-06-10 22:19:28.633000+00:00  <14>[  168.925400] [IGT] kms_vblank: =
executing
    2021-06-10 22:19:28.651000+00:00  IGT-Version: 1.26-g8eeb9c1 (arm) (Lin=
ux: 5.13.0-rc3 armv7l)<14>[  168.931255] [IGT] kms_vblank: starting subtest=
 pipe-A-ts-continuation-suspend
    2021-06-10 22:19:28.651000+00:00  =

    2021-06-10 22:19:28.651000+00:00  Starting subtest: pipe-A-ts-continuat=
ion-suspend
    2021-06-10 22:19:28.708000+00:00  Beginning pipe-A-ts-continuation-susp=
end on pipe A, connector eDP-1
    2021-06-10 22:19:28.743000+00:00  [cmd] rtcwake: assuming RTC uses UTC =
...
    2021-06-10 22:19:28.743000+00:00  rtcwake: wakeup from \"mem\" using /d=
ev/rtc0 at Thu Jun 10 22:19:44 2021
    2021-06-10 22:19:28.761000+00:00  <6>[  169.049286] PM: suspend entry (=
deep)
    2021-06-10 22:19:28.761000+00:00  <6>[  169.053673] Filesystems sync: 0=
.000 seconds
    2021-06-10 22:19:28.774000+00:00  <6>[  169.059407] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (115 line(s) more)  =

 =20
