Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1555413F27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 03:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhIVCBN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 22:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbhIVCBM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 22:01:12 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A7CC061575
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:59:43 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id nn5-20020a17090b38c500b0019af1c4b31fso1071864pjb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 18:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TELqzfIE1aImTJPZImRqhSA+2bPV3HgKAsSbOHfUq4o=;
        b=BgYSCNxCznGBihp1fZ4y5A/tb/2o0LohUd7G/0oANUGP58hJn2SkcOyhb0h42QSIv8
         6K9JDoZuBtKWm1OKXK5fFUISM8A9Ojt0BXo9V3XBN39ehBZPYohkjgltOwA3Da/IUbRb
         NcZ184KZ4sl/5JY3w/svre07cULe7FTf2AtJZascKvRiY1Sdz1DM32uRkw8whRtfDK72
         AKq0eH0Yus9LqR6Kg6NFb/kSqAkVdPS+X2f4bStcMzhhAIv5D8T/mg55uqJgu1ZkZAiY
         Z7PvqnelbUMJZF41V5eXPwUoUJW5dhl0QQu9Bi+jalCPkxyoK5spNGMJKOPAC50LSTCR
         QUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TELqzfIE1aImTJPZImRqhSA+2bPV3HgKAsSbOHfUq4o=;
        b=I/MAt6ak5NsJw+Pj/1HLlnkdvrFIVo1AHjp1K2gDe5U/1UbKzo4GhrGGpfaOkwh6/o
         BmbDX9XAG5oqKUK16lOjGyJzVMTbhZcKcenPagf85LnRgbhTyQznoGyWnD+y8m5zLYpq
         HyTJ1M7cYaZt5QzS8Z48H1Q78xKtc8Vyu0rrRtcPSaaubXCumtDtXeUMWTNxfgDdiha5
         AwL5zH0/0vszdRt3na8zsm6DNEXCAMIE5fHjwU8+lIm92Ro1esMQ6CtRSmPBmFAJPNjB
         QtKqFDTNT0xpeh83IJ3iX1+KeqxHRmyITUtsbFEJXImlojMbAimXvo3GruH+jXR/eiAV
         0GqA==
X-Gm-Message-State: AOAM530rPl2pqClmdikgp/O8M9S1Ndkd0PQLKcjFkvnTgctd3f1OKv1Z
        YN7aNNma2yg2uR8QY1j/N59oF/SHeQfMtUhA
X-Google-Smtp-Source: ABdhPJyf20Uyuu3WV1POYQ6SwNQVtle6R4KV3Jpjao0x6A0rUGC3mw9gCamcqvhD5t8CDhptsvII+w==
X-Received: by 2002:a17:90b:3901:: with SMTP id ob1mr8582299pjb.136.1632275982571;
        Tue, 21 Sep 2021 18:59:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m11sm1493754pjf.15.2021.09.21.18.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 18:59:42 -0700 (PDT)
Message-ID: <614a8e0e.1c69fb81.5ef02.73c6@mx.google.com>
Date:   Tue, 21 Sep 2021 18:59:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-20-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next usb: 2 runs,
 1 regressions (renesas-next-2021-09-20-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 2 runs, 1 regressions (renesas-next-2021-09-20-v5.15-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-20-v5.15-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-20-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      41c50f42a51cc8630c6a28e9b26f92d920e91780 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/614a7e9c4cd6d20f6a99a2ff

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-20-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/614a7e9c4cd6d20f6=
a99a301
        new failure (last pass: renesas-next-2021-08-10-v5.14-rc1)

    2021-09-22T00:48:41.168931  rtcwake: assuming RTC uses UTC ...
    2021-09-22T00:48:41.169151  rtcwake: wakeup from \"freeze\" using rtc0 =
at Wed Sep 22 00:48:43 2021
    2021-09-22T00:48:41.227169  <6>[   15.502908] PM: suspend entry (s2idle)
    2021-09-22T00:48:41.227423  <6>[   15.507485] Filesystems sync: 0.000 s=
econds
    2021-09-22T00:48:41.227650  <6>[   15.514408] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-09-22T00:48:41.227909  <6>[   15.523935] OOM killer disabled.
    2021-09-22T00:48:41.228159  <6>[   15.527841] Freezing remaining freeza=
ble tasks ... (elapsed 0.001 seconds) done.
    2021-09-22T00:48:41.228398  <6>[   15.537631] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2021-09-22T00:48:59.838705  <6>[   15.551581] rk_gmac-dwmac ff290000.et=
hernet eth0: Link is Down
    2021-09-22T00:48:59.839000  <3>[   33.940206] ehci-platform ff500000.us=
b: port 1 resume error -110 =

    ... (107 line(s) more)  =

 =20
