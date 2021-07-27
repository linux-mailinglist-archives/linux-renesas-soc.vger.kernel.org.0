Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841773D83EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 01:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbhG0XZJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 19:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbhG0XZI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 19:25:08 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6A0C061760
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 16:25:08 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id i10so417561pla.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 16:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Xno27RAMJ8I4H2xHTyH/vPoPANI0QFU0wwg/zwKFw5U=;
        b=wIueCLUT25iIuUbdO1rn9xuhw7CU2AcNoCa4yC4c2154oMTbxLq1ekshPAYt6qpeZs
         j8NYXity5ml3ZEc/IQL4gm9wYaD3idmfM9LJHIghFKnAnVv4f1V03RKmZhyEYxzLOQ8s
         7xLUQ0VygDcL2gYH/x49HeSNK4CldoVl0SuTyxdwsHKYceFQfk9xg5WPnYvgU8Ea6u1F
         kXQxeEvMjrBnihXdwJKTmJpyzIxnW35XDgIVJDgnkMfsXT4A5ncy/hN9DKhtyFbiuI76
         pKFTl9TzIcx919Gfk2YmfsarTn/K2y+Z/J8V9jr1uykNjaV0d6UfYrNDt32JTEcuSDFV
         pSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Xno27RAMJ8I4H2xHTyH/vPoPANI0QFU0wwg/zwKFw5U=;
        b=AOgo+aZowz5vbDIECu4BlNkMDyyaN59JfNlTtiClFkVm4Smqzfp21dE6lh+c+HX0q1
         iNAKzJjmsBcLiijAsRZicPGhdHXYNBLSNNEo0h8mh7DV1J1d6VHlSis32AkRTXw48eoG
         QcIjI6/K0H0YxuIwqp8jdFzy02E2cyZ+7d/ytJK7EXY7htLZQ0Y1MCwUbNtaIQ3N4nLs
         ddcTJTpIvkvH6wy88rbUkP+ssEmSHb3xSYe9xnGycAaLt++dt+xEgjvzuG0JdOWo3fLS
         xJrEmzHnL+OdiSCLMdLrqQNDg0zyQXKf3E/Tu5au5yZBfhQsiqWGDBXaJYUHoL+ODof6
         zbrQ==
X-Gm-Message-State: AOAM532N4rA6h8IiWz3UjUaOjmrueJpdj30/rJxXA7bPZGbVmTvpe7Mc
        0u5tonu9HBwPfwWh0P8zs1hbPbDUSDX6rIkw
X-Google-Smtp-Source: ABdhPJxq0KBDpvtly9XFF5tEovceQ/YKy7XgS/3oe2bw0Is+yLXjNNik29jhwlhRF9qLhrQpEysSRQ==
X-Received: by 2002:a05:6a00:238e:b029:35c:c5e:b82d with SMTP id f14-20020a056a00238eb029035c0c5eb82dmr25503372pfc.33.1627428307690;
        Tue, 27 Jul 2021 16:25:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b3sm4947701pfi.179.2021.07.27.16.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 16:25:07 -0700 (PDT)
Message-ID: <610095d3.1c69fb81.f97b4.04e6@mx.google.com>
Date:   Tue, 27 Jul 2021 16:25:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-07-27-v5.14-rc3
Subject: renesas/master usb: 2 runs,
 1 regressions (renesas-devel-2021-07-27-v5.14-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 2 runs, 1 regressions (renesas-devel-2021-07-27-v5.14-r=
c3)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-27-v5.14-rc3/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-27-v5.14-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f9fff2ace3df79f0bd941471e986f0890eb3a5de =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/610085ce40b5369c8d5018c6

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-27-v5.14-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-27-v5.14-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0722.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/610085ce40b5369c8=
d5018c8
        failing since 0 day (last pass: renesas-devel-2021-07-19-v5.14-rc2,=
 first fail: renesas-devel-2021-07-26-v5.14-rc3)

    2021-07-27T22:11:21.151841  rtcwake: assuming RTC uses UTC ...
    2021-07-27T22:11:21.152050  rtcwake: wakeup from \"freeze\" using rtc0 =
at Tue Jul 27 22:11:23 2021
    2021-07-27T22:11:21.208301  <6>[   16.107911] PM: suspend entry (s2idle)
    2021-07-27T22:11:21.208744  <6>[   16.112520] Filesystems sync: 0.000 s=
econds
    2021-07-27T22:11:21.209079  <6>[   16.118755] Freezing user space proce=
sses ... (elapsed 0.001 seconds) done.
    2021-07-27T22:11:21.209394  <6>[   16.128274] OOM killer disabled.
    2021-07-27T22:11:21.209692  <6>[   16.132170] Freezing remaining freeza=
ble tasks ... (elapsed 0.001 seconds) done.
    2021-07-27T22:11:21.209987  <6>[   16.141872] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
    2021-07-27T22:12:00.636410  <6>[   16.155826] rk_gmac-dwmac ff290000.et=
hernet eth0: Link is Down
    2021-07-27T22:12:00.636890  <6>[   40.792281] vcc_host: disabling =

    ... (123 line(s) more)  =

 =20
