Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5C946335E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 12:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhK3LyG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 06:54:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbhK3LyD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 06:54:03 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F085CC061748
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 03:50:43 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso18115931pji.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 03:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+v+l7Uv2JBbCn4I04lM8CRAHEivBcO8kgXX75IYbfY8=;
        b=JoLvmwFoBctLMJBekQ57FRWJ4OwWI751wvbOBfGkfn8UsaGh+pQZl6q+NFZrMwJ993
         DEYGc21UdEHsQo8eIE1Yk/b17WxvJAWVeSA165KQxlhYEIejdXK8x/rHq+MxsbBNkSML
         c6Tl16I2jeBvh39k+e46dNwtbmo4O5gA98pWyk9xoLiam24IdWWh3WwdFMDRMKor/4Sb
         c6811AJtLgnV7+xSIij9hWmR33SodKN3SkJvyGxvTY271RLKu5HPMSNr6B7v4P4cRsBP
         2FbPQ8rixNeQOJVAWsgW9xTQ3eMCiGARkeCyxG2/angs3SDSS88vEVjzfcGPMthfHh6m
         ZuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+v+l7Uv2JBbCn4I04lM8CRAHEivBcO8kgXX75IYbfY8=;
        b=zIuNJpJEdnBMFFWGJ4k0H/3PFp7nSXDJJ+cf+rgFZr6RFgSHljiD/xgNLe+bGEUZ/l
         EWDQCYLpSxOn9L3kPcXEICEi3mxw6BJr7c0dLW4UVobTYQEGjVaAM0tVPsleUWTAjE3C
         DzV7ur/5IGnY6SlMiVxIYXZRUXASAhJUv4AFQTfp/OLHiNyQGPIg8UKW1eOx8PFYM+hb
         3MLpliiuum8TEVNrhLEpshSzUWPLFhkxg6M3kIVX+z3kcVwXiBaijXzQxW+6KHBA8EJA
         Q/NkgSXPcZFDKPO62Rc9/KRf8cP/cC64nPkrWOly4rVzsfcuCR6DrxNKxTTIf0jEYz4w
         fhAw==
X-Gm-Message-State: AOAM531IwkTEvekukLeCIP2Ps6ukU2gWDwvQI9obH5AUosfS9MomM8At
        joLl+yZ9WZDcdUy3cuw7HhFoZQxcx7VKKLZp
X-Google-Smtp-Source: ABdhPJxVq4J72gFMxQM8w9X/SxtSuoMAsC6/orZ/1aWq/YzuzEqIh8Ngjoi8kL5d6BZT5TvqYsDGuA==
X-Received: by 2002:a17:902:c7c4:b0:141:deb4:1b2f with SMTP id r4-20020a170902c7c400b00141deb41b2fmr67236972pla.44.1638273043198;
        Tue, 30 Nov 2021 03:50:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id hg4sm2287561pjb.1.2021.11.30.03.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 03:50:42 -0800 (PST)
