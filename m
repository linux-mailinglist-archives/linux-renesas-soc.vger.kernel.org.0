Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5622F49AB12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 05:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S249689AbiAYEMJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 23:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1318722AbiAYDG5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 22:06:57 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FF5C078501
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 15:44:12 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id j16so6900288plx.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 15:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vN8AhQfunA4fDY4LB4ySU/3XYG/wpbIAPSzmppofL20=;
        b=AqEZwOZjF4xT0IIEQDbIVLR2M7n7ASsyKi6sK5pY3WjhSbCVt9SivZAXh4qLkjE6uf
         G3vJOYZLblM15eTYiiXLfRbrAHYUrV2Fj0qAAtXGtpE9jfgMdTqKRmL24qHZ0OSFrHO9
         4CzVVi4JeqYoZ8kOlis05DlYYTezO0Hr9XqeO0Ee8FR/VMGYp5PyP9eVGzNsngoI6yqY
         vIagO6X5BWpFcaZ/EFchM7zBfSjPLzNZ2omS7+rLKx7PMvwV0OYDtqVPUe+ZJ5RLm/nj
         FKvbEO4Qc69Y796e8ZmR5xMPwmINMH5AtFWoYpbKCIsLI+We+XQrDh9GWmMYtx1vNQ/H
         drmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vN8AhQfunA4fDY4LB4ySU/3XYG/wpbIAPSzmppofL20=;
        b=3WzuhiIkzGXCrocYdoCe+h+nheF9hDu4b/7wtHRbDyi4FIYCFMuX930nUE6FXgFTaw
         4kDZiclTCF7xP+nBAOe0Rp9C06nIdE1qpGRm1du+oo3+WEQjCaAG9I3p8S699GShQAmo
         kA6t8zMq59Gcoh6KOoF/FIC63oyGKL/OBf4CY0fVARCf90TZXyKnzF2jQyJ7rokExOXu
         lyXfGjRX1/El48tIcMOt5hy8qTLShIYcq67ZDWKCedM0T4nXdulWL0N4o8BiIEqC10D6
         a7cF+pvIV6ABHyf5nNO8E2WW85x0ZyJm+WI67jEE938ONokXo0kRu6fJ6vXQHmZeLAC5
         7Izg==
X-Gm-Message-State: AOAM5338/7WRqaXyAG5Yj9LT+hqY19Br+wle/qyODEnBgnp3fojqvHIZ
        CLdx8Ug6lgn2AtBmTuI9kXXdutE7FO6WQr76
X-Google-Smtp-Source: ABdhPJxi7znGCPV3IzjDdFem5x4IQzkB7R7srGVHcSBnRj2fzbfcCdNM92t4vb5E51FYVb+XVg/PCg==
X-Received: by 2002:a17:90b:390a:: with SMTP id ob10mr698605pjb.92.1643067851722;
        Mon, 24 Jan 2022 15:44:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q9sm17847276pfk.137.2022.01.24.15.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 15:44:11 -0800 (PST)
Message-ID: <61ef39cb.1c69fb81.85a20.03e2@mx.google.com>
Date:   Mon, 24 Jan 2022 15:44:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-18-g925b6371c834
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next sleep: 5 runs, 4 regressions (v5.17-rc1-18-g925b6371c834)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 5 runs, 4 regressions (v5.17-rc1-18-g925b6371c834)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 4          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.17-=
rc1-18-g925b6371c834/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: v5.17-rc1-18-g925b6371c834
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      925b6371c8340f967fc54b8102fdf6b94e87013b =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 4          =


  Details:     https://kernelci.org/test/plan/id/61ef276a15d3b32588abbd11

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-rock2-sq=
uare.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.17-rc1-18-g925=
b6371c834/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-rock2-sq=
uare.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61ef276a15d3b325=
88abbd18
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-01-24T22:21:33.421485  rtcwake: assuming RTC uses UTC ...
    2022-01-24T22:21:33.421806  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jan 24 22:21:39 2022
    2022-01-24T22:21:33.440205  <6>[   77.135197] PM: suspend entry (deep)
    2022-01-24T22:21:33.440773  <6>[   77.139548] Filesystems sync: 0.000 s=
econds
    2022-01-24T22:21:53.492787  <6>[   77.145552] Freezing user space proce=
sses ... =

    2022-01-24T22:21:53.493398  <3>[   97.166530] Freezing of tasks failed =
