Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4053798CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 23:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhEJVKS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 17:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhEJVKS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 17:10:18 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1E2C06175F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 14:09:12 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id p17so10508966pjz.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 14:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xUDINrrNLAyscydEThKv9u/iGC9meEvSUnoIO43otyI=;
        b=k/hxKR4oGm1VAvCw34LedA4chtxk1oM1YXCebuQ06qgRhmYddtWEez6kf0n2WKk8Zx
         C2HyPQzvnN5apd6SPDfPVnlvp3JK7MGNv6J8seMNvw6b/XEJD70IGfl8V6MKweFQHopg
         oOSPoVzGpQzd9QlnlXKmzJu3gP7fe0UUpc4t1iwfGAAn6RqjshZJ4jomGKUiFklYsXpH
         sq5/oKHJZx/B2Tz0ZW+WD2106aYHEcp/qgBgbtQgriS0iBNSBRe3R0xHsrSv1BfJ5efb
         FCk9BoBSDBNzVEVlr1aEqicsLI3KdxVbLGr68/ToIpLGMW3dv7s0Rvsx96EQsOJk7th6
         EjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xUDINrrNLAyscydEThKv9u/iGC9meEvSUnoIO43otyI=;
        b=V/aIf0IhUbEvHaN9zwrg3l6SwCw2/8NR8PTR0nCndgj/yqki+tN4Aex0nILtx1w3VR
         fQCs1MRUm9V0K5r7MJaZDnU25EIl7sJP7WZ0KG5IIGubp50Mz5NsTxH8AbCVA/iBjXDI
         Ydi9iUvWTU2i1ZhAFdEpmCTLZnHgks2ome1lKR3eazhFlukD8HdW8JLWjKN71k9JFTIe
         kVsUJ0vDPKp1Nk8XsloRvJq2BivNAldytitz8qbUoxUgZ3iN2FlCcsO0RUDiFuMVOlXF
         T7nFH0LPQLMTECRXkKNlZOnCJg+TeeXqvK7tvoaMjNQZ0lzj1ycaAAEyQXlFuUngyC75
         GmTQ==
X-Gm-Message-State: AOAM530pNFEe6U7MOaD9MfRWHyjltlwrv1E042o8iKhJ2j0fRl+BIp/e
        N8Tu611goSuBl6Zpz5YLmhMqZlYi6gv7e4Nt
X-Google-Smtp-Source: ABdhPJyohAV26aXL98on7VYHogVWbhau5btYvx2vvLflFcdTj+eKQponAhS+ETXQvfBYw66VNsqo2w==
X-Received: by 2002:a17:902:7589:b029:ed:492a:6ac6 with SMTP id j9-20020a1709027589b02900ed492a6ac6mr27043428pll.62.1620680951829;
        Mon, 10 May 2021 14:09:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z13sm12051672pgc.60.2021.05.10.14.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 14:09:11 -0700 (PDT)
Message-ID: <6099a0f7.1c69fb81.b6d26.4e94@mx.google.com>
Date:   Mon, 10 May 2021 14:09:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-10-v5.13-rc1
X-Kernelci-Branch: master
Subject: renesas/master usb: 3 runs,
 1 regressions (renesas-devel-2021-05-10-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 3 runs, 1 regressions (renesas-devel-2021-05-10-v5.13-r=
c1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-10-v5.13-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-10-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dcf2613335bced4d60b8b8e10134d2f9153d298c =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-8    | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/60999254f9e9b69d896f5469

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-10-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/usb-rk3288-r=
ock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/60999254f9e9b69d8=
96f546c
        failing since 13 days (last pass: renesas-devel-2021-04-19-v5.12-rc=
8, first fail: v5.12-451-gae657abc971d2)

    2021-05-10 20:01:41.769000+00:00  + lsusb
    2021-05-10 20:01:41.769000+00:00  + awk {print $6}
    2021-05-10 20:01:41.769000+00:00  + sort
    2021-05-10 20:01:41.769000+00:00  + seq 1 3
    2021-05-10 20:01:41.769000+00:00  + /usr/sbin/rtcwake -d rtc0 -m freeze=
 -s 1
    2021-05-10 20:01:41.769000+00:00  rtcwake: assuming RTC uses UTC ...
    2021-05-10 20:01:41.770000+00:00  rtcwake: wakeup from \"freeze\" using=
 rtc0 at Mon May 10 20:01:44 2021
    2021-05-10 20:01:41.829000+00:00  <6>[   13.349451] PM: suspend entry (=
s2idle)
    2021-05-10 20:01:41.829000+00:00  <6>[   13.354026] Filesystems sync: 0=
.000 seconds
    2021-05-10 20:01:41.829000+00:00  <6>[   13.362878] Freezing user space=
 processes ... (elapsed 0.001 seconds) done. =

    ... (112 line(s) more)  =

 =20
