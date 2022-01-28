Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3B649FC86
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jan 2022 16:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbiA1PNN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 10:13:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbiA1PNM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 10:13:12 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09A0C061714
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 07:13:12 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id z10-20020a17090acb0a00b001b520826011so11189036pjt.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 07:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cWQv60wCXQn3TEPc96QVyczCaKEb5t0H5/ijm6oSJcI=;
        b=KHbU/Y83Jpaj27Ls3m14yshPoUsSlLkXcDpsRraitXBM3lkIEUKrUUea1OWNadfxgN
         97oDn5nE5aK16P5XPigvr2NpuPy4u15X6w/2bbEp/JYy18ElS++HEdQhWBns4s+AqDcG
         iPYuttVehxHok6D0DFR7dOKql6YZTNmNUaYf2qsu6x/njRb7QzR8Sb8PmAU9wixge1Pr
         dzE6MvYcWAcQwHNPVF3kpQC4UHnLD0vDRGhtm7+sVfX8xwjfoGbls7RQRa9aNTZBxtNf
         MwbVe15SviJPxYXhsaYJgBb5dZtVVTQnF5AOtPCepF4nfH6RKDjZEWw0rREeHfiwJnEZ
         DkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cWQv60wCXQn3TEPc96QVyczCaKEb5t0H5/ijm6oSJcI=;
        b=xLdq1DOZJp/xT4gRACCkzn6I0PC85/UqQ2GxH5rRLpzcbDwit99SHjqHlKtWVCIYlM
         QHPKYTY60YYqJ2DgCjz2IaWoqWQoDpUtbeWc0rIU4sGir/V0phE4qzy64H6wIrVeHyZo
         c9cemob+OeaO7YhAhaha7WFQL6d4JzcF8jFTZdJKr7acoU4cLlKlTBJKheu7abpQt5oH
         0c4FIqAnGffWQZ97bamNe/YUAC98r6Oon3Sj1nWFKx53OzdvSpSDBnRFqhPvnbLfxyyl
         4AUlmCrou6+CEZtGSsTPhh0ovbrbcv2ZL8EdySs/kBPxAcN0tu6wsqChtUR+9wT4eTAw
         Kkkg==
X-Gm-Message-State: AOAM5328xUjezRp2CaOBPE83pVKiltpgRwW71qLtqqwRpywYWbffz/hS
        ox8JyiE76JjzD1T8ckQPgcMG9gRdzGwdE1oU
X-Google-Smtp-Source: ABdhPJysDAq1G2YrWM6Obrch6/lT9NdY369DqW4Uc0N/HXivUgtmkHoDThb0DXlC+gdBePQf3z/Nwg==
X-Received: by 2002:a17:902:c409:: with SMTP id k9mr9332389plk.66.1643382792078;
        Fri, 28 Jan 2022 07:13:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x7sm22145733pgr.87.2022.01.28.07.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 07:13:11 -0800 (PST)
