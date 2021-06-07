Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2085F39E43A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 18:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhFGQhu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Jun 2021 12:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbhFGQhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jun 2021 12:37:48 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63185C061766
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jun 2021 09:35:47 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so374879pjq.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jun 2021 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JlISYtAzj6DerFdECqrqpmen2U5uvjrW/SFk+Fxltxg=;
        b=DswjeTqQpOhCfBgtZuTbw7JwtTkwzJURPa26T2agKuePnWGSRoymxe/Y7cmeFKXeL6
         mdPr/3hxZtn0MXP0TwZwxB4jdKKA3g3h746x2d4Q9Hl6zdzVYqjqJ8l2Uc2um8FRChoL
         WGO+ydkooPa742jIVUGtFc6sxpwvVg/xJmQZHoMd6P/YB8UWAX8sATXl7L9s+vgmWMl+
         I+Z0yPHHLG0tuylvuhuR/EDF0QDv/J/wx96BYobVFfecU9YlcvXfwrD9hkFhjAx7AqWH
         YkWiAymp8avpLC/oFJLtkyW/llV64hMWxJPMi5ozEayRvNyP6p7Et4S+hEwnPHP/Rht5
         AIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JlISYtAzj6DerFdECqrqpmen2U5uvjrW/SFk+Fxltxg=;
        b=gI7NiuUwg3r96faVj+PcDHihWtqulK6UCsEGyh88FHR5QpE6D7C2WA/+Ev8eAT8ktY
         czoUT2pNj2k7yG577l4/7eIlRhKx6AeJlMcwN8F+AGipz2riutwKk+9t+Vp8oyswkiD6
         lMJs0MgtXHf+WhxhzrD8PXosuQMcpyeojaiH9kBkOuWQ8oaVzbjOYbsbUppWqzxNCKjZ
         UHmvTHKuaPTRL70AuY/UIpSzyBKCVXX9ntjzGzPgLqhb2tE6N1gaxsHkmMgTJupJPNhv
         7W8Yls3oaitkdu4M5gUkTxkfNlcCQeDEHF9/1hJkPz5fXoSQ4Al1EfswsvUcbDGs2rXi
         zxTg==
X-Gm-Message-State: AOAM533eWMEF3A325EPSvxlbZ9ivWQ7zQMGNrSVXRZiutn7LxhS+TvBY
        r6ppysF5it/ltp+o7CZ6pdwmqyhFGtyeksWJ
X-Google-Smtp-Source: ABdhPJyAgeLmaGshA84z8awen+zGhc52wXgP63/bex2kaEvOsDsylA81EzTusqSpHfLn+SZrkJS56Q==
X-Received: by 2002:a17:903:2308:b029:110:41c3:70b0 with SMTP id d8-20020a1709032308b029011041c370b0mr13768193plh.32.1623083746683;
        Mon, 07 Jun 2021 09:35:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i2sm6436pjj.25.2021.06.07.09.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 09:35:46 -0700 (PDT)
Message-ID: <60be4ae2.1c69fb81.dc5ff.005c@mx.google.com>
Date:   Mon, 07 Jun 2021 09:35:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-06-07-v5.13-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 57 runs,
 5 regressions (renesas-next-2021-06-07-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 57 runs, 5 regressions (renesas-next-2021-06-07-=
v5.13-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defconfig | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-8    | defconf=
ig          | 1          =

meson-gxm-q200               | arm64 | lab-baylibre    | gcc-8    | defconf=
ig          | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | sunxi_d=
efconfig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-06-07-v5.13-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-06-07-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e1833059a1c5dac43b9e7352890ec727247341e0 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60be0d77bad020e0510c0eed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60be0d77bad020e05=
10c0eee
        failing since 41 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-8    | defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60be0e5ab88b7c932a0c0e8a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-meson-g12=
b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-meson-g12=
b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60be0e5ab88b7c932=
a0c0e8b
        new failure (last pass: renesas-next-2021-05-31-v5.13-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | gcc-8    | defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60be2c1bdde88486be0c0dff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60be2c1bdde88486b=
e0c0e00
        failing since 65 days (last pass: renesas-next-2020-10-26-v5.10-rc1=
, first fail: renesas-next-2021-04-02-v5.12-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60be213c030d67e9e50c0df9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60be213c030d67e9e=
50c0dfa
        failing since 76 days (last pass: v5.12-rc2-14-g6f56f6c26099, first=
 fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig          | regressions
-----------------------------+-------+-----------------+----------+--------=
------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-8    | sunxi_d=
efconfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60be1a1fd38e4899550c0e05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-06-07-v5.13-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60be1a1fd38e48995=
50c0e06
        failing since 37 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
