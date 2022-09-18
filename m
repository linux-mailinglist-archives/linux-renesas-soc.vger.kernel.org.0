Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE465BBEA0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Sep 2022 17:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiIRPWR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Sep 2022 11:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiIRPWR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Sep 2022 11:22:17 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F62654F
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 08:22:15 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id e68so25811558pfe.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 08:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=W44pppLrDi0HVc78Flt5ZPqsQRSTiJPcvJvn2WH3Stg=;
        b=fSblJ0iVfybFFilc6D2MENgpiifxxQALWqrAmp7Pp7Zytk3DddX+fPRZuYXtr8Mb5A
         IBTFTpNfei6qjmFmk7cG3+TnudyWSpiUZmHfA4bZ/7Xc39NookT9448LGcpEpwtH/QI+
         JTNJxlXZRG7/yrMUHH/dpgnV4/9Eaf0P66g4q2ALqDKd4sYnGPrnl0Wh/rkueVKUEnqu
         w/EbGR675xIzZMe5hPTW4NwCxexH33LwTqIm6HCmJSGfUm6qtJtR9YzBY5TCgmTadle3
         rPz8AHOE+ubWlETAfvgYMQeyN6ovgNXoskZoQQuL+283Gg7+tpBLA/ERfu+ksHy+Ynun
         r9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=W44pppLrDi0HVc78Flt5ZPqsQRSTiJPcvJvn2WH3Stg=;
        b=wJ2lUEBTO9U2gBtXjSWPsAbtOFNXmhDeHoFRSOxGXCJ3tIlRZZYZTXHX3RKwNnnwAu
         GrT9jmgHAyRNXsnCXr6o9wPAypb/1btxkk7sXRlwFS0ntuNESvGf9IO4m1cNQoFaKAsv
         MagpqTHc88u39o1Dtwj8nv4QVkSL4CrFxkNejbCTZYuPbZdZcvJTk4n9OOksjA6i60x+
         vfa+IjZO5Q0xmzfedSxDLJCHg9ix2RIgzGurp1Px26kQURmKMaxjjr1DjfgAzkXywUCt
         v9KLcmpZHAyKWdhg7KuO4ROYsTTLDohi7og+XMDC6aU+/0igPHdi+vB89+aLXgzM3ZN1
         rEnQ==
X-Gm-Message-State: ACrzQf2bD8jrI/8ErRJq9L5fHr3LbAetn4OOoONrbj3gJyaiCiibees6
        dRkGGI0ksKscyUaMp5pi39tqgjsSxsFabe3D9Ps=
X-Google-Smtp-Source: AMsMyM4bbVRLKjfYwrGrpIYvLOeDIrtVNPWwxSjCWyVY7KdYyGJin5AucKFmGC3uxsy0Aev75D5CZw==
X-Received: by 2002:a05:6a00:230f:b0:53e:2c2c:5c03 with SMTP id h15-20020a056a00230f00b0053e2c2c5c03mr14088615pfh.11.1663514535172;
        Sun, 18 Sep 2022 08:22:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m3-20020a638c03000000b0042bd73400b6sm16880271pgd.87.2022.09.18.08.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 08:22:14 -0700 (PDT)
Message-ID: <632737a6.630a0220.2d478.d075@mx.google.com>
Date:   Sun, 18 Sep 2022 08:22:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-09-18-v6.0-rc1
Subject: renesas/next cros-ec: 10 runs,
 7 regressions (renesas-next-2022-09-18-v6.0-rc1)
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

renesas/next cros-ec: 10 runs, 7 regressions (renesas-next-2022-09-18-v6.0-=
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
s-next-2022-09-18-v6.0-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-09-18-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2918d1d088b5c12f5449318fd4a0230455fa5752

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


  Details:     https://kernelci.org/test/plan/id/6327253e5075dafcb9355655

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
27253e5075dafcb9355666
        failing since 34 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
327253e5075dafcb9355668
        failing since 34 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-09-18T14:03:22.579918  / # =

    2022-09-18T14:03:22.584669  =

    2022-09-18T14:03:22.686297  / # #
    2022-09-18T14:03:22.691269  #
    2022-09-18T14:03:22.792239  / # export SHELL=3D/bin/sh
    2022-09-18T14:03:22.797171  export SHELL=3D/bin/sh
    2022-09-18T14:03:22.898099  / # . /lava-7304818/environment
    2022-09-18T14:03:22.903067  . /lava-7304818/environment
    2022-09-18T14:03:23.004007  / # /lava-7304818/bin/lava-test-runner /lav=
a-7304818/0
    2022-09-18T14:03:23.008863  /lava-7304818/bin/lava-test-runner /lava-73=
04818/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6327243ba56b684f7635564b

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/cros-ec-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
27243ba56b684f7635565c
        failing since 34 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
327243ba56b684f7635565e
        failing since 34 days (last pass: renesas-next-2022-07-07-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-09-18T13:58:58.761247  / # =

    2022-09-18T13:58:58.767392  =

    2022-09-18T13:58:58.873548  / # #
    2022-09-18T13:58:58.880058  #
    2022-09-18T13:58:58.982440  / # export SHELL=3D/bin/sh
    2022-09-18T13:58:58.988907  export SHELL=3D/bin/sh
    2022-09-18T13:58:59.090835  / # . /lava-7304817/environment
    2022-09-18T13:58:59.096766  . /lava-7304817/environment
    2022-09-18T13:58:59.199078  / # /lava-7304817/bin/lava-test-runner /lav=
a-7304817/0
    2022-09-18T13:58:59.205649  /lava-7304817/bin/lava-test-runner /lava-73=
04817/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6327287792f89a4989355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6327287792f89a49893556=
45
        failing since 34 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6327284641c967215535567b

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-09-18-v6.0-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/cros-=
ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220826.0/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
27284641c967215535568c
        failing since 34 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
327284641c967215535568e
        failing since 34 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1)

    2022-09-18T14:16:20.482349  / # =

    2022-09-18T14:16:20.485546  =

    2022-09-18T14:16:20.595941  / # #
    2022-09-18T14:16:20.599268  #
    2022-09-18T14:16:20.702809  / #export SHELL=3D/bin/sh
    2022-09-18T14:16:20.705152   export SHELL=3D/bin/sh
    2022-09-18T14:16:20.807649  / # . /lava-7305090/environment
    2022-09-18T14:16:20.810627  . /lava-7305090/environment
    2022-09-18T14:16:20.914313  / # /lava-7305090/bin/lava-test-runner /lav=
a-7305090/0
    2022-09-18T14:16:20.917657  /lava-7305090/bin/lava-test-runner /lava-73=
05090/0 =

    ... (8 line(s) more)  =

 =20