Message-ID: <61f40807.1c69fb81.50ff1.d099@mx.google.com>
Date:   Fri, 28 Jan 2022 07:13:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-01-28-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next sleep: 7 runs,
 5 regressions (renesas-next-2022-01-28-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 7 runs, 5 regressions (renesas-next-2022-01-28-v5.17-rc=
1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 5          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-01-28-v5.17-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-01-28-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7fb968536682d96db805b040a0d8376c36c718a5 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 5          =


  Details:     https://kernelci.org/test/plan/id/61f3fb8a8eaf66d5a6abbd99

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-01-28-v5.17-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/61f3fb8b8eaf66d5=
a6abbd9f
        new failure (last pass: renesas-next-2022-01-25-v5.17-rc1)

    2022-01-28T14:16:02.308195  rtcwake: assuming RTC uses UTC ...
    2022-01-28T14:16:02.308272  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Jan 28 14:16:09 2022
    2022-01-28T14:16:02.329378  <6>[   95.987835] PM: suspend entry (deep)
    2022-01-28T14:16:02.329514  <6>[   95.992219] Filesystems sync: 0.000 s=
econds
    2022-01-28T14:16:22.376197  <6>[   95.997746] Freezing user space proce=
sses ... =

    2022-01-28T14:16:22.376470  <3>[  116.013473] Freezing of tasks failed =
after 20.010 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-28T14:16:22.376613  <6>[  116.024023] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   117 flags:0x00000081
    2022-01-28T14:16:22.376744  <6>[  116.033892]  __schedule from schedule=
+0x48/0xd0
    2022-01-28T14:16:22.376867  <6>[  116.039381]  schedule from io_schedul=
e+0x34/0x44
    2022-01-28T14:16:22.376987  <6>[  116.045015]  io_schedule from folio_w=
ait_bit_common+0x1cc/0x32c =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61f3fb8b8eaf66d5=
a6abbda0
        new failure (last pass: renesas-next-2022-01-25-v5.17-rc1)

    2022-01-28T14:15:42.143248  rtcwake: assuming RTC uses UTC ...
    2022-01-28T14:15:42.143589  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Jan 28 14:15:48 2022
    2022-01-28T14:15:42.161502  <6>[   75.820344] PM: suspend entry (deep)
    2022-01-28T14:15:42.162021  <6>[   75.824761] Filesystems sync: 0.000 s=
econds
    2022-01-28T14:16:02.205452  <6>[   75.830451] Freezing user space proce=
sses ... =

    2022-01-28T14:16:02.205686  <3>[   95.841875] Freezing of tasks failed =
after 20.006 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-28T14:16:02.205785  <6>[   95.852342] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   117 flags:0x00000081
    2022-01-28T14:16:02.205875  <6>[   95.862103]  __schedule from schedule=
+0x48/0xd0
    2022-01-28T14:16:02.205960  <6>[   95.867579]  schedule from io_schedul=
e+0x34/0x44
    2022-01-28T14:16:02.206042  <6>[   95.873095]  io_schedule from folio_w=
ait_bit_common+0x1cc/0x32c =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/61f3fb8b8eaf66d5=
a6abbda1
        new failure (last pass: renesas-next-2022-01-25-v5.17-rc1)

    2022-01-28T14:15:21.971648  rtcwake: assuming RTC uses UTC ...
    2022-01-28T14:15:21.971993  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Jan 28 14:15:28 2022
    2022-01-28T14:15:21.990157  <6>[   55.648356] PM: suspend entry (deep)
    2022-01-28T14:15:21.990680  <6>[   55.652833] Filesystems sync: 0.000 s=
econds
    2022-01-28T14:15:42.039114  <6>[   55.659246] Freezing user space proce=
sses ... =

    2022-01-28T14:15:42.039861  <3>[   75.675138] Freezing of tasks failed =
after 20.010 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-28T14:15:42.040283  <6>[   75.685571] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   117 flags:0x00000081
    2022-01-28T14:15:42.040753  <6>[   75.695320]  __schedule from schedule=
+0x48/0xd0
    2022-01-28T14:15:42.041125  <6>[   75.700783]  schedule from io_schedul=
e+0x34/0x44
    2022-01-28T14:15:42.041466  <6>[   75.706396]  io_schedule from folio_w=
ait_bit_common+0x1cc/0x32c =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/61f3fb8b8eaf66d5=
a6abbda2
        new failure (last pass: renesas-next-2022-01-25-v5.17-rc1)

    2022-01-28T14:15:01.798177  rtcwake: assuming RTC uses UTC ...
    2022-01-28T14:15:01.798302  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Jan 28 14:15:08 2022
    2022-01-28T14:15:01.820077  <6>[   35.477994] PM: suspend entry (deep)
    2022-01-28T14:15:01.820430  <6>[   35.482410] Filesystems sync: 0.000 s=
econds
    2022-01-28T14:15:21.865399  <6>[   35.488356] Freezing user space proce=
sses ... =

    2022-01-28T14:15:21.865804  <3>[   55.502151] Freezing of tasks failed =
after 20.008 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-28T14:15:21.866046  <6>[   55.512570] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   117 flags:0x00000081
    2022-01-28T14:15:21.866385  <6>[   55.522231]  __schedule from schedule=
+0x48/0xd0
    2022-01-28T14:15:21.866612  <6>[   55.527621]  schedule from io_schedul=
e+0x34/0x44
    2022-01-28T14:15:21.866822  <6>[   55.533089]  io_schedule from folio_w=
ait_bit_common+0x1cc/0x32c =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/61f3fb8b8eaf66d5=
a6abbda3
        new failure (last pass: renesas-next-2022-01-25-v5.17-rc1)

    2022-01-28T14:14:41.644617  rtcwake: assuming RTC uses UTC ...
    2022-01-28T14:14:41.644790  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Jan 28 14:14:48 2022
    2022-01-28T14:14:41.644964  <6>[   15.301215] PM: suspend entry (deep)
    2022-01-28T14:14:41.645136  <6>[   15.306034] Filesystems sync: 0.000 s=
econds
    2022-01-28T14:15:01.692855  <6>[   15.316399] Freezing user space proce=
sses ... =

    2022-01-28T14:15:01.693307  <3>[   35.328688] Freezing of tasks failed =
after 20.006 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-01-28T14:15:01.693576  <6>[   35.339136] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   117 flags:0x00000081
    2022-01-28T14:15:01.693821  <6>[   35.348899]  __schedule from schedule=
+0x48/0xd0
    2022-01-28T14:15:01.694047  <6>[   35.354362]  schedule from io_schedul=
e+0x34/0x44
    2022-01-28T14:15:01.694403  <6>[   35.359879]  io_schedule from folio_w=
ait_bit_common+0x1cc/0x32c =

    ... (14 line(s) more)  =

 =20
