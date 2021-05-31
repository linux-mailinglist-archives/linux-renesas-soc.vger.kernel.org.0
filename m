Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56D1396365
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 May 2021 17:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhEaPPb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 May 2021 11:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234344AbhEaPNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 May 2021 11:13:07 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A40C0045B6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:10:04 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id g24so6673301pji.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=N12SDTINOZ5OzEnMt6NHd+dB8yIstaWw6fUNTR79Kv8=;
        b=twQyuQ+uGkIFabDy/miDFMu9fhJxqESLT8ZdwLyTnl33WGlJqJAN+cfK7lmwRbnbAA
         ZlS7zp3jA7tdr4guKIvj1jdO0cleB5UTTWmJ7kK+9cGPb3iGBYpNWDht324i1r2epn4O
         PJ2cyIyvi95spCFrNPxatN5I5lJERhl8Io6p9NWV9NL1F0OFpudqTSyJkv4LBX6qvaY5
         acm8ZRuZ/itpXwDA7JUSXZ679R8G58hFIUqNyGiI50JpfMR37VLemgD/oCWPLFO52VhW
         3DqR6EFZQvcVLW5zGV7PLpOadfT63NI45GhF3ooRIXIWxjhUbMR7ia/9e5sVkSnFwXjA
         khfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=N12SDTINOZ5OzEnMt6NHd+dB8yIstaWw6fUNTR79Kv8=;
        b=jZ+zs/gxgOP0IEaam4x965xfOFeN/LM4/zlkRsaiLpjpIGb6udDIqdQ8dD0+s5tftu
         znjlHvYvOfIDvdWi2WMPlnjNrOzwYQhOSQriZLdDt3b9OgVeimU5CdabEbiE7iC1PO7k
         EeYonfhxHw56eBRcndYktXJmTZqziygcw1NBVPgH79CCSOdTLVt/XY66sjZwRTv2u/l5
         wqOzcJ9Nog4cKYNpussp1EbRydB00f6tw1R3j1SgOHIbJ0OAcaA7AVAmUj7fDaiZICFg
         4F0TbkReQhrs0Nvp1pnCBxW8Q6xTWs9vjSGNdrhCb3CPz8A9rKNqHG+WMjvegxtSfQsf
         mUWQ==
X-Gm-Message-State: AOAM533vSW+VXq6Y2LEcubnQJ0r/pkfQKmX2iMC7EH/j3Vn6eWEkDQg+
        Q8XzPTP+tR68Cgm/gmFZLRHFuRcBzS22vnm8
X-Google-Smtp-Source: ABdhPJzIaVImzOZ2Qvq8o69V+/FplqxeAaj04WSfg+yZQB5A01JWp34YX7quhgLgv1PwiwpuP82noQ==
X-Received: by 2002:a17:902:c406:b029:ef:7ba2:f308 with SMTP id k6-20020a170902c406b02900ef7ba2f308mr20942342plk.9.1622470203495;
        Mon, 31 May 2021 07:10:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 133sm6207463pfx.186.2021.05.31.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 07:10:03 -0700 (PDT)
Message-ID: <60b4ee3b.1c69fb81.67dd.23ea@mx.google.com>
Date:   Mon, 31 May 2021 07:10:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-31-v5.13-rc1
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next sleep: 5 runs,
 2 regressions (renesas-next-2021-05-31-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 5 runs, 2 regressions (renesas-next-2021-05-31-v5.13-rc=
1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-31-v5.13-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-31-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      acad452912fc6a5cd2171fbe6af0ecbb3aad265c =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/60b4dc1361f25071c9b3afaa

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60b4dc1361f25071=
c9b3afaf
        failing since 5 days (last pass: renesas-next-2021-05-11-v5.13-rc1,=
 first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-05-31 12:50:00.604000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Mon May 31 12:50:07 2021
    2021-05-31 12:50:00.614000+00:00  <6>[   82.659671] PM: suspend entry (=
deep)
    2021-05-31 12:50:00.621000+00:00  <6>[   82.666130] Filesystems sync: 0=
.000 seconds
    2021-05-31 12:50:00.633000+00:00  <6>[   82.673506] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-05-31 12:50:00.639000+00:00  <6>[   82.684859] OOM killer disabled.
    2021-05-31 12:50:00.905000+00:00  <6>[   82.690854] Freezing remaining =
freezable tasks ... =

    2021-05-31 12:50:00.913000+00:00  <3>[   82.948186] dwmmc_rockchip ff0c=
0000.mmc: Busy; trying anyway
    2021-05-31 12:50:01.424000+00:00  <3>[   83.464740] mmc_host mmc1: Time=
out sending command (cmd 0x202000 arg 0x0 status 0x80202000)
    2021-05-31 12:50:01.432000+00:00  <6>[   83.476559] smsc95xx 2-1.1:1.0 =
eth0: Link is Down
    2021-05-31 12:50:01.443000+00:00  <6>[   83.484249] smsc95xx 2-1.1:1.0 =
eth0: hardware isn't capable of remote wakeup =

    ... (26 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60b4dc1361f25071=
c9b3afb0
        failing since 5 days (last pass: renesas-next-2021-05-11-v5.13-rc1,=
 first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-05-31 12:50:21.175000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Mon May 31 12:50:28 2021
    2021-05-31 12:50:21.185000+00:00  <6>[  103.231696] PM: suspend entry (=
deep)
    2021-05-31 12:50:21.220000+00:00  <6>[  103.265807] Filesystems sync: 0=
.000 seconds
    2021-05-31 12:50:21.232000+00:00  <6>[  103.273210] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-05-31 12:50:21.238000+00:00  <6>[  103.284531] OOM killer disabled.
    2021-05-31 12:50:22.448000+00:00  <6>[  103.290463] Freezing remaining =
freezable tasks ... =

    2021-05-31 12:50:22.464000+00:00  <3>[  104.492343] usb 2-1: device des=
criptor read/64, error -110
    2021-05-31 12:50:22.810000+00:00  <6>[  104.852336] usb 2-1: new high-s=
peed USB device number 5 using dwc2
    2021-05-31 12:50:28.128000+00:00  <3>[  110.172413] usb 2-1: device des=
criptor read/64, error -110
    2021-05-31 12:50:41.268000+00:00  <4>[  123.299881]  =

    ... (21 line(s) more)  =

 =20
