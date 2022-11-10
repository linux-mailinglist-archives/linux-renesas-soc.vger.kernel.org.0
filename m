Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0AB3624BFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 21:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbiKJUgb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 15:36:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbiKJUgP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 15:36:15 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004434508D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 12:35:56 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id h193so2670488pgc.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 12:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pjpFNSe0F8C7pjkjaw20bHdX3QjaHzMTS93qzWzV1Y8=;
        b=vdOJKATL9r4xyfxXX+Sy5y0c9SXmFgqTgUE/lrCH5SvvUbpFutCCtrVcEgPzk8BQn+
         emQsdxS6kg+UDOHtNkEUkr2qHv5nJPgFogd8zKs5nWcCKgsIfor5WW6WZvdwgDiuP/J+
         DEd5yUZRqH6t595Ty49L8XC78PrWzVEoPxT1RyOuGSdfujqunT5OvxK1+iDDQ/rGVcjF
         RjCRaH9HSHACuAPs/r1wSsb77WZ4XANqPuclXQEY53uzMLATgfcng2nuDsDSw0h1k9iZ
         PE8R5TlQ38WuQRAUt1QYAPfgwbh+dRnNXtz5UAV2VD9EniZtGkbvwZ1s1RqxpjWdSGGd
         8a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjpFNSe0F8C7pjkjaw20bHdX3QjaHzMTS93qzWzV1Y8=;
        b=E/dJ5scjQc6fljP81wTgOCmaU1rjn87F1IDCAMl5u3ONXO8kzuSX4FOYsIIcHD6Jef
         XiwX2+4nwOXH7reKGDD8/8+yygR98qUyk0qlnMe4LpVaP4vKDeTgrwyPQMfmNyGKl+/v
         u5T6nQ0ngLvSlrImw4XhH5uGWvO9eyX06j04YXsV+uAnwwd7WMXp2Q/BKX9/gS76mnrn
         2QZEB5OmbyRJg44gER8R06vHMWzQ1g09/amVYjZG3cI7jWVM7+kyCC2kSisSJDVNdl4o
         wAT3NsTww3nQnq18hZ7r+q879GOoGldfsG5/CGZtuhX+eztVn/nWLGDJPqDcxbGzdnwc
         hJjw==
X-Gm-Message-State: ANoB5pklAP2C9NtjxpbqXCaX39bCFiV8I5QnHDiiEpY0Csy02OMtOECl
        PQut24C8sy+5Q37BfslaD91E4oNaVbp5YRF0Bm0=
X-Google-Smtp-Source: AA0mqf7rJJxP1UEmMspePLgan46wZuN5JPypZAmp7Q0+zInJLQqaI5QBgknuoHa1X4zTUdhhAythWg==
X-Received: by 2002:a63:6601:0:b0:470:814c:f54a with SMTP id a1-20020a636601000000b00470814cf54amr2448276pgc.516.1668112556273;
        Thu, 10 Nov 2022 12:35:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p15-20020aa79e8f000000b0056bb4bbfb9bsm74922pfq.95.2022.11.10.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 12:35:55 -0800 (PST)
Message-ID: <636d60ab.a70a0220.eea30.031b@mx.google.com>
Date:   Thu, 10 Nov 2022 12:35:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-11-10-v6.1-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 8 runs,
 5 regressions (renesas-devel-2022-11-10-v6.1-rc4)
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

renesas/master cros-ec: 8 runs, 5 regressions (renesas-devel-2022-11-10-v6.=
1-rc4)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-10-v6.1-rc4/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-10-v6.1-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      35f5248b8c44355d69637ca0ae3fc3fbfc8aa2d0

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


  Details:     https://kernelci.org/test/plan/id/636d4c8b61f2ae3ae6e7db9e

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
6d4c8b61f2ae3ae6e7dbaf
        failing since 86 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
36d4c8b61f2ae3ae6e7dbb1
        failing since 86 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-11-10T19:09:50.630612  / # =

    2022-11-10T19:09:50.635302  =

    2022-11-10T19:09:50.737029  / # #
    2022-11-10T19:09:50.741361  #
    2022-11-10T19:09:50.842233  / # export SHELL=3D/bin/sh
    2022-11-10T19:09:50.846661  export SHELL=3D/bin/sh
    2022-11-10T19:09:50.947551  / # . /lava-7937041/environment
    2022-11-10T19:09:50.951881  . /lava-7937041/environment
    2022-11-10T19:09:51.052809  / # /lava-7937041/bin/lava-test-runner /lav=
a-7937041/0
    2022-11-10T19:09:51.057371  /lava-7937041/bin/lava-test-runner /lava-79=
37041/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/636d4db72e43578ea5e7db68

  Results:     4 PASS, 2 FAIL, 8 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
6d4db72e43578ea5e7db74
        failing since 86 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
36d4db72e43578ea5e7db76
        failing since 86 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-11-10T19:14:39.883820  / # =

    2022-11-10T19:14:39.885917  =

    2022-11-10T19:14:39.886162  =

    2022-11-10T19:14:39.991301  / # #
    2022-11-10T19:14:39.991586  <6>[   30.793610] mwifiex_pcie 0000:01:00.0=
: info: FW download over, size 638992 bytes
    2022-11-10T19:14:39.993520  #
    2022-11-10T19:14:39.993764  =

    2022-11-10T19:14:40.097559  / # export SHELL=3D/bin/sh
    2022-11-10T19:14:40.099570  export SHELL=3D/bin/sh
    2022-11-10T19:14:40.099843   =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/636d4d1439ef5a6683e7db83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cr=
os-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221024.1/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/636d4d1439ef5a6683e7db=
84
        new failure (last pass: renesas-devel-2022-11-01-v6.1-rc3) =

 =20
