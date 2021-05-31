Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E9D3964A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 May 2021 18:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbhEaQGM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 May 2021 12:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbhEaQEC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 May 2021 12:04:02 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BE2C08EAED
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:41:02 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id q25so1360429pfh.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 May 2021 07:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MSeFweDKLxAWXT6DNKzuUIHo3AVcmSdhpOQGBzWIWBU=;
        b=BYAURlrnJva/9F+BoFj4n6+sj0qt01azTRqIfqGlWlJg5oAklfEHlOemJsMuGXM3JC
         ++LYEJRFBuv8KkmC6qrXsdn0R1ovHjyfXyVMBiqamt2jwHFr5bz3JG3GW3+FbfQJlAhn
         YhO5ZX9ESbs6fx4JYVLYuWZhQscIZ4maBpIfriWS5eOwRmJq+ITJrULeJjLZQEd8CmIr
         4PuDpy9/SwEbRHIovFXEMCiz9w2kw+N3AsX7F75sFH49YmOVC2mcvwHWdV3h2KELdC4i
         HLTSc09VXUsJvEb830Ztg+Qvpfh0I7fibSoyQHi5r4MOABlLRYtl+qDIClqBtylGf352
         gR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MSeFweDKLxAWXT6DNKzuUIHo3AVcmSdhpOQGBzWIWBU=;
        b=EEKQTT3ivDEHymntzBhfPFhQxnIDbsHZ29ryHNzvNA6uYRi7q+zYOwN/85k1ItgOzb
         mvIJL+81U01zbnjNpDe+jxCAJPJAuSiESCPBkD2hPlHvvwgGNC8jGB50PdwfeeopFlug
         KKehuQlhI5nCzF/jWc2VKdJ8CXgOQvTctozFD/9Wi6AlSxhuJYLhKyO5stkHpILEQ+Z9
         tdgKe9zh82jMrXsLOg61nGn0iefZV5+zUmMuwUx6+jJL7QG81Mif8eoL4HcTGuNC/0rV
         pC6MdQK3m1Ojh0J82rBq8dW7l41eX4JfrAXMrvBBn/mQtmakpVQoDNI6dvLS2HOFJTiM
         TUsQ==
X-Gm-Message-State: AOAM530jXxYgIwbw9wEpmlR+O9cesHc+Q8G9ONamYNoFiFxJa6lv0UtP
        sD9nxzlNCZ642ro3zdRf/fI0bTgh02RsZrjp
X-Google-Smtp-Source: ABdhPJxlJjC0KlDE5Tyf4TpEmq/ss5iMUKoZU33Rbu+wCWVJIbM0NSnUUWESrDM2rhmmQwjOzS9KfA==
X-Received: by 2002:a65:60da:: with SMTP id r26mr23046327pgv.133.1622472062127;
        Mon, 31 May 2021 07:41:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o10sm11144794pfh.67.2021.05.31.07.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 07:41:01 -0700 (PDT)
Message-ID: <60b4f57d.1c69fb81.86705.3487@mx.google.com>
Date:   Mon, 31 May 2021 07:41:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-31-v5.13-rc4
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master sleep: 6 runs,
 2 regressions (renesas-devel-2021-05-31-v5.13-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 6 runs, 2 regressions (renesas-devel-2021-05-31-v5.13=
-rc4)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-31-v5.13-rc4/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-31-v5.13-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a17b18482334959148cabda392caea262c68ba77 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/60b4ec0505ca8ae7cdb3afb8

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-31-v5.13-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60b4ec0505ca8ae7=
cdb3afbd
        failing since 20 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-31 13:58:17.581000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Mon May 31 13:58:23 2021
    2021-05-31 13:58:17.590000+00:00  <6>[   82.226855] PM: suspend entry (=
deep)
    2021-05-31 13:58:17.597000+00:00  <6>[   82.233313] Filesystems sync: 0=
.000 seconds
    2021-05-31 13:58:17.609000+00:00  <6>[   82.240673] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-05-31 13:58:17.615000+00:00  <6>[   82.252035] OOM killer disabled.
    2021-05-31 13:58:17.891000+00:00  <6>[   82.258030] Freezing remaining =
freezable tasks ... =

    2021-05-31 13:58:17.899000+00:00  <3>[   82.525698] dwmmc_rockchip ff0c=
0000.mmc: Busy; trying anyway
    2021-05-31 13:58:18.411000+00:00  <3>[   83.042244] mmc_host mmc1: Time=
out sending command (cmd 0x202000 arg 0x0 status 0x80202000)
    2021-05-31 13:58:18.419000+00:00  <6>[   83.054042] smsc95xx 2-1.1:1.0 =
eth0: Link is Down
    2021-05-31 13:58:18.429000+00:00  <6>[   83.061728] smsc95xx 2-1.1:1.0 =
eth0: hardware isn't capable of remote wakeup =

    ... (26 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60b4ec0505ca8ae7=
cdb3afbe
        failing since 20 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-05-31 13:58:37.854000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Mon May 31 13:58:43 2021
    2021-05-31 13:58:37.865000+00:00  <6>[  102.502910] PM: suspend entry (=
deep)
    2021-05-31 13:58:37.886000+00:00  <6>[  102.522063] Filesystems sync: 0=
.000 seconds
    2021-05-31 13:58:37.897000+00:00  <6>[  102.529474] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-05-31 13:58:37.902000+00:00  <6>[  102.540895] OOM killer disabled.
    2021-05-31 13:58:39.425000+00:00  <6>[  102.546890] Freezing remaining =
freezable tasks ... =

    2021-05-31 13:58:39.438000+00:00  <3>[  104.061253] usb 2-1: device des=
criptor read/64, error -110
    2021-05-31 13:58:39.787000+00:00  <6>[  104.421287] usb 2-1: new high-s=
peed USB device number 5 using dwc2
    2021-05-31 13:58:45.026000+00:00  <3>[  109.661231] usb 2-1: device des=
criptor read/64, error -110
    2021-05-31 13:58:57.913000+00:00  <4>[  122.552719]  =

    ... (21 line(s) more)  =

 =20
