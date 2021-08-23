Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FECD3F5161
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 21:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhHWTlE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 15:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhHWTlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 15:41:04 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A71C061575
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Aug 2021 12:40:21 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id n5so12652411pjt.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Aug 2021 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lv90AATX1E+bhX1ZNyUj32hyJF4XAauB97TNgwzVpNs=;
        b=MZZn8vJo1gYtQ7DiQSFiptzafrcskztyWSIOBiQnxomvY6zZFiPJxZpltNXsJxPGo8
         boV7Pvk/sc+BNAyoYy+nz2hA/2EeM1Y5myujgH3VT9K9zaF5fK8nYOPPOQ5gmn/bHzJP
         K0wpuQIYJYSmn4rcQx6G13IDDEijcf6cUKsSHPb67IN30U2JJsPe1vZG82IauWLYSAUT
         IQ27grlbfDJ7zK/VF3plRA79kFPW3JuABnk2jkcYZtSs+w1WdAU8atK5wS0xCgRdvLNs
         KyM6k9JKvfMoIhpRaisKyy5htr+9mraFOwBK8/7ugn4TJlzkVu+PZhzQP5QwYtdwgeBc
         3HWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lv90AATX1E+bhX1ZNyUj32hyJF4XAauB97TNgwzVpNs=;
        b=TWNLwP3V9WaCi/xYY0piKWR4rELyFa7IRl6dccPGoanl4s8nwcejuAPFNNWyzCWRWS
         PDxP2YHfWXFDKqU0aOmFQm1jwgKRWMxJuqg0c+346PJK2qJtkJ/bI/rTK9mIXeI5ks5u
         00Ztfw/SgfRzte7E+NcMPQeM2Y3prs/5lBVt/bzvDKHyADDYxrcKAnmaEyaW9B+E8vzC
         gYIQJXqDVPkLWYLTTQmpraQyJa9GWCNkH4TqxHeBnBlEUvAMI5Y7yB/H7rl7occ3gjrO
         7gQYjf8jLvIwg8jS4J220OxOqcPmykOKsDMIhQ16LkvkQbN9pJpS3+WLTMHPFKhB8ujh
         RyHg==
X-Gm-Message-State: AOAM530mPXA+ocZTrVeDFLbyCEiaFqhqkZmHLfZi3WSCVBdO4RC8CtHp
        Q2kvRMvfhyA1Mb3ol3MDf+cX0niCqG3NMI9v
X-Google-Smtp-Source: ABdhPJzxzKmK6lIIlHwCaTLwjbGSN/gShE7wcKQtRnIf2Rep2wQDEGPgjxFhDi/gO9LT9aA2H+XRaA==
X-Received: by 2002:a17:90a:4f46:: with SMTP id w6mr181118pjl.9.1629747620584;
        Mon, 23 Aug 2021 12:40:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y7sm17368735pfp.102.2021.08.23.12.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 12:40:20 -0700 (PDT)
Message-ID: <6123f9a4.1c69fb81.1e51.22fa@mx.google.com>
Date:   Mon, 23 Aug 2021 12:40:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-08-23-v5.14-rc7
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 6 runs,
 1 regressions (renesas-devel-2021-08-23-v5.14-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 6 runs, 1 regressions (renesas-devel-2021-08-23-v5.14=
-rc7)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-08-23-v5.14-rc7/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-08-23-v5.14-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a8378ef28a200358f247cc997a8c3db868b1e917 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6123e934f7b9a19cac8e2cbe

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collab=
ora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-08-23-v5.14-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collab=
ora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0730.6/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-1: https://kernelci.org/test/case/id/6123e934f7b9a=
19cac8e2cc9
        new failure (last pass: renesas-devel-2021-08-12-v5.14-rc5)

    2021-08-23T18:28:54.649186  rtcwake: assuming RTC uses UTC ...
    2021-08-23T18:28:54.657359  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Aug 23 18:29:00 2021
    2021-08-23T18:28:54.659151  <6>[   31.360154] PM: suspend entry (deep)
    2021-08-23T18:28:54.663319  <6>[   31.372915] Filesystems sync: 0.000 s=
econds
    2021-08-23T18:28:54.667528  <6>[   31.377537] PM: suspend entry (s2idle)
    2021-08-23T18:28:54.674781  <6>[   31.377777] Freezing user space proce=
sses ... =

    2021-08-23T18:28:54.677281  <6>[   31.381553] PM: suspend exit
    2021-08-23T18:28:54.677530  rtcwake: write error
    2021-08-23T18:28:54.681887  <4>[   31.391179] (elapsed 0.001 seconds) d=
one.
    2021-08-23T18:28:54.685212  <6>[   31.395693] OOM killer disabled. =

    ... (1150 line(s) more)  =

 =20
