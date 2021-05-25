Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E803900D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 14:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbhEYMZE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 08:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbhEYMZE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 08:25:04 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927D7C061756
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 05:23:33 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id v14so19875102pgi.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 05:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oYX1cgNtMv1XfZGQFJ22L4/AUv80i9yLmyMF4Ype1cE=;
        b=JMELf2SdHRpGMUJBAmmcv9e/ypqV/6wlcvhTY4I7c83HPudTfKzUxBebqphv79HMck
         NleJpoYOM/p6vqlc9wM8WnNJ5YslFAahcfY/Kb8x4+V2aPTb1au8gedbza6cfvoGZyGo
         L4U0MFBocUE4aC720xZ2m/gKhcOX+2iE+9z6bM6UpPpKEKajg7X75O+R8rO/nHTy+Gq4
         RKTGD1iJOeMGtXVbPxjlJPfHy7bZQ/yuCqWNTcBVL89qpxHURanCaV5UJq1o3Wh/9Sz5
         0GE+2hVqf39wzEkEmZZULgBB6Jw9dzbqPzVQjxkGWGZzIJbMM5WSeeX6a/6bmX9aGJPp
         QRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oYX1cgNtMv1XfZGQFJ22L4/AUv80i9yLmyMF4Ype1cE=;
        b=g6hvJmTqO9JXiE/VPsJ6S54kJTO1onrmVQrAVD/r5XS4z75U7pHmPdiDcM0QWfRBPO
         Zzzh/9lr4hRPumtPQPwjEKGRiUZaSr6tM6m6qs1b8/IUU/qY9aX0paXgQmajM2VI1qF8
         +iJgPS8AYBy4AW5/EmZRdl0kPhMBGWqJTpBa5mOpngw8LxeD1dVyWDfbc2YhE8igneO8
         XXxlA8TFO4ntnX3WywqTU/8hOOLuYEje3X2WwtzWSTzVWyx5WTUfcpv1d+tGRqyWiUCY
         bDR1M0SX/oZe8sSR34hbgnC2T6xDCKtdLKyr1aix3nu3g4yRv6k25nFFMA7MpNVaeCCB
         8tvQ==
X-Gm-Message-State: AOAM531hEv9L9Z/DIGQCsktkhzYhQ5/Vo1r4+tudxsef6aL1CbjUr/nu
        pWk63vTqzZ49z+2QnNKDSJPSW+N0PQsNHg7Z
X-Google-Smtp-Source: ABdhPJyjasL8Q+opt7tCpxlFE+KrQ6/79HkdfLkLpt2E45HxA3V7D1kbij4pOeRkmQZcGO8nqUgN+Q==
X-Received: by 2002:a62:8fcf:0:b029:2e8:f2ba:38e7 with SMTP id n198-20020a628fcf0000b02902e8f2ba38e7mr7654109pfd.1.1621945412788;
        Tue, 25 May 2021 05:23:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z187sm886161pfb.149.2021.05.25.05.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 05:23:32 -0700 (PDT)
Message-ID: <60acec44.1c69fb81.7da18.1f33@mx.google.com>
Date:   Tue, 25 May 2021 05:23:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-25-v5.13-rc3
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master usb: 1 runs,
 1 regressions (renesas-devel-2021-05-25-v5.13-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 1 runs, 1 regressions (renesas-devel-2021-05-25-v5.13-r=
c3)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-25-v5.13-rc3/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-25-v5.13-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d6e14d563167f1d9eb028bfec40b214368fc5c82 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60acdc779154ba0f9fb3afb1

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-25-v5.13-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-25-v5.13-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60acdc779154ba0f9=
fb3afb4
        new failure (last pass: renesas-devel-2021-05-11-v5.13-rc1)

    2021-05-25 11:11:01.233000+00:00  + lsusb
    2021-05-25 11:11:01.234000+00:00  + awk {print $6}
    2021-05-25 11:11:01.234000+00:00  + sort
    2021-05-25 11:11:01.234000+00:00  + seq 1 3
    2021-05-25 11:11:01.234000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-05-25 11:11:01.234000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-05-25 11:11:01.235000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Tue May 25 11:11:03 2021
    2021-05-25 11:11:01.291000+00:00  <6>[   13.532689] PM: suspend entry (=
s2idle)
    2021-05-25 11:11:01.292000+00:00  <6>[   13.537331] Filesystems sync: 0=
.000 seconds
    2021-05-25 11:11:01.292000+00:00  <6>[   13.544734] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (130 line(s) more)  =

 =20
