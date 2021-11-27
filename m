Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC12445F768
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Nov 2021 01:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhK0AVR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 19:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhK0ATQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 19:19:16 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57DACC061746
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 16:16:01 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id o4so10269131pfp.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 16:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PgD+BJBLayn/1lrPORydpKqSXeKcVEpfbTHycYJDZUI=;
        b=g0tqMZK+eQedDUUdd4+dxxIL89lBCB3e7WHh6MHQ7GwU6+MEM+2/qLvySfVbBGN9OU
         4Oe5bu+83Q5J1RRJWt6hCF7iWnjoWNjWz2Gjpxgm5T8T8pzVICmCEo3ixPnUkN5og74+
         2oDxYr/8QcGOs/+3vSGUIwD18Nur6/Fe7ruQ9Z58B2trZmJBwWsKK4BE+qe57eNUbcrh
         xxvy/6xI6+MwZ3jKWVNFKHGN9l8jMUlwONn1G9aMUbI6SFyMXUuATYjcL0TMitpaz0A3
         JG47oaoye3Io+iy7eqbchUH3LtmnWW9uMAHY8upayFHDBMQlQF+iFMy4gOUaBBOkhUi4
         OzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PgD+BJBLayn/1lrPORydpKqSXeKcVEpfbTHycYJDZUI=;
        b=xCUX2sRw9FVZHbKCVf2vaRQQtQSuhrr4JxJlZvrHIjPQ7+LSVhdockIco6qS2fT4OU
         a5vbibbC0GfZnML/E5L96iCz4GwrlVcsD9s+gfCl2oRhOBn5IARtrKIXGjpZf9hm7M3j
         lYyYm0EUbKX+F2ZOaWn/BZSfyvidfNs7Dom3S8e8sXNETZHFWj2rV9xKjJOL5Fe8zBuS
         qfjMFiUr0fsZnWezH/aV7RbVaAOYrxyX5gM7x3xSuJivPpOrJkUNQn6NNW28ii5OFw7i
         /xU4YEl2aNPOuu3m5ovppI3YKwfZh2kQJb2TyvtwCe451AS95L4RjyFANoijR/XlCuiM
         sTMg==
X-Gm-Message-State: AOAM530YTkJXU6sU1O7EfRNZBIF7SsmKa1V5vZ1fXHXr6/kxCszxFIPu
        DNH+LNinZ0/Tp/Bv6DlTX54r4GBf1OXetrWq
X-Google-Smtp-Source: ABdhPJyuBhhqz5r1u5VnHX1AAr1sBXUOluTrJdusALObjuABQGnIYdKT3NxvPWdkuntliyUgFrJCEA==
X-Received: by 2002:a05:6a00:1ad0:b0:49f:d04e:78da with SMTP id f16-20020a056a001ad000b0049fd04e78damr25066590pfv.77.1637972160659;
        Fri, 26 Nov 2021 16:16:00 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q11sm7964309pfk.192.2021.11.26.16.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 16:16:00 -0800 (PST)
Message-ID: <61a178c0.1c69fb81.64de6.6e7b@mx.google.com>
Date:   Fri, 26 Nov 2021 16:16:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-11-26-v5.16-rc2
Subject: renesas/master sleep: 5 runs,
 3 regressions (renesas-devel-2021-11-26-v5.16-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 5 runs, 3 regressions (renesas-devel-2021-11-26-v5.16=
-rc2)

Regressions Summary
-------------------

platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
hp-11A-G6-EE-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =

rk3288-rock2-square | arm    | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-26-v5.16-rc2/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-26-v5.16-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e6857b805826e5d6f698ac92f4db69feb43afb4c =



Test Regressions
---------------- =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
hp-11A-G6-EE-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a1665d11169405d318f6fb

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-26-v5.16-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-26-v5.16-rc2/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1118.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-1: https://kernelci.org/test/case/id/61a1665d11169=
405d318f706
        new failure (last pass: renesas-devel-2021-11-22-v5.16-rc2) =

 =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
rk3288-rock2-square | arm    | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 2          =


  Details:     https://kernelci.org/test/plan/id/61a173ee0e6f79565a18f6d3

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-26-v5.16-rc2/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-26-v5.16-rc2/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1118.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/61a173ef0e6f7956=
5a18f6db
        failing since 6 days (last pass: renesas-devel-2021-11-15-v5.16-rc1=
, first fail: renesas-devel-2021-11-19-v5.16-rc1)

    2021-11-26T23:50:40.755353  rtcwake: assuming RTC uses UTC ...
    2021-11-26T23:50:40.755692  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Nov 26 23:50:47 2021
    2021-11-26T23:50:40.777684  <6>[   33.664171] PM: suspend entry (deep)
    2021-11-26T23:50:40.778227  <6>[   33.668512] Filesystems sync: 0.000 s=
econds
    2021-11-26T23:51:00.826418  <6>[   33.674032] Freezing user space proce=
sses ... =

    2021-11-26T23:51:00.826650  <3>[   53.691798] Freezing of tasks failed =
after 20.012 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-26T23:51:00.826768  <6>[   53.702239] task:systemd-udevd   stat=
e:D stack:    0 pid:  131 ppid:   115 flags:0x00000081
    2021-11-26T23:51:00.826876  <6>[   53.711994] [<c10496d4>] (__schedule)=
 from [<c1049bbc>] (schedule+0x48/0xd0)
    2021-11-26T23:51:00.826980  <6>[   53.720253] [<c1049bbc>] (schedule) f=
rom [<c1049c9c>] (io_schedule+0x34/0x44)
    2021-11-26T23:51:00.875697  <6>[   53.728629] [<c1049c9c>] (io_schedule=
) from [<c043f4a8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/61a173ef0e6f7956=
5a18f6dd
        failing since 6 days (last pass: renesas-devel-2021-11-15-v5.16-rc1=
, first fail: renesas-devel-2021-11-19-v5.16-rc1)

    2021-11-26T23:50:20.554288  rtcwake: assuming RTC uses UTC ...
    2021-11-26T23:50:20.554609  rtcwake: wakeup from \"mem\" using rtc0 at =
Fri Nov 26 23:50:27 2021
    2021-11-26T23:50:20.554931  <6>[   13.449957] PM: suspend entry (deep)
    2021-11-26T23:50:20.567472  <6>[   13.454675] Filesystems sync: 0.000 s=
econds
    2021-11-26T23:50:40.618170  <6>[   13.463723] Freezing user space proce=
sses ... =

    2021-11-26T23:50:40.618798  <3>[   33.482026] Freezing of tasks failed =
after 20.012 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2021-11-26T23:50:40.619200  <6>[   33.492616] task:systemd-udevd   stat=
e:D stack:    0 pid:  131 ppid:   115 flags:0x00000081
    2021-11-26T23:50:40.619570  <6>[   33.502441] [<c10496d4>] (__schedule)=
 from [<c1049bbc>] (schedule+0x48/0xd0)
    2021-11-26T23:50:40.624497  <6>[   33.510769] [<c1049bbc>] (schedule) f=
rom [<c1049c9c>] (io_schedule+0x34/0x44)
    2021-11-26T23:50:40.667086  <6>[   33.519232] [<c1049c9c>] (io_schedule=
) from [<c043f4a8>] (folio_wait_bit_common+0x1cc/0x32c) =

    ... (14 line(s) more)  =

 =20
