Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93AFD2C9484
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Dec 2020 02:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgLABRR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 20:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgLABRR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 20:17:17 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D17C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 17:16:36 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id ms7so203548pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 17:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4HMUYQdwsVKmtZF58XfiapOL/eJIxSITAtHNLKIhkUo=;
        b=BGtc/bvxIjY4nHJyhKZVXQeQ1PJQqANDQKEH9z/a0BXxjCtR4WQt82K1Rjft2oZMm3
         Wp9GaNkGRkGCbcxDiTxi7uBgUu1YPva2x5HS4sWmzqPv4Id854FWUb1jN9VG9rWtYrve
         vk6z3rN7hvYiWw1X/JKGit3cZ3GrtFMaHsrAxEZsk6Nx+H5pZoWCgyh/qlT0UDrgjHCh
         QU6FrXINeJKBClPuXO1QhenCgy08Z/FC1j8v2c6NOKCQlAWsWAmRtcA1YoSTiqtrbAPU
         RZwucW9cxbDiLYhUmpU0Ep8LplDq2mW4pHTZ/tS2iKgzD+V9vi5Zxn2PzBwa9rTJzcGg
         3CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4HMUYQdwsVKmtZF58XfiapOL/eJIxSITAtHNLKIhkUo=;
        b=EDyD4fTuszeyfGeIXTecuvFCTsWo59O6PMK8XrRmtpdNgJOKyMwAF+JV1kWQM6fjCh
         IT0qASkhS+FukxZlwGZA+NqNdxGv6tiTfDwP3nVIxRAtXBVt6310rRuvK2kGfd5pHI+e
         zM2PGq5ij0TEqlb5/MyW4ZTlJsyGPHc0BZSOxiXTGjXBmaX7CkcYq9WQ8BI7aS8G60k9
         Y98iFemnNUzgOIGT7ZZPvh1VdNMCYh/ARE9ykveb60+lErHwL6XN36n0emQ0KoEqkERD
         yF89Ne8ZU6qOyfXkw9MAaNPSJ3QVRFxl0tTbJOWtZ5eLy5+NlGt3k2gtpE1I3CFz7um7
         vaOQ==
X-Gm-Message-State: AOAM532FUuNahg7/roHQ+7uA/yyDQweVPrORUdJXWNLxxrDVDthmcjHV
        vHmXTSb9xbOKgIHfqNNPyt0nX9ClatW5/g==
X-Google-Smtp-Source: ABdhPJxGvHn/W69Zwo/341ZTgTNg5zDobsH9+F9NVSIg9GIgAtpkzka4X0M6V3zlOAibrMlkJ38zTg==
X-Received: by 2002:a17:90a:8d86:: with SMTP id d6mr148558pjo.120.1606785396152;
        Mon, 30 Nov 2020 17:16:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g11sm140419pju.23.2020.11.30.17.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 17:16:35 -0800 (PST)
Message-ID: <5fc59973.1c69fb81.ccbb9.07ba@mx.google.com>
Date:   Mon, 30 Nov 2020 17:16:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2020-11-30-v5.10-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 26 runs,
 4 regressions (renesas-next-2020-11-30-v5.10-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 26 runs, 4 regressions (renesas-next-2020-11-30-=
v5.10-rc1)

Regressions Summary
-------------------

platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
imx6q-sabrelite           | arm  | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig | 1          =

imx6q-sabrelite           | arm  | lab-collabora | gcc-8    | multi_v7_defc=
onfig | 1          =

odroid-xu3                | arm  | lab-collabora | gcc-8    | multi_v7_defc=
onfig | 1          =

sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre  | gcc-8    | sunxi_defconf=
ig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2020-11-30-v5.10-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2020-11-30-v5.10-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c51a6c86347a721c328a37adf4c3f8892aa10330 =



Test Regressions
---------------- =



platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
imx6q-sabrelite           | arm  | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc5655d98caad1895c94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-11-30-v5.10-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-imx=
6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-11-30-v5.10-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-imx=
6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fc5655d98caad189=
5c94cc3
        failing since 34 days (last pass: renesas-next-2020-09-25-v5.9-rc1,=
 first fail: renesas-next-2020-10-26-v5.10-rc1) =

 =



platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
imx6q-sabrelite           | arm  | lab-collabora | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc565c74993d1c09cc94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-11-30-v5.10-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-im=
x6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-11-30-v5.10-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-im=
x6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fc565c74993d1c09=
cc94cce
        failing since 34 days (last pass: renesas-next-2020-09-25-v5.9-rc1,=
 first fail: renesas-next-2020-10-26-v5.10-rc1) =

 =



platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
odroid-xu3                | arm  | lab-collabora | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc57a9a5728302561c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-11-30-v5.10-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-11-30-v5.10-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fc57a9a572830256=
1c94cbb
        new failure (last pass: renesas-next-2020-11-27-v5.10-rc1) =

 =



platform                  | arch | lab           | compiler | defconfig    =
      | regressions
--------------------------+------+---------------+----------+--------------=
------+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre  | gcc-8    | sunxi_defconf=
ig    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc5826a95453e5713c94cd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2020=
-11-30-v5.10-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2020=
-11-30-v5.10-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1130.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fc5826a95453e571=
3c94cd9
        failing since 28 days (last pass: renesas-next-2020-10-26-v5.10-rc1=
, first fail: renesas-next-2020-11-02-v5.10-rc1) =

 =20
