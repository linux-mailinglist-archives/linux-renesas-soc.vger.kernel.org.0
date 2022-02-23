Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3974C06F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 02:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236590AbiBWBhj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Feb 2022 20:37:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiBWBhh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 20:37:37 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00C44E388
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 17:37:10 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id em10-20020a17090b014a00b001bc3071f921so716641pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 17:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t32DOj5M+nELmSnzzgpgn/c2zRbEjH6Ef0K2kIkwoP4=;
        b=g/TV1aDE+3l04iiu+FowahVplX3yoamWXgywYeEAb73RFVUgSHdYvNhbKo8G2n0iR0
         jjQTj1C2RZBV7JPdE2bAVcW9NEO4oChTc8Iyghwwk/R8eGGnivV8ZlEPxw5lciKAx2x2
         nHsV/O3odI9ihkW7PBmIyrCYMLQHjPXKU+2GxHSTsi5UFbdyFEBOW4Qi6dukMLvBCOHB
         bwXihqnsOAJSlezgeHsRiwF8xpfJ8Mw1A+T2a5yl7pEaamAILV5yQlQGWUE2sNDEWep9
         f99+k0ZA/J8ocONnaVXmAqeKfp6EkwsOtyIKC8NMzsBFofz4s/b+hGGluFmDTqs6kWlM
         h/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t32DOj5M+nELmSnzzgpgn/c2zRbEjH6Ef0K2kIkwoP4=;
        b=jMHAs0ZzcpfQcnQXJJXyBtKA1OkLz/syA0jAgRpFAvz+ncBTvvnCaj0yNZ93YpByEB
         zwcRjao7GGOl6T25YxLFRbdd2mV5vQKDXe64lDuLMtCEbnGmsYbT1E/7Uuj9n0UejJ3v
         vKRoH1G/wusjbJ4+L9Y8G9qiSZD9D6RXERxmZthGFU6gQQeZEzsJ6opDTJQy7bqXgnQy
         /5fLXH99AKrK2hZQJHgeuxAzG9oeqO0hJOc9MhaeGFcmls8cni82hR6sD9JSJG2O6XFi
         VMoprgz0v2gzXuB31Gagu23bKTZngSE1CtO+gTGaVgj4paFyCByU+wz78F3uL9eGn7ed
         i55g==
X-Gm-Message-State: AOAM532fzqHYfmHACzvg8gkOLz83c7yddP/azAPtWU8Spl022b/LU2f9
        y1c/bbpjhX1ZrG0tBUYqwgfv09NaOa9EmT+7
X-Google-Smtp-Source: ABdhPJwUX8HDtGRBO6Mbj+BJmR3d6zHPk0UZhC4zYzHa+QG3wldb5KusVh1TKX9+iwMIzypVEkbTKw==
X-Received: by 2002:a17:902:b208:b0:14f:14e8:1e49 with SMTP id t8-20020a170902b20800b0014f14e81e49mr25159569plr.35.1645580229853;
        Tue, 22 Feb 2022 17:37:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q21sm18398897pfu.188.2022.02.22.17.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 17:37:09 -0800 (PST)
Message-ID: <62158fc5.1c69fb81.2eebf.1f86@mx.google.com>
Date:   Tue, 22 Feb 2022 17:37:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-22-v5.17-rc5
Subject: renesas/master sleep: 7 runs,
 5 regressions (renesas-devel-2022-02-22-v5.17-rc5)
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

renesas/master sleep: 7 runs, 5 regressions (renesas-devel-2022-02-22-v5.17=
-rc5)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 5          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-22-v5.17-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-22-v5.17-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      764d9473182a7a0e7d0fd7f57c5157204abc9dba =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 5          =


  Details:     https://kernelci.org/test/plan/id/621588a4f906494530c6296c

  Results:     3 PASS, 9 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk328=
8-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/621588a4f9064945=
30c6296f
        new failure (last pass: renesas-devel-2022-02-21-v5.17-rc5)

    2022-02-23T01:02:51.720572  rtcwake: assuming RTC uses UTC ...
    2022-02-23T01:02:51.720891  rtcwake: wakeup from \"mem\" using rtc0 at =
Wed Feb 23 01:02:58 2022
    2022-02-23T01:02:51.740084  <6>[   96.726207] PM: suspend entry (deep)
    2022-02-23T01:02:51.740599  <6>[   96.730589] Filesystems sync: 0.000 s=
econds
    2022-02-23T01:03:11.793998  <6>[   96.736343] Freezing user space proce=
sses ... =

    2022-02-23T01:03:11.794756  <3>[  116.757631] Freezing of tasks failed =
after 20.015 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-02-23T01:03:11.795191  <6>[  116.768180] task:systemd-udevd   stat=
e:D stack:    0 pid:  128 ppid:   116 flags:0x00000081
    2022-02-23T01:03:11.795578  <6>[  116.778031]  __schedule from schedule=
+0x48/0xd0
    2022-02-23T01:03:11.795935  <6>[  116.783491]  schedule from io_schedul=
e+0x34/0x44
    2022-02-23T01:03:11.796278  <6>[  116.789088]  io_schedule from folio_w=
ait_bit_common+0x1b4/0x30c =

    ... (15 line(s) more)  =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/621588a4f9064945=
30c62970
        new failure (last pass: renesas-devel-2022-02-21-v5.17-rc5)

    2022-02-23T01:02:31.541359  rtcwake: assuming RTC uses UTC ...
    2022-02-23T01:02:31.541674  rtcwake: wakeup from \"mem\" using rtc0 at =
