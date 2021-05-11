Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A16E637AAC7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 17:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbhEKPhF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 11:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbhEKPhC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 11:37:02 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB3AC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 08:35:54 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id c13so2917125pfv.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QqDIpt+YKoDQaYotvey+l023MVq5zxTx/y+JzNVC5Bk=;
        b=B2zepQ0PaNglFbwUQit+tCptvI/C5oarhcsC7OT3/SElmXiUJ6lIiHVk5OEOwPPol1
         xoAihf3LA9SKbTfA0jQ8VkAAtnf/cgzHyJPsK8ViFcxci+yg4c+Hsej0E0dVqgMo+/h4
         TCptBvqGyYN6rTLtMCVYOJ5Hw7Pe1Moa8r9QNUtI0TdPXFBesj2CyienfhjL9JN1jIWF
         8ceBxCsuticxYjTr+sl5sWxzI0OgXVMXNo04+6O6nDKJ32a3nVBGFAyyoJ5C/MRUten5
         VHWdhWzWNVrzjAa2Op6fdsYyCsaAL0OncuzeTMkOk+8a2vWESB4jCuOgamYVwwflb7K1
         HnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QqDIpt+YKoDQaYotvey+l023MVq5zxTx/y+JzNVC5Bk=;
        b=JL4JzGoRTD6IuJzG3XEIA26R6FDwBFZtRIszcqX2pOd6vXqXZBANUgwmlJqJojqORe
         nr9xCd/KBESnxIomFHL1fuvoyr5pqeb4J+d5HSGwPgewSCEMS+ztt7170YqGpBwgTE3O
         ZpEcCrSKK7NqxZdjyc/SljU1wd5YvyJZlmeMoaNHVYyFUqsBFIodzJrqeSjDk1wOSNjB
         BQq+h86a9NMXgdxTIwUkrnDzfXogXPQQQwizqBA12eQVBYbsqdp5e65WnAhFpAjdwo7/
         SlFpJyNvrll8TwNaWIHCPM+Q2P2JcCnqJqlOZ+Xj+5bX2On7lefsTkeufHZnjKnLH+hT
         LGBw==
X-Gm-Message-State: AOAM532qLNYwSGfsQD4DEBWrVEZM8pEM35kPzUDqscjL/iiXMcPpMREY
        g2+Pah5ZoZO0t6Ljq/C8CS13Kuxbg77Vu7lR
X-Google-Smtp-Source: ABdhPJytYV+UnemUYue1Ma7UmOztKJyUzMFXLCv/BgryqJk7zHAKTSsGu0TqMThPYMNJrg7EG5hUew==
X-Received: by 2002:a63:d80f:: with SMTP id b15mr17392657pgh.388.1620747354056;
        Tue, 11 May 2021 08:35:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u24sm14229534pga.78.2021.05.11.08.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 08:35:53 -0700 (PDT)
Message-ID: <609aa459.1c69fb81.23f87.af99@mx.google.com>
Date:   Tue, 11 May 2021 08:35:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-05-11-v5.13-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master sleep: 6 runs,
 2 regressions (renesas-devel-2021-05-11-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 6 runs, 2 regressions (renesas-devel-2021-05-11-v5.13=
-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-11-v5.13-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-11-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bff1b0e749d4df5f61ce46122ab7f5c522684b50 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/609aa0ba7806ad13bad08f31

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/609aa0ba7806ad13=
bad08f36
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 15:18:03.003000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-05-11 15:18:03.004000+00:00  <6>[   82.740577] smsc95xx 2-1.1:1.0 =
eth0: Link is Down
    2021-05-11 15:18:03.017000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Tue May 11 15:18:09 202<6>[   82.749735] smsc95xx 2-1.1:1.0 eth0: har=
dware isn't capable of remote wakeup
    2021-05-11 15:18:03.017000+00:00  1
    2021-05-11 15:18:03.022000+00:00  <6>[   82.761945] PM: suspend entry (=
deep)
    2021-05-11 15:18:03.030000+00:00  <6>[   82.770562] Filesystems sync: 0=
.000 seconds
    2021-05-11 15:18:03.041000+00:00  <6>[   82.777940] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-05-11 15:18:03.047000+00:00  <6>[   82.789596] OOM killer disabled.
    2021-05-11 15:18:03.300000+00:00  <6>[   82.795733] Freezing remaining =
freezable tasks ... =

    2021-05-11 15:18:03.324000+00:00  <6>[   83.040350] usb 2-1: new high-s=
peed USB device number 4 using dwc2 =

    ... (23 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/609aa0ba7806ad13=
bad08f37
        failing since 0 day (last pass: v5.12-451-gae657abc971d2, first fai=
l: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-11 15:18:23.495000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Tue May 11 15:18:30 2021
    2021-05-11 15:18:23.506000+00:00  <6>[  103.249331] PM: suspend entry (=
deep)
    2021-05-11 15:18:23.523000+00:00  <6>[  103.262637] Filesystems sync: 0=
.000 seconds
    2021-05-11 15:18:23.541000+00:00  <6>[  103.277086] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-05-11 15:18:23.546000+00:00  <6>[  103.289118] OOM killer disabled.
    2021-05-11 15:18:23.981000+00:00  <6>[  103.295640] Freezing remaining =
freezable tasks ... =

    2021-05-11 15:18:23.997000+00:00  <3>[  103.720346] usb 2-1: device des=
criptor read/64, error -110
    2021-05-11 15:18:24.342000+00:00  <6>[  104.080351] usb 2-1: new high-s=
peed USB device number 5 using dwc2
    2021-05-11 15:18:29.580000+00:00  <3>[  109.320351] usb 2-1: device des=
criptor read/64, error -110
    2021-05-11 15:18:43.562000+00:00  <4>[  123.305310]  =

    ... (18 line(s) more)  =

 =20
