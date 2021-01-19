Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA272FBD93
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 18:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391300AbhASR10 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 12:27:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391216AbhASR1W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 12:27:22 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040C6C061573
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 09:26:42 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id n25so13389451pgb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jan 2021 09:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ViOZ7AWw177qV6Lq3br2WbZyxn706L0SfDG1lm75R+k=;
        b=fh9FiKve9RL637sBOKfR/ePCKq5YNWA/v1IqO+u5sZYJaXC2qvJHRKX5NYDmZSIu2E
         +d6Vteth61dt/EYNaL8uLv0bYGHO+TNiX2SvAVbViBej8pT2Oe4jm2pmJ0YoP3fJ+w+g
         TCMZBICF9xbNNn+x7U0bRDgpFzvNjBVT0Bz+79yxxZxs/OB2KkfrmrySBRRooZHnZ9Nk
         XO4Z7X1rQGFOjx5rxS2WhLuMcdDjID2TYq01axmnEgHHO30i1C8iUspJEcHBbPnGRfpv
         Rqlt8uK9tHmDeS/rbniqeE/m5NV0zAnA8VYldWKpa7/GHRVDfC+ANVNz+Eiy29vL1sqL
         +DIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ViOZ7AWw177qV6Lq3br2WbZyxn706L0SfDG1lm75R+k=;
        b=gtsjDYYEu5lom6zKaK5VazRLZZdXrDVI5QE5dBnqg9Bo5WWof2VGGdoCA6TT+8Z03d
         DOBmiEtK30fBe4nFHSVBEvyCit3S1tDKJ24ruFMuE9kpVNJAUxj3GTuVWLXym9EOVp0e
         C0TuTAXR9U38uxFBFOEtJxShq3WgRwB5Z23Z7yRL4JPLzZFsekh75YUevE9nW9pSQdG6
         81cM/c+0/QtKGeE7D1yprhFPBNBLpra9Wi6X+vnKwb3eZ7S/aeaRGsv5xERU5+b6o//i
         dOIBle89tn5ITWtBKtyrJTxMMgvAH6To+fn0Z8Z9W3CS1dJgBsEqb/smNF8haYzxQyXi
         YRYg==
X-Gm-Message-State: AOAM533yHwRFBuPXkwaBidmaVX1qhYlgfr1UyTtDx4cNHHZyiELegFG3
        x/9IwtcMdJPSyktSwNYSNtffZHmRKDuuTQ==
X-Google-Smtp-Source: ABdhPJz3RvBzfWoiRWu394zrvV1OMSKDoH1PKJa7PKQqu/81AGCvteHR/klzaWj3bPYZtGd5vpEWGw==
X-Received: by 2002:a63:f44f:: with SMTP id p15mr5414635pgk.141.1611077201249;
        Tue, 19 Jan 2021 09:26:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n1sm3756917pjv.47.2021.01.19.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:26:40 -0800 (PST)
Message-ID: <60071650.1c69fb81.4c226.8c60@mx.google.com>
Date:   Tue, 19 Jan 2021 09:26:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.11-rc4-383-g822f1d4bfbf2
Subject: renesas/master sleep: 5 runs,
 1 regressions (v5.11-rc4-383-g822f1d4bfbf2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 5 runs, 1 regressions (v5.11-rc4-383-g822f1d4bfbf2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v5.1=
1-rc4-383-g822f1d4bfbf2/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: v5.11-rc4-383-g822f1d4bfbf2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      822f1d4bfbf25ac7008eb9779c43ea99d5aa8f40 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/6007046e86cd5f3f4cbb5d1c

  Results:     11 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig/gcc-8/lab-collabora/sleep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v5.11-rc4-383-g=
822f1d4bfbf2/arm64/defconfig/gcc-8/lab-collabora/sleep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0118.2/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-1: https://kernelci.org/test/case/id/6007046e86cd5f3f=
4cbb5d1f
        new failure (last pass: renesas-devel-2021-01-11-v5.11-rc3)

    2021-01-19 16:05:17.105000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Tue Jan 19 16:02:50 2021
    2021-01-19 16:05:17.112000+00:00  <6>[   21.846314] PM: suspend entry (=
deep)
    2021-01-19 16:05:17.118000+00:00  <6>[   21.850937] Filesystems sync: 0=
.000 seconds
    2021-01-19 16:05:17.128000+00:00  <6>[   21.856635] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-01-19 16:05:17.132000+00:00  <6>[   21.866683] OOM killer disabled.
    2021-01-19 16:05:17.142000+00:00  <6>[   21.870743] Freezing remaining =
freezable tasks ... (elapsed 0.001 seconds) done.
    2021-01-19 16:05:17.151000+00:00  <6>[   21.880878] printk: Suspending =
console(s) (use no_console_suspend to debug)
    2021-01-19 16:05:19.312000+00:00  <3>[   22.504597] mwifiex_pcie 0000:0=
1:00.0: adapter is not valid
    2021-01-19 16:05:19.317000+00:00  <6>[   22.844241] Disabling non-boot =
CPUs ...
    2021-01-19 16:05:19.386000+00:00  <5>[   22.844795] CPU1: shutdown =

    ... (40 line(s) more)  =

 =20
