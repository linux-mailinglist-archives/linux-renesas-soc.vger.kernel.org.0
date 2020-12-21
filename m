Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0F02DFB84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 12:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgLULaG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 06:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgLULaF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 06:30:05 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC6AC0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 03:29:25 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id w5so6201707pgj.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 03:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=F0v3t+L7KJdbyfzo4e1UGkEHFhbIvMU2vDEyoihqQiQ=;
        b=qLlaJfD+sAWECDelGDtuTi1Q52yLvR7Gj9ed85MIW3qWIxEoSOqF+qMMDrdewCebSB
         xLqijHueX8QycWJE+gq8dxRWn1ZxUbqkMwveD9f4cAzWfsi4AggrfH/GsP/5O5UJ+/DI
         T+IG8SAirHoN225d+lfmr2Es9csWRmf3m4+vgG/AxPmtX5paQNDMCd6/Bw+UDW1sD3ZZ
         7a8/KMJCyj9jbUcREvRFltNEd/oLLfN6dkjYkeZl0DhIS0x4nF8s6APr4DAcrwqLmr2T
         M9kaYYN5/lyNlUkJVn+3LyGq74sJUfjgB+nMf31fZKDNqkcMKbu0T9Fm96P/bN/io9Cp
         ePDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=F0v3t+L7KJdbyfzo4e1UGkEHFhbIvMU2vDEyoihqQiQ=;
        b=Ra1r3X6oXI/v9w7kIMiDcti98nbFIq3azXTSvGoQjHpeHrjfNA5o0GZJU458ulb22H
         /F55wsXLAUGhxnXDvPU0BqDLfTz/Y9LVzAJ4q1qsXH3r73l2aDTiro9pd3sEih5y4Hh+
         OQkwd1Outi5iAP1JcywhckW4YEpieo1A7KnIDk5cbXKKV9S6oZ5Mn7TYoF0zCM22nEk5
         aYE/R3UuNrThBwPzy/9JdUQkJCzV9Ha+nMQIBeHnctkNbLSI+t+QhjMeSi5F89YI6SR3
         Xgwrf2H3d5q/V6Bl9QvUUuY/Etj66p6x3A26NuHR53QNZsZTYQsj/hA9Og6LsxfF9J/+
         NXWA==
X-Gm-Message-State: AOAM531rZiVi2wDK5vgxZU98LXFcdybgbps4du7Y76KCR37xP2MW+h/g
        xxINgn2p5L7CKWVELFW40Cr7HFm9HpXgBw==
X-Google-Smtp-Source: ABdhPJzNJLdWEZPgQZXMXw0h8OwB1J4IzcFA3Dcjr6nthZw3FalpGQkfr5yUbvtFB8VZNCT/WOaMKw==
X-Received: by 2002:a62:d113:0:b029:1a3:6213:d598 with SMTP id z19-20020a62d1130000b02901a36213d598mr14759468pfg.71.1608550164760;
        Mon, 21 Dec 2020 03:29:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d4sm15228452pjz.28.2020.12.21.03.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 03:29:24 -0800 (PST)
Message-ID: <5fe08714.1c69fb81.cb946.c215@mx.google.com>
Date:   Mon, 21 Dec 2020 03:29:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2020-12-21-v5.10
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 22 runs,
 1 regressions (renesas-devel-2020-12-21-v5.10)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 22 runs, 1 regressions (renesas-devel-2020-12-21-v5=
.10)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2020-12-21-v5.10/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2020-12-21-v5.10
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a0d9f5cfe680c9afb8a9bb2d57b6a1c707da9c3a

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  0e6ac4bd51161c16cc6e4128d921c92902420a51 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=
=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe07637551ef1ef7cc94cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/ltp-ipc-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/ltp-ipc-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20201214.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/5fe07637551ef1ef7cc94c=
d2
        new failure (last pass: renesas-devel-2020-12-07-v5.10-rc7) =

 =20
