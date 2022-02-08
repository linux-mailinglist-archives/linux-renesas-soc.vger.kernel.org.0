Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3448C4AD7CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 12:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356416AbiBHLrq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 06:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345834AbiBHLrg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 06:47:36 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634F9C03E65C
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 03:35:24 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id p22-20020a17090adf9600b001b8783b2647so1795384pjv.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Feb 2022 03:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=unsPwH3aklCU1M7cRIZUqLNhuRWR8h8u7+I2kjwE4DM=;
        b=JP5ovrf9DN/o8bC8gjbTrsQyTqh9s+k9M25datr+Fpd4Y/niG2XAB3j+ZkSzQ40sg+
         gVsy0hn9dxnSI7qBRIJ9npEVTqEwiBhqaOm6tzfSwtu120tyK0tiWmNvlMICF0RskD2d
         EaE4+v0In68uNS9QoDN5nLt8pFMtxFqse140kek4boTLuMJZLcZ7Xp+khl1fvwXsZZxm
         R5Ut5YhSAl9OMj6tj0W715yIv88e/uZ8mDLk/r8Xy4luQk6HNEHVJun/wSNYemv4uqQN
         DtghY+kbvZuYInGBHfEGiWDYYEbRbegP61vLtiQDgVrYmmciURXZ2HlorEXqObwANDnZ
         Dm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=unsPwH3aklCU1M7cRIZUqLNhuRWR8h8u7+I2kjwE4DM=;
        b=0Xus7MU3pkflY6RlDvxCnsvBpN247GnBzgHh0qN4cakK2Y3BKdT6AVyuSyGuCzLKSo
         vIs4ldwAyPctj+5wjNtiL/+IMd9nz3eJfySTs65sR09mChXP4LqoqzjsG80NOFUO2bw+
         eusjLUbDpouka+hXRzv3rxQ6mqXuj9jevkZODEw7xmsmi/TmF+lTMuZHiwkYV4YoWblZ
         NmrzRJPwsddHXI/HcyfXWtikyMRKStMtwnNdFH3ZgPPTAPxBMDSfGuc9rtHT5rLzkzKr
         cXlcRTKDqWYkQy/gsdwH4xerzoNcN9UTVQinF2TsfuMA5Zppznnmnh5mhXxEBbRAVFi9
         Rs5g==
X-Gm-Message-State: AOAM530p6aHqraHXrDLWA9DwmREfkfC3H4rRRpYumJlAcu+3KY8qdjyV
        hZzal9bVvgqLyD0vnCqCkDaiuFOtoOvMve1I
X-Google-Smtp-Source: ABdhPJxJBbC0kFBa+fkedi+3fjGwjuVUd1ofhuvxiBHqAdcvmU3rwUFUZLP25Ax367JxNdPMVo0+gA==
X-Received: by 2002:a17:902:8d8c:: with SMTP id v12mr3982379plo.0.1644320123487;
        Tue, 08 Feb 2022 03:35:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 17sm16154056pfl.175.2022.02.08.03.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 03:35:23 -0800 (PST)
Message-ID: <6202557b.1c69fb81.c4a72.8d71@mx.google.com>
Date:   Tue, 08 Feb 2022 03:35:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-02-08-v5.17-rc3
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: renesas/master sleep: 2 runs,
 2 regressions (renesas-devel-2022-02-08-v5.17-rc3)
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

renesas/master sleep: 2 runs, 2 regressions (renesas-devel-2022-02-08-v5.17=
-rc3)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-08-v5.17-rc3/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-08-v5.17-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      429683cd533e19e9d252957b958c071b011dd88e =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 2          =


  Details:     https://kernelci.org/test/plan/id/6202434e3603b946755d6ef8

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-08-v5.17-rc3/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/6202434e3603b946=
755d6f01
        failing since 0 day (last pass: renesas-devel-2022-01-31-v5.17-rc2,=
 first fail: renesas-devel-2022-02-07-v5.17-rc3)

    2022-02-08T10:12:53.528743  rtcwake: assuming RTC uses UTC ...
    2022-02-08T10:12:53.528827  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Feb  8 10:13:00 2022
    2022-02-08T10:12:53.550572  <6>[   36.453000] PM: suspend entry (deep)
    2022-02-08T10:12:53.550730  <6>[   36.457506] Filesystems sync: 0.000 s=
econds
    2022-02-08T10:13:13.593842  <6>[   36.463412] Freezing user space proce=
sses ... =

    2022-02-08T10:13:13.594105  <3>[   56.469775] Freezing of tasks failed =
after 20.001 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-02-08T10:13:13.594224  <6>[   56.480257] task:systemd-udevd   stat=
e:D stack:    0 pid:  123 ppid:   120 flags:0x00000081
    2022-02-08T10:13:13.594331  <6>[   56.489990]  __schedule from schedule=
+0x48/0xd0
    2022-02-08T10:13:13.594432  <6>[   56.495463]  schedule from io_schedul=
e+0x34/0x44
    2022-02-08T10:13:13.594529  <6>[   56.500981]  io_schedule from folio_w=
ait_bit_common+0x1b4/0x30c =

    ... (15 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/6202434e3603b946=
755d6f02
        failing since 0 day (last pass: renesas-devel-2022-01-31-v5.17-rc2,=
 first fail: renesas-devel-2022-02-07-v5.17-rc3)

    2022-02-08T10:12:33.353487  rtcwake: assuming RTC uses UTC ...
    2022-02-08T10:12:33.353876  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Feb  8 10:12:39 2022
    2022-02-08T10:12:33.354297  <6>[   16.260902] PM: suspend entry (deep)
    2022-02-08T10:12:33.359898  <6>[   16.265708] Filesystems sync: 0.000 s=
econds
    2022-02-08T10:12:53.410910  <6>[   16.274648] Freezing user space proce=
sses ... =

    2022-02-08T10:12:53.411167  <3>[   36.291375] Freezing of tasks failed =
after 20.011 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-02-08T10:12:53.411287  <6>[   36.301851] task:systemd-udevd   stat=
e:D stack:    0 pid:  123 ppid:   120 flags:0x00000081
    2022-02-08T10:12:53.411394  <6>[   36.311596]  __schedule from schedule=
+0x48/0xd0
    2022-02-08T10:12:53.411503  <6>[   36.317069]  schedule from io_schedul=
e+0x34/0x44
    2022-02-08T10:12:53.411617  <6>[   36.322578]  io_schedule from folio_w=
ait_bit_common+0x1b4/0x30c =

    ... (15 line(s) more)  =

 =20