Message-ID: <61a61012.1c69fb81.1034c.61ee@mx.google.com>
Date:   Tue, 30 Nov 2021 03:50:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-11-30-v5.16-rc3
Subject: renesas/master sleep: 4 runs,
 5 regressions (renesas-devel-2021-11-30-v5.16-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 4 runs, 5 regressions (renesas-devel-2021-11-30-v5.16=
-rc3)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 5          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-30-v5.16-rc3/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-30-v5.16-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4a8e6127a65a43320486091f9448d869aedb1dc8 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 5          =


  Details:     https://kernelci.org/test/plan/id/61a60394a34cf2f04a18f705

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-30-v5.16-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-30-v5.16-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211126.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/61a60394a34cf2f0=
4a18f70b
        new failure (last pass: renesas-devel-2021-11-29-v5.16-rc3)

    2021-11-30T10:53:30.533538  rtcwake: assuming RTC uses UTC ...
    2021-11-30T10:53:30.533638  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov 30 10:53:37 2021
    2021-11-30T10:53:30.556341  <6>[   99.151724] PM: suspend entry (deep)
    2021-11-30T10:53:30.556580  <6>[   99.156141] Filesystems sync: 0.000 s=
econds
    2021-11-30T10:53:50.591617  <6>[   99.161843] Freezing user space proce=
sses ... =

    2021-11-30T10:53:50.592035  <3>[  119.167844] Freezing of tasks failed =
after 20.000 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-30T10:53:50.592270  <6>[  119.178426] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   120 flags:0x00000081
    2021-11-30T10:53:50.592480  <6>[  119.188269] [<c1048094>] (__schedule)=
 from [<c104857c>] (schedule+0x48/0xd0)
    2021-11-30T10:53:50.592678  <6>[  119.196688] [<c104857c>] (schedule) f=
rom [<c104865c>] (io_schedule+0x34/0x44)
    2021-11-30T10:53:50.641090  <6>[  119.205201] [<c104865c>] (io_schedule=
) from [<c043f440>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61a60394a34cf2f0=
4a18f70c
        new failure (last pass: renesas-devel-2021-11-29-v5.16-rc3)

    2021-11-30T10:53:10.337262  rtcwake: assuming RTC uses UTC ...
    2021-11-30T10:53:10.337742  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov 30 10:53:16 2021
    2021-11-30T10:53:10.359202  <6>[   78.955978] PM: suspend entry (deep)
    2021-11-30T10:53:10.359698  <6>[   78.960361] Filesystems sync: 0.000 s=
econds
    2021-11-30T10:53:30.407009  <6>[   78.966384] Freezing user space proce=
sses ... =

    2021-11-30T10:53:30.407464  <3>[   98.983060] Freezing of tasks failed =
after 20.011 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-30T10:53:30.407800  <6>[   98.993499] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   120 flags:0x00000081
    2021-11-30T10:53:30.408140  <6>[   99.003249] [<c1048094>] (__schedule)=
 from [<c104857c>] (schedule+0x48/0xd0)
    2021-11-30T10:53:30.408379  <6>[   99.011508] [<c104857c>] (schedule) f=
rom [<c104865c>] (io_schedule+0x34/0x44)
    2021-11-30T10:53:30.455479  <6>[   99.019885] [<c104865c>] (io_schedule=
) from [<c043f440>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/61a60394a34cf2f0=
4a18f70d
        new failure (last pass: renesas-devel-2021-11-29-v5.16-rc3)

    2021-11-30T10:52:50.149318  rtcwake: assuming RTC uses UTC ...
    2021-11-30T10:52:50.149695  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov 30 10:52:56 2021
    2021-11-30T10:52:50.170688  <6>[   58.766253] PM: suspend entry (deep)
    2021-11-30T10:52:50.171255  <6>[   58.770733] Filesystems sync: 0.000 s=
econds
    2021-11-30T10:53:10.168816  <6>[   58.777209] Freezing user space proce=
sses ... =

    2021-11-30T10:53:10.217438  <3>[   78.787321] Freezing of tasks failed =
after 20.004 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-30T10:53:10.218011  <6>[   78.797765] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   120 flags:0x00000081
    2021-11-30T10:53:10.218396  <6>[   78.807529] [<c1048094>] (__schedule)=
 from [<c104857c>] (schedule+0x48/0xd0)
    2021-11-30T10:53:10.218752  <6>[   78.815833] [<c104857c>] (schedule) f=
rom [<c104865c>] (io_schedule+0x34/0x44)
    2021-11-30T10:53:10.219093  <6>[   78.824212] [<c104865c>] (io_schedule=
) from [<c043f440>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/61a60394a34cf2f0=
4a18f70e
        new failure (last pass: renesas-devel-2021-11-29-v5.16-rc3)

    2021-11-30T10:52:29.947518  rtcwake: assuming RTC uses UTC ...
    2021-11-30T10:52:29.947620  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov 30 10:52:36 2021
    2021-11-30T10:52:29.969028  <6>[   38.565080] PM: suspend entry (deep)
    2021-11-30T10:52:29.969272  <6>[   38.569497] Filesystems sync: 0.000 s=
econds
    2021-11-30T10:52:50.016381  <6>[   38.576395] Freezing user space proce=
sses ... =

    2021-11-30T10:52:50.016677  <3>[   58.592061] Freezing of tasks failed =
after 20.010 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-30T10:52:50.016822  <6>[   58.602515] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   120 flags:0x00000081
    2021-11-30T10:52:50.016954  <6>[   58.612251] [<c1048094>] (__schedule)=
 from [<c104857c>] (schedule+0x48/0xd0)
    2021-11-30T10:52:50.017080  <6>[   58.620510] [<c104857c>] (schedule) f=
rom [<c104865c>] (io_schedule+0x34/0x44)
    2021-11-30T10:52:50.065677  <6>[   58.628887] [<c104865c>] (io_schedule=
) from [<c043f440>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/61a60394a34cf2f0=
4a18f70f
        new failure (last pass: renesas-devel-2021-11-29-v5.16-rc3)

    2021-11-30T10:52:09.743113  rtcwake: assuming RTC uses UTC ...
    2021-11-30T10:52:09.743456  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov 30 10:52:16 2021
    2021-11-30T10:52:09.743832  <6>[   18.350871] PM: suspend entry (deep)
    2021-11-30T10:52:09.754876  <6>[   18.355674] Filesystems sync: 0.000 s=
econds
    2021-11-30T10:52:29.808309  <6>[   18.365078] Freezing user space proce=
sses ... =

    2021-11-30T10:52:29.808951  <3>[   38.382692] Freezing of tasks failed =
after 20.012 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-30T10:52:29.809371  <6>[   38.393253] task:systemd-udevd   stat=
e:D stack:    0 pid:  130 ppid:   120 flags:0x00000081
    2021-11-30T10:52:29.809730  <6>[   38.403068] [<c1048094>] (__schedule)=
 from [<c104857c>] (schedule+0x48/0xd0)
    2021-11-30T10:52:29.810070  <6>[   38.411468] [<c104857c>] (schedule) f=
rom [<c104865c>] (io_schedule+0x34/0x44)
    2021-11-30T10:52:29.858892  <6>[   38.419872] [<c104865c>] (io_schedule=
) from [<c043f440>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =

 =20
