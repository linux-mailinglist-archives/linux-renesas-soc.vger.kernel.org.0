Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5C1347EF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 18:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237426AbhCXRLN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 13:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237306AbhCXRKY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 13:10:24 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6608C0610CF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 10:09:07 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id y5so17794683pfn.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 10:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=88k8L6R/ICrCLPWfIi6fM1iksVTfWwew/gFGbvC9uws=;
        b=cVZYzlmbAP+U2+rHaDB5rxA6KPjhApCELt2MwK90halVV41NpG1SjoYa9AzEU5vOYI
         Tm4spu1M1la00jrs/hCryR4/gV4JhHth6zEWPaQCH7NDg6FtMIcPpIR8OjPhZkfsH6EA
         0MUvAdqAeKGpQi3h6JXNXn2minkqbp4xBSmCEmfC1iBng6zSgpKfIHhwcvlhdDoJqMTA
         9Oco7eKadhsHKSvQnQOPI4PHjXoPmwMzZvE9ysUIJYuahQIPhuiVtxbjn8xLPweJWPz8
         YCaWaXLmUftSG31NfifXij0WkTFNiecJj80x0WQb9qRHYpn5phu5CBjpaXJseLOIAuHq
         THdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=88k8L6R/ICrCLPWfIi6fM1iksVTfWwew/gFGbvC9uws=;
        b=az85o8h0pLT2jPeYRNWLFm48MFT8H03fwrTF56MnySbyR+jMQ2yBJcsDy/w/Foqn6t
         0hBmOhb3YrXKDELKYEFXdbAYWozWgAnPRdSiK1ri7LPt6CWYXMWebgDlfhoB9UoGrIux
         8FYgfzpXJwdZiPDTrs7C2e6ds6Qpjap4wPPn4ffZndRbIeXLC5AgxcRgPCtRFaPY+P+D
         f4JNADUHkoVOU/HQpbXhul9Cblvo7ZAl5K6JeDbBWtnCQkOX1T37lmr9XCeWOmt775yv
         1QgeZXmLWG4IEnn5hSpwncX7do/EO0b4gQGY7MKG+NoCLyMegl1015C2hhDMyf6dHUtc
         wZfA==
X-Gm-Message-State: AOAM531Pb2FNoGnZPO76rVabb/J6G6RvSKhk99J62mWtGHkPVP389CAo
        XuHV2E8gaihux4fyJgFAF6d4wSsJyWFFcQ==
X-Google-Smtp-Source: ABdhPJyHtATmWo2ySflTcOp3rF0Gc9DumxnZDWMxFRhMnyJnxiH4MztI5wHLl2WTFZOqvisFycm1eA==
X-Received: by 2002:a65:61a4:: with SMTP id i4mr3894772pgv.39.1616605747325;
        Wed, 24 Mar 2021 10:09:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j3sm2824658pjf.36.2021.03.24.10.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:09:07 -0700 (PDT)
Message-ID: <605b7233.1c69fb81.e21f3.6c43@mx.google.com>
Date:   Wed, 24 Mar 2021 10:09:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-03-24-v5.12-rc4
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master usb: 2 runs,
 1 regressions (renesas-devel-2021-03-24-v5.12-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 2 runs, 1 regressions (renesas-devel-2021-03-24-v5.12-r=
c4)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-03-24-v5.12-rc4/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-03-24-v5.12-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c8e95c41b8503aa53a50110d62643ce210b00001 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/605b5dbaab47012704af02b9

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-24-v5.12-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-03-24-v5.12-rc4/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0315.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/605b5dbaab4701270=
4af02bc
        new failure (last pass: renesas-devel-2021-03-22-v5.12-rc4)

    2021-03-24 15:36:44.215000+00:00  + lsusb
    2021-03-24 15:36:44.215000+00:00  + awk {print $6}
    2021-03-24 15:36:44.215000+00:00  + sort
    2021-03-24 15:36:44.215000+00:00  + seq 1 3
    2021-03-24 15:36:44.215000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-03-24 15:36:44.215000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-03-24 15:36:44.216000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Wed Mar 24 15:36:47 2021
    2021-03-24 15:36:44.271000+00:00  <6>[   19.412810] PM: suspend entry (=
s2idle)
    2021-03-24 15:36:44.272000+00:00  <6>[   19.417414] Filesystems sync: 0=
.000 seconds
    2021-03-24 15:36:44.272000+00:00  <6>[   19.424140] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (134 line(s) more)  =

 =20
