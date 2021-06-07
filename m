Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C16439DD39
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 15:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhFGNCE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 09:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhFGNCD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 09:02:03 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A5BC061787
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 06:00:12 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id h16so9797350pjv.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 06:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pXyE4NMHB6VnU0qhJBkcwJ3HERAJJAIF6w46gZA1xVQ=;
        b=uoytRayTvCZqGrUIcN0mxILxMKxh4GdIkJ6mR2p3VkuLSd6U7ymw5Fz9dCvh2I/1s5
         5reqEdf4h36SP1SvEr+iHLf1HT8YSHKZlS6xvLx0p6JHh1I3FOqCpxWoso4zreFd9GEt
         qCZLIpzZdoLRMg7UdXW/icCAxAB9zO8jG9PSuQEL7lV6EjujwaB7GFE7EnKvlAcNd5am
         abg1Z5knqjMr0mIyAEhEhUlJVnbkZ6RwJukf27IilaZaxRI0ISfjU84JivDKGcvnZjEx
         Fnd6iK2LVG9ou4l51Rl8493O4qJ2OR/ct6u7LH7o9INlWDexnaNoNay1Sg6NH51RiEFx
         QF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pXyE4NMHB6VnU0qhJBkcwJ3HERAJJAIF6w46gZA1xVQ=;
        b=l5qdlUCNgJw0csrgzSQmImAq9V3TNuL54EnmNZubamExaw2Vm/dJs9AAkANLsmGBxL
         gzESnwl4NNjU33903QPGdu2GL8+0BqfmsB9m9IiEUaZE7rIwVXsicPK00qBeZJKptdDX
         tirw7Dh73HSCeIxlWhyJGe3hGpMUlFjpIZGj2Vhl4ZiBT1jj5HydahMWJMh4zoi335jG
         TpeRwiW8o1EJsA332n1uu7rA8VlfanFELEj3Zz5qxV6XQ7PlfbXIRdQj8jXaJURzGl+H
         jVEZjYwU3L1aKSaEoohw9T+B2jWUu3+33UdhHYcwKlVYvth/IF7TreI8P1ouZ+AESG9n
         XvXA==
X-Gm-Message-State: AOAM531LCRmajoqZ+PcsNo77w4iTlbmsGBNPReBmVbWqvpbVVwzq7rg+
        a8SR7Bxw3gB8pzZccBBOTwK1rzC+5vYBkru8
X-Google-Smtp-Source: ABdhPJwVxXNraVxL+F1RJmITRoKonyeUd+bSaznQXQFfbk0k5bV4PwSb5UcOFB0jXwpEybt4WtlxkQ==
X-Received: by 2002:a17:90a:8581:: with SMTP id m1mr20343427pjn.47.1623070812045;
        Mon, 07 Jun 2021 06:00:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c3sm7875203pfl.42.2021.06.07.06.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 06:00:11 -0700 (PDT)
Message-ID: <60be185b.1c69fb81.a9be2.683b@mx.google.com>
Date:   Mon, 07 Jun 2021 06:00:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-06-07-v5.13-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master sleep: 10 runs,
 2 regressions (renesas-devel-2021-06-07-v5.13-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 10 runs, 2 regressions (renesas-devel-2021-06-07-v5.1=
3-rc5)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-07-v5.13-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-07-v5.13-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0dc27258c7ad2021418a2aa43fb14a9dda2dd46d =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/60be0340f8302f30780c0e0b

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-07-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60be0340f8302f30=
780c0e10
        failing since 27 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-07 11:27:40.945000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-06-07 11:27:40.956000+00:00  <6>[   81.828840] smsc95xx 2-1.1:1.0 =
eth0: hardware isn't capable of remote wakeup
    2021-06-07 11:27:40.957000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Mon Jun  7 11:27:47 2021
    2021-06-07 11:27:40.961000+00:00  <6>[   81.846876] PM: suspend entry (=
deep)
    2021-06-07 11:27:40.970000+00:00  <6>[   81.853867] Filesystems sync: 0=
.000 seconds
    2021-06-07 11:27:40.982000+00:00  <6>[   81.861799] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-06-07 11:27:40.987000+00:00  <6>[   81.873304] OOM killer disabled.
    2021-06-07 11:27:41.243000+00:00  <6>[   81.879406] Freezing remaining =
freezable tasks ... =

    2021-06-07 11:27:41.268000+00:00  <6>[   82.126567] usb 2-1: new high-s=
peed USB device number 4 using dwc2
    2021-06-07 11:27:46.534000+00:00  <3>[   87.416567] usb 2-1: device des=
criptor read/64, error -110 =

    ... (25 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60be0340f8302f30=
780c0e11
        failing since 27 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-07 11:28:01.512000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Mon Jun  7 11:28:07 2021
    2021-06-07 11:28:01.523000+00:00  <6>[  102.408668] PM: suspend entry (=
deep)
    2021-06-07 11:28:01.534000+00:00  <6>[  102.419243] Filesystems sync: 0=
.000 seconds
    2021-06-07 11:28:01.549000+00:00  <6>[  102.429146] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-06-07 11:28:01.557000+00:00  <6>[  102.442951] OOM killer disabled.
    2021-06-07 11:28:01.973000+00:00  <6>[  102.451241] Freezing remaining =
freezable tasks ... =

    2021-06-07 11:28:01.991000+00:00  <3>[  102.856569] usb 2-1: device des=
criptor read/64, error -110
    2021-06-07 11:28:02.334000+00:00  <6>[  103.216568] usb 2-1: new high-s=
peed USB device number 5 using dwc2
    2021-06-07 11:28:07.573000+00:00  <3>[  108.456580] usb 2-1: device des=
criptor read/64, error -110
    2021-06-07 11:28:21.577000+00:00  <4>[  122.464680]  =

    ... (21 line(s) more)  =

 =20
