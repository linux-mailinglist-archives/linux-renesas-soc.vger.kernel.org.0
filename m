Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1345A46C399
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 20:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhLGT3O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 14:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhLGT3O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 14:29:14 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F59FC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Dec 2021 11:25:43 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id gt5so232238pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Dec 2021 11:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SoGCLfSNfYJuDoARmJhbteJfva21JShIYZ0yGIkfq6E=;
        b=IaSSbdM7ux12xr7QzqIc7onSfG4Vlw9kAEsvmN6f+VI4bEli0WEyxLoq4/sCfOka6R
         8Iddz9VFwinaUK3QdnuaXpXsPZ+xnbnjpC8FJirx1AVD/32UH9lnDg3pf97jd+DrSIS5
         IAdRPdvUVM1amZ98+6BrBS9XiUjcYgQL1jtZoX7gciBZVfsnUMzd4kFsB7bi/F6G469Y
         PSfXYDtX6sSCjWsQLZGxcXNKPRVOEJwLVJZBw6UZdcF99sAIUexqUPdkCnRFoJXFEIck
         8+bbIDRavzcyysMkYTpjig4yk8Q6I/6JZVImMopGlV1wmnX2razegJWUwEXylTkZB3id
         bf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SoGCLfSNfYJuDoARmJhbteJfva21JShIYZ0yGIkfq6E=;
        b=w5fqHHeVqXurJDop5HCpIT27LYVusRIU++rOwbf77hxM8GW2bfjM6cBi5b35rjUUTy
         y5BrNudonyxmtckq5BOXafrai7e+PQmYP3FC8eb+dPnmdjVdnqEm5TqVQJ3h0e6bhcQq
         plP8wwcygrAxIEdkUnmApGuNT8yOwvze+GY9WTHDTbUC4XFz9U6pJ7M9lKtJnLPaK9XJ
         Gj5Jg3cG6aC7AbXuDFv/TW8TWfaXD+mupQOYnEfTimPTBvugYGqL5m8z95sKZtyRp4/3
         8/Y+LiGC7rb2K6CbpZZrUkouyy+UKiV7uEFjJM/XJT8pwl4vos8YhX35CVBCGiUCfqaW
         N3Dg==
X-Gm-Message-State: AOAM530auFStyJ/F8xIu+1ICZGwsalXxFjE6LuheLeOkDbGB0nf2LOVh
        GIlCwxqiIPa4KZRx9odFC/hobnEBR+Qbg+Ii
X-Google-Smtp-Source: ABdhPJwVHimT8TTBSOtNBt/Qv3SJGN3QyAtQ9BM48r625EbZuFqghZis/eaF0+6M8VctbKYbU13F6w==
X-Received: by 2002:a17:90b:4d0e:: with SMTP id mw14mr1241766pjb.43.1638905142917;
        Tue, 07 Dec 2021 11:25:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x9sm3553061pjq.50.2021.12.07.11.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 11:25:42 -0800 (PST)
Message-ID: <61afb536.1c69fb81.da66a.a816@mx.google.com>
Date:   Tue, 07 Dec 2021 11:25:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next sleep: 6 runs,
 3 regressions (renesas-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 6 runs, 3 regressions (renesas-next-2021-11-30-v5.16-rc=
1-14-g0940300f8e1d)

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


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-11-30-v5.16-rc1-14-g0940300f8e1d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0940300f8e1df4451b3a5c9e079a74cacc6b854d =



Test Regressions
---------------- =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
hp-11A-G6-EE-grunt  | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...6=
-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61afa2f4e45776ce911a9486

  Results:     22 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1-14-g0940300f8e1d/x86_64/x86_64_defconfig+x86-chromebook/gc=
c-10/lab-collabora/sleep-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1-14-g0940300f8e1d/x86_64/x86_64_defconfig+x86-chromebook/gc=
c-10/lab-collabora/sleep-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211203.0/amd64/rootfs.cpio.gz =



  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/61afa2f4e4577=
6ce911a9490
        new failure (last pass: renesas-next-2021-11-26-v5.16-rc1) =

 =



platform            | arch   | lab           | compiler | defconfig        =
            | regressions
--------------------+--------+---------------+----------+------------------=
------------+------------
rk3288-rock2-square | arm    | lab-collabora | gcc-10   | multi_v7_defconfi=
g           | 2          =


  Details:     https://kernelci.org/test/plan/id/61afa2cea2eec9d1cb1a94a2

  Results:     2 PASS, 11 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1-14-g0940300f8e1d/arm/multi_v7_defconfig/gcc-10/lab-collabo=
ra/sleep-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1-14-g0940300f8e1d/arm/multi_v7_defconfig/gcc-10/lab-collabo=
ra/sleep-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211203.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61afa2cea2eec9d1=
cb1a94ad
        failing since 7 days (last pass: renesas-next-2021-11-19-v5.16-rc1,=
 first fail: renesas-next-2021-11-30-v5.16-rc1)

    2021-12-07T18:01:58.959432  SULT=3Dpass>
    2021-12-07T18:01:59.003316  rtcwake: assuming RTC uses UTC ...
    2021-12-07T18:01:59.003900  rtcwake: read rt<4>[   18.048248] rtc-hym85=
63 0-0051: no valid clock/calendar values available
    2021-12-07T18:01:59.004355  c time failed: Invalid argument
    2021-12-07T18:01:59.005057  _ID=3Drtcwake-mem-1 RESULT=3Dfail>
    2021-12-07T18:01:59.005379  rtcwake: assuming RTC uses UTC ...
    2021-12-07T18:01:59.005700  rtcwake: read rtc time failed: Invalid argu=
ment
    2021-12-07T18:01:59.051506  L_TESTCASE TEST_CASE_ID=3Drtcwake-mem-2 RES=
ULT=3Dfail>
    2021-12-07T18:01:59.052100  rtcwake: assuming RTC uses UTC ...
    2021-12-07T18:01:59.052539  rtcwake: read rtc time failed: Invalid argu=
ment =

    ... (2 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/61afa2cea2eec9d1=
cb1a94ae
        failing since 7 days (last pass: renesas-next-2021-11-19-v5.16-rc1,=
 first fail: renesas-next-2021-11-30-v5.16-rc1) =

 =20
