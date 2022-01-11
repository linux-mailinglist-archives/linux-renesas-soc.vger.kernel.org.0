Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF38948AE90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jan 2022 14:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238999AbiAKNjf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jan 2022 08:39:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240266AbiAKNja (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 08:39:30 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3103DC061756
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jan 2022 05:39:30 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id lr15-20020a17090b4b8f00b001b19671cbebso5943245pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jan 2022 05:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SMYOFYrxu+bHbWZs6wFmJeq3O5cOwYvpJoqkwctcyIk=;
        b=RnZRV1tbQsgsVHuGfUWut3G4TvmIp+osDIqxJw0tc99P3X8/uBXLabK7u00X7LGQ7m
         lZXzC/PrSygAC9CgJr+/Vimxbbaakwed4F0o4xgHL/Qh22C/8wWnWncDrc56ufvujyn4
         iVsVmIK5c88TIO9aMqqDk+QPoM9jdcwh2jNzXM2O+yEkUyyRSkGYCP+i9qLcjApULXcK
         XRQi4X2ehSiHucbaKQ4ornru9Qja27XMET/exsTITUk1SOVx6dGHRnFtqZAb7YKKq91+
         Iwe/QzPIC9IEktZquvNtZOFyE0FzE6CM4Tg4eFD/TMgrCUYJNaMZGxQL1E8GOsJ5zxyq
         Setg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SMYOFYrxu+bHbWZs6wFmJeq3O5cOwYvpJoqkwctcyIk=;
        b=b2oz94cKtqDU7ZYDD1XFpC7J5aSqSmTyqtXIyyjpwZnicnIoKhYp/Y0ZLY9z98MnY9
         yXsafp4gmjOPQsge0zh2gwwOehzDfETJNpQGmn9nUPBI4ZOQnvvxH4cBrR0Py7fxPyPL
         Oaib/yvAvjRaw0KWKEolzbeqhdbRXHcqGCgxDba/OCAKNuv8B7JbQ2DhGa342EAMJx5b
         2PfpQzTd8A85FWN9+IYHbj9v0RsjJyELvRgWPwwiO6HJsLrnyp2BJ5FrG4qF0VA2ylk8
         0KgqhnhgJhM2UM2WgguT75sepznwgTqUj+RxaS9+x6J/GI6suXXZODSSO+butNNNKks6
         PMfg==
X-Gm-Message-State: AOAM5317z0X/VThbNFiOmemuiQyMi7BodX01fUWqzBo+cwJEIxM5f4zD
        5gKUmh6424HPoTSZAjm5a0sJwJU060NxwmTs
X-Google-Smtp-Source: ABdhPJy8I4ZeblufJIlA8rmiWPPef2ii/5RTyTcpbz3pkse1q+OiuERIpTP+/VhYZ135kQZ5vlsu6Q==
X-Received: by 2002:a17:90b:3b49:: with SMTP id ot9mr3227322pjb.110.1641908369480;
        Tue, 11 Jan 2022 05:39:29 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y131sm8109905pfb.158.2022.01.11.05.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 05:39:29 -0800 (PST)
Message-ID: <61dd8891.1c69fb81.8f3af.4cc5@mx.google.com>
Date:   Tue, 11 Jan 2022 05:39:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-01-11-v5.16
X-Kernelci-Branch: master
Subject: renesas/master sleep: 8 runs,
 1 regressions (renesas-devel-2022-01-11-v5.16)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 8 runs, 1 regressions (renesas-devel-2022-01-11-v5.16)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-11-v5.16/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-11-v5.16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6db3d37d04fb23ae868d4ab8b0f4a869c32e0b4b =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61dd764cd37368ca14ef679d

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-11-v5.16/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211224.1/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/61dd764cd3736=
8ca14ef67a7
        failing since 0 day (last pass: renesas-devel-2022-01-03-v5.16-rc8,=
 first fail: renesas-devel-2022-01-10-v5.16)

    2022-01-11T12:20:23.863696  rtcwake: assuming RTC uses UTC ...
    2022-01-11T12:20:23.870054  rtcwake: wakeup from \"freeze\" using rtc0 =
at Tue Jan 11 12:20:29 2022
    2022-01-11T12:20:23.873775  <6>[   34.319920] PM: suspend entry (deep)
    2022-01-11T12:20:23.880110  <6>[   34.332546] Filesystems sync: 0.000 s=
econds
    2022-01-11T12:20:23.883287  <6>[   34.337104] PM: suspend entry (s2idle)
    2022-01-11T12:20:23.886603  <6>[   34.337376] Freezing user space proce=
sses ... =

    2022-01-11T12:20:23.889667  <6>[   34.341119] PM: suspend exit
    2022-01-11T12:20:23.902464  <4>[   34.356101] (elapsed 0.014 seconds) d=
one.
    2022-01-11T12:20:23.905724  <6>[   34.360394] OOM killer disabled.
    2022-01-11T12:20:24.928578  <6>[   34.363898] Freezing remaining freeza=
ble tasks ... (elapsed 1.014 seconds) done. =

    ... (1149 line(s) more)  =

 =20
