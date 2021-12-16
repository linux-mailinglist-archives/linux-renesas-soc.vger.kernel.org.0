Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE750477A58
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 18:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235646AbhLPRRJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 12:17:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbhLPRRI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 12:17:08 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CB1C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 09:17:08 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id a11-20020a17090a854b00b001b11aae38d6so3872421pjw.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 09:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cdg5Ljk2EpBHDszhC5V/t+q0bXgcAkc+sRjGelKvTH0=;
        b=WsaU1N+vB9pSe7um0LxetuyV9EfIYooma93772+Szz/9ww9GFmPqdJDBCfVauvPgyD
         ubeDRRJ+Cn15RJ7ktQOqsFhgK5oakz0W4Q7hbe7TICXmGBvySG3O3jCqHz5B3HlEIyyy
         7YCr1nXmM73Wvy+fAO36/7YCTY0d3ysf/i6Og2Si0BPhp6GgMCAUZZd9WdoaaBoEyvdi
         GAeuPuSVYDhyl47iiMc1eWL4s+H7ieA//4imBYUn3r7ArPBiAeFle4tRUHGR5qGhQ3JJ
         yonMP/mNAN3b9gOlztPFiBd5tXp7MdG7o+rwhEDhbDHf8VIvONYIDpmw0Ib15kBPtjFh
         xzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cdg5Ljk2EpBHDszhC5V/t+q0bXgcAkc+sRjGelKvTH0=;
        b=oay6uy7CsjHEinVjEyw9OXRDVwOr0kUAwfLQmzUESDD+a0qHBcu9E2QWKFvvHrSbPx
         GBVJnSrQsW9Z9pzbbIT+UNMwqKdNadu+wORnvfkFuGZse24BCI8T4lExq4ZWlP7G/4dN
         dGAQiupV8t90UsR708pJHAZaadvqceiY97N+mORBXzAqWBQAOd0vwxeg8MmRZ/tcxvvo
         DjQiVFQ5SVyNMjpcDPfuNuhk6ioRObE/KF07+sshQFCWNTnstV3Ttv+gewK8oFn0OSiH
         PLQOtBzVXpywFEllt/Xin4kYukNuhINClyHHbiRQwMTa9ttoS5/uCKL7aypDob0m4CoW
         ZPwQ==
X-Gm-Message-State: AOAM530Wluk7Kp+Qd6cbru7k7AEPZWhNCOCFKBTEyJCn+e2X1s1HNk1R
        pVCyis1nEtAvGSivLoi0ozBLqfZ7XObXbvbv
X-Google-Smtp-Source: ABdhPJzDvAJ9yDcIQoOsJ1Hnpv5wcRltypbjBwdEvx3QXSKuiU3nuvQQXyP6C3gwpz6fjbBfiUnAGA==
X-Received: by 2002:a17:902:b615:b0:143:bbf0:aad0 with SMTP id b21-20020a170902b61500b00143bbf0aad0mr17273889pls.12.1639675027946;
        Thu, 16 Dec 2021 09:17:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h128sm6360267pfg.212.2021.12.16.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 09:17:07 -0800 (PST)
Message-ID: <61bb7493.1c69fb81.4307a.14fd@mx.google.com>
Date:   Thu, 16 Dec 2021 09:17:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-12-16-v5.16-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next sleep: 3 runs,
 2 regressions (renesas-next-2021-12-16-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 3 runs, 2 regressions (renesas-next-2021-12-16-v5.16-rc=
1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-12-16-v5.16-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-12-16-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a155038f641134b0272d26f75d1ab4a805013e48 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 2          =


  Details:     https://kernelci.org/test/plan/id/61bb6977154f56f0fd397126

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61bb6977154f56f0=
fd39712d
        failing since 16 days (last pass: renesas-next-2021-11-19-v5.16-rc1=
, first fail: renesas-next-2021-11-30-v5.16-rc1)

    2021-12-16T16:25:40.564057  rtcwake: assuming RTC uses UTC ...
    2021-12-16T16:25:40.564435  rtcwake: wakeup from \"mem\" using rtc0 at =
Thu Dec 16 16:25:47 2021
    2021-12-16T16:25:40.586327  <6>[   76.469190] PM: suspend entry (deep)
    2021-12-16T16:25:40.586819  <6>[   76.473605] Filesystems sync: 0.000 s=
econds
    2021-12-16T16:26:00.628814  <6>[   76.479439] Freezing user space proce=
sses ... =

    2021-12-16T16:26:00.629099  <3>[   96.489683] Freezing of tasks failed =
after 20.006 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-16T16:26:00.629280  <6>[   96.500118] task:systemd-udevd   stat=
e:D stack:    0 pid:  129 ppid:   118 flags:0x00000081
    2021-12-16T16:26:00.629435  <6>[   96.509843] [<c10856f4>] (__schedule)=
 from [<c1085bdc>] (schedule+0x48/0xd0)
    2021-12-16T16:26:00.629601  <6>[   96.518103] [<c1085bdc>] (schedule) f=
rom [<c1085cbc>] (io_schedule+0x34/0x44)
    2021-12-16T16:26:00.629738  <6>[   96.526474] [<c1085cbc>] (io_schedule=
) from [<c043f3d8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/61bb6977154f56f0=
fd39712e
        failing since 16 days (last pass: renesas-next-2021-11-19-v5.16-rc1=
, first fail: renesas-next-2021-11-30-v5.16-rc1)

    2021-12-16T16:25:20.378786  rtcwake: assuming RTC uses UTC ...
    2021-12-16T16:25:20.379170  rtcwake: wakeup from \"mem\" using rtc0 at =
Thu Dec 16 16:25:27 2021
    2021-12-16T16:25:20.400187  <6>[   56.284617] PM: suspend entry (deep)
    2021-12-16T16:25:20.400674  <6>[   56.289149] Filesystems sync: 0.000 s=
econds
    2021-12-16T16:25:40.436153  <6>[   56.295831] Freezing user space proce=
sses ... =

    2021-12-16T16:25:40.436778  <3>[   76.298889] Freezing of tasks failed =
after 20.002 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-16T16:25:40.437207  <6>[   76.309509] task:systemd-udevd   stat=
e:D stack:    0 pid:  129 ppid:   118 flags:0x00000081
    2021-12-16T16:25:40.437635  <6>[   76.319339] [<c10856f4>] (__schedule)=
 from [<c1085bdc>] (schedule+0x48/0xd0)
    2021-12-16T16:25:40.438004  <6>[   76.327738] [<c1085bdc>] (schedule) f=
rom [<c1085cbc>] (io_schedule+0x34/0x44)
    2021-12-16T16:25:40.485187  <6>[   76.336192] [<c1085cbc>] (io_schedule=
) from [<c043f3d8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =

 =20
