Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A025409F39
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 23:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345228AbhIMVhD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 17:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344964AbhIMVhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 17:37:01 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04BE7C061760
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 14:35:45 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id r2so10662778pgl.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 14:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sEAViIXM8esNyoN5dktge0Zm6xwFOFH47VbLeofIkJk=;
        b=iDXFDfiK1rjWDAWEo0qxIBGVJVMp7cjrb8G+Nkw0A933ZY3ZrdDS2nq5XkwCLLUt1i
         bcS9FLwj4ZYkTbMfThQjjefLcfQzGiLZMLRrIU8bhrahH7xPquqzQzNu6y5UzrtZBHTw
         S5vmrvjOQD1XDi/b0Imy8Zcl81aKWzUq6Z+0PoQxLgpf/JHorT0UQikZyROlCeNYagii
         cGb9I/zTul0W8h5gqErJYfJQoxyDE3OC+txzMAYrv/THTCUJIuabbn1WUukaUezTJROU
         EimjCua7U4/ga7w3QoM5R/+oMdL8THwrtRwOzxNuTP0xbapnrl5G2N6XnuLYBe4vXEvb
         KTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sEAViIXM8esNyoN5dktge0Zm6xwFOFH47VbLeofIkJk=;
        b=bcQMAJk9+4l2umQUtBZUL/F9tQ2sIqTP3ACaWXqK1Wiyuz9C5pWTcjqSnqSEFo4BnU
         IntyEokvKWavsHiKakI17qDKk9G5wRuraa3r59G/hrlvciSyD8x7Mq1Js/Ulwj2yCqiI
         5P60WUHnK8TsFs6m7lFa03JEkmB3NUztb+O55qfZkgwz+uZDvmLaAraklDcFOhN0+HaU
         VN38JiNxJ+o2nAKx1rwiXRbthr/kTf++jnOnmM3RdkVV9S66dz1LOVRx3YMINfS2uRdu
         IZD4rpyuYvxUs+j7BHuQ3EXldeSLxgh6bhZ6O/NPVeZdKSnui014KlztWvfGB5Sst117
         7+Rg==
X-Gm-Message-State: AOAM5328yGrwjqSfnPRhIFkGQIqA23o0W+sIaE6tQ3tWqwrSEI7caILL
        J84mM6k3wWfmvXDc5lGzQZdeRrnu8zuMT9s4
X-Google-Smtp-Source: ABdhPJzh3b5RvDxtsUGxvGqnORhH/UQXKQTJj8WxpzxrbMl2RZneHaW/FxTibzHJlzzzA/DJlZIl1w==
X-Received: by 2002:a05:6a00:1881:b0:3fa:7d56:c611 with SMTP id x1-20020a056a00188100b003fa7d56c611mr1403729pfh.8.1631568944391;
        Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x13sm4762590pfp.133.2021.09.13.14.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
Message-ID: <613fc430.1c69fb81.235b4.e867@mx.google.com>
Date:   Mon, 13 Sep 2021 14:35:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-39-gcbbd8f16ae1c
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next sleep: 5 runs, 1 regressions (v5.15-rc1-39-gcbbd8f16ae1c)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 5 runs, 1 regressions (v5.15-rc1-39-gcbbd8f16ae1c)

Regressions Summary
-------------------

platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.15-=
rc1-39-gcbbd8f16ae1c/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: v5.15-rc1-39-gcbbd8f16ae1c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cbbd8f16ae1c24d6f82712bf5ef798a8a62b0233 =



Test Regressions
---------------- =



platform           | arch   | lab           | compiler | defconfig         =
           | regressions
-------------------+--------+---------------+----------+-------------------=
-----------+------------
hp-11A-G6-EE-grunt | x86_64 | lab-collabora | gcc-8    | x86_64_defcon...6-=
chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/613fad8f36c13fe9ed99a308

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/sleep-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.15-rc1-39-gcbb=
d8f16ae1c/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/sleep-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0827.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/613fad8f36c13=
fe9ed99a312
        new failure (last pass: renesas-next-2021-08-12-v5.14-rc1)

    2021-09-13T19:57:56.174584  rtcwake: assuming RTC uses UTC ...
    2021-09-13T19:57:56.181914  rtcwake: wakeup from \"freeze\" using rtc0 =
at Mon Sep 13 19:58:02 2021
    2021-09-13T19:57:56.184912  <6>[   34.707833] PM: suspend entry (deep)
    2021-09-13T19:57:56.188838  <6>[   34.709189] r8152 2-4:1.0 eth0: carri=
er on
    2021-09-13T19:57:56.193214  <6>[   34.717818] Filesystems sync: 0.000 s=
econds
    2021-09-13T19:57:56.201436  <6>[   34.726985] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-09-13T19:57:56.205232  <6>[   34.735348] OOM killer disabled.
    2021-09-13T19:57:57.246642  <6>[   34.738845] Freezing remaining freeza=
ble tasks ... (elapsed 1.039 seconds) done.
    2021-09-13T19:57:57.253857  <6>[   35.780327] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2021-09-13T19:57:57.353093   =

    ... (1151 line(s) more)  =

 =20
