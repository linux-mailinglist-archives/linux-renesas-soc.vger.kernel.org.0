Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08463344548
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 14:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbhCVNPt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 09:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233635AbhCVNN3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 09:13:29 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3AFC0613D9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 06:13:29 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id gb6so8435531pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IPwfVlFbWWBuG0S19Pwgj6t0UC1Ih9yQ/kIGlqHTSlo=;
        b=vfCeTAQ+6q96a6RqaOzAOd18FxJJq6/8n4MXaMSFivniWLyo1IPJLqiy6wN6IZzyeg
         cny86UzzDmEaQqMw00qezFcAjU4PUSZ2vkRq7dSAGAcs51a6hwyMr6e2I9gO9UgCUxQZ
         CasEQ8RTOm6P/H93pmPTLs9C0xep8AMzPaMqhECLbc43OpRPXCoxU9QFAiJLIW1Jcj/w
         yNobEImX0uKParweUYxfft2VxE+lNeMKXYBTxJSXYx+l9/3E2WG0ic2SjDsODeAU9c8a
         oCO/5o0qHzoqJm8R2liF01XXj0aDnBFGMAuL6d+65AcXGDBJLNJ6XuqGxTuncQZj59YX
         6svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IPwfVlFbWWBuG0S19Pwgj6t0UC1Ih9yQ/kIGlqHTSlo=;
        b=OBIyiwM2pBq5ILCjx4Yi85n22ejW0PlOIdNC2KXaAKtkHmok2Lx1rXwWP+VBt7gh0T
         chq1GvPYer23K0imCxah3rIgWh8hUr5uI8+nWu0uMy4KfRMKxxeEzDDj9krzqecOmv9+
         DwOQSx0VQcvjk7RAFWpZMU3vedf+Y5EnJoSL60XsP7ISVHKBrRPlBnlQjbJchtDxsLfH
         zckNc8qXkzu5hNT99yudF0adQVVvn+ZYFbRZCpZktcQDBgxJ/jJ7Uco/sfk89BVIWgau
         5mNtpju7v0YURxD4b5gfGTxlEd7xy/n0Zje9opusMb8ZReKcWRfBp4fakr50DnApEm8L
         99kg==
X-Gm-Message-State: AOAM530T36l2tdsi3JPH/GVZ7m6BwakJNzOWAHd+ceHgZBTZLHGuFjLG
        qKMeEpU3jmVdTKSBb5U23iRZBCs17HWyTA==
X-Google-Smtp-Source: ABdhPJz8vnaaKpJ8u7G89WJ+hMxAAiGmoe24uHN7UGQJJG9om61rbqTY2lcTCev5spgs+oXfm2dEww==
X-Received: by 2002:a17:902:d893:b029:e6:7a98:6919 with SMTP id b19-20020a170902d893b02900e67a986919mr27122804plz.58.1616418808876;
        Mon, 22 Mar 2021 06:13:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t16sm14056504pfc.204.2021.03.22.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:13:28 -0700 (PDT)
Message-ID: <605897f8.1c69fb81.852e2.1fc3@mx.google.com>
Date:   Mon, 22 Mar 2021 06:13:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-03-22-v5.12-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next usb: 2 runs,
 1 regressions (renesas-next-2021-03-22-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 2 runs, 1 regressions (renesas-next-2021-03-22-v5.12-rc2)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-22-v5.12-rc2/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-22-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7ad9aafe713bdca552efdf6309a196e4f3eec177 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/605891dd00813e0072addccb

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-22-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/605891dd00813e007=
2addcce
        new failure (last pass: renesas-next-2021-03-16-v5.12-rc2)

    2021-03-22 12:42:22.440000+00:00  + lsusb
    2021-03-22 12:42:22.441000+00:00  + awk {print $6}
    2021-03-22 12:42:22.441000+00:00  + sort
    2021-03-22 12:42:22.441000+00:00  + seq 1 3
    2021-03-22 12:42:22.442000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-03-22 12:42:22.442000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-03-22 12:42:22.443000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Mon Mar 22 12:42:24 2021
    2021-03-22 12:42:22.498000+00:00  <6>[   19.487073] PM: suspend entry (=
s2idle)
    2021-03-22 12:42:22.498000+00:00  <6>[   19.491607] Filesystems sync: 0=
.000 seconds
    2021-03-22 12:42:22.498000+00:00  <6>[   19.498451] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (149 line(s) more)  =

 =20
