Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1979442F1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Nov 2021 14:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhKBNgT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Nov 2021 09:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhKBNgS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 09:36:18 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09573C061714
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Nov 2021 06:33:44 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id m26so19564779pff.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Nov 2021 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JLvxycX103v45PCt5e5vp0+5RnLSC+O73ukT7KU72Rs=;
        b=VZ3pKZqiAh1EYKf1OieaHo5vpNIAptz1+jJ1ZmlDzB7I1nHlMZ7AxfEs11NU7aDVI5
         gwgyPj/M4D4w57HfIfwiMJZaz9NAs9ds92wsAp1ufL0CtgDVVt+DMsPYAJowPESePIpj
         i3DVqlZWt/w1d0EHl3OCoDo9SecXdmMuaLRKixH8pu6c2Tnbft+DcSpz1IJXklfwes2C
         IOivZiNq8eDNCqQwMlGg8o3ULn+D8sK0/cDbOjRwBl9gU4CTSQm54PjtLXzmiJwKFh5+
         Z3VEJAFpMqcfZIDbza2/daxAls78kMcUmLVsbuhCeAE+uJO0mqYMOVE4CLcgLVZS4+Oe
         tvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JLvxycX103v45PCt5e5vp0+5RnLSC+O73ukT7KU72Rs=;
        b=w2CCZogTXbtWBYoB0N7PwvmdRF+rXKOCkIrDKhwnK3A1Uyo+YWiVfLJ++za4eOCW65
         +V119EM2ncqkI+onMBlAkLefhSlhAePLXXW5PcbJK5og2FespsGkeh+8vEeolTRWNOmq
         aZvbxf3oasOk2gNa9gLTOOZezqppnXd67A0kGQhS9MScTfMwl3KYvoSHNtHhmql7d5ES
         XSFiU7/9KmcdU6zPV28crqDNOuae4QiOmP+Y2KCzup+OfKQ5tHD5GBHMEBvi/hTHwJWj
         brlmOK8KVJXU7XLkeca+WIw/ZzrkmEXy+Ihryd/FCktAxDF6xOZu1CGtIrYGzkbCG5nx
         02yw==
X-Gm-Message-State: AOAM533BAD2tdi3kSB35Y37XAJRyX4BtGSrxcD/IeI81P3qPBwUkPlrg
        fbIPBappAJiIhhAbP5a0n2lpQsThYZvdvexx
X-Google-Smtp-Source: ABdhPJwmHUxA6ngTLSxBzza7gCBqfi69x3oJY6Ktr+oXDEsLP4tCOBwnYi2zqGk8Mv+cpeImWzH3pQ==
X-Received: by 2002:a63:2cca:: with SMTP id s193mr27631570pgs.240.1635860023414;
        Tue, 02 Nov 2021 06:33:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 1sm18722313pfm.163.2021.11.02.06.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 06:33:43 -0700 (PDT)
Message-ID: <61813e37.1c69fb81.8ba32.490e@mx.google.com>
Date:   Tue, 02 Nov 2021 06:33:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-11-02-v5.15
X-Kernelci-Report-Type: test
Subject: renesas/master sleep: 9 runs,
 1 regressions (renesas-devel-2021-11-02-v5.15)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 9 runs, 1 regressions (renesas-devel-2021-11-02-v5.15)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-02-v5.15/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-02-v5.15
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ee746325c55436cdf9cd64a0a06a190fe72678b5 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/618129317afb4b6b743358e9

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-02-v5.15/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-02-v5.15/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1030.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-10: https://kernelci.org/test/case/id/618129317afb4b6=
b743358f5
        new failure (last pass: renesas-devel-2021-10-26-v5.15-rc7)

    2021-11-02T12:02:22.905824  rtcwake: assuming RTC uses UTC ...
    2021-11-02T12:02:22.909732  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Nov  2 12:02:28 2021
    2021-11-02T12:02:22.920969  <6>[   27.339160] PM: suspend entry (deep)
    2021-11-02T12:02:22.925187  <6>[   27.343031] Filesystems sync: 0.000 s=
econds
    2021-11-02T12:02:22.934420  <6>[   27.347865] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-11-02T12:02:22.937405  <6>[   27.356412] OOM killer disabled.
    2021-11-02T12:02:24.342674  <6>[   27.359942] Freezing remaining freeza=
ble tasks ... (elapsed 1.453 seconds) done.
    2021-11-02T12:02:24.349916  <6>[   28.764880] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2021-11-02T12:02:24.451506  =

    2021-11-02T12:02:24.451718   =

    ... (1146 line(s) more)  =

 =20
