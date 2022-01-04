Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DAB483BB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jan 2022 06:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiADFfw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jan 2022 00:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiADFfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jan 2022 00:35:52 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195B1C061761
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jan 2022 21:35:52 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id u20so31225076pfi.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jan 2022 21:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=G9v1noKP2g0yBgMAFhDJMEt4Jpv9hi7YoUham8e2hZs=;
        b=it+lkHHBHnRll3DdniQMPVnwOnoCxublSa8fN08FWHlA3QEeBQY1jEesB45EeVGkgz
         eqwQ4Ioan3pzdaCDJB67U8VeExVRNR9ncbmtj1wE6qcPRVGOZZZUZQCE/WrvcYiYNN9F
         aEzD4i8g6T8T4ktTSYiJVAe8kx2aiJgEqd/ZivqnKhh43ST5Gkchk1KUPBw3j8SjJRS+
         3qCB941E1SJ1xEEPZ1KHCliXUKtmGmBBlCH9+fPdIahtgWgzLQK7KCKhH4BVp5K0kYk6
         SFYUnsOcnldoy/kn5MX64JbpcdKQSXQcN3sPEG7rzwOgUIThHbik6BRAYYsqgyDGmxKu
         pLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=G9v1noKP2g0yBgMAFhDJMEt4Jpv9hi7YoUham8e2hZs=;
        b=SKFfyd0zCoER2tfHTFjDJ94m5wwPOYSsPaB5BZyh+Tj7ChgIU5ZuCRO23Ck3Rm42Us
         uDxyf18eX40hxWDsao1jAlMO43yHNZzztcRQrXVHgaz20tiAzG1CrDAlM5uM7YTvLee2
         sej31yJOxmnP+BmVJTXUjNvqq61EWdn30TCO9b4YL8Ll0Lz3JKe/RnPTpWttEA0aRrpV
         C3D7DaFGPedTZUGz0e5pAPgVUmn8Vm/Cmv1hXORV8hN6wNMRw1ayzqrbVXGTBtocIhr2
         SSGTp66HjbExNSB8U9vSGPRX4F4imbvxz5CZff+6SHT2GxyaZAJosD4foxgaHYIqtMhI
         MjUA==
X-Gm-Message-State: AOAM532wIUbD1VZYS4hFtrIpIAU6SHk6DH+0Dayu05K3BH8wqAn4fEy8
        ATIdyXm/C153XM+krgKwSWato4+s+5QTANOv
X-Google-Smtp-Source: ABdhPJw7UJkOMPtvFwb/2kXpewWictQHvAo1nOxPyR7B3tQqkEAGMi3RSmfeSM0nIZysnKBQFNKJ3A==
X-Received: by 2002:a63:3dc6:: with SMTP id k189mr41202616pga.601.1641274551250;
        Mon, 03 Jan 2022 21:35:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t8sm34324216pgk.66.2022.01.03.21.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 21:35:51 -0800 (PST)
Message-ID: <61d3dcb7.1c69fb81.a94cc.e534@mx.google.com>
Date:   Mon, 03 Jan 2022 21:35:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-01-03-v5.16-rc8
X-Kernelci-Branch: master
Subject: renesas/master baseline: 377 runs,
 2 regressions (renesas-devel-2022-01-03-v5.16-rc8)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 377 runs, 2 regressions (renesas-devel-2022-01-03-=
v5.16-rc8)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

meson-gxl-s905d-p230 | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-03-v5.16-rc8/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-03-v5.16-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      742d780d939d62803bacae8de6b8ecf30792d391 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d3a3748e6fe6e926ef6751

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-03-v5.16-rc8/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-03-v5.16-rc8/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d3a3748e6fe6e926ef6=
752
        failing since 49 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxl-s905d-p230 | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d3aaee5d14496df6ef674a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-03-v5.16-rc8/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-03-v5.16-rc8/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-ba=
ylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d3aaee5d14496df6ef6=
74b
        new failure (last pass: renesas-devel-2021-11-22-v5.16-rc2) =

 =20