after 20.015 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-24T22:21:53.493790  <6>[   97.176949] task:systemd-udevd   stat=
e:D stack:    0 pid:  125 ppid:   116 flags:0x00000081
    2022-01-24T22:21:53.497414  <6>[   97.186665]  __schedule from schedule=
+0x48/0xd0
    2022-01-24T22:21:53.497912  <6>[   97.192087]  schedule from io_schedul=
e+0x34/0x44
    2022-01-24T22:21:53.498413  <6>[   97.197541]  io_schedule from folio_w=
ait_bit_common+0x1cc/0x32c =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/61ef276a15d3b325=
88abbd19
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-01-24T22:21:13.246767  rtcwake: assuming RTC uses UTC ...
    2022-01-24T22:21:13.246847  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jan 24 22:21:19 2022
    2022-01-24T22:21:13.267389  <6>[   56.963740] PM: suspend entry (deep)
    2022-01-24T22:21:13.267545  <6>[   56.968208] Filesystems sync: 0.000 s=
econds
    2022-01-24T22:21:33.316961  <6>[   56.974586] Freezing user space proce=
sses ... =

    2022-01-24T22:21:33.317595  <3>[   76.989471] Freezing of tasks failed =
after 20.009 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-24T22:21:33.318016  <6>[   77.000022] task:systemd-udevd   stat=
e:D stack:    0 pid:  125 ppid:   116 flags:0x00000081
    2022-01-24T22:21:33.321812  <6>[   77.009847]  __schedule from schedule=
+0x48/0xd0
    2022-01-24T22:21:33.322360  <6>[   77.015434]  schedule from io_schedul=
e+0x34/0x44
    2022-01-24T22:21:33.322744  <6>[   77.021060]  io_schedule from folio_w=
ait_bit_common+0x1cc/0x32c =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/61ef276a15d3b325=
88abbd1a
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-01-24T22:20:53.073379  rtcwake: assuming RTC uses UTC ...
    2022-01-24T22:20:53.073694  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jan 24 22:20:59 2022
    2022-01-24T22:20:53.092344  <6>[   36.787427] PM: suspend entry (deep)
    2022-01-24T22:20:53.092839  <6>[   36.791812] Filesystems sync: 0.000 s=
econds
    2022-01-24T22:21:13.141016  <6>[   36.797774] Freezing user space proce=
sses ... =

    2022-01-24T22:21:13.141291  <3>[   56.814800] Freezing of tasks failed =
after 20.011 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-24T22:21:13.141419  <6>[   56.825220] task:systemd-udevd   stat=
e:D stack:    0 pid:  125 ppid:   116 flags:0x00000081
    2022-01-24T22:21:13.141523  <6>[   56.834986]  __schedule from schedule=
+0x48/0xd0
    2022-01-24T22:21:13.141620  <6>[   56.840417]  schedule from io_schedul=
e+0x34/0x44
    2022-01-24T22:21:13.141711  <6>[   56.845965]  io_schedule from folio_w=
ait_bit_common+0x1cc/0x32c =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/61ef276a15d3b325=
88abbd1b
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-01-24T22:20:32.907032  rtcwake: assuming RTC uses UTC ...
    2022-01-24T22:20:32.907132  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jan 24 22:20:39 2022
    2022-01-24T22:20:32.907234  <6>[   16.616452] PM: suspend entry (deep)
    2022-01-24T22:20:32.921054  <6>[   16.621106] Filesystems sync: 0.000 s=
econds
    2022-01-24T22:20:52.969974  <6>[   16.630799] Freezing user space proce=
sses ... =

    2022-01-24T22:20:52.970698  <3>[   36.643005] Freezing of tasks failed =
after 20.006 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-24T22:20:52.971120  <6>[   36.653491] task:systemd-udevd   stat=
e:D stack:    0 pid:  125 ppid:   116 flags:0x00000081
    2022-01-24T22:20:52.971493  <6>[   36.663177]  __schedule from schedule=
+0x48/0xd0
    2022-01-24T22:20:52.971848  <6>[   36.668542]  schedule from io_schedul=
e+0x34/0x44
    2022-01-24T22:20:52.972192  <6>[   36.674000]  io_schedule from folio_w=
ait_bit_common+0x1cc/0x32c =

    ... (14 line(s) more)  =

 =20
