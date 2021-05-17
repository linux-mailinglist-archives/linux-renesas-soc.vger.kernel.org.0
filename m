Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1FAF383B39
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 19:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237875AbhEQR0r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 13:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbhEQR0r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 13:26:47 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B523C061573
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 10:25:30 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so7721pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yI+rcqHRI4hp8CptVI2JO/WMq6ixwhq074fbpODKgAE=;
        b=qAYFHQ4KcRSlZVGSfywRG73qV42BNMkXtWgnMij2wNcvmay2JLTuPZ9otXUnAD/l+Q
         g0yIY+CITzfCSSnHG+XIfmEy9rONERXAABVICYTHZ+AF3tc2fuofJxh/bj6rS6hDdxDt
         ybspfNI1wJ7ZMHT2xoG4SB6bH7kdoqO71p6WzgZzuB2Q5uxH6K3kVmiJS/4i0txccW58
         2NdtXAJQT6jRvGMEzfeABT/bC6bnsBmAM1lRmbkYCVCr5iZP5uMnEfHC2J1TuDzgBfku
         8pvFUQ6nSqUWFWNnry7wiChcCIakx4t+Hk5/UZjQ2QqoKhWkLEJujvI95gzpOhMSKAdR
         /cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yI+rcqHRI4hp8CptVI2JO/WMq6ixwhq074fbpODKgAE=;
        b=GssVCUj9cFnIjrQvtCyn7LjjZheXxKCFY8iW4a+r7n7JbCO3N6eFrCgqaYJbUX3xjs
         PLyr87dUGxOSlwU4bpBedI5zrcCZWwACGFZ3a5XFejXZPtxagxNNv2Zkqm+JwjQ7rl9x
         YlZzPoGQfqayouaIN4zqZH848wtfSi9wQp9oRaxcBU+cWrMfm1dFQYmgK2ciIB58Xst5
         syaaIymEHnno7nau8MzEgH6Sfjm0YpKScTFNGXijfslc8PC2AXhb2iNDASEfxKTauzlI
         Xy07lnhrGX4eh7FHGRKxQrqVdiy9JFH9yMwgsJqDhfEsixUCPK9JvmEYsbnvr240nJba
         aSDQ==
X-Gm-Message-State: AOAM530mJYSqOnQVeyEY4gslwRiaV2XdSdLAIXZEp6V0DXN72he3YBFP
        1ljkyul7HZxoycXWHBhZfhwaWoVzsABnVPEp
X-Google-Smtp-Source: ABdhPJyZEOLL2+oO14aSa8jDfHJH+cSpoqSDjPoV2TdWvfnAPW+lFNIdKaSiytZol/A/fmJ7Z5dZew==
X-Received: by 2002:a17:90a:d904:: with SMTP id c4mr528447pjv.123.1621272329816;
        Mon, 17 May 2021 10:25:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b124sm14915pfa.27.2021.05.17.10.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 10:25:29 -0700 (PDT)
Message-ID: <60a2a709.1c69fb81.7c162.0133@mx.google.com>
Date:   Mon, 17 May 2021 10:25:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-17-v5.13-rc1
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 14 runs,
 4 regressions (renesas-next-2021-05-17-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 14 runs, 4 regressions (renesas-next-2021-05-17-=
v5.13-rc1)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig | 1          =

meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
         | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-17-v5.13-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-17-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      943db114cf998d030df260dfab3248894cc38719 =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60a271f87462e967fcb3afba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60a271f87462e967f=
cb3afbb
        failing since 20 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/60a2755a9b6663f794b3afa3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60a2755a9b6663f79=
4b3afa4
        failing since 44 days (last pass: renesas-next-2020-10-26-v5.10-rc1=
, first fail: renesas-next-2021-04-02-v5.12-rc2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60a29286e07b1f55eab3afa2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60a29286e07b1f55e=
ab3afa3
        failing since 56 days (last pass: v5.12-rc2-14-g6f56f6c26099, first=
 fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60a290a69c1a86702ab3afac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-17-v5.13-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60a290a69c1a86702=
ab3afad
        failing since 16 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
