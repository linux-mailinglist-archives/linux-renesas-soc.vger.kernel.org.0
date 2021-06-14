Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE15C3A6997
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 17:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233080AbhFNPIT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 11:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbhFNPIS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 11:08:18 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46339C061767
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 08:06:05 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d16so10730592pfn.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 08:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vDhf/Cg/FaS1QMhcw6oZbm86PeSUFdpUeRVKW1JyCDg=;
        b=UKk5cybDoMRhvzcgr6KDMp8Cl2NxHms9Av9/UsEAyQK4K5zYf/HY+tpDWr9axcwsg5
         S0DDjxApxSqUp2JvtJPXG3HhnIFNsQm9EhDaaaeVL+T3xppSyWpXQdJ20y2ufAvbaSPP
         tKToJc0/QqSDPUAdRG1giwTto6/vqKmBnp3tLMBiSjH2jNCRC3Opm3xb3Qqa3ZaLfoON
         FtuVeEdTIWdOl8+coiDWSBftXGbz8/do/jbRx9OKYA/NDzP8wgnOTjgkzh4aXNISBuLq
         KExs/yY97oZrMoewQ64+sV4JDWpAMzG6X5WJcVuMjKsERsawiH3Y5hg5IYZcADJVT3VA
         DA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vDhf/Cg/FaS1QMhcw6oZbm86PeSUFdpUeRVKW1JyCDg=;
        b=oBhD7D0IKd3Lezs05KZ7WNgSTsNHsbNuyNAKTWudBp7IwiHeHSsFsXCpm6Z0iDYz6b
         WqIBc1V5ptxeJZbvcrslTmdJ9uQwXZJk1+UbwY8cyWk/c9lARlj+p10kjwvVf4xJVxyw
         8VA0sRFlOrrZD5Y5JDyKDMGLCXmjgarkGnaaUL/agLvzgbcwdRY9meH37oJMhGlJo8Ii
         LkXfW8Mm174/sKN0tnv3drciOHTNxfmrDO+GTbwimro8bT2oZn9q3ZeWwrIXiSYx0xKg
         S5wwS6M5YjrnJcHB3SggeRr3ARBK3yH3UeVdKvMzMrENr+OpTLpYGF5fHIhKKR/Tl7Cc
         BCmw==
X-Gm-Message-State: AOAM532/aQVd4tiTI0tkBT53uO7eCbWldbuJvBPqE24cvoFcqIQAQaPs
        mvTuWT02Czg2bP8IodWg/e2BAAhg+zt0TrPk
X-Google-Smtp-Source: ABdhPJw6/VNf26Hs9sjNqtrlmQDumqubYSdG63ndb4Hr4Th3+MjShe1leNlO1bajj/EQhwoE5IGJvw==
X-Received: by 2002:aa7:8810:0:b029:2ea:1b56:3acb with SMTP id c16-20020aa788100000b02902ea1b563acbmr22043168pfo.68.1623683164353;
        Mon, 14 Jun 2021 08:06:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id iq15sm17213900pjb.53.2021.06.14.08.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 08:06:03 -0700 (PDT)
Message-ID: <60c7705b.1c69fb81.8ccbe.26d8@mx.google.com>
Date:   Mon, 14 Jun 2021 08:06:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-06-14-v5.13-rc6
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 10 runs,
 17 regressions (renesas-devel-2021-06-14-v5.13-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 10 runs, 17 regressions (renesas-devel-2021-06-14-v5.=
13-rc6)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
15         =

rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-14-v5.13-rc6/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-14-v5.13-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      62ebef21d49093d77b84633283806c94630e3694 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
odroid-xu3        | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
15         =


  Details:     https://kernelci.org/test/plan/id/60c76c01745b6b910d41f530

  Results:     3 PASS, 20 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-odroid=
-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-odroid=
-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60c76c01745b6b91=
0d41f535
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5) =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60c76c01745b6b91=
0d41f536
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.062000+00:00  rtcwake: read rtc time failed: Invali=
d argument   =


  * sleep.rtcwake-mem-4: https://kernelci.org/test/case/id/60c76c01745b6b91=
0d41f537
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.085000+00:00  rtcwake: read rtc time failed: Invali=
d argument   =


  * sleep.rtcwake-mem-6: https://kernelci.org/test/case/id/60c76c01745b6b91=
0d41f539
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.130000+00:00  rtcwake: read rtc time failed: Invali=
d argument   =


  * sleep.rtcwake-mem-8: https://kernelci.org/test/case/id/60c76c01745b6b91=
0d41f53b
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.182000+00:00  rtcwake: read rtc time failed: Invali=
d argument   =


  * sleep.rtcwake-freeze-1: https://kernelci.org/test/case/id/60c76c01745b6=
