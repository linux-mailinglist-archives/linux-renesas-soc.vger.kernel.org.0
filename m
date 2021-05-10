Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3352137994D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 23:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbhEJVkF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 17:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbhEJVkE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 17:40:04 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC82C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 14:38:59 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id b15so3621165plh.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 14:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5tOctPpSZGn534xxXm6B4DYETccuyXI352VtIkHYbr0=;
        b=0Ksmm9ATab6qF+rAJf+hF6gK64Cx/f043QkwQQbpd437P9mRVcXXxnOGXZWyVbnC3r
         6eD2Mhb5FfNXwtCI6xLcBziqmxf7F2U1GsO/aacu90kFJfu9n0+y5UUbWDyc43M6TK3q
         ZOnAR2P3dIX9KX4PKxZYV7U6rhCoRTbgpZhha41DvLU8rBekDrfPFOuHVqd95k5a8yvG
         U8u90pxoSBP6ZRMGMWCEC/sx2u9cVKLawnQ8yTuox7ANhZQNO/jziKi5+vB6DzMkXHOb
         FkzRgLCyafj2e1GNF2ud/8f0frku+/pcSsDwyEfN+GkvqwfF21CHGtw+zh0tq+VLCgEf
         AkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5tOctPpSZGn534xxXm6B4DYETccuyXI352VtIkHYbr0=;
        b=uEPR+xU/JMnZfoFy9UUvTvRPDr8BXnj0Mpwe18WNKsl9Edy1Z/7gTVsjiGa02KdJ5G
         0HXFrLTySfptIwBy4E4vENUZaklMjmMHiJ/D2p4FBh4YNYuTXrObUJUGgExVOWfP+CUG
         3Fpb+s/htrC+4x1SN2FoxCT/OxQ9cPXH0gLF9ZyrL4wG17SqhSMUo8UGgNJa5yo+MrKI
         r7y9b7LOwEPTnMMvRUxhj0tIwvRvEMKWYwpaYn1sqTD1sUYDNQ/t73YCAUzid0NtYl9g
         6h58bBvGtyOPRdQ5Tzmlj5zg52LZ6k+Mhbp5o9CSUTyyfLt5Af6bOuCjjNxuQkJQ7MpI
         RQ+Q==
X-Gm-Message-State: AOAM5312JQVXZSuhfdLjafNcZ5H5j1CcivFxh2191fBsVKM4wCCRHfjT
        Ug1XF2MFAGcfgQx0gwx2pyyahNTYFSKM14ZX
X-Google-Smtp-Source: ABdhPJzJ9WmEWlPpXIq8H/AZykukYj36yPujDM4frYA0y0QHUT+O+Nx1e0A8oae5EdnfnTicvG63PQ==
X-Received: by 2002:a17:902:7441:b029:ef:46ba:649 with SMTP id e1-20020a1709027441b02900ef46ba0649mr3413018plt.66.1620682738459;
        Mon, 10 May 2021 14:38:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q7sm10246470pfq.172.2021.05.10.14.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 14:38:58 -0700 (PDT)
Message-ID: <6099a7f2.1c69fb81.c384c.f5b4@mx.google.com>
Date:   Mon, 10 May 2021 14:38:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-10-v5.13-rc1
X-Kernelci-Branch: next
Subject: renesas/next usb: 2 runs,
 1 regressions (renesas-next-2021-05-10-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next usb: 2 runs, 1 regressions (renesas-next-2021-05-10-v5.13-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-10-v5.13-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-10-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      213494b51d07b798e12651aaa9e24d8e0acf90e0 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60999b322ed6d2264e6f5494

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60999b322ed6d2264=
e6f5497
        failing since 13 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276)

    2021-05-10 20:39:31.576000+00:00  + lsusb
    2021-05-10 20:39:31.576000+00:00  + awk {print $6}
    2021-05-10 20:39:31.577000+00:00  + sort
    2021-05-10 20:39:31.577000+00:00  + seq 1 3
    2021-05-10 20:39:31.577000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-05-10 20:39:31.577000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-05-10 20:39:31.577000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Mon May 10 20:39:34 2021
    2021-05-10 20:39:31.632000+00:00  <6>[   20.876513] PM: suspend entry (=
s2idle)
    2021-05-10 20:39:31.633000+00:00  <6>[   20.881091] Filesystems sync: 0=
.000 seconds
    2021-05-10 20:39:31.633000+00:00  <6>[   20.887393] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (133 line(s) more)  =

 =20
