Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C3832A638
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Mar 2021 17:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351318AbhCBOP1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Mar 2021 09:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240650AbhCBBWa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 20:22:30 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0D6C061756
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Mar 2021 17:21:50 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id l2so12806317pgb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Mar 2021 17:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qwz68JNmzXDyuNVJXTQgMokIPWJq3VJs3dgMrAHwHYc=;
        b=GvCgzv8uqO6ikQgEwj4bvfp4skrtDhIdIRzd7fiWhURLSxBJl+d0M158lBKotbDiKX
         zTjraqx9JhlxibQNh6t6Jm86iXyXGKG+WEJ4FNhpIh1CE7hBUEYd+A1/AK5cmxUru5Go
         81GCMXNn17pYfw/x2boW4Xa5pEEgX09Cpjub6Ptg3F03T+qNuKoJffg+atmfnHjjaZEU
         /CZcEP7Zdh8gJmreAkMHXgnlnckjds7gldfpL0jF/XEGLFzlRPhwmqoSFoom+aeJ86x7
         r3o1PG+9x18eDTbX1FkAe7vx+/qlWv4Lf38HNX9D78z3FgyqW48j97z8mvUpBMC9UzCE
         RJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qwz68JNmzXDyuNVJXTQgMokIPWJq3VJs3dgMrAHwHYc=;
        b=itVLBBOpNJsIGOxmq2mmV1D3MWX2kfhLXYomki0yPmya/aVeXSb+5jnkCdFnWlh9fg
         i/CabafFPJ6cNI+3AuFSWmtejC0PRCke3nmL7FQvixudZHDi4PnP2o6oIxjKIchuILsn
         G4boVBhDo9iVU4TGHW13TiiQ6Q1dPjpWK98Q5dBE8kpsAQAgSjo/u8Jl33323lBbChKg
         Oaeq9LUZu9yWcd6wn1PosgrU7kEQ2FHXQpmbPQadX6l18ZxjAEHxOtyg/q2yDjStWJhi
         g6Kj8/K1bALUUIjSuqKWStGs7nLBGBk3aR0K9n28o/G+qxSRJYIKMs+SEdrrXK2kuIe2
         vx1w==
X-Gm-Message-State: AOAM5327eI7h8zMG8OOHjX4zxDe+9YhcDvGs4WkaXzB1uuV4fSIuRfx6
        4lZY9NnBLYMhJEq8WAjN6okDX7IoF7Y8vQ==
X-Google-Smtp-Source: ABdhPJyD29SF8JU5go27v/htSQXO1RWDQKu1Ty9D+mdesOXKqC4UVW+XEzmge8VcEc3/aOddmqlJfg==
X-Received: by 2002:a62:c301:0:b029:1ed:c3d5:54d6 with SMTP id v1-20020a62c3010000b02901edc3d554d6mr1095532pfg.18.1614648109462;
        Mon, 01 Mar 2021 17:21:49 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q15sm780594pje.28.2021.03.01.17.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 17:21:49 -0800 (PST)
Message-ID: <603d932d.1c69fb81.961a9.2b7b@mx.google.com>
Date:   Mon, 01 Mar 2021 17:21:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc1-379-gc28144dc9685d
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master usb: 2 runs,
 1 regressions (v5.12-rc1-379-gc28144dc9685d)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 2 runs, 1 regressions (v5.12-rc1-379-gc28144dc9685d)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
2-rc1-379-gc28144dc9685d/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: v5.12-rc1-379-gc28144dc9685d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c28144dc9685de3293c3672e85b2f8f89b7615f4 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/603d842b0596720526addd2a

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock2-s=
quare.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc1-379-g=
c28144dc9685d/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock2-s=
quare.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0301.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/603d842b059672052=
6addd2d
        new failure (last pass: renesas-devel-2021-02-15-v5.11)

    2021-03-02 00:12:44.353000+00:00  + lsusb
    2021-03-02 00:12:44.353000+00:00  + awk {print $6}
    2021-03-02 00:12:44.354000+00:00  + sort
    2021-03-02 00:12:44.354000+00:00  + seq 1 3
    2021-03-02 00:12:44.354000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-03-02 00:12:44.354000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-03-02 00:12:44.355000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Tue Mar  2 00:12:46 2021
    2021-03-02 00:12:44.410000+00:00  <6>[   18.694042] PM: suspend entry (=
s2idle)
    2021-03-02 00:12:44.410000+00:00  <6>[   18.698618] Filesystems sync: 0=
.000 seconds
    2021-03-02 00:12:44.411000+00:00  <6>[   18.704998] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (134 line(s) more)  =

 =20
