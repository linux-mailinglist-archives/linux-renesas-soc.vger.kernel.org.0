Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E524477B36
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 19:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239989AbhLPSCM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 13:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238614AbhLPSCL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 13:02:11 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6A0C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 10:02:11 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id mj19so6268822pjb.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 10:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=H0VS6qe0oGBPjKINRfn2SQ5qFAd/6BhMv+nIRM9ZTDo=;
        b=V6eC/gnV5P2HkTR+8yYz7/m7jUqR00y7SasiHlrUYIKApqd9nQ6fdVweXIum55W1oR
         zAT8L4rONYKr3PZ8cEaDK9ahkWdKuZvY2e2RaFtzjMvfCGYsKw0TSqcfWbW9zU4vVBDT
         dyPtI5a9XPCKEWBPzG0YG9bo1pyfYLndS97GyxAsujZ3dz62aNsbVZbID9On9CCnYK2U
         L90mEMD2Q5nxNKS+AzRJfzpZ9n+GotPFCdDg69u0cViU3+xhgXG1Edpilka+r6hywHkt
         Pv7xTa2m15XyrESNF9jUOXTF006Rokl/CZR04k97urhB8HnSDF585dFYKKGjN7yC23+X
         vHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=H0VS6qe0oGBPjKINRfn2SQ5qFAd/6BhMv+nIRM9ZTDo=;
        b=pDJgmypnJCOk3z388TxUsTrSmU4UKly/vTMjbTvIrJw4Ec9VVaJgmqi0Ro8htakHu9
         kbw2DqeHHRA4xz6x1RFfWrzN8Eflk96mlm0McLCwXppT1uI6isyIfVCiH8KWItkGcm3j
         WSh6UatsAS44qmoGEo+pu+o60l1lcobYhGMc79r2glY7jAUZEECFOoVn3EA4E0MIhQZx
         PUXKA3cR+y3SjOwudYqPQqjg/b3IAFRCq1mQ+BraT5yYbM1URP95VtvQGlyJUuQJWle+
         RIrIXQ0fejOFPMcozLlLAa5r0Mvw/TyG8X1KXN0jepJORM+rlOCRqWCRlutUcNpbB9vM
         6o8Q==
X-Gm-Message-State: AOAM533eUdM72bnwDZkmRTK984QxahASyNtuAN4eRSbZlO88H5AVxK4u
        Z1DgSMDDlTl1vZKfsfCTgVN4pmdUFgn3EfEG
X-Google-Smtp-Source: ABdhPJxnqlNC2gsObX9tvLs1auVbLFBbPf9lHk867SxM6HMgVO6XCEzsbLM0Yqzl6CRdwhAo+MUyeA==
X-Received: by 2002:a17:902:e2d2:b0:148:a9d9:125e with SMTP id l18-20020a170902e2d200b00148a9d9125emr8873237plc.138.1639677730777;
        Thu, 16 Dec 2021 10:02:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d185sm5875764pgc.58.2021.12.16.10.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 10:02:10 -0800 (PST)
Message-ID: <61bb7f22.1c69fb81.23831.ffe3@mx.google.com>
Date:   Thu, 16 Dec 2021 10:02:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-16-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master usb: 2 runs,
 1 regressions (renesas-devel-2021-12-16-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master usb: 2 runs, 1 regressions (renesas-devel-2021-12-16-v5.16-r=
c5)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-16-v5.16-rc5/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-16-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b33e75b3e597788be243c04aba22d39431b9ecfb =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
| regressions
--------------------+------+---------------+----------+--------------------=
+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/61bb72b2ffec88815239715c

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-16-v5.16-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-=
rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/armhf/rootfs.cpio.gz =



  * usb.compare-freeze: https://kernelci.org/test/case/id/61bb72b2ffec88815=
239715e
        new failure (last pass: renesas-devel-2021-12-14-v5.16-rc5)

    2021-12-16T17:03:58.640675  G Controller Bus 003 Device 003: ID 0ea0:21=
68 USB Flash Disk Bus 003 Device 002: ID 05e3:0608 USB2.0 Hub Bus 003 Devic=
e 001: ID 1d6b:0002 Linux 5.16.0-rc5 ehci_hcd EHCI Host Controller\"
    2021-12-16T17:03:58.641167  + lsusb
    2021-12-16T17:03:58.641544  + awk {print $6}
    2021-12-16T17:03:58.641956  + sort
    2021-12-16T17:03:58.642406  + seq 1 3
    2021-12-16T17:03:58.642749  + /usr/sbin/rtcwake -d rtc0 -m freeze -s 1
    2021-12-16T17:03:58.643078  rtcwake: assuming RTC uses UTC ...
    2021-12-16T17:03:58.643402  rtcwake: wakeup from \"freeze\" using rtc0 =
at Thu Dec 16 17:04:01 2021
    2021-12-16T17:03:58.643721  <6>[   17.352914] PM: suspend entry (s2idle)
    2021-12-16T17:03:58.644035  <6>[   17.357457] Filesystems sync: 0.000 s=
econds =

    ... (119 line(s) more)  =

 =20
