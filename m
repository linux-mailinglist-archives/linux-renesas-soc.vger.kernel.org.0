Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3267B30A663
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Feb 2021 12:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233113AbhBALVO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Feb 2021 06:21:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233219AbhBALVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Feb 2021 06:21:12 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D050CC061788
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Feb 2021 03:20:31 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id o63so11841137pgo.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Feb 2021 03:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4NX3nXrFe9h8zj3IG9G+SubXa0/HIHxdn62gBxY/ams=;
        b=rMdr9kpCjLc9iK5GEXeeI6PKFf/DXjkcvoQoWssRaWbv/pQ3YXkfnOwEdGIGM0t1zE
         Gv9wNAutNMSgRnd6TuEgPDVrYLXjvEvm1yNvoDIn4MbFemDAPrtZPpxBWQXjJAiav4fj
         081/WMnhqchzMrNllFyN2wfV7tIuIgx2YKELEIOph62LC49Y06u1JsfQVGZRY+7toZn5
         G/brXukbd4TBbL6uwslPAfUqqNvC4LgaDl3YwMhweCibarM41GaZ/mFoSQ/S2cDnVaI0
         EyqHG8La1DrUF8McvmhAfOVvcb2yYlhJRmVCMVrEzvgXSwe+GkFxkOT8887bUisr7eyZ
         hvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4NX3nXrFe9h8zj3IG9G+SubXa0/HIHxdn62gBxY/ams=;
        b=nlALEjgmeK7NiNwppqetuR+zqi/3ai5nUTj95+LXZfA57tUAMtm6Dv62aEKO851Scn
         Fllz9VYTOHqXYM4d4717qPDTTKjlMWuj2dNQoaDfBRP90Snxru+Is3phAnBtq2h1B7rG
         iQI7iSq7LwNfCpDsoy2H7dyynlvoyH7hI/3HzYapg/oOKE44VD31G/ZVq2n9XiSl+XsH
         1vEHvFyH+4LALn/yZE5+pmQZ49xwhHrlgj2hSKw2+yG2TEo0t/Vod7pBLnIpggsByKxT
         6D2PjIdVlCLiXmJxrkcrk5A1zrerKI1gdRc0edTqZZAlGILFA/If7+pg3sddQzEFsdmt
         OtjA==
X-Gm-Message-State: AOAM530QPjH0wkBDzD5FPsKNqKI/UjdrG56ZQwgRvF7H0wNVhN3alN+l
        mx7wglPZI/j4DRqA7NdSv1+ylrFbwNvTLA==
X-Google-Smtp-Source: ABdhPJzNMdFxmh0R20a4Xh+JLpBJSzf0sbE/k8fbp5xsS46tifDlUjPIhqI0X1roPD+IAXL1iLTZgA==
X-Received: by 2002:a63:1f1e:: with SMTP id f30mr16890645pgf.141.1612178431113;
        Mon, 01 Feb 2021 03:20:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cq2sm4042264pjb.55.2021.02.01.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 03:20:30 -0800 (PST)
Message-ID: <6017e3fe.1c69fb81.e333.844b@mx.google.com>
Date:   Mon, 01 Feb 2021 03:20:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-02-01-v5.11-rc6
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master sleep: 7 runs,
 2 regressions (renesas-devel-2021-02-01-v5.11-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 7 runs, 2 regressions (renesas-devel-2021-02-01-v5.11=
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
sas-devel-2021-02-01-v5.11-rc6/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-02-01-v5.11-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      45e12c13bdd70bc8d9741ce35e2aa594e986e457 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 2          =


  Details:     https://kernelci.org/test/plan/id/6017d0a2d17d0298d3d3dfca

  Results:     2 PASS, 12 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-01-v5.11-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-01-v5.11-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0125.1/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/6017d0a2d17d0298=
d3d3dfce
        failing since 2 days (last pass: renesas-devel-2021-01-26-v5.11-rc5=
, first fail: renesas-devel-2021-01-29-v5.11-rc5)

    2021-02-01 09:57:45.250000+00:00  rtcwake: rea<4>[   20.709468] rtc-hym=
8563 0-0051: no valid clock/calendar values available
    2021-02-01 09:57:45.251000+00:00  d rtc time failed: Invalid argument
    2021-02-01 09:57:45.251000+00:00  CASE_ID=3Drtcwake-mem-2 RESULT=3Dfail>
    2021-02-01 09:57:45.251000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-02-01 09:57:45.298000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-02-01 09:57:45.298000+00:00  IGNAL_TESTCASE TEST_CASE_ID=3Drtcwake=
-mem-3 RESULT=3Dfail>
    2021-02-01 09:57:45.299000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-02-01 09:57:45.299000+00:00  rtcwake: read rtc time failed: Inval<=
4>[   20.764813] rtc-hym8563 0-0051: no valid clock/calendar values availab=
le
    2021-02-01 09:57:45.299000+00:00  id argument   =


  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/6017d0a2d17d0298=
d3d3dfcf
        failing since 2 days (last pass: renesas-devel-2021-01-26-v5.11-rc5=
, first fail: renesas-devel-2021-01-29-v5.11-rc5)

    2021-02-01 09:57:45.348000+00:00  rtcwake: read rt<4>[   20.783349] rtc=
-hym8563 0-0051: no valid clock/calendar values available
    2021-02-01 09:57:45.348000+00:00  c time failed: Invalid argument
    2021-02-01 09:57:45.348000+00:00  rtcwake: assuming RTC uses UTC .<4>[ =
  20.803841] rtc-hym8563 0-0051: no valid clock/calendar values available
    2021-02-01 09:57:45.348000+00:00  ..
    2021-02-01 09:57:45.348000+00:00  rtcwake: read rtc time failed: Invali=
d argument   =

 =20
