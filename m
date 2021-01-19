Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 141B52FBD11
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 18:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729404AbhASQ5p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 11:57:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391077AbhASQ5O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 11:57:14 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7FEC061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 08:56:33 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id cq1so258917pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=c1AJWiewWkhMGlaiFItbDB7/Hhpcb/uSRTeXed0t+80=;
        b=dp1X5gObAtbuzF7Nvn2cvLrHCODbDvdOOllaM3hLIA+OOZp4dWfzl4uJEo4XAEcylV
         a3BYMeDgojp6koE8wdkGNxST6ckqMEhhIP3cwEvWqNypfZMCCSHtX3E45OYABPczAsrG
         FwPLKexF57JgsYxvPxqZZsNE+s5odkWbmQx0ZvFybNK35kvwPf5UwixZOw1aXOEocTvY
         /BzROmPG8dRYNsNcWX+4zP7AG+hj/vAiZ8dFRg2bfkKjECdut15noSz7Gy9vz6qECLZg
         Wut9qGFu2u1G6B7kGGU4Ya4pAYH1CYFXHmkFpCnSKaxSGtXU23weqrOMARC3O+xhEQhB
         sRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=c1AJWiewWkhMGlaiFItbDB7/Hhpcb/uSRTeXed0t+80=;
        b=fMH+gucNB8Hyuygzwb3m1wTLmwoP8gRcRy7lbiIoPCmx6h1gPzA4uS4mt22AQr0VTK
         uyf2IR/CNzUMFs/y6pGPuyADVtQsZbHB8FOebtlB+8mGetRcTRt3ge4Ep44FDZMpkwJj
         B0aOdHatnBVbg3RU2FPaUyfURT5vx5cRRbjR1XY2hXtQjCjcLtGm3/lmHhZBzd/eHQWR
         S2Ry6LnOI1OL3mV7zrUEZWrxHZEkO/PCcomUhrrO5ihJMXxVdY5IOU83QarSrxqYssLM
         v710zTto4wGfEncUDp55sG2QIEao4sqVL1g4fAnDfHSSCFIoOItmRwUOTjDUwoPBNqGG
         whrw==
X-Gm-Message-State: AOAM533X8CqxkUsk3OlSTD9NC6uwbNBtXyHK6UKhBbWp1o6U4/SJGtYv
        jii3EJqZde0a+nmIjkN6lnnBSGuHK5vORg==
X-Google-Smtp-Source: ABdhPJwPu2XmuzwVGp+hRKjQiSk/eDvfOvqg9j7sz3nV5wL59Ybz9aWVG3s2FBGN+Xfev/5BDGtR1w==
X-Received: by 2002:a17:90a:658c:: with SMTP id k12mr625454pjj.31.1611075392476;
        Tue, 19 Jan 2021 08:56:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id fa12sm4021742pjb.13.2021.01.19.08.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 08:56:31 -0800 (PST)
Message-ID: <60070f3f.1c69fb81.670b6.93e3@mx.google.com>
Date:   Tue, 19 Jan 2021 08:56:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-01-14-v5.11-rc1-2-gb72b30fb341d
Subject: renesas/next sleep: 5 runs,
 4 regressions (renesas-next-2021-01-14-v5.11-rc1-2-gb72b30fb341d)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 5 runs, 4 regressions (renesas-next-2021-01-14-v5.11-rc=
1-2-gb72b30fb341d)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
 | regressions
--------------------+-------+---------------+----------+-------------------=
-+------------
rk3288-rock2-square | arm   | lab-collabora | gcc-8    | multi_v7_defconfig=
 | 3          =

rk3399-gru-kevin    | arm64 | lab-collabora | gcc-8    | defconfig         =
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-01-14-v5.11-rc1-2-gb72b30fb341d/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-01-14-v5.11-rc1-2-gb72b30fb341d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b72b30fb341d0acba58431da7519d4643aa85b34 =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
 | regressions
--------------------+-------+---------------+----------+-------------------=
-+------------
rk3288-rock2-square | arm   | lab-collabora | gcc-8    | multi_v7_defconfig=
 | 3          =


  Details:     https://kernelci.org/test/plan/id/6006fcfe11bf4f9043bb5d18

  Results:     2 PASS, 14 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/multi_v7_defconfig/gcc-8/lab-collabora=
/sleep-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm/multi_v7_defconfig/gcc-8/lab-collabora=
/sleep-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0118.2/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/6006fcfe11bf4f90=
43bb5d1b
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1)

    2021-01-19 15:38:34.489000+00:00  rtcwake: read rtc time failed: I<4>[ =
  19.772856] rtc-hym8563 0-0051: no valid clock/calendar values available
    2021-01-19 15:38:34.490000+00:00  nvalid argument
    2021-01-19 15:38:34.490000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-01-19 15:38:34.491000+00:00  rtcwake: rea<4>[   19.791296] rtc-hym=
8563 0-0051: no valid clock/calendar values available
    2021-01-19 15:38:34.491000+00:00  d rtc time failed: Invalid argument   =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/6006fcfe11bf4f90=
43bb5d1c
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1) =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/6006fcfe11bf4f90=
43bb5d1d
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1)

    2021-01-19 15:38:34.492000+00:00  TC ...
    2021-01-19 15:38:34.538000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-01-19 15:38:34.538000+00:00  rtcwake:<4>[   19.831814] rtc-hym8563=
 0-0051: no valid clock/calendar values available
    2021-01-19 15:38:34.539000+00:00   assuming RTC uses UTC ...
    2021-01-19 15:38:34.539000+00:00  rtcwake: read rtc time failed: Invali=
d argument   =

 =



platform            | arch  | lab           | compiler | defconfig         =
 | regressions
--------------------+-------+---------------+----------+-------------------=
-+------------
rk3399-gru-kevin    | arm64 | lab-collabora | gcc-8    | defconfig         =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6006ff9fae30e1a7dabb5d26

  Results:     11 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig/gcc-8/lab-collabora/sleep-=
rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-01-14-v5.11-rc1-2-gb72b30fb341d/arm64/defconfig/gcc-8/lab-collabora/sleep-=
rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0118.2/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/6006ff9fae30e1a7=
dabb5d2d
        new failure (last pass: renesas-next-2021-01-14-v5.11-rc1) =

 =20
