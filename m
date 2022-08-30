Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690695A6107
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 12:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbiH3KqK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 06:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiH3KqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 06:46:09 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D200972FEC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 03:46:04 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id h13-20020a17090a648d00b001fdb9003787so6094204pjj.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 03:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=17+Zs3OBLTT2v6dl5Wy4wKD4/TyVqxQG3qNKvxyOYl8=;
        b=RBF9lFBGtYL7dfff9rWw+qOJiImu3WjmoSP56ZSKQbQuIEavn3bsbNX2bNxgzO2HZl
         UhoWxnv+10BZevUxTvny0OvHo3RCmjieZLBzsMQaSaBlaNEGG5nYhHQqYk6afqpdjili
         f2J7fYLOiYBn+6mbTFwzSDa4oaNWSv7Xolcqf2zcE+ynby/wdBcWZhOJ0yNhoVAqdEg4
         y4aunCFnxT/S7r25l9MpkhBde83pAuABr5cPd9SqVyH6j5jEbKHDl8qANxrruQTHGPT1
         UWD6lNKsqIt6YTHa2ZNlUOTEmzLc9E5ajP9u5y+SCzhgDFunhkyGoU9mX33ZBpZgaYzP
         J76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=17+Zs3OBLTT2v6dl5Wy4wKD4/TyVqxQG3qNKvxyOYl8=;
        b=XcxjUESyAUtCoaQiEt8NDBn6uu7vIlWH7wyWZpsTA8uXymWiE1mz40iEUp+EI2qokv
         J3SuUR+rjJUMwp6dMXRQlGT/MIGzHM0hxmrkTWrTrKqFVAuxC0hqePKjN0pv1WaJNrJx
         BMCK7Ly99LukrVfCvb9LgKq6mqFnPHfdo+X9RTa8qpZBezJLa9TIzs5TL2INWNBoBAg1
         Wp/CVcZ6wA3msIYzg1Q1ckLihtgzXdE1Z0Xg7Y72zzkvDTgji7xXPdrp/v4sWfW2H89T
         SB1dbWraxQFRVu1STX9RBDnRlnpYkBStCJ9xFXzg4LULBzlSnx+EsTsEMU+/UiIalb+7
         n6DA==
X-Gm-Message-State: ACgBeo3k8YIU3bKdCUI2XKxrbFRf3ko5Az/Oyv0YCUU4RZxyM2xmnoOk
        WGleDEhuldo+5gdN8YYRkZUnwMcJd1K9rIlfImg=
X-Google-Smtp-Source: AA6agR7d7OijZGxc8azfPeiVeDnfotbtRTN2f1syF52La4TtMhppwwNHs34gydlyHBsOl8A3lASY/w==
X-Received: by 2002:a17:902:b206:b0:173:c58:dc74 with SMTP id t6-20020a170902b20600b001730c58dc74mr20126439plr.65.1661856363299;
        Tue, 30 Aug 2022 03:46:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e2-20020a17090a630200b001fdcfe9a731sm3518946pjj.50.2022.08.30.03.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 03:46:02 -0700 (PDT)
Message-ID: <630dea6a.170a0220.a883f.6597@mx.google.com>
Date:   Tue, 30 Aug 2022 03:46:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-30-v6.0-rc3
Subject: renesas/master cros-ec: 10 runs,
 5 regressions (renesas-devel-2022-08-30-v6.0-rc3)
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

renesas/master cros-ec: 10 runs, 5 regressions (renesas-devel-2022-08-30-v6=
.0-rc3)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-30-v6.0-rc3/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-30-v6.0-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      87c1cb103bc6896ad3e45e0cc1417b57696d733a

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/630dd77005242106fb35565f

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
0dd77005242106fb355670
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30dd77005242106fb355672
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-08-30T09:24:47.345866  / # =

    2022-08-30T09:24:47.352316  =

    2022-08-30T09:24:47.458768  / # #
    2022-08-30T09:24:47.465058  #
    2022-08-30T09:24:47.567492  / # export SHELL=3D/bin/sh
    2022-08-30T09:24:47.574242  export SHELL=3D/bin/sh
    2022-08-30T09:24:47.676352  / # . /lava-7134951/environment
    2022-08-30T09:24:47.683245  . /lava-7134951/environment
    2022-08-30T09:24:47.785515  / # /lava-7134951/bin/lava-test-runner /lav=
a-7134951/0
    2022-08-30T09:24:47.791567  /lava-7134951/bin/lava-test-runner /lava-71=
34951/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd92959cef2eb20355678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/630dd92959cef2eb203556=
79
        failing since 18 days (last pass: renesas-devel-2022-08-11-v5.19-rc=
8, first fail: renesas-devel-2022-08-11-v5.19) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/630dda2c63d273946535564d

  Results:     5 PASS, 2 FAIL, 11 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
0dda2c63d273946535565d
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30dda2c63d273946535565f
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-08-30T09:36:21.654666  / # =

    2022-08-30T09:36:21.658435  =

    2022-08-30T09:36:21.768522  / # #
    2022-08-30T09:36:21.772841  #
    2022-08-30T09:36:21.875856  / #export SHELL=3D/bin/sh
    2022-08-30T09:36:21.879846   export SHELL=3D/bin/sh
    2022-08-30T09:36:21.983839  / #. /lava-7135226/environment
    2022-08-30T09:36:21.988034   . /lava-7135226/environment
    2022-08-30T09:36:22.091979  / # /lava-7135226/bin/lava-test-runner /lav=
a-7135226/0
    2022-08-30T09:36:22.094527  <6>[   22.318480] mwifiex_pcie 0000:01:00.0=
: info: FW download over, size 638992 bytes =

    ... (10 line(s) more)  =

 =20
