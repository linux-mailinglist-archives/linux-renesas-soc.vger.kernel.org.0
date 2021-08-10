Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA053E8293
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Aug 2021 20:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236057AbhHJSM3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Aug 2021 14:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236704AbhHJSML (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 14:12:11 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC792C06179F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:39:29 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t7-20020a17090a5d87b029017807007f23so5291781pji.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RcAeQN+gmXLDK3m47qYKDkmMQSLuJXUR+/BsPFLKsLU=;
        b=MIlb72VtpP7Qezq4+F9wH2a/vIpBNBLjH2KEeQUSdJqD+kbllu89MT/re0l1DpfSgg
         TEUtTPWKRZNtMHVQioFewRjbVXKYnEfBPyauhU9YIAUTHH0qpsCVexMzxIBFwGV1VMgv
         5q5wA5BE7nm9M+v8C3ypJ4yg98J2Txsnl/m9ftlbMKLPo5XecZWR2AdXNMFFDnLShozf
         R9HM81GaK99eUUawBT9VH1y/3z6IHHRvfzcpScPzx0HbTBdK0eWr/1LSJQLaeM2OPTm1
         48p3OeeXbVZG6AqWlzxv2ZARmdFKnrMRfh8h6Zyb0RYn/jI9hFOp9mVA/sNBSWDeiLRN
         Cq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RcAeQN+gmXLDK3m47qYKDkmMQSLuJXUR+/BsPFLKsLU=;
        b=UhdLp3yXkqhw6PJ/ZGl4d8Pk7uNcZUnlASGW6E1fLpjCCMKb5RjVT4Eec9bpUUNFD6
         v8fqxomhRIzUxo+AgOkJfU2XcE+dfUN22id1G/EqnEEf1lVIe1a6Zq2vf0o+PMy/MRne
         WytVxV/TcSpHQyjW2KZhasK0J/OIQn/Fw49BdM6eiMnntSVI1cYDzgVCDacxiTCLKefn
         VvtIEbI9IQ+Aza175APZmmT4021i+k5IpbEIHqLjq0/GHuhH3JMvvBHP/bTSA0FLZiFh
         IPuSGhJVhoU4swhOz68QMncge3iefj3COrRqF6fqLSEcc0KkHXEkn6Iw35+Iq4K5ijaE
         LULQ==
X-Gm-Message-State: AOAM533hOHTIN87CzM7Xy17RwSXJuaTmhgygR8LP30wvXPBvWx6SQJju
        2XSYBiYW4Ed6r9JHv4EpY6hAAGCEFdnBcLiW
X-Google-Smtp-Source: ABdhPJzcimx/0W6dHzTDuIGSv+/9Do9rWWeTb2zK2C+4RiLGjGyYBhgHiY5XVlrBtbq/HiGg2g2xIQ==
X-Received: by 2002:a17:90a:c8c:: with SMTP id v12mr6117974pja.37.1628617169115;
        Tue, 10 Aug 2021 10:39:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w130sm21828175pfd.118.2021.08.10.10.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 10:39:28 -0700 (PDT)
Message-ID: <6112b9d0.1c69fb81.e2997.e8ed@mx.google.com>
Date:   Tue, 10 Aug 2021 10:39:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-08-10-v5.14-rc5
X-Kernelci-Report-Type: test
Subject: renesas/master sleep: 10 runs,
 2 regressions (renesas-devel-2021-08-10-v5.14-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 10 runs, 2 regressions (renesas-devel-2021-08-10-v5.1=
4-rc5)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-10-v5.14-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-10-v5.14-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      998b2a51c195410ed92f4f3a5ad117c2b567819f =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/6112a2092399069a2eb136bd

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-10-v5.14-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/6112a2092399069a=
2eb136d0
        failing since 91 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-10T15:55:56.632411  rtcwake: assuming RTC uses UTC ...
    2021-08-10T15:55:56.632679  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Aug 10 15:56:03 2021
    2021-08-10T15:55:56.646963  <6>[  101.985929] PM: suspend entry (deep)
    2021-08-10T15:55:56.647245  <6>[  101.990272] Filesystems sync: 0.000 s=
econds
    2021-08-10T15:55:56.661307  <6>[  101.995907] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-08-10T15:55:56.661659  <6>[  102.005268] OOM killer disabled.
    2021-08-10T15:55:58.800461  <6>[  102.009199] Freezing remaining freeza=
ble tasks ... =

    2021-08-10T15:55:58.801047  <3>[  104.136581] usb 2-1: device descripto=
r read/64, error -110
    2021-08-10T15:55:59.144969  <6>[  104.486505] usb 2-1: new high-speed U=
SB device number 5 using dwc2
    2021-08-10T15:56:04.394144  <3>[  109.736506] usb 2-1: device descripto=
r read/64, error -110 =

    ... (19 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/6112a2092399069a=
2eb136d1
        failing since 91 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-08-10T15:55:36.436304  rtcwake: assuming RTC uses UTC ...
    2021-08-10T15:55:36.441441  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Aug 10 15:55:43 2021
    2021-08-10T15:55:36.460087  <6>[   81.795443] PM: suspend entry (deep)
    2021-08-10T15:55:36.460337  <6>[   81.799756] Filesystems sync: 0.000 s=
econds
    2021-08-10T15:55:36.470145  <6>[   81.805034] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-08-10T15:55:36.470450  <6>[   81.814268] OOM killer disabled.
    2021-08-10T15:55:36.914143  <6>[   81.818166] Freezing remaining freeza=
ble tasks ... =

    2021-08-10T15:55:36.914490  <3>[   82.249444] dwmmc_rockchip ff0c0000.m=
mc: Busy; trying anyway
    2021-08-10T15:55:37.424762  <3>[   82.761805] mmc_host mmc1: Timeout se=
nding command (cmd 0x202000 arg 0x0 status 0x80202000)
    2021-08-10T15:55:37.437755  <6>[   82.771583] usb 2-1: USB disconnect, =
device number 2 =

    ... (66 line(s) more)  =

 =20