b910d41f53e
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5) =


  * sleep.rtcwake-freeze-2: https://kernelci.org/test/case/id/60c76c01745b6=
b910d41f53f
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.273000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-06-14 14:47:21.288000+00:00  rtcwake: assuming RTC uses UTC ...   =


  * sleep.rtcwake-freeze-3: https://kernelci.org/test/case/id/60c76c01745b6=
b910d41f540
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.306000+00:00  rtcwake: assuming RTC uses UTC ...   =


  * sleep.rtcwake-freeze-4: https://kernelci.org/test/case/id/60c76c01745b6=
b910d41f541
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.334000+00:00  rtcwake: assuming RTC uses UTC ...   =


  * sleep.rtcwake-freeze-5: https://kernelci.org/test/case/id/60c76c01745b6=
b910d41f542
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5) =


  * sleep.rtcwake-freeze-6: https://kernelci.org/test/case/id/60c76c01745b6=
b910d41f543
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.362000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-06-14 14:47:21.381000+00:00  rtcwake: assuming RTC uses UTC ...   =


  * sleep.rtcwake-freeze-7: https://kernelci.org/test/case/id/60c76c01745b6=
b910d41f544
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5) =


  * sleep.rtcwake-freeze-8: https://kernelci.org/test/case/id/60c76c01745b6=
b910d41f545
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.409000+00:00  rtcwake: read rtc time failed: Invali=
d argument   =


  * sleep.rtcwake-freeze-9: https://kernelci.org/test/case/id/60c76c01745b6=
b910d41f546
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.434000+00:00  rtcwake: read rtc time failed: Invali=
d argument   =


  * sleep.rtcwake-freeze-10: https://kernelci.org/test/case/id/60c76c01745b=
6b910d41f547
        failing since 3 days (last pass: renesas-devel-2021-06-07-v5.13-rc5=
, first fail: renesas-devel-2021-06-10-v5.13-rc5)

    2021-06-14 14:47:21.456000+00:00  rtcwake: read rtc time failed: Invali=
d argument
    2021-06-14 14:47:21.474000+00:00  + set +x   =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/60c76ab9f02958b31541f53c

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-14-v5.13-rc6/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60c76ab9f02958b3=
1541f541
        failing since 34 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-14 14:28:52.674000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Mon Jun 14 14:28:59 2021
    2021-06-14 14:28:52.686000+00:00  <6>[   82.135578] PM: suspend entry (=
deep)
    2021-06-14 14:28:52.692000+00:00  <6>[   82.141989] Filesystems sync: 0=
.000 seconds
    2021-06-14 14:28:52.704000+00:00  <3>[   82.143918] mmc_host mmc1: Time=
out sending command (cmd 0x202000 arg 0x0 status 0x80202000)
    2021-06-14 14:28:52.711000+00:00  <6>[   82.149335] Freezing user space=
 processes ... =

    2021-06-14 14:28:52.719000+00:00  <6>[   82.161021] usb 2-1: USB discon=
nect, device number 2
    2021-06-14 14:28:52.725000+00:00  <4>[   82.161949] (elapsed 0.001 seco=
nds) =

    2021-06-14 14:28:52.734000+00:00  <6>[   82.168402] usb 2-1.1: USB disc=
onnect, device number 3
    2021-06-14 14:28:52.750000+00:00  <4>[   82.176334] done.
    2021-06-14 14:28:52.756000+00:00  <6>[   82.182788] smsc95xx 2-1.1:1.0 =
eth0: unregister 'smsc95xx' usb-ff580000.usb-1.1, smsc95xx USB 2.0 Ethernet =

    ... (29 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60c76ab9f02958b3=
1541f542
        failing since 34 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-14 14:29:13.238000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Mon Jun 14 14:29:19 2021
    2021-06-14 14:29:13.250000+00:00  <6>[  102.701924] PM: suspend entry (=
deep)
    2021-06-14 14:29:13.261000+00:00  <6>[  102.711465] Filesystems sync: 0=
.000 seconds
    2021-06-14 14:29:13.274000+00:00  <6>[  102.719882] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-06-14 14:29:13.280000+00:00  <6>[  102.732163] OOM killer disabled.
    2021-06-14 14:29:13.807000+00:00  <6>[  102.738351] Freezing remaining =
freezable tasks ... =

    2021-06-14 14:29:13.821000+00:00  <3>[  103.256579] usb 2-1: device des=
criptor read/64, error -110
    2021-06-14 14:29:14.168000+00:00  <6>[  103.616582] usb 2-1: new high-s=
peed USB device number 5 using dwc2
    2021-06-14 14:29:19.407000+00:00  <3>[  108.856573] usb 2-1: device des=
criptor read/64, error -110
    2021-06-14 14:29:33.303000+00:00  <4>[  122.752325]  =

    ... (18 line(s) more)  =

 =20
