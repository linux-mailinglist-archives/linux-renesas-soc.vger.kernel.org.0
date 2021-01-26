Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1B8303456
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 06:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732403AbhAZFXN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 00:23:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbhAZDFM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 22:05:12 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCC8C0613D6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 19:04:31 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id o7so546987pgl.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 19:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QEpBnjT6IFuyo6n6tj5JO1gfLkbnXmrnvCU9KWI6Uvg=;
        b=cslcPQRIlubDFKeWvL77tIgti7R6B/e/fQ4orOZx/22HtS6mFuI5cgiAzZGBM99T8G
         pil4erHg1tuNPzRM8wiD4uAnpadHaXOR8ngrrQ3sNGSiYBgjXtpgRU/sKWwejGQ5sX+R
         I87B5JISx5M/LumBj9d6MoVhiDUnCzo2aFmUKO1zfsGUNDVa5sca7YLMor+yDx3kd7qs
         wsswAsGqBO8jMuGOSNjoNR5w6fMwN6Eeo9B/PjwxXH6tZBFXgkW2MeGKK9G9onxeZSS3
         C7+eQtRT9+oIMoqSestFsou8MoiQOTPyzWDq7DAGZODQBK55ct/f668uRG8Rfzn5rbUF
         9U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QEpBnjT6IFuyo6n6tj5JO1gfLkbnXmrnvCU9KWI6Uvg=;
        b=BRj5ujxg28dVJyC3uBHFvx8uZdImWzrpheTn2AB9TlGuxM5/ez0NyHvg8+z5YZNcS4
         NWKEid/6LuCdW2k4JQeIVyf796/LU1UT7ncVekBuGQWjkXg6fgVf/YV0ygoPPSDpCEgQ
         WIz+mjoTvpFxLx1Nd+LzAm88Qo9jejBHvoQKlNqIDBJj0P9a5LIp+eL6dX2bnLJHdvPN
         vRXWT6YAWM855XgwVRcS7LAWG6Ap8qlgKn0HIzc7KmBwNoX0dpJItnWwFSEzpFutb4D8
         iLDyV/tCTCGAzfUxkzzydgoxE+5mPsVKbJTYi/mruoTVzhQPqQQi1hnA8qpLcaoH3vkI
         iOJQ==
X-Gm-Message-State: AOAM531hrE+pbOKrXYlm9lCc8iqp756UpvwL9xsg6i8t8xCre6XJWd+C
        Ht3z25oYsmM9dCO/hepYU+6OTuzxfyy1SZoJ
X-Google-Smtp-Source: ABdhPJw2qhuRmtCXdEgBcEitL3qFeToL5jprGL8aznGLtSV/t5krv8ILK+ciY/QLG8DbmPYT2Zxwmw==
X-Received: by 2002:a62:8012:0:b029:1b7:c65b:92f2 with SMTP id j18-20020a6280120000b02901b7c65b92f2mr3191845pfd.23.1611630270985;
        Mon, 25 Jan 2021 19:04:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h12sm18037668pgs.7.2021.01.25.19.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 19:04:30 -0800 (PST)
Message-ID: <600f86be.1c69fb81.fb3a7.c968@mx.google.com>
Date:   Mon, 25 Jan 2021 19:04:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-01-25-v5.11-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 217 runs,
 6 regressions (renesas-devel-2021-01-25-v5.11-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 217 runs, 6 regressions (renesas-devel-2021-01-25-=
v5.11-rc5)

Regressions Summary
-------------------

platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

qemu_arm-versatilepb     | arm  | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm  | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-01-25-v5.11-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-01-25-v5.11-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      70d43ed7025970798f753542ddce0e4eda7abcbf =



Test Regressions
---------------- =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600f5316552402510ed3e032

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sa=
bresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f5316552402510ed3e=
033
        failing since 84 days (last pass: renesas-devel-2020-10-30-v5.10-rc=
1, first fail: renesas-devel-2020-11-02-v5.10-rc2) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/600f529991aacf8c80d3dfc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibr=
e/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f529991aacf8c80d3d=
fca
        new failure (last pass: v5.11-rc4-383-g822f1d4bfbf2) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600f4f80b17f925156d3e007

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f4f80b17f925156d3e=
008
        failing since 68 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600f5af81735b53a8cd3dfdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f5af81735b53a8cd3d=
fdd
        failing since 68 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600f4f9027bc7f483fd3dfe5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f4f9027bc7f483fd3d=
fe6
        failing since 68 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =



platform                 | arch | lab           | compiler | defconfig     =
               | regressions
-------------------------+------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm  | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600f50197275bb2a7cd3dff7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f50197275bb2a7cd3d=
ff8
        failing since 68 days (last pass: renesas-devel-2020-11-10-v5.10-rc=
3, first fail: renesas-devel-2020-11-16-v5.10-rc4) =

 =20
