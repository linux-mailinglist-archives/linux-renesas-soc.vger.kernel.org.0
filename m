Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B823E508E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 03:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234842AbhHJBNi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Aug 2021 21:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbhHJBNh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 21:13:37 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD8BC0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Aug 2021 18:13:16 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id j3so18717238plx.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Aug 2021 18:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8/DV4r0+R1psDsL7oq4rQ54/MAeBWnBa483U3Gs52BM=;
        b=aYlN77bz/6C5F8l4RJ3SRGw2WP93HtL1JxN7q8nhZS1BL6sdG03/ez0DPWJV/joKXx
         nbzwkhcDMsFgkkM6fdX0uG6Ev5t279FUXIfUorxrIppaclB8wu6hfGRztkaDMIoMrbVr
         ATjRBofQRe93w22FyNBPPLor4gmtzVIDpdAk3UnYc/t0o/Bj3BZMIsMXTtXCn8q/YFJj
         gDbOzWViaC1iXVOYpWXoDET0bS6W5xtEG6MH8SDdTInZAfccGuxT0Asz6GqD9NTHtQod
         /vtaL3RHRldYirD6YUjrIA+ZhzSG4fs8AmBU1LKjs9Y8tlmtYwoj3TVTQNfoiBfq3xtI
         P0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8/DV4r0+R1psDsL7oq4rQ54/MAeBWnBa483U3Gs52BM=;
        b=Ud/5UeLXAGwZ6OgPoiRYSa3OaSgOwr7wip5WT3S6yIFY8jeBbI+u5rKEqiQhUe0I/Y
         vSCEB3pY+XQJjggQ4GNrPtAXeqQkrD1ivJJpyNopM0erfIV5xbi1LVQtyoDVNtKSq7fZ
         W5NztA0p5DxKoh4QjSznBu+leuOf25Hth1y1V8Ag3zalbV75+Ac2jwgDqs45NGbQIPu1
         bp0lbqbiLqD3fitgA0yTCSoNlc7/CenZ3eQlWMFCHKLTQO7fO2NMZAW0Yftj3EWZRCP9
         K2NbFPnKoQBXp5fXQEFbdddFPOLYSevVsgLlBcRrCnolQjIzd/W0PVm0Tc0WNPBM/gyI
         AoxQ==
X-Gm-Message-State: AOAM531DyAr51MtoO7BZGSPzMWzwYurW6LvJ/bsfUEi0QqAv/lHuUpZb
        uPqHVG5jsxYk6JcHwHAL6Cg+kmJbzA6M95h4
X-Google-Smtp-Source: ABdhPJzkL+9qMpkDwKr3ygnSpR5E4Z4708QdwH7G/3J8OY2v0FdHXK4O8BjiHhw6QlUvAd++pnlg/A==
X-Received: by 2002:a65:5288:: with SMTP id y8mr204745pgp.275.1628557996112;
        Mon, 09 Aug 2021 18:13:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c15sm21447035pfl.181.2021.08.09.18.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 18:13:15 -0700 (PDT)
Message-ID: <6111d2ab.1c69fb81.2de58.fbb1@mx.google.com>
Date:   Mon, 09 Aug 2021 18:13:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: v5.14-rc5-549-g3b20129c119f
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 2 runs,
 2 regressions (v5.14-rc5-549-g3b20129c119f)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 2 runs, 2 regressions (v5.14-rc5-549-g3b20=
129c119f)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =

rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
4-rc5-549-g3b20129c119f/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: v5.14-rc5-549-g3b20129c119f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3b20129c119f50f3534a0e1a5c353bb502ffe2c6

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  4ac7d6bf5dd1d7aae893fafee98a309d357e5bd6
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  6135b9cc319ed965e3aafb5b2ae2abf4762a06b2 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-8    | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6111c3fda6bdf3a1dfb136d7

  Results:     92 PASS, 3 FAIL, 140 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210730.2/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/6111c3fda6bdf3a1dfb1375f
        failing since 91 days (last pass: renesas-devel-2021-04-19-v5.12-rc=
8, first fail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-10T00:08:48.224397  <6>[  157.929209] smsc95xx 2-1.1:1.0 eth0: =
hardware isn't capable of remote wakeup
    2021-08-10T00:08:48.244044  <14>[  157.956842] [IGT] kms_vblank: execut=
ing
    2021-08-10T00:08:48.244350  IGT-Version: 1.26-g6135b9c (arm) (Linux: 5.=
14.0-rc5 armv7l)
    2021-08-10T00:08:48.256976  <14>[  157.963357] [IGT] kms_vblank: starti=
ng subtest pipe-A-ts-continuation-suspend
    2021-08-10T00:08:48.257284  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-08-10T00:08:48.350307  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-08-10T00:08:48.385085  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-08-10T00:08:48.385394  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Tue Aug 10 00:09:04 2021
    2021-08-10T00:08:48.407075  <6>[  158.118556] PM: suspend entry (deep)
    2021-08-10T00:08:48.407379  <6>[  158.122942] Filesystems sync: 0.000 s=
econds =

    ... (94 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig          |=
 regressions
------------------+-------+---------------+----------+--------------------+=
------------
rk3399-gru-kevin  | arm64 | lab-collabora | gcc-8    | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/6111c03dd6335d0d3db1366b

  Results:     80 PASS, 14 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gr=
u-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.14-rc5-549-g=
3b20129c119f/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk3399-gr=
u-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210730.2/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/6111c03ed6335d0d3db136f3
        failing since 27 days (last pass: renesas-devel-2021-06-22-v5.13-rc=
7, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-08-09T23:52:51.105808  <6>[   79.762146] Console: switching to col=
our dummy device 80x25
    2021-08-09T23:52:51.111758  <14>[   79.769626] [IGT] kms_vblank: execut=
ing
    2021-08-09T23:52:51.126135  IGT-Version: 1.26-g6135b9c (aarch64) (Linux=
: 5.14.0-rc5 aarch64)<14>[   79.775834] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-08-09T23:52:51.126882  =

    2021-08-09T23:52:51.132053  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-08-09T23:52:51.208424  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-08-09T23:52:51.237998  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-08-09T23:52:51.245096  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Mon Aug  9 23:47:11 2021
    2021-08-09T23:52:51.258838  <6>[   79.916458] PM: suspend entry (deep)
    2021-08-09T23:52:51.263619  <6>[   79.920839] Filesystems sync: 0.000 s=
econds =

    ... (159 line(s) more)  =

 =20
