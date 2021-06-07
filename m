Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFE139DE55
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 16:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhFGOHz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 10:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhFGOHz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 10:07:55 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D105C061766
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 07:05:48 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id h12so10320279pfe.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bw1/zojokGe8SVAV4XN//ljBXzh58ohcIcRx2MFeWlI=;
        b=w+iGOiUbAr0e/hgiPG3oEi2cGTminH7l7vAqCyVpTnujWHm60tGjO+VoMw/1FZml4A
         dmWBeGNnfWaicYfcruv3hjIbWh1h8pAXrf/C9Jh9LSdhEdPEVb8MbGxHy8vRucUeoWTg
         +grCoBGdLPZ6/YaG4XeQotI8qpWI/5ZiXeTYW3kNYYp7kFVcEUMhhp2u7p2FrLTEZBGf
         wcoZc9/FfXGPp02oiYyGMS8d8L351tWHcTt8SqDFAzsGfQwd+TYqK/YX7X0wiZwyyzTX
         89krUiNa3TQeNpSgC1sCJoms/xY+elfZl2sRvTAsRKogfKk4fGlhnzZ85aZ0IQnZjkK3
         ykVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bw1/zojokGe8SVAV4XN//ljBXzh58ohcIcRx2MFeWlI=;
        b=ioqm1yK+ube9HFxw1skPOr528DQB8SJnMgij3s5b8HE066ydOsLE01TuyhtjIiQMOD
         bRZPwpfRLP04F2Wtr7aexntkUsTWDqkXa0V8LNk0xgx9sN5vSA1N19RdQAcdUSWidui4
         88VpqDW4vLan7m2SJJ/zasGK1LY8OjJ468dtneBbm2/zfBjFTdO7QqgOHb8etu9/ZIiw
         3PXNNcWcc1TWE80KLgLaGwIjMkLtzhnAloxJO6T+NPblBBQyI2b1GO2ApG9LTDgS3l3p
         XM/fsNYIu5y/DcUkJdtyRmCXhOjnXIRTS+JqO3IBZ+N6yN69tLytuVHyNWgVyirz8P7o
         dFyg==
X-Gm-Message-State: AOAM533D4xGBpwMiOFhCkDmLRDkv14GtAFQ/M728zUZPOUGimusDC7e5
        C4N/rJfTw3vppxBj99OYawmTWjIClUP4uk0g
X-Google-Smtp-Source: ABdhPJzLHJcBbcpHTUpYxqMLkV6TLY6d2KdyGtSOx4syPyQQP0fJtYz4STXvcFQUY0LmosNSsADx7Q==
X-Received: by 2002:a63:58e:: with SMTP id 136mr13478175pgf.206.1623074747865;
        Mon, 07 Jun 2021 07:05:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i2sm12225679pjj.25.2021.06.07.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 07:05:47 -0700 (PDT)
Message-ID: <60be27bb.1c69fb81.48c72.55a3@mx.google.com>
Date:   Mon, 07 Jun 2021 07:05:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-06-07-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next sleep: 10 runs,
 2 regressions (renesas-next-2021-06-07-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 10 runs, 2 regressions (renesas-next-2021-06-07-v5.13-r=
c1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-06-07-v5.13-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-06-07-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e1833059a1c5dac43b9e7352890ec727247341e0 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/60be209f5cc221f9230c0e00

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60be209f5cc221f9=
230c0e05
        failing since 12 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-06-07 13:32:43.014000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Mon Jun  7 13:32:49 2021
    2021-06-07 13:32:43.024000+00:00  <6>[   82.562105] PM: suspend entry (=
deep)
    2021-06-07 13:32:43.046000+00:00  <6>[   82.583955] Filesystems sync: 0=
.000 seconds
    2021-06-07 13:32:43.060000+00:00  <6>[   82.592393] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-06-07 13:32:43.066000+00:00  <6>[   82.604790] OOM killer disabled.
    2021-06-07 13:32:43.268000+00:00  <6>[   82.611759] Freezing remaining =
freezable tasks ... =

    2021-06-07 13:32:43.292000+00:00  <6>[   82.804194] usb 2-1: new high-s=
peed USB device number 4 using dwc2
    2021-06-07 13:32:48.608000+00:00  <3>[   88.144242] usb 2-1: device des=
criptor read/64, error -110
    2021-06-07 13:33:03.075000+00:00  <4>[  102.615870] =

    2021-06-07 13:33:03.102000+00:00  <3>[  102.634343] Freezing of tasks f=
ailed after 20.004 seconds (0 tasks refusing to freeze, wq_busy=3D1): =

    ... (23 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60be209f5cc221f9=
230c0e06
        failing since 12 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-06-07 13:33:03.587000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Mon Jun  7 13:33:10 2021
    2021-06-07 13:33:03.597000+00:00  <6>[  103.135727] PM: suspend entry (=
deep)
    2021-06-07 13:33:03.607000+00:00  <6>[  103.144479] Filesystems sync: 0=
.000 seconds
    2021-06-07 13:33:03.621000+00:00  <6>[  103.154287] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-06-07 13:33:03.629000+00:00  <6>[  103.168005] OOM killer disabled.
    2021-06-07 13:33:04.047000+00:00  <6>[  103.176221] Freezing remaining =
freezable tasks ... =

    2021-06-07 13:33:04.066000+00:00  <3>[  103.584204] usb 2-1: device des=
criptor read/64, error -110
    2021-06-07 13:33:04.409000+00:00  <6>[  103.944178] usb 2-1: new high-s=
peed USB device number 5 using dwc2
    2021-06-07 13:33:09.648000+00:00  <3>[  109.184224] usb 2-1: device des=
criptor read/64, error -110
    2021-06-07 13:33:23.647000+00:00  <4>[  123.189337]  =

    ... (21 line(s) more)  =

 =20
