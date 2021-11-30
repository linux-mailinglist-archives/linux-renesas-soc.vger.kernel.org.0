Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A878463252
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 12:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbhK3L2g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 06:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236663AbhK3L2g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 06:28:36 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFABC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 03:25:17 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id m24so14660946pls.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 03:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FoNfHhqPkvE2J+D14hFr8K+ZhrYOQD5Nk9/t7lSpFWM=;
        b=N3aG6N0KjElmHkmSNKnTR6OO0lrJZqfZe4UrLYPXHSxq7ccHsfMvCHEx4nnfUjBQDo
         QkzIRZBPeaD+YzimMFFfR0uQEXn/LHh3lvduQK47RgtGxh4PnMx7SPIYWrIyoAnF7dRQ
         KGLwmt/wvJQgopDmzd8aLZ+ZAsz4WFsKc0eKc332lNn4rEpxXMPNjRXgg94liNO5NG18
         FikVk1UQbXnffETAktZFaZPF8AwHVVIYDKq5FmW0pjtmNGKoI5KavfHyvPO+bY4zekiK
         6xKNwOoEE8ELWvBglsTug27V1qX37vOyGPwGdiKcSn5UF6Ko9R2pZGO5305CvLwSDkgA
         H8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FoNfHhqPkvE2J+D14hFr8K+ZhrYOQD5Nk9/t7lSpFWM=;
        b=bsYwEoaiWrUhwDBBFykhQGbT2ytK/FcrLMkBywLK4kd/Umlsq/+Aghehr6ZOyqtx3R
         GkXnBXK2nBJ8hs0cE4xjrpnZ19sXCOKVdc3PVTmo+VT+2mZqgDqYLkUh6pJ4oynQv2Py
         5EWTWuRSeAuvuWSRkhQ1DnA4K3LG8fY1Fn29Cjx2+ClXbcAskeu0Er41nlMMt2F6ZbBz
         GtZ52HMqKcsgaulbpjhgTS1J8xTtvYzAVqTBsEl+Vkg1bg92B/OwWJGYoyDJWSOJjN0E
         eF68C6aM8GycPXqAp0fm2wfgYfNrHeVfe94geCnuTNsEghOuUurIpn/BzIjLEFiqhX6S
         RUQg==
X-Gm-Message-State: AOAM532j3/x0lgyHUeidRgQW3bkj0nEsk2pZjgp3cLncEPZbvqj9zjvT
        lHR1rER9VoyUJByacndPhJ5eLlPHbiWRa+ht
X-Google-Smtp-Source: ABdhPJypAbQi/0KropMwjjnpHMl0j7+zoLK50kPWtIDISdcuauOqEg3cJQGowyZ2hdZ8rS+g+eAg1A==
X-Received: by 2002:a17:90b:384d:: with SMTP id nl13mr5360133pjb.80.1638271516333;
        Tue, 30 Nov 2021 03:25:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o134sm19333744pfg.1.2021.11.30.03.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 03:25:16 -0800 (PST)
