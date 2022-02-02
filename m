Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64094A7034
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 12:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343967AbiBBLnO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 06:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343970AbiBBLnN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 06:43:13 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE91C061714
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 03:43:13 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id i186so16072431pfe.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 03:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kTbCR5kzDYEF8lG/AERq1oqapR3R1dDRBUoCpyWyIWo=;
        b=MiPp6tMnPParP6/x2L8nGJHJ1FTpUrek3HPjvwi5h9QgUhH+0Imm7JPi67o3XtR7jR
         ltTfC0gKQUol1bihJymIXmFG8kSoAg06dz6E2CBEGQLPM/d/7ClPgi2ReAZlVaN5nU8z
         nQo+3CTPf7BwTItNbsWU5KImr3myCNBanMyGv5ZJ9GfnWNnFBRRkcUDiN+ha2JeW9cGd
         hlDMnDZTrdFT0FhNkm2OtB4beNNaJA/zlzcSqFlt16/yXec3vo6aF3GXaceIkZ4XF5J5
         UmZUPHtljDx89TxWWVBUr2FZcDM4/vb7t1YruluNH5n1aYGIqbIQw/6VL0JGEeEvvPNP
         PGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kTbCR5kzDYEF8lG/AERq1oqapR3R1dDRBUoCpyWyIWo=;
        b=7QcVHyvlYIZIuX3F9lD4EV1DYnU0PwdyhYR+8UmTjVZes6g2U6OidtDW4a9/scdfH4
         Vv6gDpoBbubyC0PXRDB2/pTT/nR2LFbIvIrs6WjoG3f1u6seKh2v6SprOrpE0tx0mrHt
         DF7u5xG8w94po+Zf1E3tDc2ug4LyfN+ltt9BdImfaDmUlW0lCJ2nHUtXEs2fwYJxFI48
         pe8RxxYeT4zVbrgD67t+gy5qowQMY3BqDw5DnPYfzX+g4CgykuG0CKAUxzZQmJItqJXR
         J9/B3lyHiXf8YXeXoE6BlYoAzF9iyRoh9JxPom5AYm+168ouixDptugW38nJv55cJgfJ
         +OAg==
X-Gm-Message-State: AOAM532E1DVKuDveSI+Reoszyt7JiNVNhyq4Y9JgsQolgc6DBRKY5JT9
        tyYAoqqBV5ETUHlNiemaWSaqEJWdPgwwZwln
X-Google-Smtp-Source: ABdhPJwvQTuyWY268/DbfZNSZZ2CAIoWNOTHKqaqhSOnzA5kisrq94TgD7zAiv2w/Ca6VxsD+GRxfQ==
X-Received: by 2002:a63:96:: with SMTP id 144mr3901769pga.19.1643802192980;
        Wed, 02 Feb 2022 03:43:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l26sm33770413pgm.73.2022.02.02.03.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 03:43:12 -0800 (PST)
Message-ID: <61fa6e50.1c69fb81.879b5.ac87@mx.google.com>
Date:   Wed, 02 Feb 2022 03:43:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-02-02-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
Subject: renesas/next sleep: 3 runs,
 4 regressions (renesas-next-2022-02-02-v5.17-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next sleep: 3 runs, 4 regressions (renesas-next-2022-02-02-v5.17-rc=
1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 4          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-02-v5.17-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-02-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c3b08f12c71900ef2e92cc8f778f3073afe69f4c =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 4          =


  Details:     https://kernelci.org/test/plan/id/61fa574f7bc2ec11485d6eeb

  Results:     2 PASS, 13 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-02-v5.17-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220128.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/61fa574f7bc2ec11=
485d6eef
        failing since 4 days (last pass: renesas-next-2022-01-25-v5.17-rc1,=
 first fail: renesas-next-2022-01-28-v5.17-rc1)

    2022-02-02T10:04:51.349009  rtcwake: assuming RTC uses UTC ...
    2022-02-02T10:04:51.392590  rtcwake: read rt<4>[   15.976671] rtc-hym85=
63 0-0051: no valid clock/calendar values available
    2022-02-02T10:04:51.393155  c time failed: Invalid argument
    2022-02-02T10:04:51.393987  rtcwake: assuming RTC uses UTC .<4>[   15.9=
96416] rtc-hym8563 0-0051: no valid clock/calendar values available
    2022-02-02T10:04:51.394846  ..
    2022-02-02T10:04:51.395289  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-5: https://kernelci.org/test/case/id/61fa574f7bc2ec11=
485d6ef7
        failing since 4 days (last pass: renesas-next-2022-01-25-v5.17-rc1,=
 first fail: renesas-next-2022-01-28-v5.17-rc1)

    2022-02-02T10:04:51.444006  rtcwake: assuming RTC uses UTC ...
    2022-02-02T10:04:51.488916  <4>[   16.070593] rtc-hym8563 0-0051: no va=
lid clock/calendar values available
    2022-02-02T10:04:51.489459  rtcwake: read rtc time failed: Invalid argu=
ment   =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/61fa574f7bc2ec11=
485d6ef8
        failing since 4 days (last pass: renesas-next-2022-01-25-v5.17-rc1,=
 first fail: renesas-next-2022-01-28-v5.17-rc1)

    2022-02-02T10:04:51.395986  rtcwake: ass<4>[   16.014955] rtc-hym8563 0=
-0051: no valid clock/calendar values available
    2022-02-02T10:04:51.396325  uming RTC uses UTC ...
    2022-02-02T10:04:51.440720  rtcwake: read rtc time failed: Invalid argu=
ment
    2022-02-02T10:04:51.441701  =3Dfail>
    2022-02-02T10:04:51.442468  rtcwake: assuming RTC uses UTC ...
    2022-02-02T10:04:51.442926  rtcwake: read rtc ti<4>[   16.054483] rtc-h=
ym8563 0-0051: no valid clock/calendar values available
    2022-02-02T10:04:51.443308  me failed: Invalid argument   =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/61fa574f7bc2ec11=
485d6ef9
        failing since 4 days (last pass: renesas-next-2022-01-25-v5.17-rc1,=
 first fail: renesas-next-2022-01-28-v5.17-rc1) =

 =20
