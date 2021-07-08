Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE7F3C1A5E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jul 2021 22:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhGHULd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jul 2021 16:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhGHULa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 16:11:30 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737BBC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jul 2021 13:08:47 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id ie21so4434800pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jul 2021 13:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7eq6e+tykHDlG+KE1HobjBCcS17FocYBKy3/puiDTq4=;
        b=TJjppPuj3NZ5JAGnJzGc88cJFfoahy4GOot+SAikrPkSfQP7SWdXFIqfelO734VMLO
         IiHiej9hOQmeilTvz67p7f2jUrZMzqJNt4P+bWQdHJ6cXtKGglJczz0uMQQGaqv9IJYX
         66Vra62qD1AUSptji15fDERxjxITh+6yhKqxZ1bcGHKjwAwhRgww6n3OoObz3hSOt2Ds
         tXDi/rnzk8rHBQqepfkOGokboaGCjqr0+IxlS8B4MrripzPQb/7NfFl1Invw89sIVHbN
         rwWkGYbwKGI47Nq73X6AkxDKypZOIDMQWCsyBnduiGg1w6QBC1Jrd5bwl6qtQOiuMOYx
         48SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7eq6e+tykHDlG+KE1HobjBCcS17FocYBKy3/puiDTq4=;
        b=rYDy9UndvLviHJ3BEg8UJlMsakxnjO6AH5q5FfIMpKUw7jGeAXDwpuKiYji0ND07ki
         srFCPwVatYtHMxhjO63U5o9lJgRV4sdPc2JSXKgahqyXiqz5CLsJF/g6vpmEGuW5avZA
         kQ+WF+SDQMIfFQp2sZ57Q/VN+LoWzWJbZdYV9ghOdZV274LI/uVj6OP6GhYwsWp4Y0dY
         QCBq4trXMk7iCPTpEnnBiWHfM+gwsqTwUd7jFX9+5loiDgBFAk79nWpgx5FbppJItGxW
         mXHLqKAcTQbJNeYV8tvRvv1DdXvKQsVcesG/UeVEFb7Lf6cTN9gsjZDT28DN/pW4jSfA
         GvGA==
X-Gm-Message-State: AOAM5332TUTzE8bQCK2eOkqfJpLcswHh8L9a1qX+Ixvv9fA0mZTd1L5A
        o/6QfWikrPwg6gWurlfGC9oixFJFOsTMkyKo
X-Google-Smtp-Source: ABdhPJy0gdpBOhTNUHJjwPEQ+s+xbs37d+RrqXlSdy31bj5DfgjBHWEID3eYMd2h9ZX0qeCDXJArOg==
X-Received: by 2002:a17:902:f54d:b029:128:e54f:48f5 with SMTP id h13-20020a170902f54db0290128e54f48f5mr27118221plf.68.1625774926861;
        Thu, 08 Jul 2021 13:08:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 10sm3733319pjc.41.2021.07.08.13.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 13:08:46 -0700 (PDT)
Message-ID: <60e75b4e.1c69fb81.83e77.aec9@mx.google.com>
Date:   Thu, 08 Jul 2021 13:08:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-07-08-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next sleep: 10 runs,
 2 regressions (renesas-next-2021-07-08-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 10 runs, 2 regressions (renesas-next-2021-07-08-v5.13-r=
c1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-08-v5.13-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-08-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eb9ec119eee98db6f908226234823a0fef906cd6 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/60e75703af418c869d11797e

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60e75703af418c86=
9d117991
        failing since 44 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-08T19:48:12.920255  rtcwake: assuming RTC uses UTC ...
    2021-07-08T19:48:12.924926  rtcwake: wakeup from \"mem\" using rtc0 at =
Thu Jul  8 19:48:19 2021
    2021-07-08T19:48:12.936214  <6>[  102.648456] PM: suspend entry (deep)
    2021-07-08T19:48:12.956059  <6>[  102.667392] Filesystems sync: 0.000 s=
econds
    2021-07-08T19:48:12.968257  <6>[  102.674919] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-07-08T19:48:12.974119  <6>[  102.686496] OOM killer disabled.
    2021-07-08T19:48:13.465990  <6>[  102.692690] Freezing remaining freeza=
ble tasks ... =

    2021-07-08T19:48:13.482315  <3>[  103.176643] usb 2-1: device descripto=
r read/64, error -110
    2021-07-08T19:48:13.839254  <6>[  103.546594] usb 2-1: new high-speed U=
SB device number 5 using dwc2
    2021-07-08T19:48:19.150641  <3>[  108.856581] usb 2-1: device descripto=
r read/64, error -110 =

    ... (19 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60e75703af418c86=
9d117992
        failing since 44 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-07-08T19:47:52.427587  <6>[   82.126667] smsc95xx 2-1.1:1.0 eth0: =
hardware isn't capable of remote wakeup
    2021-07-08T19:47:52.427814  rtcwake: assuming RTC uses UTC ...
    2021-07-08T19:47:52.432515  rtcwake: wakeup from \"mem\" using rtc0 at =
Thu Jul  8 19:47:59 2021
    2021-07-08T19:47:52.448392  <6>[   82.158884] PM: suspend entry (deep)
    2021-07-08T19:47:52.459329  <6>[   82.169535] Filesystems sync: 0.000 s=
econds
    2021-07-08T19:47:52.473454  <6>[   82.178603] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-07-08T19:47:52.479099  <6>[   82.190220] OOM killer disabled.
    2021-07-08T19:47:52.697409  <6>[   82.196457] Freezing remaining freeza=
ble tasks ... =

    2021-07-08T19:47:52.720485  <6>[   82.406638] usb 2-1: new high-speed U=
SB device number 4 using dwc2
    2021-07-08T19:47:58.027563  <3>[   87.736653] usb 2-1: device descripto=
r read/64, error -110 =

    ... (22 line(s) more)  =

 =20
