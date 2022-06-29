Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D239560AD3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 22:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbiF2UCb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 16:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbiF2UCa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 16:02:30 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2063ED14
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 13:02:29 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id d14so16657453pjs.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 13:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+5BXf+E1DMudWHpkpOYBljTseDBE0A/N+ekkASf4Ntg=;
        b=PrZP4Qwu/oruZENE/zriVyu6XKK2ZCgZtgEJRyPTI4bKQ4FgYCVUaX8Ez5CxR1pq8c
         zA+J4YdVMqV2IJ69eETqzfR9fMnx1sWkkF1QIwyKc//+YShDc3+vhTQvp4KiXcJuOnx8
         IMwdJsuIf+nDUSitovRi0pt4cgAONsHrjWMdeBdHKbDdqnZE0Hv9EQpuw5sg4KpNSpLj
         qH0zhV5Lp6Awe1TZ0KI69GIN0RICSOcifBnzCMGn8ZCYEdb5Kg2HS2QIE+spaUIlf5rk
         HtchrEw3z4f8vp86Gy5+dFjDkVSs+qYlh1yaukzF6mgZzxgFnm0kipSjUpUvsJXFyP7i
         3jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+5BXf+E1DMudWHpkpOYBljTseDBE0A/N+ekkASf4Ntg=;
        b=5SiGg//P623m9LEThzIMh/wTZlv+dM5OEZPwX89PJ0BlIT+fGghPeFN0uqa18UDsGp
         rEaSzm7nA886kRwnwjOc3w/2hdQjr4zsbbqAEg75OmPqBT9gCgG1gkAPs66KiWzIgDnO
         QfJlyJRR2gQenOlOwwAEHS4BxMHQvU0kEp6WIF9UxpoqDOLfpu62ZezdLzZ5xOZjepZB
         jZVXf+4B9wKYr8lFefY0OBVVFxUPs5Wwq3A7xbw9wfb+y3Zvs8tevrqgHR0eQDJxIxkL
         7zj56wSj5y4lPKdxVM/OS/y1aphK8eeNM5+bUZ38iRJ/HBQv6nrg1m2CGL09jbDf1SgH
         D+ew==
X-Gm-Message-State: AJIora8uUquY/5yO9qLQ9WJZVdLrta+McNfT2Gnogs4mnzpHc2imaGWb
        ohigLSiIRRB5sb/LXG+dtDeGCPmrQXhgMSTN9II=
X-Google-Smtp-Source: AGRyM1tmlS79wG67A5Gi9cj2bkdQbq4OMSy7P1K32pj4+2flsNJsTaTuVkVY8xgKQim0q98i6wqkFA==
X-Received: by 2002:a17:902:da87:b0:16a:54e1:3426 with SMTP id j7-20020a170902da8700b0016a54e13426mr10553167plx.157.1656532948882;
        Wed, 29 Jun 2022 13:02:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i12-20020a17090a64cc00b001eccb13dfb0sm75311pjm.4.2022.06.29.13.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 13:02:28 -0700 (PDT)
Message-ID: <62bcafd4.1c69fb81.df49.022c@mx.google.com>
Date:   Wed, 29 Jun 2022 13:02:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-06-29-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 170 runs,
 8 regressions (renesas-next-2022-06-29-v5.19-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 170 runs, 8 regressions (renesas-next-2022-06-29-v5.=
19-rc1)

Regressions Summary
-------------------

platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | gcc-10   | sunxi_de=
fconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | gcc-10   | sunxi_de=
fconfig              | 1          =

tegra124-nyan-big            | arm  | lab-collabora   | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-06-29-v5.19-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-06-29-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      5695289da1bfec5108a882840cf064600cb4ff0c =



Test Regressions
---------------- =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc786366860f88bea39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bc786366860f88bea39=
bd8
        failing since 22 days (last pass: renesas-next-2021-11-30-v5.16-rc1=
-14-g0940300f8e1d, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc7d3cdd5238301ca39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bc7d3cdd5238301ca39=
bda
        failing since 22 days (last pass: renesas-next-2021-11-30-v5.16-rc1=
-14-g0940300f8e1d, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc7bb2aa687875a0a39be5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bc7bb2aa687875a0a39=
be6
        failing since 22 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc7bb2af0d18821ea39bd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bc7bb2af0d18821ea39=
bd6
        new failure (last pass: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-bananapi-m2-plus    | arm  | lab-baylibre    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc76dd124ccda854a39bec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-=
bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-=
bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bc76dd124ccda854a39=
bed
        new failure (last pass: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc7bb5aa687875a0a39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bc7bb5aa687875a0a39=
be9
        new failure (last pass: renesas-next-2022-05-05-v5.18-rc1) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc76db124ccda854a39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-=
libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-=
libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bc76db124ccda854a39=
bdf
        new failure (last pass: renesas-next-2022-05-05-v5.18-rc1) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
tegra124-nyan-big            | arm  | lab-collabora   | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62bc84f8f7dd04978ba39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-29-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62bc84f8f7dd04978ba39=
bcf
        failing since 22 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
