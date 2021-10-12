Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44D042AADB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 19:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhJLRf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 13:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhJLRf2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 13:35:28 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921FAC061570
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 10:33:26 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id d23so2614983pgh.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=N1MeuV8CmOb5IelMC0H/t9IxD7Jd0lxVJBrVZYpLINI=;
        b=u6bnIGg0cZ259qQIzn1L35pzC4yuXrBIpzLI/RkFpVWgN9lIfDJg2VUj+EAEEWlwIm
         KGvaSv51ZVNtzPxa6auDrG+OONOV5MIOG5U3FvF/UT+XfbxjHSoaUsrQfjDwwu6dPvVk
         FTceKVXUrFhmvWYZ9zrev/RSB/JYqXAdifGP8QNe3rSVtVI+m1knHK9zcMsO2AZ2D4ZM
         nMmpo7KE32iJpStQ8Cn4uFX3WUL8LlPk1hnG8mb4+lWGv9zBFXPowYloXQ+ShY7Yd4zr
         SphSnxy5ozWZ4zGEaoJrVM5ZOfFRjFBPAlJMeR1h3XYQ4MdUfVpoOobhNP+yxHbQw9FF
         ECJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=N1MeuV8CmOb5IelMC0H/t9IxD7Jd0lxVJBrVZYpLINI=;
        b=Sa/pNTvY7B4HNnSOKtqL/pYpLwWw19a29L17OW7/P+jLeiC/Uo28yy5sAKHr3ZZ8aT
         F4qRP7ujDeQEMxdr7EpHROPZCD4F4asZD052h0UMUiBiH759lMhzVjbaWDvn8Xx4Z1UJ
         PYlB13PnqYWet5dEgNJ2U2Chs8hajD/AylXcH/+xOaky+xDNDxOtwsEYKl9c128HQO28
         pEMYlYzmsgAqT2Vv249Dy6F2CQRLUNpTvo82wQmyX8e4OEHuoSdeSUCN7VvZYiYqvLsk
         9A7lbffconIobNu+iSR+gg+EpYH9Nm9mV+6/5+mqUvHjWMCjpimWLg+oTYrWBVs8wfe/
         kRtA==
X-Gm-Message-State: AOAM530Y0DVwyGPojSgQvhPL0mDkjFau3W5bQhJmSpQN/GNEFobsV8Fl
        Y5BRKhPt88dFkkeRJkFsO1GF67gElUY+iFmz
X-Google-Smtp-Source: ABdhPJxJmmvov+uAYClxUOmyvrz0W1ct2o09CN97Sk/ebHheTPMIDq2vwsD5MLIurLJrDQVjiphaIg==
X-Received: by 2002:a05:6a00:1c60:b0:44c:def1:a66b with SMTP id s32-20020a056a001c6000b0044cdef1a66bmr26051761pfw.7.1634060005935;
        Tue, 12 Oct 2021 10:33:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c9sm11728663pgq.58.2021.10.12.10.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 10:33:25 -0700 (PDT)
Message-ID: <6165c6e5.1c69fb81.25209.10a7@mx.google.com>
Date:   Tue, 12 Oct 2021 10:33:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-10-11-v5.15-rc5
Subject: renesas/master sleep: 5 runs,
 3 regressions (renesas-devel-2021-10-11-v5.15-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 5 runs, 3 regressions (renesas-devel-2021-10-11-v5.15=
-rc5)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-10-11-v5.15-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-10-11-v5.15-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6e602e69ec04a3e0887e4fd9189250b4e7ee7e23 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 3          =


  Details:     https://kernelci.org/test/plan/id/6165abb74f445e127d08fade

  Results:     2 PASS, 12 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-10-11-v5.15-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1008.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/6165abb74f445e12=
7d08fae9
        new failure (last pass: renesas-devel-2021-10-08-v5.15-rc4)

    2021-10-12T15:37:22.613108  rtcwake: assuming RTC uses UTC ...
    2021-10-12T15:37:22.658756  <4>[   14.439956] rtc-hym8563 0-0051: no va=
lid clock/calendar values available
    2021-10-12T15:37:22.659113  rtcwake: read rtc time failed: Invalid argu=
ment
    2021-10-12T15:37:22.659658  rtcwake: assumin<4>[   14.460750] rtc-hym85=
63 0-0051: no valid clock/calendar values available
    2021-10-12T15:37:22.659911  g RTC uses UTC ...
    2021-10-12T15:37:22.660154  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/6165abb74f445e12=
7d08faea
        new failure (last pass: renesas-devel-2021-10-08-v5.15-rc4)

    2021-10-12T15:37:22.521622  SULT=3Dpass>
    2021-10-12T15:37:22.562334  rtcwake: assuming RTC uses UTC ...
    2021-10-12T15:37:22.562609  rtcwake: read rtc time failed: Invalid argu=
ment
    2021-10-12T15:37:22.563034  _ID=3Drtcwake-mem-1 RESULT=3Dfail>
    2021-10-12T15:37:22.563229  rtcwake: assuming RTC uses UTC ...
    2021-10-12T15:37:22.563420  rtcwake: read rtc time failed: Invalid argu=
ment
    2021-10-12T15:37:22.563802  L_TESTCASE TEST_CASE_ID=3Drtcwake-mem-2 RES=
ULT=3Dfail>
    2021-10-12T15:37:22.563985  rtcwake: assuming RTC uses UTC ...
    2021-10-12T15:37:22.610740  rtcwake: read rtc time failed: Invalid a<4>=
[   14.400648] rtc-hym8563 0-0051: no valid clock/calendar values available
    2021-10-12T15:37:22.611165  rgument =

    ... (3 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/6165abb74f445e12=
7d08faeb
        new failure (last pass: renesas-devel-2021-10-08-v5.15-rc4) =

 =20