Message-ID: <61a60a1c.1c69fb81.79d48.5426@mx.google.com>
Date:   Tue, 30 Nov 2021 03:25:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-11-30-v5.16-rc1
Subject: renesas/next sleep: 3 runs,
 5 regressions (renesas-next-2021-11-30-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 3 runs, 5 regressions (renesas-next-2021-11-30-v5.16-rc=
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
s-next-2021-11-30-v5.16-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-11-30-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      168c85dfca1716272b5f75f1fd0e4361cf869546 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 5          =


  Details:     https://kernelci.org/test/plan/id/61a5fbff6e378453ee18f6ca

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211126.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/61a5fbff6e378453=
ee18f6d0
        new failure (last pass: renesas-next-2021-11-19-v5.16-rc1)

    2021-11-30T10:21:10.122888  rtcwake: assuming RTC uses UTC ...
    2021-11-30T10:21:10.123262  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov 30 10:21:16 2021
    2021-11-30T10:21:10.144268  <6>[   96.901243] PM: suspend entry (deep)
    2021-11-30T10:21:10.144801  <6>[   96.905721] Filesystems sync: 0.000 s=
econds
    2021-11-30T10:21:30.194322  <6>[   96.913235] Freezing user space proce=
sses ... =

    2021-11-30T10:21:30.194924  <3>[  116.931402] Freezing of tasks failed =
after 20.013 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-30T10:21:30.195313  <6>[  116.941858] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   117 flags:0x00000081
    2021-11-30T10:21:30.195677  <6>[  116.951592] [<c10856f4>] (__schedule)=
 from [<c1085bdc>] (schedule+0x48/0xd0)
    2021-11-30T10:21:30.199330  <6>[  116.959889] [<c1085bdc>] (schedule) f=
rom [<c1085cbc>] (io_schedule+0x34/0x44)
    2021-11-30T10:21:30.242641  <6>[  116.968229] [<c1085cbc>] (io_schedule=
) from [<c043f3d8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61a5fbff6e378453=
ee18f6d1
        new failure (last pass: renesas-next-2021-11-19-v5.16-rc1)

    2021-11-30T10:20:49.928922  rtcwake: assuming RTC uses UTC ...
    2021-11-30T10:20:49.929174  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov 30 10:20:56 2021
    2021-11-30T10:20:49.951784  <6>[   76.710334] PM: suspend entry (deep)
    2021-11-30T10:20:49.952314  <6>[   76.714757] Filesystems sync: 0.000 s=
econds
    2021-11-30T10:21:09.995366  <6>[   76.720566] Freezing user space proce=
sses ... =

    2021-11-30T10:21:09.996066  <3>[   96.731773] Freezing of tasks failed =
after 20.006 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-30T10:21:09.996477  <6>[   96.742144] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   117 flags:0x00000081
    2021-11-30T10:21:09.996890  <6>[   96.751821] [<c10856f4>] (__schedule)=
 from [<c1085bdc>] (schedule+0x48/0xd0)
    2021-11-30T10:21:09.997243  <6>[   96.760056] [<c1085bdc>] (schedule) f=
rom [<c1085cbc>] (io_schedule+0x34/0x44)
    2021-11-30T10:21:10.043971  <6>[   96.768357] [<c1085cbc>] (io_schedule=
) from [<c043f3d8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/61a5fbff6e378453=
ee18f6d2
        new failure (last pass: renesas-next-2021-11-19-v5.16-rc1)

    2021-11-30T10:20:29.744346  rtcwake: assuming RTC uses UTC ...
    2021-11-30T10:20:29.744773  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov 30 10:20:36 2021
    2021-11-30T10:20:29.765640  <6>[   56.521518] PM: suspend entry (deep)
    2021-11-30T10:20:29.766150  <6>[   56.525986] Filesystems sync: 0.000 s=
econds
    2021-11-30T10:20:49.809818  <6>[   56.531886] Freezing user space proce=
sses ... =

    2021-11-30T10:20:49.810453  <3>[   76.543235] Freezing of tasks failed =
after 20.008 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-30T10:20:49.810848  <6>[   76.553656] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   117 flags:0x00000081
    2021-11-30T10:20:49.811205  <6>[   76.563345] [<c10856f4>] (__schedule)=
 from [<c1085bdc>] (schedule+0x48/0xd0)
    2021-11-30T10:20:49.811548  <6>[   76.571538] [<c1085bdc>] (schedule) f=
rom [<c1085cbc>] (io_schedule+0x34/0x44)
    2021-11-30T10:20:49.811986  <6>[   76.579812] [<c1085cbc>] (io_schedule=
) from [<c043f3d8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/61a5fbff6e378453=
ee18f6d3
        new failure (last pass: renesas-next-2021-11-19-v5.16-rc1)

    2021-11-30T10:20:09.536702  rtcwake: assuming RTC uses UTC ...
    2021-11-30T10:20:09.537052  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov 30 10:20:16 2021
    2021-11-30T10:20:09.560116  <6>[   36.314179] PM: suspend entry (deep)
    2021-11-30T10:20:09.560764  <6>[   36.318537] Filesystems sync: 0.000 s=
econds
    2021-11-30T10:20:29.616956  <6>[   36.324177] Freezing user space proce=
sses ... =

    2021-11-30T10:20:29.617564  <3>[   56.352375] Freezing of tasks failed =
after 20.006 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-30T10:20:29.617954  <6>[   56.362848] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   117 flags:0x00000081
    2021-11-30T10:20:29.618313  <6>[   56.372594] [<c10856f4>] (__schedule)=
 from [<c1085bdc>] (schedule+0x48/0xd0)
    2021-11-30T10:20:29.618656  <6>[   56.380895] [<c1085bdc>] (schedule) f=
rom [<c1085cbc>] (io_schedule+0x34/0x44)
    2021-11-30T10:20:29.668198  <6>[   56.389273] [<c1085cbc>] (io_schedule=
) from [<c043f3d8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/61a5fbff6e378453=
ee18f6d6
        new failure (last pass: renesas-next-2021-11-19-v5.16-rc1)

    2021-11-30T10:19:49.083536  rtcwake: assuming RTC uses UTC ...
    2021-11-30T10:19:49.083941  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov 30 10:19:55 2021
    2021-11-30T10:19:49.084284  <6>[   15.852804] PM: suspend entry (deep)
    2021-11-30T10:19:49.094904  <6>[   15.857534] Filesystems sync: 0.000 s=
econds
    2021-11-30T10:20:09.399124  <6>[   15.869426] Freezing user space proce=
sses ... =

    2021-11-30T10:20:09.399725  <3>[   36.134558] Freezing of tasks failed =
after 20.008 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-30T10:20:09.400209  <6>[   36.145169] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   117 flags:0x00000081
    2021-11-30T10:20:09.400581  <6>[   36.155002] [<c10856f4>] (__schedule)=
 from [<c1085bdc>] (schedule+0x48/0xd0)
    2021-11-30T10:20:09.400978  <6>[   36.163399] [<c1085bdc>] (schedule) f=
rom [<c1085cbc>] (io_schedule+0x34/0x44)
    2021-11-30T10:20:09.447920  <6>[   36.171860] [<c1085cbc>] (io_schedule=
) from [<c043f3d8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =

 =20
