Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8370D4AC73B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 18:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236017AbiBGRYe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 12:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382879AbiBGRPZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 12:15:25 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF74EC0401D8
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Feb 2022 09:15:24 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id i17so14058595pfq.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Feb 2022 09:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=o2jK4dQG5lYeldQntCcw2Wprg6Xt5GsPYAVGkxrUju8=;
        b=tL4xznP0Ilh/vmueJPaMMAauaRXNwWkNc7yN0DseTxwxKdSt3aqzZcYozsjVWrbGSr
         RZ63XD020AJ1HQEQvJdPyELFr3ysYQ0bChmppNi0NwRBfvCJqcRvvQOzkZdGH3b0nsTE
         zxs9u2H3NXS2Nhqy29IAYv+839p38gPAY91WzTRGCTLHwYIX4709x6/5Rk4uDK4Zyplm
         nDHwlNc5Eb7uoUTGCFKv78HjSfTVvIS606VgvX2opicq5aUSRngvKc9cnJP8abHqY+aa
         T31TC4Q/QhUpfGWogFe8PuAY2bYeGNwxjp35JCVJKZjxSf+ioxiWXhGkWS/RQul4IdCD
         wR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=o2jK4dQG5lYeldQntCcw2Wprg6Xt5GsPYAVGkxrUju8=;
        b=YmRN9hmYPpHvXBVMWxRT98ZathPm2io3Wd2kXb4qz9PPxC98996f98A27WC7GT0bAC
         NqA7+aXe9/bWyhGQKPM5W2RRfI0kJy6SAdh9ZeqV3/XKCo+1uNgyuB57HznfAji4oyoo
         cKvDsWRanyWU6KZQ/Ozbdf8wEztAgsV8sDrAQdYKNV+TExWTA32GW4CIT8caLEJppnyo
         r4ro3pDtLUdvDTq7e7cVf9Bz6fVUqV/Dbx1F3p4LWQn9LPxd9znGqjp/75Iyhn9SUn4U
         ZCsiCrr7LCUvCVGnJuu60cD2E7rKiRxTnCjbYTMk8xZCAYDtEuA18JnrxcPHwELe7KYt
         49OQ==
X-Gm-Message-State: AOAM5336YfRZJ+qweFw64BTwXvqG96TovFxAqB7sjQ1gETl+6YiGxN0p
        IflKbAPH5CvS8r2gD5Qfp2y9ZoQ40btRvnxJ
X-Google-Smtp-Source: ABdhPJx329XRdoxBAbPy7Mfd6qduSNDgfG/Py2Wjhr5YxqJdBa75VGedE5IIhykN851GFW3LqMrVtg==
X-Received: by 2002:a63:8941:: with SMTP id v62mr306594pgd.183.1644254124071;
        Mon, 07 Feb 2022 09:15:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ot9sm12942662pjb.47.2022.02.07.09.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 09:15:23 -0800 (PST)
Message-ID: <620153ab.1c69fb81.4beb6.f8ee@mx.google.com>
Date:   Mon, 07 Feb 2022 09:15:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-02-07-v5.17-rc3
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: renesas/master sleep: 7 runs,
 3 regressions (renesas-devel-2022-02-07-v5.17-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 7 runs, 3 regressions (renesas-devel-2022-02-07-v5.17=
-rc3)

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
sas-devel-2022-02-07-v5.17-rc3/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-07-v5.17-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      1473d361292c53a189d07c296105887e45695417 =



Test Regressions
---------------- =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
hp-11A-G6-EE-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62013fbd4cef4ad5fe5d6f06

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-colla=
bora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/62013fbd4cef4=
ad5fe5d6f10
        new failure (last pass: renesas-devel-2022-02-02-v5.17-rc2)

    2022-02-07T15:49:06.682675  <6>[   34.716072] PM: suspend entry (deep)
    2022-02-07T15:49:06.686026  rtcwake: assuming RTC uses UTC ...
    2022-02-07T15:49:06.692441  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Feb  7 15:49:12 2022
    2022-02-07T15:49:06.699155  <6>[   34.723804] Filesystems sync: 0.000 s=
econds
    2022-02-07T15:49:06.702397  <6>[   34.728128] r8152 2-4:1.0 eth0: carri=
er on
    2022-02-07T15:49:06.712377  <6>[   34.741887] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2022-02-07T15:49:06.715730  <6>[   34.750741] OOM killer disabled.
    2022-02-07T15:49:07.740875  <6>[   34.754250] Freezing remaining freeza=
ble tasks ... (elapsed 1.017 seconds) done.
    2022-02-07T15:49:07.747326  <6>[   35.779857] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2022-02-07T15:49:07.848801   =

    ... (1150 line(s) more)  =

 =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
rk3288-rock2-square | arm    | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 2          =


  Details:     https://kernelci.org/test/plan/id/620152f08713ea96df5d6ef1

  Results:     2 PASS, 11 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-07-v5.17-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/620152f08713ea96=
df5d6efc
        new failure (last pass: renesas-devel-2022-01-31-v5.17-rc2)

    2022-02-07T17:12:06.653265  rtcwake: assuming RTC uses UTC ...
    2022-02-07T17:12:06.697931  rtcwake: read rt<4>[   15.571906] rtc-hym85=
63 0-0051: no valid clock/calendar values available
    2022-02-07T17:12:06.698519  c time failed: Invalid argument
    2022-02-07T17:12:06.699325  rtcwake: assuming RTC uses UTC .<4>[   15.5=
92383] rtc-hym8563 0-0051: no valid clock/calendar values available
    2022-02-07T17:12:06.699705  ..
    2022-02-07T17:12:06.700072  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/620152f08713ea96=
df5d6efd
        new failure (last pass: renesas-devel-2022-01-31-v5.17-rc2) =

 =20
