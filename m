Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DF03C79EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 01:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbhGMXFT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 19:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235536AbhGMXFT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 19:05:19 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B257C0613EF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:02:27 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id n10so213867plk.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5W0LHa2tQ75icKMwiJKzlmC55TAz5PsHo83Zj/ujm90=;
        b=1qZBPlsLIeN9IaCTAqnT660YgjYJWEwPrHP0yc7yZ8QNlpvJNpf4aek4lrrFK2u8Js
         kek1kNl+2p7g26mhArifIBAhhsb6OSNu+6QPzRN2zoRJr+vTM2y8FtPubpENlVsb/uTU
         7V6ZRABpj1mDDG/k/Mk0sIr/pCAF+HNNArMrdjVUVw0j8KhKfHUxdLboFso61iu3mr+C
         lW9Vf92v/DMWLu0fxhSJvNwIEgXkVYcnFhe8XL3b3OwoHJDETj2bMetrE23CapBawCUx
         VdEbF+enLLrr2E0N9yL3YLNYmVUVya4pOQ84IgWAK5YqzQELATsmcVtRbTH0y+excdH+
         a+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5W0LHa2tQ75icKMwiJKzlmC55TAz5PsHo83Zj/ujm90=;
        b=tBiQyzHUr8yYD6Hf1j7yGpCN78qY5edxMeGbuUMEZK3WFrxK5D8y8e9+uvORg5QADn
         Iysdv/sZBOJTQQnPotkk6S1lH83PPQ152kVK2vIC66KWmr1WMcj3A4Gs3jg6v/eed7FJ
         bW+GdFoOZOKyNUls9GCCIJK0aaLvUpK1XR3mOHWziBIaxz1rhzwnQ0N3SzKMkG8meYY4
         uoBHqzFxT2KtA44+ZbEB1fYy8iHXBOH8VOl2jcaW3RnFlwHgwTLXDqAlmwsT5TAz9Sfn
         lccW0xCe3HlccGJbVEmHiFUozSiA+LzqJhHZ+TzDZTQr2xPM6Yx+fwlEWMwjIkOKCMpR
         qB7g==
X-Gm-Message-State: AOAM530eEzLKgruMtfHybdP5XDtDR1SDqtFRLdTZ/AIDV9HZ16g62nX/
        zV8wRWBpCnPBLEiiKYHm1ccE7SGKiua1h4DU
X-Google-Smtp-Source: ABdhPJzwVtQFjYrmu3ELSNQXLgZ4Eqmfl3FIQJ1MuSvnuwFeHHq+xlIlgQT4LGIQxPjq9t271aPUDQ==
X-Received: by 2002:a17:90a:5d06:: with SMTP id s6mr6624650pji.197.1626217346697;
        Tue, 13 Jul 2021 16:02:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a130sm237184pfa.90.2021.07.13.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 16:02:26 -0700 (PDT)
Message-ID: <60ee1b82.1c69fb81.b9cd6.164b@mx.google.com>
Date:   Tue, 13 Jul 2021 16:02:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-13-v5.14-rc1
Subject: renesas/master sleep: 10 runs,
 2 regressions (renesas-devel-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 10 runs, 2 regressions (renesas-devel-2021-07-13-v5.1=
4-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-13-v5.14-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      81b7948a0be3dc48ef04d01b16c08dc3b460bce2 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/60ee0904f47298cb9f8a939b

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0709.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60ee0904f47298cb=
9f8a93ae
        failing since 64 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-13T21:40:48.780139  rtcwake: assuming RTC uses UTC ...
    2021-07-13T21:40:48.784183  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Jul 13 21:40:55 2021
    2021-07-13T21:40:48.802761  <6>[  102.041466] PM: suspend entry (deep)
    2021-07-13T21:40:48.803099  <6>[  102.046111] Filesystems sync: 0.000 s=
econds
    2021-07-13T21:40:48.819719  <6>[  102.053665] Freezing user space proce=
sses ... (elapsed 0.002 seconds) done.
    2021-07-13T21:40:48.820036  <6>[  102.064186] OOM killer disabled.
    2021-07-13T21:40:50.980299  <6>[  102.068315] Freezing remaining freeza=
ble tasks ... =

    2021-07-13T21:40:50.980709  <3>[  104.216425] usb 2-1: device descripto=
r read/64, error -110
    2021-07-13T21:40:51.326635  <6>[  104.566421] usb 2-1: new high-speed U=
SB device number 5 using dwc2
    2021-07-13T21:40:56.574036  <3>[  109.816418] usb 2-1: device descripto=
r read/64, error -110 =

    ... (19 line(s) more)  =


  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60ee0904f47298cb=
9f8a93af
        failing since 64 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-07-13T21:40:28.598698  rtcwake: assuming RTC uses UTC ...
    2021-07-13T21:40:28.598941  rtcwake: wakeup from \"mem\" using rtc0 at =
Tue Jul 13 21:40:35 2021
    2021-07-13T21:40:28.609534  <6>[   81.854437] PM: suspend entry (deep)
    2021-07-13T21:40:28.624309  <6>[   81.858752] Filesystems sync: 0.000 s=
econds
    2021-07-13T21:40:28.624547  <6>[   81.863987] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-07-13T21:40:28.629107  <6>[   81.873219] OOM killer disabled.
    2021-07-13T21:40:29.062761  <6>[   81.877116] Freezing remaining freeza=
ble tasks ... =

    2021-07-13T21:40:29.063113  <3>[   82.299219] dwmmc_rockchip ff0c0000.m=
mc: Busy; trying anyway
    2021-07-13T21:40:29.574325  <3>[   82.811579] mmc_host mmc1: Timeout se=
nding command (cmd 0x202000 arg 0x0 status 0x80202000)
    2021-07-13T21:40:29.586646  <6>[   82.821244] smsc95xx 2-1.1:1.0 eth0: =
Link is Down =

    ... (63 line(s) more)  =

 =20
