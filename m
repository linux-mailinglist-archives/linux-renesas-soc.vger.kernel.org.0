Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871E9333D46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 14:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhCJNFr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 08:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbhCJNFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 08:05:40 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690E3C061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 05:05:40 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n10so11372709pgl.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 05:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=px2Y1hyJSixRqmgBP2WOehpyhAB6zN3L22wjhLEzyqY=;
        b=yGpYvDMQVhlL6mD2JudkIIvFCUsvZbUe32W/zHLkNBrdYgG6DrTiiv+ORwYt9r4Rwn
         Ybx6huRk53v4A6W0lQ2CdEawryy/OpV1ijuQE1wmJgJShn+GipKbieQgFzhgP6K4JUXn
         PbV/Rx9n9lB8RIxQ768X+NlpewL/Cm6jyol4+ihRzObWx2Y0VbQfcqvD9nIcITZ9718N
         fXx0M/sDu6N+ZoYBqUMfD9pfkMzm5+XdvO671VvMWs+gEvoUqZ1BxaBUen/IQnfpsnxA
         w2LzUALpbO+vFXGps6Nryhy2wpUQ+OEdzBAaT+HeVB5jzjhJzfPZjuiME5tEU/Xx8hpT
         GQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=px2Y1hyJSixRqmgBP2WOehpyhAB6zN3L22wjhLEzyqY=;
        b=oZagudtufq8aXa6S74lRz7kLgQ4tP3niDiPtcNSxIuP9YyBy3D01eTAgoCQ04Nn5UZ
         QjFFlLi65vEhz6KpLcduwqlI9AADlWn8TGT3dAB/OkzMibyw+F67QvokjzGnR4kGbZMz
         od24ZUR3WvU0+Xl13oT1S+rZwB0N4/Qs2pXh/GhsIJjSNbXX7CapHboezuln4NVwFr/V
         7XZjXUrWqDar6HlNBIQUw2Z4AtVu6Fm2+65cwZ9GLqzThMhh9dKcYUUoMqm4L6NbS5fO
         U2OBOTFJQyATwoJdORKe2nusFbUlQndCNWw5v0lmXmiTEz9tmsDfwTHeSUd5uXQzoykp
         AvxQ==
X-Gm-Message-State: AOAM532dT64BxI1zN2RFpgt96n/+JwclptSpbEeeskF6cC4/NW9Z4eNm
        c3z8Tt4gpq9AkeJg3sdpxLbr8KbTPAkNKhDh
X-Google-Smtp-Source: ABdhPJz+oHq0coz+1AHRsv+srDNmz3/FSoaK/F3R/jhillqHqsCi8peP4eoTXzc51kxe87Lv5w0/gA==
X-Received: by 2002:a63:fb10:: with SMTP id o16mr2730845pgh.368.1615381539860;
        Wed, 10 Mar 2021 05:05:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j21sm8524332pfc.114.2021.03.10.05.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:05:39 -0800 (PST)
Message-ID: <6048c423.1c69fb81.db83c.5020@mx.google.com>
Date:   Wed, 10 Mar 2021 05:05:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-402-g439caa20adad
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master usb: 1 runs,
 1 regressions (v5.12-rc2-402-g439caa20adad)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 1 runs, 1 regressions (v5.12-rc2-402-g439caa20adad)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
2-rc2-402-g439caa20adad/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: v5.12-rc2-402-g439caa20adad
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      439caa20adad0b30e626d9bc776057f3a124a4e2 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/6048b56fa1a2ff4697addcb1

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.12-rc2-402-g=
439caa20adad/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock2-sq=
uare.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.12-rc2-402-g=
439caa20adad/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock2-sq=
uare.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0301.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/6048b56fa1a2ff469=
7addcb4
        new failure (last pass: v5.12-rc2-394-g4e589d84c742)

    2021-03-10 11:57:53.046000+00:00  + lsusb
    2021-03-10 11:57:53.047000+00:00  + awk {print $6}
    2021-03-10 11:57:53.047000+00:00  + sort
    2021-03-10 11:57:53.047000+00:00  + seq 1 3
    2021-03-10 11:57:53.048000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-03-10 11:57:53.048000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-03-10 11:57:53.048000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Wed Mar 10 11:57:55 2021
    2021-03-10 11:57:53.104000+00:00  <6>[   19.823655] PM: suspend entry (=
s2idle)
    2021-03-10 11:57:53.105000+00:00  <6>[   19.828265] Filesystems sync: 0=
.000 seconds
    2021-03-10 11:57:53.105000+00:00  <6>[   19.834952] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (113 line(s) more)  =

 =20
