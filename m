Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFC7478F3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 16:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238068AbhLQPL1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 10:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238066AbhLQPL0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 10:11:26 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F35DC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 07:11:26 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 8so2547556pfo.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 07:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CaAbGp3CrmoDh9bon0Exrfgtc2+FkLEsQP9PuPOMK1Y=;
        b=NAb9Uir7Q5190RgSyCR1aQyF4u+GrxYZWKPTBldJex5YUbWfU+sIUmKubEN+dw61vT
         bMIiI7X7m3KKuiduHhw0WZMYaW2xKJ3vt7IX2ioHxPwxkVelHCd5splzFB5xv8/d7Uk/
         O1DB7GieabBtFz3hbvsqTFurJ2rHlEU6KQ/PEE3t1JrN7h/gGZuvpLKc30FfQBnZQhr/
         yecv9yB5OswfdJHNsLoIpUq5rTU3fw/3BmLMKSpCN1kyLkwJ5L8kxG502dqhiN1Srkfv
         NKiHj/EiI3GvZaALU7vvRJ8tBwBe9XhRIOccaMszsMZvjA4BRd70rFw0bLP3DWrPO1VW
         vt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CaAbGp3CrmoDh9bon0Exrfgtc2+FkLEsQP9PuPOMK1Y=;
        b=eq2mOcf91maJiJwshpMjZXjz9AnsuZUj3S17EuZNs64Q686VmjDqnhE0gDkJ8G/nOk
         5B+yEJ70hdSXeMQNQtLACMB4Da6kOgp3Z9BoMnzjzx1LoKwRjj9+TKXeLX6xhaU0ykov
         IqjQAMgu8RInRi+3ElOT1BK4Z8dlVh3lno6kL5YZV75f+aJuwB184CYjONyKffo7gGDQ
         Qxl406cJo20fJCm1+bfG9AEbEaUwOKPGP2NEQb6WgOqnIKnmjpWZglPaIbDCoAADWLe6
         xd6hBIZMxs407c2sqMHNQCLLpDlFlQuizrz70NT0lMgz6WhehvfJhGHBfbM9hWfr+fht
         O0nQ==
X-Gm-Message-State: AOAM533Px9GbCmv5RbN13QfIKrTtI7MddAh//vansFj95jFi7VMqUZfe
        5Z1BY75t8Ijt+19coTmj3BwZ3ITqoiGxjuHX
X-Google-Smtp-Source: ABdhPJx4rq8c13KpqhRMLWW72tDgHNYRKAOOyPoaPFT7o4+0Upu1W1W7sZo3AWGfsj2D3lC2ldivwg==
X-Received: by 2002:a63:5007:: with SMTP id e7mr3193719pgb.295.1639753885687;
        Fri, 17 Dec 2021 07:11:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s15sm8753087pjs.51.2021.12.17.07.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:11:25 -0800 (PST)
Message-ID: <61bca89d.1c69fb81.dcd07.853e@mx.google.com>
Date:   Fri, 17 Dec 2021 07:11:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-17-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 6 runs,
 5 regressions (renesas-devel-2021-12-17-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 6 runs, 5 regressions (renesas-devel-2021-12-17-v5.16=
-rc5)

Regressions Summary
-------------------

platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
hp-11A-G6-EE-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =

rk3288-rock2-square | arm    | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 4          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-17-v5.16-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-17-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9aa3a08281f795eec94a1d7ee8c48ed7dec31a7c =



Test Regressions
---------------- =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
hp-11A-G6-EE-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc90e57d3a27c53439711f

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-3: https://kernelci.org/test/case/id/61bc90e57d3a2=
7c534397128
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5)

    2021-12-17T13:28:54.088167  rtcwake: assuming RTC uses UTC ...
    2021-12-17T13:28:54.094960  rtcwake: wakeup from \"freeze\" using rtc0 =
at Fri Dec 17 13:29:00 2021
    2021-12-17T13:28:54.098139  <6>[   40.184887] PM: suspend entry (deep)
    2021-12-17T13:28:54.104641  <6>[   40.197479] Filesystems sync: 0.000 s=
econds
    2021-12-17T13:28:54.107898  <6>[   40.202045] PM: suspend entry (s2idle)
    2021-12-17T13:28:54.111008  <6>[   40.202337] Freezing user space proce=
sses ... =

    2021-12-17T13:28:54.114698  <6>[   40.206069] PM: suspend exit
    2021-12-17T13:28:54.121110  <6>[   40.206709] r8152 2-4:1.0 eth0: carri=
er on
    2021-12-17T13:28:54.124280  <4>[   40.210799] (elapsed 0.004 seconds) d=
one.
    2021-12-17T13:28:54.127315  <6>[   40.222541] OOM killer disabled. =

    ... (1151 line(s) more)  =

 =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
rk3288-rock2-square | arm    | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 4          =


  Details:     https://kernelci.org/test/plan/id/61bc9c8064f488398e39712d

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-17-v5.16-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/61bc9c8064f48839=
8e397133
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5)

    2021-12-17T14:15:13.841825  rtcwake: assuming RTC uses UTC ...
    2021-12-17T14:15:13.842536  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Dec 17 14:15:20 2021
    2021-12-17T14:15:13.863333  <6>[   57.023164] PM: suspend entry (deep)
    2021-12-17T14:15:13.863852  <6>[   57.027550] Filesystems sync: 0.000 s=
