Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A56A049A5EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 03:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3418173AbiAYCND (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 21:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3414886AbiAYAwx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 19:52:53 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7325DC0E5315
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 14:34:23 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id u10so12935792pfg.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 14:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/1sFTEaiavVn4gI8jy5XjIYOFQKJ6nrPVGngHoTu8zc=;
        b=tHKtoZLmpzYyHCYmstcGA+/Z2Z922quMq9sxJ5KsOk9JagoFcOhJVOeaRtWfUlaTYe
         6HBMs+6pNcftHzm28md3ItrQTp/7RsE0pBe0GpAxAlvB9XnmuF/qaN1/Ls9Hr6AOpK0q
         dHMU+ugLAJgljxU5O1qdJpR2XDtuLBMScK/3jMvf1SmsMQcGEOGznh1oN8iOUTOVzClm
         KNnT/9DOhPZOSgWEMS4xDnih0ZyX83sxTOygBiYyD4aSp4Zmq7MvSpP58oM+c4wDdUTc
         gKIyS7ofJ8WgjJzGqoNJoP5rifvVP+wkZMTSBRUUa6RqQPm6A7SX60EMLqsOxd65qYgP
         wEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/1sFTEaiavVn4gI8jy5XjIYOFQKJ6nrPVGngHoTu8zc=;
        b=AnHaBN8s/asAJnwRalkrnC8TMwxZNZDh+lMs48mdqmscPuDovT2PapMC7/Bf8DiHrS
         D2N2taVQQ6rdecqqRVCcUVgQ0OV7Hv9NA/npnQebUsrVPmJ3OktbS05bZvtD+GkvrGeD
         gSvIdz67MoeVUg/RN3n1ma+FNwWYSywA9ewMwP+huWnJOz6O1k6rnreD106P5iu7pF9K
         FgbWAoE39MZ5UO3mANBHSx0XelroZhLJbReyWrkmdfxqTtPWVI116CdU2hh7bqxHOCxJ
         yn4/6nznC3ILXnMWKIfXUK8ArEi/FpdB59pXbLnQq/CsUCd78QhCkPC0YYC694DHFURm
         nXVg==
X-Gm-Message-State: AOAM5306s79m7i5re4Xg4FUU4Y3l1gDkVbD44R/pEheOzNQjwd8AaHhR
        gOlr4Ddei9BtpdQMV2K+tHu0aEw94QRr0NeX
X-Google-Smtp-Source: ABdhPJz4B4zjLiTr+/NEG1juHYMXWOPZ+hwYhWs7V1/c+s+ZkthCmtBIzUYh8W12Gvn01NxKX843Aw==
X-Received: by 2002:a05:6a02:18a:: with SMTP id bj10mr9585017pgb.132.1643063662793;
        Mon, 24 Jan 2022 14:34:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s22sm17554693pfu.34.2022.01.24.14.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:34:22 -0800 (PST)
Message-ID: <61ef296e.1c69fb81.da464.fe62@mx.google.com>
Date:   Mon, 24 Jan 2022 14:34:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-611-g4ccda2778be0
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master sleep: 8 runs,
 5 regressions (v5.17-rc1-611-g4ccda2778be0)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 8 runs, 5 regressions (v5.17-rc1-611-g4ccda2778be0)

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


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
7-rc1-611-g4ccda2778be0/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: v5.17-rc1-611-g4ccda2778be0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4ccda2778be03d61d70b8c8da55ef54d69a7f3cd =



Test Regressions
---------------- =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
hp-11A-G6-EE-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61ef1343796d6f7a12abbd1b

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/sl=
eep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/sl=
eep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-10: https://kernelci.org/test/case/id/61ef1343796d6f7=
a12abbd27
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T20:58:13.544740  <6>[   31.053463] PM: suspend entry (deep)
    2022-01-24T20:58:13.548650  rtcwake: assuming RTC uses UTC ...
    2022-01-24T20:58:13.553741  rtcwake: wakeup from \"mem\" using rtc0 at =
Mon Jan 24 20:58:19 2022
    2022-01-24T20:58:13.557567  <6>[   31.057943] Filesystems sync: 0.000 s=
econds
    2022-01-24T20:58:13.562948  <6>[   31.071303] PM: suspend entry (deep)
    2022-01-24T20:58:13.567426  <6>[   31.071646] Freezing user space proce=
sses ... =

    2022-01-24T20:58:13.569544  <6>[   31.075155] PM: suspend exit
    2022-01-24T20:58:13.581145  <4>[   31.090046] (elapsed 0.014 seconds) d=
one.
    2022-01-24T20:58:13.584910  <6>[   31.094461] OOM killer disabled.
    2022-01-24T20:58:15.113164  <6>[   31.097973] Freezing remaining freeza=
ble tasks ... (elapsed 1.515 seconds) done. =

    ... (1149 line(s) more)  =

 =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
rk3288-rock2-square | arm    | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 4          =


  Details:     https://kernelci.org/test/plan/id/61ef17f0cd9a43af2cabbd22

  Results:     2 PASS, 16 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-rock2=
-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.17-rc1-611-g=
4ccda2778be0/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-rock2=
-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220121.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/61ef17f0cd9a43af=
2cabbd30
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:19:31.125403  rtcwake: assuming RTC uses UTC ...
    2022-01-24T21:19:31.170549  <4>[   15.737915] rtc-hym8563 0-0051: no va=
lid clock/calendar values available
    2022-01-24T21:19:31.171046  rtcwake: read rtc time failed: Invalid argu=
ment
    2022-01-24T21:19:31.171788  rtcwake: assumin<4>[   15.758192] rtc-hym85=
63 0-0051: no valid clock/calendar values available
    2022-01-24T21:19:31.172136  g RTC uses UTC ...
    2022-01-24T21:19:31.172525  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61ef17f0cd9a43af=
2cabbd31
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:19:31.122245  rtcwake: ass<4>[   15.683732] rtc-hym8563 0=
-0051: no valid clock/calendar values available
    2022-01-24T21:19:31.122731  uming RTC uses UTC ...
    2022-01-24T21:19:31.123113  rtcwake: read rtc time failed: Invalid a<4>=
[   15.702803] rtc-hym8563 0-0051: no valid clock/calendar values available
    2022-01-24T21:19:31.123469  rgument
    2022-01-24T21:19:31.124131  rtcwake: assuming RTC uses UTC ...
    2022-01-24T21:19:31.124449  rtcwake: read rtc ti<4>[   15.717969] rtc-h=
ym8563 0-0051: no valid clock/calendar values available
    2022-01-24T21:19:31.124770  me failed: Invalid argument   =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/61ef17f0cd9a43af=
2cabbd32
        new failure (last pass: renesas-devel-2022-01-11-v5.16) =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/61ef17f0cd9a43af=
2cabbd33
        new failure (last pass: renesas-devel-2022-01-11-v5.16)

    2022-01-24T21:19:31.029281  SULT=3Dpass>
    2022-01-24T21:19:31.029603  rtcwake: assuming RTC uses UTC ...
    2022-01-24T21:19:31.074153  rtcwake: read rtc time failed: Invalid argu=
ment
    2022-01-24T21:19:31.075026  _ID=3Drtcwake-mem-1 RESULT=3Dfail>
    2022-01-24T21:19:31.075372  rtcwake: assuming RTC uses UTC .<4>[   15.6=
68629] rtc-hym8563 0-0051: no valid clock/calendar values available
    2022-01-24T21:19:31.075710  ..
    2022-01-24T21:19:31.076128  rtcwake: read rtc time failed: Invalid argu=
ment   =

 =20
