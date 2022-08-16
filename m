Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3507B595DBC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 15:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbiHPNuv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 09:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235254AbiHPNun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 09:50:43 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86FB9E2F3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 06:50:29 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id m2so9275901pls.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 06:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=Mla2INdO+spxIrLg2pPUs0nLNUgktH3TCWCZ2LWH5X8=;
        b=7cE7ri/cdU3VUlwSpIt1uWLEq+XF54blhqCSncrFqu8/mjTRnKNFxdBPur8lSylmqJ
         OSnGy2X8B3NHbi/PvaYN4ohveUXCMFw4TmWKip2EyRuoFlj+0lrujvSBLifT/A4DmOCm
         KXm2F/T6CpXErbzdjtdkNbwRO3LEQtulqCc0cZUE3kKhVTOJShFSpm4BmDB6d9dQ/6HK
         fdZ9i76Ekdjg69kPLJt2eCfdadQyTDfHxiVx2UcwMyYnuxgLyE8S2v9VJYjsIGq2xKLM
         qzgvVhF+DpIsPWPll8seTpk3oND5T146cZaGixEoR9q75b0J0jv9uVBiIkKyi0FX9nwg
         l4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=Mla2INdO+spxIrLg2pPUs0nLNUgktH3TCWCZ2LWH5X8=;
        b=xIpZoSPAO2RImzMPgs44i6XAT1+9Wpp00sIVbcPgOg1IY8cm7cyNssbKvZY6HrjksJ
         TEu0/OfzkBHrWR1khlzflc7qqHCw890CP6oAHSmgpBh8S+wjxtArWIzPnKXbM7SZwhTS
         EgYdXI7tReRY5e8jhFVqnR6KesoEbkNKajOwPcYMmlG3yTQhfNqFuieJ9dj4XcDhP3X7
         Ui+A+IkKO5jUbqrII9Tp586msd/HSn8yJ1ULMwR01z47CIY7CekwSHoLWagAQMLF4c6d
         0pPg+GA5qzpt+s5X7tZR+yG/KOXJW7NSUVCgq8TnijYiT6ZI+f3I3TZzoY8eP8LvK1EJ
         1ONQ==
X-Gm-Message-State: ACgBeo2vgUdJvMEffHujDYHo85rqdKQtezxCrF69vMFk8JrNBqITNwRq
        NA817yKQ4NEdTFvMw4crOkYxHWoksvP3+AP/
X-Google-Smtp-Source: AA6agR7agq1IJ6yr93VeII/pcYsc2029Jx/+pmdi2S4XpHml2Uckz7FHAQwFFqQ9Crpmh4N9ST/MuQ==
X-Received: by 2002:a17:902:c149:b0:170:9c83:a319 with SMTP id 9-20020a170902c14900b001709c83a319mr22336984plj.107.1660657829061;
        Tue, 16 Aug 2022 06:50:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t67-20020a625f46000000b0052d90512a53sm8483576pfb.44.2022.08.16.06.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 06:50:28 -0700 (PDT)
Message-ID: <62fba0a4.620a0220.c1ffe.e21a@mx.google.com>
Date:   Tue, 16 Aug 2022 06:50:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-08-16-v6.0-rc1
Subject: renesas/next baseline-nfs: 56 runs,
 6 regressions (renesas-next-2022-08-16-v6.0-rc1)
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

renesas/next baseline-nfs: 56 runs, 6 regressions (renesas-next-2022-08-16-=
v6.0-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91sam9g20ek                | arm   | lab-broonie  | gcc-10   | at91_dt_de=
fconfig            | 1          =

at91sam9g20ek                | arm   | lab-broonie  | gcc-10   | multi_v5_d=
efconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig+ima       | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-08-16-v6.0-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-08-16-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      328413c2bd85d7011cd71072902a43c448b71f59 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91sam9g20ek                | arm   | lab-broonie  | gcc-10   | at91_dt_de=
fconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb67b038ac950ba7355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62fb67b038ac950ba=
7355645
        new failure (last pass: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91sam9g20ek                | arm   | lab-broonie  | gcc-10   | multi_v5_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb65cf5b33b0e5c3355652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v5_defconfig/gcc-10/lab-broonie/baseline-nfs-at91=
sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v5_defconfig/gcc-10/lab-broonie/baseline-nfs-at91=
sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62fb65cf5b33b0e5c=
3355653
        new failure (last pass: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb83fed3fa35c9a535565d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62fb83fed3fa35c9a=
535565e
        failing since 69 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb6d67e8b7c3edac355645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62fb6d67e8b7c3eda=
c355646
        failing since 0 day (last pass: renesas-next-2022-07-05-v5.19-rc1, =
first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb6b371126deea7f355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62fb6b371126deea7=
f355643
        failing since 0 day (last pass: renesas-next-2021-11-30-v5.16-rc1-1=
4-g0940300f8e1d, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb6d7be8b7c3edac35567e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-16-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62fb6d7be8b7c3eda=
c35567f
        failing since 0 day (last pass: renesas-next-2021-11-30-v5.16-rc1-1=
4-g0940300f8e1d, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =20