econds
    2021-12-17T14:15:33.914003  <6>[   57.033444] Freezing user space proce=
sses ... =

    2021-12-17T14:15:33.914313  <3>[   77.054157] Freezing of tasks failed =
after 20.015 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-17T14:15:33.914489  <6>[   77.064711] task:systemd-udevd   stat=
e:D stack:    0 pid:  120 ppid:   116 flags:0x00000081
    2021-12-17T14:15:33.914633  <6>[   77.074530] [<c1048fdc>] (__schedule)=
 from [<c10494c4>] (schedule+0x48/0xd0)
    2021-12-17T14:15:33.914766  <6>[   77.082925] [<c10494c4>] (schedule) f=
rom [<c10495a4>] (io_schedule+0x34/0x44)
    2021-12-17T14:15:33.963069  <6>[   77.091357] [<c10495a4>] (io_schedule=
) from [<c043f4b8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/61bc9c8064f48839=
8e397134
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5)

    2021-12-17T14:14:53.642412  rtcwake: assuming RTC uses UTC ...
    2021-12-17T14:14:53.642804  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Dec 17 14:15:00 2021
    2021-12-17T14:14:53.663989  <6>[   36.823188] PM: suspend entry (deep)
    2021-12-17T14:14:53.664479  <6>[   36.827540] Filesystems sync: 0.000 s=
econds
    2021-12-17T14:15:13.714711  <6>[   36.833088] Freezing user space proce=
sses ... =

    2021-12-17T14:15:13.715357  <3>[   56.853676] Freezing of tasks failed =
after 20.015 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-17T14:15:13.715767  <6>[   56.864108] task:systemd-udevd   stat=
e:D stack:    0 pid:  120 ppid:   116 flags:0x00000081
    2021-12-17T14:15:13.716135  <6>[   56.873860] [<c1048fdc>] (__schedule)=
 from [<c10494c4>] (schedule+0x48/0xd0)
    2021-12-17T14:15:13.716516  <6>[   56.882169] [<c10494c4>] (schedule) f=
rom [<c10495a4>] (io_schedule+0x34/0x44)
    2021-12-17T14:15:13.763106  <6>[   56.890503] [<c10495a4>] (io_schedule=
) from [<c043f4b8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61bc9c8064f48839=
8e397135
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5)

    2021-12-17T14:15:34.041156  rtcwake: assuming RTC uses UTC ...
    2021-12-17T14:15:34.041300  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Dec 17 14:15:40 2021
    2021-12-17T14:15:34.062921  <6>[   77.224358] PM: suspend entry (deep)
    2021-12-17T14:15:34.063088  <6>[   77.228744] Filesystems sync: 0.000 s=
econds
    2021-12-17T14:15:54.114176  <6>[   77.234509] Freezing user space proce=
sses ... =

    2021-12-17T14:15:54.114853  <3>[   97.253743] Freezing of tasks failed =
after 20.013 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-17T14:15:54.115291  <6>[   97.264165] task:systemd-udevd   stat=
e:D stack:    0 pid:  120 ppid:   116 flags:0x00000081
    2021-12-17T14:15:54.115676  <6>[   97.273910] [<c1048fdc>] (__schedule)=
 from [<c10494c4>] (schedule+0x48/0xd0)
    2021-12-17T14:15:54.116043  <6>[   97.282215] [<c10494c4>] (schedule) f=
rom [<c10495a4>] (io_schedule+0x34/0x44)
    2021-12-17T14:15:54.162333  <6>[   97.290557] [<c10495a4>] (io_schedule=
) from [<c043f4b8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/61bc9c8064f48839=
8e397136
        new failure (last pass: renesas-devel-2021-12-16-v5.16-rc5)

    2021-12-17T14:14:33.454871  rtcwake: assuming RTC uses UTC ...
    2021-12-17T14:14:33.455035  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Dec 17 14:14:39 2021
    2021-12-17T14:14:33.455202  <6>[   16.626195] PM: suspend entry (deep)
    2021-12-17T14:14:33.468302  <6>[   16.631792] Filesystems sync: 0.000 s=
econds
    2021-12-17T14:14:53.515335  <6>[   16.638372] Freezing user space proce=
sses ... =

    2021-12-17T14:14:53.515933  <3>[   36.654187] Freezing of tasks failed =
after 20.010 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-12-17T14:14:53.516325  <6>[   36.664616] task:systemd-udevd   stat=
e:D stack:    0 pid:  120 ppid:   116 flags:0x00000081
    2021-12-17T14:14:53.516694  <6>[   36.674361] [<c1048fdc>] (__schedule)=
 from [<c10494c4>] (schedule+0x48/0xd0)
    2021-12-17T14:14:53.517050  <6>[   36.682700] [<c10494c4>] (schedule) f=
rom [<c10495a4>] (io_schedule+0x34/0x44)
    2021-12-17T14:14:53.563941  <6>[   36.691076] [<c10495a4>] (io_schedule=
) from [<c043f4b8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =

 =20
