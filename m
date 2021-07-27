Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652403D6B93
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 03:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbhG0A7I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 20:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbhG0A7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 20:59:08 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99BBC061757
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:39:35 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so2635032pji.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 18:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mE/8yljXRHvzuc7YcajaDDgJ2XmfAXY8WFdbnTTgGSI=;
        b=JsZpKtICmg4YehM2e/Dy7Sk092x31CvQBXBu3kejoeVXPvRMdmhSHe0h5T5P98jJxw
         qDFN52JcbNbAHYt3WG+tGnUONWOHYmmPYhL5AbBleEEoKmxi1/PFAX64qIou12QCFSol
         CUCJE7tZvNzVu9+jUSYKD5hAL2y8iVjm1IcEr/B4AoxxGyNGUCnTOvdKpqEQlfooIHaj
         Lp1C0wSxTRIWGsQ0x4BDKOrJr5CE6zlTwiLYNF+cp0E0xEsYrQu7x0GrORp7+3xms9GC
         NAlmqqnmcX9NQ7lFjn4c9tlEOKQS0KYjFDx3Bde7M2Vjlb31n9ZSrkCA/D5Z/19xrLyy
         O1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mE/8yljXRHvzuc7YcajaDDgJ2XmfAXY8WFdbnTTgGSI=;
        b=Hs9si1V3kLmNBWEdEjhkaMK0iEnYrwBUMT1mGvQyA04hJItpH1ueIQj1n6K029UgHn
         oiapGDGuPrb0PMQ8zO6QN/rPvh344S+VQPcPJq5eHnw+PWpM/UVuvdTGsADgJqJUgsuS
         AQUIwkt7Vqn83lgg6ZnY4uiZ1aUlhVqR4vydgTMmCHXpv9/XyJ7r2HceOPOCPfmOuAGU
         v96Yoi3V2kJKqkTN0i8ux+iJYAidfn9E8OYLukSFh9Ly07Id+WXLDZ7qNIPn3nMbQFPl
         ou8lTSu1Qzzn8lFvBBVamoSLhqH7T5kDI0244U8QoOxvfmboDup0hKMnX4XXZBpEEPwV
         c7YQ==
X-Gm-Message-State: AOAM5312zWWfDIViqq+Q2KUrFcVvXGNOoMl48BZy2spIkU1L5EJsLR5Z
        YHa6B+nyDl8DdcbmJwiUD9VU45Jx43eMgdhA
X-Google-Smtp-Source: ABdhPJzyStSDvM3qXcw/bRpp8r39Y4B7X9PjVG/RR2H1tiNC7QAMKQkd6mf/uB7ATD1gLe0H3l4Bqg==
X-Received: by 2002:a63:5563:: with SMTP id f35mr21449775pgm.183.1627349975200;
        Mon, 26 Jul 2021 18:39:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h14sm1337095pfo.47.2021.07.26.18.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 18:39:34 -0700 (PDT)
Message-ID: <60ff63d6.1c69fb81.22370.5cf9@mx.google.com>
Date:   Mon, 26 Jul 2021 18:39:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2021-07-26-v5.14-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next usb: 3 runs,
 1 regressions (renesas-next-2021-07-26-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 3 runs, 1 regressions (renesas-next-2021-07-26-v5.14-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-26-v5.14-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-26-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cecb7cc88302b2e508c6cc1ce7663bba08c96a65 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60ff5119a7681291253a2f36

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-26-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60ff5119a76812912=
53a2f38
        new failure (last pass: renesas-next-2021-07-19-v5.14-rc1)

    2021-07-27T00:14:15.417240  rtcwake: assuming RTC uses UTC ...
    2021-07-27T00:14:15.417594  rtcwake: wakeup from \"freeze\" using rtc0 =
at Tue Jul 27 00:14:17 2021
    2021-07-27T00:14:15.480089  <6>[   15.884595] PM: suspend entry (s2idle)
    2021-07-27T00:14:15.480352  <6>[   15.889459] Filesystems sync: 0.000 s=
econds
    2021-07-27T00:14:15.480486  <6>[   15.898441] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-07-27T00:14:15.480595  <6>[   15.908844] OOM killer disabled.
    2021-07-27T00:14:15.480693  <6>[   15.912850] Freezing remaining freeza=
ble tasks ... (elapsed 0.001 seconds) done.
    2021-07-27T00:14:15.480787  <6>[   15.923385] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2021-07-27T00:14:59.855529  <6>[   15.942999] rk_gmac-dwmac ff290000.et=
hernet eth0: Link is Down
    2021-07-27T00:14:59.855811  <6>[   40.791899] vcc_host: disabling =

    ... (144 line(s) more)  =

 =20
