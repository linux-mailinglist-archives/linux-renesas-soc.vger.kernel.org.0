Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96B8354D4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 09:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237873AbhDFHGz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 03:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238404AbhDFHGz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 03:06:55 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFC5C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Apr 2021 00:06:48 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id c204so6002031pfc.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Apr 2021 00:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=94L1tjkW7g+Eq+M+79wQOnbZil94B5iZq8DLzBDp7p8=;
        b=VCdZ9/OwMzPcKAXpZbL50lsH+g0wIp5BqcQNsM1eV+xWlQEldI22HrghXj9Ny/s+TM
         byVQ0VQTrT5KZ6rV0AXUcTs5TQYBuR1ESLCzVQp66s/fhyz2Z/AwO5ptXnIakdM6ZtH4
         2RhmrTrnVp7XI7n2nwwj8yIQ+f1wsyazN+ZRfgkvc4c27xg6OMzbgBvsyQFIoPtncDHw
         QFwhw4o2Mj0GIohxbSbLtxthkd5h5s5cVrZxSkQ7UpVJqMA4WnwMK/vjjV9AwMYCShxd
         QDxyg2aOomMw7B7kJLTsk3lpAtcT5KcXqio0U4qPKUtLNmkwaz/mUV3MWeGqVrrsPDrY
         aaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=94L1tjkW7g+Eq+M+79wQOnbZil94B5iZq8DLzBDp7p8=;
        b=XeJPgVqVb6lOjQI80EneQY8CQezjJk025NnSv67BlT7absHzIfxSHI1COi+lO+wDCf
         gl6R87ghBZ2cIin3hRsQFze6D9MXF70ApNYVqgei8rXsrIyLp36KfroA2XShnypMoFv5
         V1lhz6Fz+ov46Jjg2UhaXa+mAyQ5qszNQAkAOeAnrZ1hVlzuwq8vvGIWd7RApDPLiRxh
         KpLKHq3bsfk3zQdLBhPw7RuS/A0zUwtF7WVwwyid79RmUWrmdjY/m3U3+WX2WPzCL9Wb
         Uh6Hg38AOwiWxuHUuVq7SPFTN7pyj/7W9FXIqlnRQawNe7BlhPluaeYYRZ9nCJ60mU+T
         /P8Q==
X-Gm-Message-State: AOAM532zqSaKBeUvy8SDBITjsYquK4ZqTZ54iyazgA1dDG3WNWUWRySL
        kyEskGMqN5aObj/IeIEMEiXuZ5L4z/IkbLr0
X-Google-Smtp-Source: ABdhPJyvJuZFTX+llOZL/y0zQ59qS2nFyoooNxKc6KwDOsrplGAXhFSJJVV783tPiCHcqKRwZxtBeg==
X-Received: by 2002:aa7:9605:0:b029:20e:b183:fc89 with SMTP id q5-20020aa796050000b029020eb183fc89mr26060496pfg.70.1617692807662;
        Tue, 06 Apr 2021 00:06:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r1sm1440831pjo.26.2021.04.06.00.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 00:06:47 -0700 (PDT)
Message-ID: <606c0887.1c69fb81.cbd6.4d37@mx.google.com>
Date:   Tue, 06 Apr 2021 00:06:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-04-05-v5.12-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 3 runs,
 2 regressions (renesas-devel-2021-04-05-v5.12-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 3 runs, 2 regressions (renesas-devel-2021-04-05-v5.12=
-rc6)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-05-v5.12-rc6/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-05-v5.12-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ea0aa7f2e67d781466efc1f9867e42062aa6e685 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 2          =


  Details:     https://kernelci.org/test/plan/id/606bf4f66ea157341bdac6ee

  Results:     2 PASS, 14 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-05-v5.12-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0324.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/606bf4f66ea15734=
1bdac6f1
        new failure (last pass: renesas-devel-2021-04-02-v5.12-rc5)

    2021-04-06 05:43:15.395000+00:00  rtcwake: read rt<4>[   19.425374] rtc=
-hym8563 0-0051: no valid clock/calendar values available
    2021-04-06 05:43:15.395000+00:00  c time failed: Invalid argument
    2021-04-06 05:43:15.396000+00:00  rtcwake: assuming RTC uses UTC .<4>[ =
  19.445779] rtc-hym8563 0-0051: no valid clock/calendar values available
    2021-04-06 05:43:15.396000+00:00  ..
    2021-04-06 05:43:15.397000+00:00  rtcwake: read rtc time failed: Invali=
d argument   =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/606bf4f66ea15734=
1bdac6f2
        new failure (last pass: renesas-devel-2021-04-02-v5.12-rc5) =

 =20
