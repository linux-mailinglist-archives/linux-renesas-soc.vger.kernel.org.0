Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FA9477CC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 20:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbhLPTrH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 14:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhLPTrH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 14:47:07 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22860C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 11:47:07 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id np3so124683pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 11:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yrWrjP0Irx54h71ZpcwN9eGUpLqDCvUB2DEYcUcACzc=;
        b=1W4uMVfV5pL81dehA7MIDHHneDAqqbFOGj3H64yT8KHUEMymVk5I/h2nz58epaskh1
         ps9jOc7bDslYqIuoK26lNiWJS+ZxIOZ0m/FkFXHrtkVhzP0YLwGCeh8iLJJ3mekioH0R
         hsy4fCtMGn9E8u6Uh1Biro4aJe436yhM9HUm9H4rMEXLx2U6uxRuWJ11bzSnc+Ctrypp
         9mbchFMJDm/UkNbKbpK4Y24zDtN1P5xkp2s866F2LxRgLBshOGg5FvN+yi0y+q1+Ne69
         wkguClEZO2eiKyr9xmDFzP9CHJ0LCS/X3q6/2uwyqDLI5iIlKnBTexrNMs996iZrlo7J
         6faA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yrWrjP0Irx54h71ZpcwN9eGUpLqDCvUB2DEYcUcACzc=;
        b=PBr9OssJciNitzTmeTGGRpWs5NC10zjX0LrHOPktCm+Hx7Y4jPC4k2chE6S0SzIuDs
         ZdJ9NqVOEfG8pO7PPqR9FMZP/PfVGNZTbRSxyIWUc5TkVvwHA/S4HTo/Vlr3/mTDNQHT
         Hk2OGIfRvLvsJMB6xqD18wSiGOSbszK5CBnAlxlNSV6Ehz5fEiqxLXDtMT3PSA1iDugW
         BDSoBu5JL2MWT2DvdobEsD3kzBTDSEYoEenLLFojxXfaRM0KAKjUUqznHTNsRW1pfWyw
         ib8AvTBYYpZ+2KTOdEMC0abDaEdzRYCMHqm6PXRCodIA8mQcWPu8t56HzNbuFo5MbyMT
         sEmg==
X-Gm-Message-State: AOAM5335IwwLzTb+DGMVHTBAnjCrTNSixktYu928Cjg9vufRzZfTe++W
        VP4KUEhrbpz11Oq1QCuI1K0YQomsqobHON5u
X-Google-Smtp-Source: ABdhPJy80dW5mJckXK9KRs3PBuWtE0kP4xrG1GkOYVrd3ua3YlA+PyJ/e6v+hymL8ksQAsYlJp1+lQ==
X-Received: by 2002:a17:902:c713:b0:141:bbb2:1ec7 with SMTP id p19-20020a170902c71300b00141bbb21ec7mr17822178plp.57.1639684026400;
        Thu, 16 Dec 2021 11:47:06 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b35sm6018254pgb.83.2021.12.16.11.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 11:47:06 -0800 (PST)
Message-ID: <61bb97ba.1c69fb81.21162.06e6@mx.google.com>
Date:   Thu, 16 Dec 2021 11:47:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-12-16-v5.16-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 61 runs,
 3 regressions (renesas-next-2021-12-16-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 61 runs, 3 regressions (renesas-next-2021-12-16-=
v5.16-rc1)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig         =
           | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

rk3288-rock2-square | arm   | lab-collabora | gcc-10   | multi_v7_defc...G_=
ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-12-16-v5.16-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-12-16-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a155038f641134b0272d26f75d1ab4a805013e48 =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/61bb62341577a3823b397154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61bb62341577a3823=
b397155
        new failure (last pass: renesas-next-2021-11-30-v5.16-rc1-14-g09403=
00f8e1d) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bb64a14b4c6783d73971c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61bb64a14b4c6783d=
73971c4
        new failure (last pass: renesas-next-2021-11-30-v5.16-rc1-14-g09403=
00f8e1d) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3288-rock2-square | arm   | lab-collabora | gcc-10   | multi_v7_defc...G_=
ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bb674762ed2f306239713b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61bb674762ed2f306=
239713c
        failing since 30 days (last pass: renesas-next-2021-10-18-v5.15-rc1=
, first fail: renesas-next-2021-11-15-v5.16-rc1) =

 =20
