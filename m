Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECFDF5A60C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 12:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiH3Ka1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 06:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiH3KaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 06:30:25 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2F95E647
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 03:30:23 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id u22so10669803plq.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=qGNgvkpTWYJgtJz3d9Rrip5yrx5sS3X7wGC38s6hZ/s=;
        b=ZrTzRZUHPnQ1sClBfMXdrlO2A4ITnIownZNyx5giVCGgfJwj1kERMMA8TQz84u+51G
         Zkozks352uplVCbqqYfhIVPkJcjfmAL5qdetIHs1UK7oCU6ZSP2vBgg/FDhXnlFEEipU
         vIP1QsUaYgqszT0OfbgHl+1uW4vxXUhb1n+xaIaYchLpoUUMNHkfUj7J/fL9yqOjjf6i
         1PoM4zueCcMcWmzok+sGsF7DtgaefM9oqGr29vP9apQFvtERw8k7OVfeBac5gCdBRCCQ
         HXS4bIjzDXhaA9BWsLns/u+OUUtCHkPbgbNMvgRnbWa0zYikPAven/dGZ5nkkTmAFaC8
         HU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=qGNgvkpTWYJgtJz3d9Rrip5yrx5sS3X7wGC38s6hZ/s=;
        b=lojl+vPli7YXbLt7x5dpbYAkqUfQ5qR2U65l78bDlBsslxiAx119syKWZOD8h4aa0Y
         sQ6NTswkLl5gzu4gWqd1C6/p++J47m+oLpHh3zJSfAD4PtYA4Epl9REqlnprMmLiJ67F
         UkeHTWZF/fxb4H7dQd7RNab8znMr/Ui4P3+E70/p8oDWFvirYsf7oomegFpjsrhsW3Sk
         rymTrzFvnXeuIq3pqTbc4w/776K/fQNXFQ0LdCwWgWoyxVvgEmtH4akVCgCmeI7JxC/K
         J3Z2pv2+iAW3kYmE6l38wTqeUDf+fWyabUjUxnzkuYbFBXqfYQNkZzjozgqXDg/wiBCG
         MtCg==
X-Gm-Message-State: ACgBeo2k4qwNy4tamrFWNUY+WfSN+Hn2RiIcvRkjq5GdY9yH5FjDgETN
        KAYCdAeRTP3NFfjKGnRofe3GkZ9qRvaqk5ow3eE=
X-Google-Smtp-Source: AA6agR6xdcDw9ScuL81c0CasQE/5b/uUx1WsG0cJ4fEkn4yl7f3NZ64HwEq4Btec5BrlSC9gojTOFA==
X-Received: by 2002:a17:903:4043:b0:174:dd99:a589 with SMTP id n3-20020a170903404300b00174dd99a589mr7409111pla.56.1661855423005;
        Tue, 30 Aug 2022 03:30:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e6-20020a17090a280600b001fd76f7a0d1sm6743652pjd.54.2022.08.30.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 03:30:22 -0700 (PDT)
Message-ID: <630de6be.170a0220.c643.adda@mx.google.com>
Date:   Tue, 30 Aug 2022 03:30:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-08-30-v6.0-rc1
Subject: renesas/next cros-ec: 10 runs,
 7 regressions (renesas-next-2022-08-30-v6.0-rc1)
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

renesas/next cros-ec: 10 runs, 7 regressions (renesas-next-2022-08-30-v6.0-=
rc1)

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

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-08-30-v6.0-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-08-30-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d561df8d9be01801dcab98bc7fed470db4967a94

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


  Details:     https://kernelci.org/test/plan/id/630dd06a2dde601ae4355700

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-30-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-30-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
0dd06a2dde601ae4355711
        failing since 14 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30dd06a2dde601ae4355713
        failing since 14 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-30T08:54:50.464985  / # =

    2022-08-30T08:54:50.470636  =

    2022-08-30T08:54:50.575625  / # #
    2022-08-30T08:54:50.581019  #
    2022-08-30T08:54:50.682107  / # export SHELL=3D/bin/sh
    2022-08-30T08:54:50.687758  export SHELL=3D/bin/sh
    2022-08-30T08:54:50.789419  / # . /lava-7134631/environment
    2022-08-30T08:54:50.795607  . /lava-7134631/environment
    2022-08-30T08:54:50.897463  / # /lava-7134631/bin/lava-test-runner /lav=
a-7134631/0
    2022-08-30T08:54:50.903523  /lava-7134631/bin/lava-test-runner /lava-71=
34631/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/630dcfb3b92c782e3a355664

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-30-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-30-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
0dcfb3b92c782e3a355675
        failing since 14 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30dcfb3b92c782e3a355677
        failing since 14 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-30T08:51:51.139877  / # =

    2022-08-30T08:51:51.144968  =

    2022-08-30T08:51:51.246755  / # #
    2022-08-30T08:51:51.251973  #
    2022-08-30T08:51:51.352856  / # export SHELL=3D/bin/sh
    2022-08-30T08:51:51.358051  export SHELL=3D/bin/sh
    2022-08-30T08:51:51.459018  / # . /lava-7134669/environment
    2022-08-30T08:51:51.465321  . /lava-7134669/environment
    2022-08-30T08:51:51.566254  / # /lava-7134669/bin/lava-test-runner /lav=
a-7134669/0
    2022-08-30T08:51:51.571875  /lava-7134669/bin/lava-test-runner /lava-71=
34669/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd592735526fa08355680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-30-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-30-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/630dd592735526fa083556=
81
        failing since 14 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/630dd4f6574db5bedd355658

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-30-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-30-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
0dd4f6574db5bedd355669
        failing since 14 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
30dd4f6574db5bedd35566b
        failing since 14 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-08-30T09:14:06.368627  / # =

    2022-08-30T09:14:06.371788  =

    2022-08-30T09:14:06.474111  / # #
    2022-08-30T09:14:06.477024  #
    2022-08-30T09:14:06.579787  / # export SHELL=3D/bin/sh
    2022-08-30T09:14:06.582307  export SHELL=3D/bin/sh
    2022-08-30T09:14:06.684918  / # . /lava-7134835/environment
    2022-08-30T09:14:06.687457  . /lava-7134835/environment
    2022-08-30T09:14:06.790164  / # /lava-7134835/bin/lava-test-runner /lav=
a-7134835/0
    2022-08-30T09:14:06.792408  /lava-7134835/bin/lava-test-runner /lava-71=
34835/0 =

    ... (8 line(s) more)  =

 =20
