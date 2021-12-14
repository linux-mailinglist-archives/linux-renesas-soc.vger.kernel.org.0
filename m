Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA7A474C77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 21:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhLNUHs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 15:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbhLNUHr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 15:07:47 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A461C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 12:07:47 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id x131so18715545pfc.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 12:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=k+/WIXFKqfXNqT5vsZJHAGCHM18m7Xn8pyza/ikcdkU=;
        b=vliibWBbxCpf42mz/hKF2f/p8qN8EJNI7IbzSOTRZOH1MNbHP9M9RqrBSvsLFjF7hE
         r79NBud+0K3GeVkflgjz+1ZBuip33N1Db222gGQyubuqTpcQOeFv053xRAdLkIQy0LrT
         0auuHmHbB1XyuDkgbptADgGFdke50ZyaLbhSVSewhaTYDzmfrHm1JvA11bEVBFiBZ3ab
         jNW0fI1nZwDLHNRhhTzbZkEq7qQ8mPbCDXA+fKthQd4yAYCM6e4u49L93gdz7QN+q5Iz
         EQ0eM0JPO7Tvu0DTHWyi4rDwFvWNxOKTyWHEOSd72tKwDcxqh8V7PJkgQLZFGp7RNSNq
         IEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=k+/WIXFKqfXNqT5vsZJHAGCHM18m7Xn8pyza/ikcdkU=;
        b=kTa+lJEtmvqod6zFe6FucWcze9XZAUGjNAnvvD5TCVH3PyC23/7txKhZmNMZQXHWoo
         R4vSTn822mniFIVAHXPG5jxEFrfiPiiyhzYuFTI5X/8oCMFtp65hSDd1MOFksZORmyfn
         pO5I0ozg83RphJXmP+CICGM0G3OcSUsZOGJ+KO3Y1toitaiRLO/Fi8kmvlz9eNGvLISZ
         RciFvo1Zyb4GCAtBQnZHRM3ndlYRS2vz/aLcNlvJXK8l9yZ+ZL8Ch94WHmSCNCmFT5xe
         yHAe3zga8UC4avdY7Q6KnJr1Qw/TKEX+EOMbjqtaCzjShyc9eeAaUMlOuND/eILnojTk
         fAbQ==
X-Gm-Message-State: AOAM533APv1AOH8V7z8+4bDLrEWgQ4xKsBHYXeoPnESsGkEXOJ2ItxHS
        U7isrZLJtQ0cqxVci2Ts61hXA2xRfoFhqQyQ
X-Google-Smtp-Source: ABdhPJyfJBUa2KNrhKBnFEQTmcBzOl7Jc9Z2j1avAJFPI7V+Qtyu1fR9OG8SXPF/pwyf37SHyh9SyQ==
X-Received: by 2002:a62:e907:0:b0:4a0:3a71:9712 with SMTP id j7-20020a62e907000000b004a03a719712mr6020589pfh.73.1639512466552;
        Tue, 14 Dec 2021 12:07:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v19sm3132214pju.32.2021.12.14.12.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 12:07:46 -0800 (PST)
