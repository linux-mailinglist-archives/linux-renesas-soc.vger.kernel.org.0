Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA1C396364
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 May 2021 17:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbhEaPPb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 May 2021 11:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234350AbhEaPNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 May 2021 11:13:07 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0AFEC0045B7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:10:04 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso7508pjx.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EVFbDBdU03BoBS9AEw0PDrQdiWSnfSf3dawiBBoV8gI=;
        b=TOuT4R6IQJ9K8LOZMZ8v+iiXcUMCWvZL6qnnBvcOXAK1P9n47wGgrFbmCwcMkjbAUH
         XKLKCRmccsyENKo27fd0Ue9Iu3djI216hmE+hwYXnp4fWTg9efgdWHBUsXiF4s2fKojm
         qzJb41fGFabFfHu5okVlP0Xl/8blmoAQ4QcKUan5iDCyluUG7HYbc7paTeQJuQPGCLXT
         Fcl8+jHnD8yD45okcb9N+gDQRvjFkhKekCgOxIUV5TWdvQxKQF1JIrJIKdeA7h+xYwcf
         ZflyJIyxCOYasve6geX5VAc48a7EAnGBo7qrvlfhdv42HiJrL2amoRy1Ft5aiJj8AJPI
         1sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EVFbDBdU03BoBS9AEw0PDrQdiWSnfSf3dawiBBoV8gI=;
        b=fQ72KIyJDZ24uKknCSLTPh/HKCUzoxEBIJvzG/HdHtA7yk2KFQd86AQdo5HgOut91K
         cRMEatS6ONgMc80MetOlXovcIrkbZVWKC0pAStbwApfdK4NY5Alc00tbISmcsDG6BgF1
         hnYWnSknNpzYLdDLE7yRyW81O57heYlztBV0qlyvcv4BQJglzGH3lauU1CGCtRYghw+U
         +cvwggShvLhXWsPXxlK+p4/ESWbYXJKZ20T5YFknWDc8dViHPcXNf5vzdia9s2ICaROT
         bjeKJ3RQRrl+K9UftB/lQB+mDrS1RGtx05z2XE19g0pp0fEd0MTbsjosgdwxa7LMEUqL
         pdmA==
X-Gm-Message-State: AOAM531fsNH4DMLxDOoSjVBFgP/UDRgStj3f4sxahVLBT77VK/SvM7kd
        0nrnQ9/SX7f1TI71iZTR6FhRXul/fO+pxIrA
X-Google-Smtp-Source: ABdhPJy+FNK6em+dN4oNJ1vpRQbMQSQnygE7DeJIvybowJqPUqUm6HUODkv4h8BiqviuQdwiGG5I5g==
X-Received: by 2002:a17:90a:ac8:: with SMTP id r8mr19082325pje.58.1622470204238;
        Mon, 31 May 2021 07:10:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r22sm4558322pgu.18.2021.05.31.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 07:10:03 -0700 (PDT)
Message-ID: <60b4ee3b.1c69fb81.40027.d3a2@mx.google.com>
Date:   Mon, 31 May 2021 07:10:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-31-v5.13-rc1
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next usb: 4 runs,
 1 regressions (renesas-next-2021-05-31-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 4 runs, 1 regressions (renesas-next-2021-05-31-v5.13-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-31-v5.13-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-31-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      acad452912fc6a5cd2171fbe6af0ecbb3aad265c =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60b4da0a72289321e7b3afca

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-31-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60b4da0a72289321e=
7b3afcd
        new failure (last pass: renesas-next-2021-05-27-v5.13-rc1)

    2021-05-31 12:38:51.470000+00:00  + lsusb
    2021-05-31 12:38:51.470000+00:00  + awk {print $6}
    2021-05-31 12:38:51.470000+00:00  + sort
    2021-05-31 12:38:51.471000+00:00  + seq 1 3
    2021-05-31 12:38:51.471000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-05-31 12:38:51.471000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-05-31 12:38:51.471000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Mon May 31 12:38:54 2021
    2021-05-31 12:38:51.528000+00:00  <6>[   13.876872] PM: suspend entry (=
s2idle)
    2021-05-31 12:38:51.528000+00:00  <6>[   13.881445] Filesystems sync: 0=
.000 seconds
    2021-05-31 12:38:51.528000+00:00  <6>[   13.889081] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (132 line(s) more)  =

 =20
