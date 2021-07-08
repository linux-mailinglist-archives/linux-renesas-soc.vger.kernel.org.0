Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8613C1A5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jul 2021 22:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhGHULe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jul 2021 16:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhGHULa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 16:11:30 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEEAC06175F
        for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jul 2021 13:08:47 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id a127so6551989pfa.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jul 2021 13:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9m3BNOaFbbEoF3QFqQMLFp1f57O+w5Jev6AS5KAb8zM=;
        b=dpD/cyeHJOrTujjbZQVrVHy3ZdFpNloQnMjrxkH8zA945RoLNTXueq+sa6D7kn9u0u
         ZoJawXgf/MxYfUDEJ7fsQCMW/466VkrkZLLzNFINQZc1ILsDfl7v3PJUgY/Wd8IVksDF
         MCql0DMtB0/J+4nCeozi4t07Ke2oLG8PxcVZmn33IUFq2UY+0Gi9DLMcoK72w8SLjNhy
         03CyQpEBKFInhWOaSUgDfvIbKzB2kqH8Jum9v4iFhJwVmQASuzfUh8i0bcIct60KppqZ
         +EWpgT4VfCoVN8SZMatrMPYMSq9gVgCAfW8WZPMgXP51WViVf7dkpgcjCN8LAeT8H2R2
         58HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9m3BNOaFbbEoF3QFqQMLFp1f57O+w5Jev6AS5KAb8zM=;
        b=NSsVs5Bv2mdl7QDIeDrjoOqD06/4CoINl7nY5simjlNYXgvK4nmvU8jDQcrhLvWwBh
         43umXXUAhr2p4zsR73zWxuTW1qbbQzWx+x+LEOkigU4hYthotabp2rFeSI+btjJTh/2j
         0oWS4cbl5jeTMMo/YCmLkKDGS0XtB5WBfjWqm8OumQBKaCAm+tiu10KvFuQ3Vt6MF07F
         H7wzJyntR4R41MbUCT5+voUNsBE4e4creMdWUqYg+qw1PkgV4QlZhsr/NTgvYJKveIJh
         0KxQynridIbXcGUsbEuSHsatJwOCTUeP/wQBUGCgtcEk0IEJZDGpvol7a//cWnU5/rF2
         y8ZA==
X-Gm-Message-State: AOAM5320dij+l6ygCj0oDNYjuOAAFTNjaQMUxnLZAiFYkav4lVA6NLtl
        D+rQ/VhG1micf4+4qET1jTPtgRjnzIi+HmN7
X-Google-Smtp-Source: ABdhPJxIVVetslFQiP06at1dQDV/tkA1gbEOrCzeTwDVRUzNA4E5WMiBNmt1lyTJtcEKgITKhiX4mw==
X-Received: by 2002:a65:594d:: with SMTP id g13mr4896388pgu.329.1625774927193;
        Thu, 08 Jul 2021 13:08:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a9sm3618267pfo.69.2021.07.08.13.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 13:08:46 -0700 (PDT)
Message-ID: <60e75b4e.1c69fb81.2d0e6.adae@mx.google.com>
Date:   Thu, 08 Jul 2021 13:08:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-07-08-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next usb: 5 runs,
 1 regressions (renesas-next-2021-07-08-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 5 runs, 1 regressions (renesas-next-2021-07-08-v5.13-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-08-v5.13-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-08-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eb9ec119eee98db6f908226234823a0fef906cd6 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60e751ee1bee3b3358117971

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-08-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60e751ee1bee3b335=
8117973
        new failure (last pass: renesas-next-2021-06-10-v5.13-rc1)

    2021-07-08T19:23:41.370787  3: ID 0ea0:2168 Bus 003 Device 002: ID 05e3=
:0608 Bus 003 Device <8>[   13.527871] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dusb-presence RESULT=3Dpass>
    2021-07-08T19:23:41.370945  001: ID 1d6b:0002 \"
    2021-07-08T19:23:41.371075  + lsusb
    2021-07-08T19:23:41.371194  + awk {print $6}
    2021-07-08T19:23:41.371320  + sort
    2021-07-08T19:23:41.371433  + seq 1 3
    2021-07-08T19:23:41.371547  + /usr/sbin/rtcwake -d rtc0 -m freeze -s 1
    2021-07-08T19:23:41.371658  rtcwake: assuming RTC uses UTC ...
    2021-07-08T19:23:41.371767  rtcwake: wakeup from \"freeze\" using rtc0 =
at Thu Jul  8 19:23:43 2021
    2021-07-08T19:23:41.430094  <6>[   13.576609] PM: suspend entry (s2idle=
) =

    ... (133 line(s) more)  =

 =20
