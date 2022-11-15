Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F169C629E8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 17:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiKOQLr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 11:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiKOQLr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 11:11:47 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5DF1D65A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 08:11:46 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id k15so14553838pfg.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 08:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=19rCx/gb35rqbJdt5N9kpmW467Dq0JpUt1L5gY0orOE=;
        b=bqhwv7qxO1S7CJ6cosU0WAlIoZXq98aDJdvZTr0sMZiOCVy2byWbId1vFQ3P0Lg0F2
         baXxeDb0CZe1GW+dHJhv+yV2HT69Atnk42QRV5ezPmKy9gfX5Jop+5XwJlfXLwQ+4bs7
         7FRRQpP5HZ0KzOPumZ7j7NchiFP9q7DOcWuHo9VqOrqzeQm3eItQq3UOCwCVH44CKDYK
         CeKO7jCMx1LpZIVCwuMhihvGZOGaO7e/htFHfo/KtxQEyBpNN7pea0WRXUfFi8fP5VjB
         Nlcn2MTuhGxnSZdnDFFJa9WpQNA0CnJ4vBwrULuPOhBYGuT7C8Uhzbl/+99Gp35yZjRe
         Zl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19rCx/gb35rqbJdt5N9kpmW467Dq0JpUt1L5gY0orOE=;
        b=qF3B5EXV61GmXDBiiZ96KugpM2U67QyhXpjF/hi/oj4IMNAj+5U4lv1tvZE6phsMGI
         JghmLlmgJvDHVKCCs2jPGsMEqde3scyFZA6UHT3ikghjakEQxY79ikGMGPcys8Slq14I
         hpmWO0QHDKL8F69ddbIQmVQtA78a21EgzOwoXg8V/+CXKj1b+w+jw5xdjRPvq7rIR84/
         VArLUJeSB0DprncZJTAdpGQCYcN9l7phdqoG3NqdYEajxoih0gUIOD66IqBRFvUmGD7e
         YJHOf1DtkIKDsZVRl8NiLXWRz84ejMSF+BC6ZpwkIsZ1KBTRQH9cQ5XsLBeY41D/z7XH
         3UGg==
X-Gm-Message-State: ANoB5plZZnnZzHo2xaHNfLjB3ke0QSI0VXK3e4rhd2K0yBBZT6B8aQUJ
        W/ZzFEUmC/FJkkhq1osE3x+lE+GKqYQt7CSbJPo=
X-Google-Smtp-Source: AA0mqf5CLr1lfnwPWjztxnTzB9+akd4oznqi4TZ7HzZfj/ws+mRg9J+k1YdKF0eoSqj5gtJuokA0AQ==
X-Received: by 2002:a63:54b:0:b0:476:dd4f:6894 with SMTP id 72-20020a63054b000000b00476dd4f6894mr304274pgf.587.1668528705695;
        Tue, 15 Nov 2022 08:11:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f54d00b0017f7c4e2604sm10085343plf.296.2022.11.15.08.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 08:11:45 -0800 (PST)
Message-ID: <6373ba41.170a0220.f9d6.e843@mx.google.com>
Date:   Tue, 15 Nov 2022 08:11:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-11-15-v6.1-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 5 runs,
 4 regressions (renesas-next-2022-11-15-v6.1-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 5 runs, 4 regressions (renesas-next-2022-11-15-v6.1-r=
c1)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-11-15-v6.1-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-11-15-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dff206d2346220aeff53f02783b9315d70d23be6

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


  Details:     https://kernelci.org/test/plan/id/6373a7bb77cf372e70e7dbc5

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-15-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-15-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
73a7bb77cf372e70e7dbd6
        failing since 92 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
373a7bb77cf372e70e7dbd8
        failing since 92 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-11-15T14:52:24.540265  / # =

    2022-11-15T14:52:24.546010  =

    2022-11-15T14:52:24.652102  / # #
    2022-11-15T14:52:24.658519  #
    2022-11-15T14:52:24.761223  / # export SHELL=3D/bin/sh
    2022-11-15T14:52:24.767487  export SHELL=3D/bin/sh
    2022-11-15T14:52:24.869717  / # . /lava-7981501/environment
    2022-11-15T14:52:24.875790  . /lava-7981501/environment
    2022-11-15T14:52:24.977956  / # /lava-7981501/bin/lava-test-runner /lav=
a-7981501/0
    2022-11-15T14:52:24.984165  /lava-7981501/bin/lava-test-runner /lava-79=
81501/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6373a58a42ae5054f6e7db74

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-15-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-15-v6.1-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
73a58a42ae5054f6e7db84
        failing since 92 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
373a58a42ae5054f6e7db86
        failing since 92 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-11-15T14:43:06.953509  / # =

    2022-11-15T14:43:06.958759  =

    2022-11-15T14:43:07.060420  / # #
    2022-11-15T14:43:07.065785  #
    2022-11-15T14:43:07.166822  / # export SHELL=3D/bin/sh
    2022-11-15T14:43:07.172129  export SHELL=3D/bin/sh
    2022-11-15T14:43:07.273094  / # . /lava-7981504/environment
    2022-11-15T14:43:07.278818  . /lava-7981504/environment
    2022-11-15T14:43:07.379767  / # /lava-7981504/bin/lava-test-runner /lav=
a-7981504/0
    2022-11-15T14:43:07.385149  /lava-7981504/bin/lava-test-runner /lava-79=
81504/0 =

    ... (7 line(s) more)  =

 =20
