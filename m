Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA2541829C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Sep 2021 16:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhIYOWr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Sep 2021 10:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237777AbhIYOWq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Sep 2021 10:22:46 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23418C061604
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 07:21:12 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id e7so12879928pgk.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0sREMDPPRatN9eQ4Z8kbmd656qugArbKi+7Kr9e6+UA=;
        b=2dU1pL+cSeSGVIFXHE6z7SEmMfcXco1YNCn1jwIBRgB04ZTU73oibbvliA2nPInlMQ
         JdkxsF3fWvJBM4yAckazXhb+nAL3Tov7uQJXNVSLTcEnU8UIEqhgQ3BjEWNp+OnOVj11
         dads3QM3hVGbL3Vik5foaWeZddkc9nQq8p4zh5MFVys90upwaNxrQXb42nB2zvRZZJx5
         sUJCD8DneVfZPKEL0XbIK6uuEsDU2aWLb2jEj9Z5FDc98f1GwYj3OlliJxMN4ozgQVpk
         srBcChBpBZ57g+0d+0Kni+fkQ8CH+HZthmh4KWILxHVg+BhJSnsgWC0jLe4gIwTur495
         HbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0sREMDPPRatN9eQ4Z8kbmd656qugArbKi+7Kr9e6+UA=;
        b=0nJfqS5j78XVBKcMGHYkh30GM0kM6UnHG4v3h9Tny+48fcrkEiPTf42BdzJJHA3DRQ
         Mlp+xVPwLzIjwElVgSgb1jPnyCFa6RhXVcV4mpCF1KBwSiSM1aSys/6b40xtKwsPcBVP
         P/Az2fSTfnu675abysIQp/BdIzVrlSPXM+FPgbIZq3TbpjB+ZjmLcU3STwDbpasK5hg0
         d9nu8ELxYJsLGMxpxRVXEePglW+BDUZxdnlSM3IgTHq7HWprSeXfhQ1b9Wt3dIFyAQV4
         UkmTsOJQHiWwQ8O4FCjhLsKavVllt6S1S68LGrgifmw/DIviYq8Vi4aU1rNS5Uloqvbe
         dHhA==
X-Gm-Message-State: AOAM530F+UQs/c6kMYGD0r9JH6KxL/qmCWY33jHDjyH3LJLb14Cx6RSw
        rCELpOcX/a4e9+5XjraKQ32jXgNYiWzRXhdg
X-Google-Smtp-Source: ABdhPJw6kVtVEYVXufWwTyUJsfnVCVjfLU3G+xWVW59qSAnTduMWW/MXz0t6Mqx8ESFO8E3i2712Dw==
X-Received: by 2002:aa7:9a0e:0:b0:44a:3ae2:825c with SMTP id w14-20020aa79a0e000000b0044a3ae2825cmr14710094pfj.28.1632579671433;
        Sat, 25 Sep 2021 07:21:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e7sm12139704pfc.114.2021.09.25.07.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 07:21:11 -0700 (PDT)
Message-ID: <614f3057.1c69fb81.789b4.514b@mx.google.com>
Date:   Sat, 25 Sep 2021 07:21:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-09-24-v5.15-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 31 runs,
 7 regressions (renesas-next-2021-09-24-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 31 runs, 7 regressions (renesas-next-2021-09-24-=
v5.15-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
+ima                | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
+ima                | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+crypto    | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+crypto    | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-09-24-v5.15-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-09-24-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      3b298ae535792fe0eda485add5fc0537c9ea3f0f =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/614ef34f438f92df7199a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614ef34f438f92df7=
199a2db
        failing since 11 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/614ef39dbd56ddeda399a2f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-mt817=
3-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm64/defconfig+ima/gcc-8/lab-collabora/baseline-nfs-mt817=
3-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614ef39dbd56ddeda=
399a2f3
        failing since 11 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/614ef5fa6199917c3b99a2ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline=
-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614ef5fa6199917c3=
b99a2f0
        new failure (last pass: renesas-next-2021-09-20-v5.15-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614efafa5426baed8a99a2ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614efafa5426baed8=
a99a2ee
        failing since 43 days (last pass: renesas-next-2021-08-10-v5.14-rc1=
, first fail: renesas-next-2021-08-12-v5.14-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/614ef6d89f408acd9399a300

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline=
-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline=
-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614ef6d89f408acd9=
399a301
        failing since 11 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614efa5b9455002aa599a33f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614efa5b9455002aa=
599a340
        failing since 11 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614efd196d1e68a6e999a2f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-09-24-v5.15-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-nfs-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0913.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/614efd196d1e68a6e=
999a2f6
        failing since 11 days (last pass: renesas-next-2021-08-12-v5.14-rc1=
, first fail: v5.15-rc1-39-gcbbd8f16ae1c) =

 =20