Message-ID: <61b8f992.1c69fb81.14df5.8e91@mx.google.com>
Date:   Tue, 14 Dec 2021 12:07:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-14-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 6 runs,
 5 regressions (renesas-devel-2021-12-14-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 6 runs, 5 regressions (renesas-devel-2021-12-14-v5.16=
-rc5)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 5          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-14-v5.16-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-14-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4061f230d33da18a476809abc03f2fa94eda6c56 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 5          =


  Details:     https://kernelci.org/test/plan/id/61b8e9be29164f934239711e

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-14-v5.16-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-14-v5.16-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/61b8e9be29164f93=
42397124
        new failure (last pass: renesas-devel-2021-12-13-v5.16-rc5)

    2021-12-14T18:56:18.763665  rtcwake: assuming RTC uses UTC ...
    2021-12-14T18:56:18.764076  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Dec 14 18:56:25 2021
    2021-12-14T18:56:18.785155  <6>[   94.977714] PM: suspend entry (deep)
    2021-12-14T18:56:18.785664  <6>[   94.982064] Filesystems sync: 0.000 s=
econds
    2021-12-14T18:56:38.829021  <6>[   94.988338] Freezing user space proce=
sses ... =

    2021-12-14T18:56:38.829617  <3>[  114.997739] Freezing of tasks failed =
after 20.004 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-14T18:56:38.830033  <6>[  115.008199] task:systemd-udevd   stat=
e:D stack:    0 pid:  120 ppid:   116 flags:0x00000081
    2021-12-14T18:56:38.830489  <6>[  115.017957] [<c1048fdc>] (__schedule)=
 from [<c10494c4>] (schedule+0x48/0xd0)
    2021-12-14T18:56:38.830849  <6>[  115.026261] [<c10494c4>] (schedule) f=
rom [<c10495a4>] (io_schedule+0x34/0x44)
    2021-12-14T18:56:38.831189  <6>[  115.034642] [<c10495a4>] (io_schedule=
) from [<c043f4b8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61b8e9be29164f93=
42397125
        new failure (last pass: renesas-devel-2021-12-13-v5.16-rc5)

    2021-12-14T18:55:58.567310  rtcwake: assuming RTC uses UTC ...
    2021-12-14T18:55:58.567402  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Dec 14 18:56:04 2021
    2021-12-14T18:55:58.589037  <6>[   74.782365] PM: suspend entry (deep)
    2021-12-14T18:55:58.589273  <6>[   74.786844] Filesystems sync: 0.000 s=
econds
    2021-12-14T18:56:18.638125  <6>[   74.793355] Freezing user space proce=
sses ... =

    2021-12-14T18:56:18.638720  <3>[   94.810432] Freezing of tasks failed =
after 20.011 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-14T18:56:18.639129  <6>[   94.820814] task:systemd-udevd   stat=
e:D stack:    0 pid:  120 ppid:   116 flags:0x00000081
    2021-12-14T18:56:18.639498  <6>[   94.830477] [<c1048fdc>] (__schedule)=
 from [<c10494c4>] (schedule+0x48/0xd0)
    2021-12-14T18:56:18.639851  <6>[   94.838696] [<c10494c4>] (schedule) f=
rom [<c10495a4>] (io_schedule+0x34/0x44)
    2021-12-14T18:56:18.686246  <6>[   94.846996] [<c10495a4>] (io_schedule=
) from [<c043f4b8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/61b8e9be29164f93=
42397126
        new failure (last pass: renesas-devel-2021-12-13-v5.16-rc5)

    2021-12-14T18:55:38.370936  rtcwake: assuming RTC uses UTC ...
    2021-12-14T18:55:38.371336  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Dec 14 18:55:44 2021
    2021-12-14T18:55:38.393424  <6>[   54.587020] PM: suspend entry (deep)
    2021-12-14T18:55:38.393992  <6>[   54.591434] Filesystems sync: 0.000 s=
econds
    2021-12-14T18:55:58.441667  <6>[   54.597444] Freezing user space proce=
sses ... =

    2021-12-14T18:55:58.442035  <3>[   74.614143] Freezing of tasks failed =
after 20.010 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-14T18:55:58.444220  <6>[   74.624507] task:systemd-udevd   stat=
e:D stack:    0 pid:  120 ppid:   116 flags:0x00000081
    2021-12-14T18:55:58.444437  <6>[   74.634191] [<c1048fdc>] (__schedule)=
 from [<c10494c4>] (schedule+0x48/0xd0)
    2021-12-14T18:55:58.444629  <6>[   74.642429] [<c10494c4>] (schedule) f=
rom [<c10495a4>] (io_schedule+0x34/0x44)
    2021-12-14T18:55:58.489932  <6>[   74.650730] [<c10495a4>] (io_schedule=
) from [<c043f4b8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/61b8e9be29164f93=
42397127
        new failure (last pass: renesas-devel-2021-12-13-v5.16-rc5)

    2021-12-14T18:55:18.186351  rtcwake: assuming RTC uses UTC ...
    2021-12-14T18:55:18.186731  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Dec 14 18:55:24 2021
    2021-12-14T18:55:18.207578  <6>[   34.401128] PM: suspend entry (deep)
    2021-12-14T18:55:18.208080  <6>[   34.405553] Filesystems sync: 0.000 s=
econds
    2021-12-14T18:55:38.251369  <6>[   34.411380] Freezing user space proce=
sses ... =

    2021-12-14T18:55:38.251983  <3>[   54.419675] Freezing of tasks failed =
after 20.002 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-14T18:55:38.252413  <6>[   54.430237] task:systemd-udevd   stat=
e:D stack:    0 pid:  120 ppid:   116 flags:0x00000081
    2021-12-14T18:55:38.252771  <6>[   54.439969] [<c1048fdc>] (__schedule)=
 from [<c10494c4>] (schedule+0x48/0xd0)
    2021-12-14T18:55:38.253112  <6>[   54.448153] [<c10494c4>] (schedule) f=
rom [<c10495a4>] (io_schedule+0x34/0x44)
    2021-12-14T18:55:38.253444  <6>[   54.456429] [<c10495a4>] (io_schedule=
) from [<c043f4b8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/61b8e9be29164f93=
42397128
        new failure (last pass: renesas-devel-2021-12-13-v5.16-rc5)

    2021-12-14T18:54:57.986998  rtcwake: assuming RTC uses UTC ...
    2021-12-14T18:54:57.987368  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Dec 14 18:55:04 2021
    2021-12-14T18:54:57.987707  <6>[   14.191337] PM: suspend entry (deep)
    2021-12-14T18:54:57.998242  <6>[   14.196060] Filesystems sync: 0.000 s=
econds
    2021-12-14T18:55:18.057905  <6>[   14.205303] Freezing user space proce=
sses ... =

    2021-12-14T18:55:18.058561  <3>[   34.224928] Freezing of tasks failed =
after 20.014 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-14T18:55:18.058957  <6>[   34.235364] task:systemd-udevd   stat=
e:D stack:    0 pid:  120 ppid:   116 flags:0x00000081
    2021-12-14T18:55:18.059312  <6>[   34.245125] [<c1048fdc>] (__schedule)=
 from [<c10494c4>] (schedule+0x48/0xd0)
    2021-12-14T18:55:18.059653  <6>[   34.253422] [<c10494c4>] (schedule) f=
rom [<c10495a4>] (io_schedule+0x34/0x44)
    2021-12-14T18:55:18.059987  <6>[   34.261805] [<c10495a4>] (io_schedule=
) from [<c043f4b8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =

 =20
