Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E29C2303452
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 06:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732356AbhAZFWo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 00:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730739AbhAZBpG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 20:45:06 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DA7C061352
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 16:34:31 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id f63so9379662pfa.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 16:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=S6nUAsHk6M6NpgFKfensnpscv7/aEFW1lTbh+kp3Psw=;
        b=JUKCrGmUrMOZZxVUgIIgOM8AT3LdccKNGdQvHw/wFc2AirCBZUhndj06S3uk7QT5tS
         nX4aFD6sOD+8ADWrL7q5PFWJ6RQye87DJyMaNbGH8ZXLBDYAJmICUabKWIiuRiITYsht
         EM1dOOijxvQ8GCqpforPbghSfs2Li2PTQ2+kTcokOJnmrq5Uxf/N55vRCfDtYS/3DdiO
         QnHoBVFw84hCC10ri5yHv9Bn/KapHmhBF2hVTJYLR/0Khr18yx3ytqOJhlzHVPG+5i0q
         +JwM2o8o5OsOCo6QOjrcF4Kk1oZel+lsF5UD8536tM4TI86kcN/dX752pvT0Z/c6lo0i
         FFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=S6nUAsHk6M6NpgFKfensnpscv7/aEFW1lTbh+kp3Psw=;
        b=NLOt0ecRyfM+6tdSQYcLX5qtOW8a6AUlwSdhJCfo8ZhM+Os8lyZDtu29BRbf/Iqio9
         WimfEa6PI1iHzSSISAt0pKT7thcL4+Hip2CoA3e0nigHppmt7sAIICc6i1CMSi4wj5B9
         gDYefUG1jWZ0Of2S/+JeN8RP1A1DLKDPmwq5F2a7MHo+TJbAzXb/QX6sK+pVkuKJiMoy
         SZp6YGDkej0kSfx5vW7KrkaQL1mjGK1wQfjztt2YhdgYZRjpRY2CPEERz5pmVQ7oXtuw
         8rxIDEOg9TxsQCn9NGHWCZNkgPgPVD9juWVoMLM/4DpV1lGuNgJeSs4509j38F0vYCq2
         aPag==
X-Gm-Message-State: AOAM533u1l+u801ZAI8EAP/B8Buec+msbIeYwn/D0JYTTPUrUJeZCcUi
        C4ajHFuhzflVf4xwlwIZd5t8NMYbMQVgZdOE
X-Google-Smtp-Source: ABdhPJxrqC+QMm4eRkvubLrw31DAtFwYPAu86FlNv3XvRxVzosLVKCVs2uGJH9CZwwoicwwzBlooVA==
X-Received: by 2002:a65:534c:: with SMTP id w12mr3031315pgr.179.1611621270832;
        Mon, 25 Jan 2021 16:34:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y11sm10234224pff.93.2021.01.25.16.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 16:34:30 -0800 (PST)
Message-ID: <600f6396.1c69fb81.aa9a1.855b@mx.google.com>
Date:   Mon, 25 Jan 2021 16:34:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-01-25-v5.11-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master sleep: 4 runs,
 3 regressions (renesas-devel-2021-01-25-v5.11-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 4 runs, 3 regressions (renesas-devel-2021-01-25-v5.11=
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
sas-devel-2021-01-25-v5.11-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-01-25-v5.11-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      70d43ed7025970798f753542ddce0e4eda7abcbf =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 3          =


  Details:     https://kernelci.org/test/plan/id/600f52876340b624b6d3dfcd

  Results:     2 PASS, 11 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0125.1/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/600f52876340b624=
b6d3dfd0
        new failure (last pass: v5.11-rc4-383-g822f1d4bfbf2)

    2021-01-25 23:21:38.122000+00:00  ake: assuming RTC uses UTC ...
    2021-01-25 23:21:38.123000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-01-25 23:21:38.123000+00:00  1 RESULT=3Dfail>
    2021-01-25 23:21:38.123000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-01-25 23:21:38.123000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-01-25 23:21:38.123000+00:00  CASE_ID=3Drtcwake-mem-2 RESULT=3Dfail>
    2021-01-25 23:21:38.124000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-01-25 23:21:38.171000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-01-25 23:21:38.172000+00:00  IGNAL_TESTCASE TEST_CASE_ID=3Drtcwake=
-mem-3 RESULT=3Dfail>
    2021-01-25 23:21:38.172000+00:00  rtcwake: assuming RTC uses UTC ... =

    ... (2 line(s) more)  =


  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/600f52876340b624=
b6d3dfd1
        new failure (last pass: v5.11-rc4-383-g822f1d4bfbf2)

    2021-01-25 23:21:38.219000+00:00  rtcwake: read rt<4>[   19.514693] rtc=
-hym8563 0-0051: no valid clock/calendar values available
    2021-01-25 23:21:38.220000+00:00  c time failed: Invalid argument
    2021-01-25 23:21:38.220000+00:00  rtcwake: assuming RTC uses UTC .<4>[ =
  19.534971] rtc-hym8563 0-0051: no valid clock/calendar values available
    2021-01-25 23:21:38.220000+00:00  ..
    2021-01-25 23:21:38.221000+00:00  rtcwake: read rtc time failed: Invali=
d argument   =


  * sleep.rtcwake-mem-6: https://kernelci.org/test/case/id/600f52876340b624=
b6d3dfd2
        new failure (last pass: v5.11-rc4-383-g822f1d4bfbf2) =

 =20