Wed Feb 23 01:02:38 2022
    2022-02-23T01:02:31.563126  <6>[   76.546622] PM: suspend entry (deep)
    2022-02-23T01:02:31.563625  <6>[   76.551101] Filesystems sync: 0.000 s=
econds
    2022-02-23T01:02:51.609382  <6>[   76.558574] Freezing user space proce=
sses ... =

    2022-02-23T01:02:51.610014  <3>[   96.573336] Freezing of tasks failed =
after 20.009 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-02-23T01:02:51.610605  <6>[   96.583812] task:systemd-udevd   stat=
e:D stack:    0 pid:  128 ppid:   116 flags:0x00000081
    2022-02-23T01:02:51.611002  <6>[   96.593551]  __schedule from schedule=
+0x48/0xd0
    2022-02-23T01:02:51.611370  <6>[   96.598984]  schedule from io_schedul=
e+0x34/0x44
    2022-02-23T01:02:51.611720  <6>[   96.604479]  io_schedule from folio_w=
ait_bit_common+0x1b4/0x30c =

    ... (15 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/621588a4f9064945=
30c62971
        new failure (last pass: renesas-devel-2022-02-21-v5.17-rc5)

    2022-02-23T01:02:11.357827  rtcwake: assuming RTC uses UTC ...
    2022-02-23T01:02:11.358252  rtcwake: wakeup from \"mem\" using rtc0 at =
Wed Feb 23 01:02:17 2022
    2022-02-23T01:02:11.378552  <6>[   56.364015] PM: suspend entry (deep)
    2022-02-23T01:02:11.379054  <6>[   56.368539] Filesystems sync: 0.000 s=
econds
    2022-02-23T01:02:31.427918  <6>[   56.375044] Freezing user space proce=
sses ... =

    2022-02-23T01:02:31.428553  <3>[   76.391471] Freezing of tasks failed =
after 20.010 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-02-23T01:02:31.428989  <6>[   76.401930] task:systemd-udevd   stat=
e:D stack:    0 pid:  128 ppid:   116 flags:0x00000081
    2022-02-23T01:02:31.429360  <6>[   76.411684]  __schedule from schedule=
+0x48/0xd0
    2022-02-23T01:02:31.429708  <6>[   76.417125]  schedule from io_schedul=
e+0x34/0x44
    2022-02-23T01:02:31.434345  <6>[   76.422622]  io_schedule from folio_w=
ait_bit_common+0x1b4/0x30c =

    ... (15 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/621588a4f9064945=
30c62974
        new failure (last pass: renesas-devel-2022-02-21-v5.17-rc5)

    2022-02-23T01:01:51.170589  rtcwake: assuming RTC uses UTC ...
    2022-02-23T01:01:51.170916  rtcwake: wakeup from \"mem\" using rtc0 at =
Wed Feb 23 01:01:57 2022
    2022-02-23T01:01:51.190428  <6>[   36.175974] PM: suspend entry (deep)
    2022-02-23T01:01:51.190921  <6>[   36.180360] Filesystems sync: 0.000 s=
econds
    2022-02-23T01:02:11.242284  <6>[   36.186136] Freezing user space proce=
sses ... =

    2022-02-23T01:02:11.243302  <3>[   56.204680] Freezing of tasks failed =
after 20.013 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-02-23T01:02:11.243960  <6>[   56.215109] task:systemd-udevd   stat=
e:D stack:    0 pid:  128 ppid:   116 flags:0x00000081
    2022-02-23T01:02:11.244336  <6>[   56.224841]  __schedule from schedule=
+0x48/0xd0
    2022-02-23T01:02:11.244685  <6>[   56.230250]  schedule from io_schedul=
e+0x34/0x44
    2022-02-23T01:02:11.245020  <6>[   56.235772]  io_schedule from folio_w=
ait_bit_common+0x1b4/0x30c =

    ... (15 line(s) more)  =


  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/621588a4f9064945=
30c62975
        new failure (last pass: renesas-devel-2022-02-21-v5.17-rc5)

    2022-02-23T01:01:30.987425  rtcwake: assuming RTC uses UTC ...
    2022-02-23T01:01:30.987761  rtcwake: wakeup from \"mem\" using rtc0 at =
Wed Feb 23 01:01:37 2022
    2022-02-23T01:01:30.988092  <6>[   15.983475] PM: suspend entry (deep)
    2022-02-23T01:01:30.998983  <6>[   15.988324] Filesystems sync: 0.000 s=
econds
    2022-02-23T01:01:51.050929  <6>[   15.999288] Freezing user space proce=
sses ... =

    2022-02-23T01:01:51.051541  <3>[   36.013959] Freezing of tasks failed =
after 20.009 seconds (1 tasks refusing to freeze, wq_busy=3D0):
    2022-02-23T01:01:51.051936  <6>[   36.024397] task:systemd-udevd   stat=
e:D stack:    0 pid:  128 ppid:   116 flags:0x00000081
    2022-02-23T01:01:51.052297  <6>[   36.034125]  __schedule from schedule=
+0x48/0xd0
    2022-02-23T01:01:51.052642  <6>[   36.039534]  schedule from io_schedul=
e+0x34/0x44
    2022-02-23T01:01:51.052979  <6>[   36.045065]  io_schedule from folio_w=
ait_bit_common+0x1b4/0x30c =

    ... (15 line(s) more)  =

 =20
