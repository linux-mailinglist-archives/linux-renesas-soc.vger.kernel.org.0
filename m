Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1368F5B5AE7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Sep 2022 15:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiILNKv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Sep 2022 09:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiILNKt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2022 09:10:49 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659E526541
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 06:10:48 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso8085200pjd.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=VyWr9lU8s/1/h5sho7pSRT7XzdukOyrh3tpmtusP1xM=;
        b=zMukM6wiwxLd9Flaczjt19g1jH5DM/dP14/wofDYSZzzrk0tDQkjmtvBz+D6pEVWXk
         B17uuPjAUzss/5IXrz7SyrdrtZIJskqMOqk+D44YnhsXBZfprIo0yP2LHUIF188Bs+9s
         AH21RZtTTPxGqSO/t9Kmbz4sd2GyXgk7YWi3DwiUJ5JgVrWTyT28fBWvZbnaeANITyFF
         VyaFDFVsU3YsS8pP+bgSB7D1zsAs3hvhBW65QhSLJKveNHYp/FBHMyU0XNQEjN7DeFYw
         psSfA76uYsH/uYZM2R2ASQaLb1QRj2s0XcI8+JQkiOvahqIHeQ2STwg5O7vR3NQW+XPT
         pb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=VyWr9lU8s/1/h5sho7pSRT7XzdukOyrh3tpmtusP1xM=;
        b=AklDnAVRDEGGDN7sJRuBg5a1+OrSBrbfs+7kGTlY9KsOLxu1NobhJ+9bRIvou82PHv
         ASgJF3XpWRw+D/0NEIDUnFtw0izo6+QifTqottVKcJgVldiRVFGlaCTlf5ttjE+CjxNj
         4P6Wc2O8fM0xmb+xIVePrRL7YihHkphetPGLQ+z8ssCCCiubwFZpRj6Qluo2cEWG0v3T
         ha7w+Z1nRpOVgB3/O3p4PpoG1tbHEAkkX2VLjnpXFTrs29mgM/mg4Ik/47eFIqrGMdrb
         pV+sVYIn7JtvKW1UkPyOq65WkjdW+OO1fu6mlk9YcTGFw+wOFjwEfHG6s0rxid0cfasi
         e5wA==
X-Gm-Message-State: ACgBeo3mKPKAGaCBYnN7No6AsKV7BVbc6IZRs3kmZRMmWhC/R/HJa5XY
        12qIgbdbudQA2GMWm1sIvLrKk8O6c0zuTflyg9I=
X-Google-Smtp-Source: AA6agR7D5ar26W9OiyCDQoX+9UqximzXl5tOdtRRO5w60qLycba99eEBfKx3eND4CQnHP6o8oIfPAA==
X-Received: by 2002:a17:90a:1b66:b0:1fa:bbb5:8a5 with SMTP id q93-20020a17090a1b6600b001fabbb508a5mr23641660pjq.216.1662988247547;
        Mon, 12 Sep 2022 06:10:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b22-20020a170902d89600b00176ab6a0d5fsm954528plz.54.2022.09.12.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 06:10:47 -0700 (PDT)
Message-ID: <631f2fd7.170a0220.b94ee.136e@mx.google.com>
Date:   Mon, 12 Sep 2022 06:10:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc5-843-g94f27a9ea269
Subject: renesas/master cros-ec: 8 runs,
 5 regressions (v6.0-rc5-843-g94f27a9ea269)
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

renesas/master cros-ec: 8 runs, 5 regressions (v6.0-rc5-843-g94f27a9ea269)

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


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v6.0=
-rc5-843-g94f27a9ea269/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: v6.0-rc5-843-g94f27a9ea269
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      94f27a9ea2691030ed8a87c33e1e6a0badc3bde9

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


  Details:     https://kernelci.org/test/plan/id/631f23d5e3656da030355677

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/cro=
s-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/cro=
s-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
1f23d5e3656da030355688
        failing since 27 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
31f23d5e3656da03035568a
        failing since 27 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-12T12:19:16.702963  / # =

    2022-09-12T12:19:16.708087  =

    2022-09-12T12:19:16.809753  / # #
    2022-09-12T12:19:16.814994  #
    2022-09-12T12:19:16.915998  / # export SHELL=3D/bin/sh
    2022-09-12T12:19:16.920916  export SHELL=3D/bin/sh
    2022-09-12T12:19:17.021880  / # . /lava-7241155/environment
    2022-09-12T12:19:17.027414  . /lava-7241155/environment
    2022-09-12T12:19:17.128420  / # /lava-7241155/bin/lava-test-runner /lav=
a-7241155/0
    2022-09-12T12:19:17.133673  /lava-7241155/bin/lava-test-runner /lava-72=
41155/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1d6d74ffc341eb355688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-m=
t8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-m=
t8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/631f1d6d74ffc341eb3556=
89
        failing since 7 days (last pass: renesas-devel-2022-09-02-v6.0-rc3,=
 first fail: renesas-devel-2022-09-05-v6.0-rc4) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/631f1fb1666c7f6b6e35567f

  Results:     5 PASS, 2 FAIL, 10 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-r=
k3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-ec-r=
k3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
1f1fb1666c7f6b6e35568e
        failing since 27 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
31f1fb1666c7f6b6e355690
        failing since 27 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-09-12T12:01:47.017435  / # =

    2022-09-12T12:01:47.019715  =

    2022-09-12T12:01:47.124406  / # #
    2022-09-12T12:01:47.127938  #
    2022-09-12T12:01:47.232121  / # export SHELL=3D/bin/sh
    2022-09-12T12:01:47.235769  export SHELL=3D/bin/sh
    2022-09-12T12:01:47.339734  / # . /lava-7241544/environment
    2022-09-12T12:01:47.343051  . /lava-7241544/environment
    2022-09-12T12:01:47.445649  / # /lava-7241544/bin/lava-test-runner /lav=
a-7241544/0
    2022-09-12T12:01:47.447589  /lava-7241544/bin/lava-test-runner /lava-72=
41544/0 =

    ... (8 line(s) more)  =

 =20
