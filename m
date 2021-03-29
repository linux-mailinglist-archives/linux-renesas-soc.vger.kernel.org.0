Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32FD834D798
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 20:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhC2SvJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 14:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhC2Suu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 14:50:50 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A00C061756
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 11:50:39 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so8153522pjc.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Mar 2021 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=M/BRcs25yP6GyG3gOeNLLAYL6wZ09tln0j4mun26haI=;
        b=T0eA1kpO5OhMiGmxzC1t3QY/Fic41H+CbYVEYsfO9Qn2ErZEtGzGZE/7kbAGftXTpJ
         OZ34OwuFPExBn2xNuRdWyYFSKQa8qGmz+mEwR67X0oJvNhDt8UMttZ9Lnsm1aPDUO/aS
         KlGV1H9LuxpkGHCHKehCy+iIzl5lEdcyloMRGOdYnNW/w4aXA6mzI4EhJ25mrBz9kAnw
         uZHoehJaPcWC3N9Glbfen+KAcWP1jv+3UayQWfFsglSSjd0HS4Llibo1CFcc0H7wNCv3
         Fw2dTQT3x11WAN1RxjfvrNnivFv9vG4vZRYG84UeA6LJqs7T4P0NjWOhED8B2vhb82oy
         yPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=M/BRcs25yP6GyG3gOeNLLAYL6wZ09tln0j4mun26haI=;
        b=pHAftNnSqV/drF9S2IqinkbFd77oTfttGzmLloQHrhMLu5WhFrwzdRQUIf2NfT3gbM
         nfwHjE6f7IASkzqIC617LpU93/YSyWkeljkvFS/MVQ2fjWQcQwuwW+JzGxwceUdEoUj3
         qNGokbpwthsPCowLPy2BlvbQDJgVFX78KHuYIqaTGumZVxJYWiOrEh9bg96C5xwyyOtF
         2MOmaUT03464FFdvtERkrzWgM9DKSLK4CYBpVqkqY5TAgcA+s9XiRu+/YmidR8F8NDDK
         zzPMf91b46SL/VLr2k84BpXc9f5xfJQiFbcY7+9eOBS5v+UjAg/YPf341M4NLPzhngyQ
         GI/A==
X-Gm-Message-State: AOAM5306y9DFCcDtreMVBkQTtAwrtDHBjuSt2kVQQ1lqRa/m/yTfqAlT
        vlYS5BlfYnIy74bHAkbenTR9XV0Esm2+pQ==
X-Google-Smtp-Source: ABdhPJykg8NsEHP1kH2EWxstEHFKtc/Zi5oMEiK2dOZvzYwQJPHeCRkFB5ih68ibGdbqsuq7U21TRA==
X-Received: by 2002:a17:90b:4c87:: with SMTP id my7mr521168pjb.162.1617043839200;
        Mon, 29 Mar 2021 11:50:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j3sm5777813pfc.49.2021.03.29.11.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 11:50:38 -0700 (PDT)
Message-ID: <6062217e.1c69fb81.7c477.e4a9@mx.google.com>
Date:   Mon, 29 Mar 2021 11:50:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-03-29-v5.12-rc2
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next usb: 2 runs,
 1 regressions (renesas-next-2021-03-29-v5.12-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 2 runs, 1 regressions (renesas-next-2021-03-29-v5.12-rc2)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-03-29-v5.12-rc2/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-03-29-v5.12-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d084e52e5b7b16d25a5e32c4625fb205a2b272d8 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/6062152e6b071329b2af02e2

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-03-29-v5.12-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/6062152e6b071329b=
2af02e5
        new failure (last pass: renesas-next-2021-03-24-v5.12-rc2)

    2021-03-29 17:53:03.402000+00:00  <6>[   18.448336] PM: suspend entry (=
s2idle)
    2021-03-29 17:53:03.403000+00:00  <6>[   18.452946] Filesystems sync: 0=
.000 seconds
    2021-03-29 17:53:03.443000+00:00  <6>[   18.467233] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-03-29 17:53:03.444000+00:00  <6>[   18.476536] OOM killer disabled.
    2021-03-29 17:53:03.444000+00:00  <6>[   18.480432] Freezing remaining =
freezable tasks ... (elapsed 0.001 seconds) done.
    2021-03-29 17:53:03.445000+00:00  <6>[   18.490148] printk: Suspending =
console(s) (use no_console_suspend to debug)
    2021-03-29 17:53:59.618000+00:00  <6>[   18.502597] rk_gmac-dwmac ff290=
000.ethernet eth0: Link is Down
    2021-03-29 17:53:59.619000+00:00  <6>[   43.351859] vcc_flash: disabling
    2021-03-29 17:53:59.619000+00:00  <6>[   43.351866] vcc_host: disabling
    2021-03-29 17:53:59.619000+00:00  <6>[   43.351869] vcc_sd: disabling =

    ... (125 line(s) more)  =

 =20
