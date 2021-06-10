Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EFF3A3808
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 01:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhFJXqb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 19:46:31 -0400
Received: from mail-pj1-f45.google.com ([209.85.216.45]:42592 "EHLO
        mail-pj1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhFJXqa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 19:46:30 -0400
Received: by mail-pj1-f45.google.com with SMTP id md2-20020a17090b23c2b029016de4440381so4877921pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 16:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Tz9P/VZpZu/qUf55YCjdipbeFjRNWYQ2685pXPj/16g=;
        b=ctUr9/3gTRHQ0/D/EKf+rXVyZ+PwzNahTwO3YZvdJJTnYaNWC8Kibb9zSsjs8gSP+5
         lzN3vhJpWt4SvcCc0AYjnz7NXgj9uWa8r4qiz0SJGnN7pvkQQxuZGK/rrj8d+/ZgHNqE
         HNuaIACFCtCa10fniJeV0Haot3jVEjnLl30AX7wb2Jgr/nZW9k11ZydMtyJrquqybk7Q
         on+kN4Zq/2RkR6Q5vWicTlR8TPKzwagLDWFcGtfDEnDwKQSruDB0pqA7lJE1o4Apvk62
         +FV4Kq+nyF0x32vjtnHTw6aiUuNhcl/0T5WGLq//7sRCWBZopWpZ0O2YBgp0OlxpQtfr
         s2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Tz9P/VZpZu/qUf55YCjdipbeFjRNWYQ2685pXPj/16g=;
        b=mQy6q6Hh/DLueuWmfqFQ/pgYq7V7Vuo4V4qDVWIuRWJu5bEVcraLKfxoPzQUpqeT3M
         v5JurP9GvD1rfl0lSeqVgEHwthrxc+HDvlHzZrEGPtRJOpHgohnJw8vXvxxWulolL1zQ
         omb2kQmdsE9vhtAXs/74xPtdy8yLJY7sz/xZO/tAbj1Sb1SXz/GeOAXeh26ACwmbBCYr
         B+FNJ3ms1nameP3a00ZIgN1aIq6w7xXJ9Vq+PX/gI+zTIpOSKlYLGc8JGSdLnGmLCis5
         WS3AmTFd+HePjiJKNHtGr1FkmOKnjDNqyMBBhyDuzZVF0eEe3Jm2nLQyvI5Me9zX93Z2
         ToTA==
X-Gm-Message-State: AOAM532RmdwOnwpzYbvL+lLk8y7BNZY8gUKEjEfVnu34F8IzvurO7VkK
        I5Vn5ztp1MxiY9k0DjClAcXCSrdJexAoshA6
X-Google-Smtp-Source: ABdhPJxnlcGg+FHaH9tMo3be+WnJJFSVDdP2clV+NDuXKmKbNo/fJnmORdda3uXJiIdwyk6OuYnHmQ==
X-Received: by 2002:a17:90a:a607:: with SMTP id c7mr1316639pjq.199.1623368613600;
        Thu, 10 Jun 2021 16:43:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d3sm8620041pjk.16.2021.06.10.16.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 16:43:33 -0700 (PDT)
Message-ID: <60c2a3a5.1c69fb81.c1448.ab10@mx.google.com>
Date:   Thu, 10 Jun 2021 16:43:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-06-10-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next sleep: 6 runs,
 2 regressions (renesas-next-2021-06-10-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 6 runs, 2 regressions (renesas-next-2021-06-10-v5.13-rc=
1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-06-10-v5.13-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-06-10-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      23df6d1f09712871dfba619729a8a165f147c17e =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/60c28ee2995c88107b0c0e02

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288-ve=
yron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60c28ee2995c8810=
7b0c0e07
        failing since 16 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-06-10 22:12:19.665000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Thu Jun 10 22:12:26 2021
    2021-06-10 22:12:19.674000+00:00  <6>[   82.377520] PM: suspend entry (=
deep)
    2021-06-10 22:12:19.680000+00:00  <6>[   82.383995] Filesystems sync: 0=
.000 seconds
    2021-06-10 22:12:19.693000+00:00  <6>[   82.391392] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-06-10 22:12:19.699000+00:00  <6>[   82.402765] OOM killer disabled.
    2021-06-10 22:12:20.096000+00:00  <6>[   82.408778] Freezing remaining =
freezable tasks ... =

    2021-06-10 22:12:20.105000+00:00  <3>[   82.798526] dwmmc_rockchip ff0c=
0000.mmc: Busy; trying anyway
    2021-06-10 22:12:20.617000+00:00  <3>[   83.315120] mmc_host mmc1: Time=
out sending command (cmd 0x202000 arg 0x0 status 0x80202000)
    2021-06-10 22:12:20.624000+00:00  <6>[   83.326936] smsc95xx 2-1.1:1.0 =
eth0: Link is Down
    2021-06-10 22:12:20.635000+00:00  <6>[   83.334633] smsc95xx 2-1.1:1.0 =
eth0: hardware isn't capable of remote wakeup =

    ... (27 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60c28ee2995c8810=
7b0c0e08
        failing since 16 days (last pass: renesas-next-2021-05-11-v5.13-rc1=
, first fail: renesas-next-2021-05-25-v5.13-rc1)

    2021-06-10 22:12:39.960000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Thu Jun 10 22:12:47 2021
    2021-06-10 22:12:39.969000+00:00  <6>[  102.673225] PM: suspend entry (=
deep)
    2021-06-10 22:12:39.990000+00:00  <6>[  102.695039] Filesystems sync: 0=
.000 seconds
    2021-06-10 22:12:40.025000+00:00  <6>[  102.718168] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-06-10 22:12:40.026000+00:00  <6>[  102.729869] OOM killer disabled.
    2021-06-10 22:12:41.688000+00:00  <6>[  102.735849] Freezing remaining =
freezable tasks ... =

    2021-06-10 22:12:41.710000+00:00  <3>[  104.390955] usb 2-1: device des=
criptor read/64, error -110
    2021-06-10 22:12:42.059000+00:00  <6>[  104.760894] usb 2-1: new high-s=
peed USB device number 5 using dwc2
    2021-06-10 22:12:47.369000+00:00  <3>[  110.070892] usb 2-1: device des=
criptor read/64, error -110
    2021-06-10 22:13:00.043000+00:00  <4>[  122.747879]  =

    ... (22 line(s) more)  =

 =20
