Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 620F662FD57
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 19:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242926AbiKRS5k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 13:57:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241915AbiKRS5Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 13:57:24 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDFE9BA17
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 10:55:08 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id y4so5355859plb.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 10:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qJxbEgfPji/V7S3dzM977q+//oEdUg1UPmQY/fizZSE=;
        b=69+qawLOnuWQGHMsjQdRUIKUR8SUxZ1Wui5NPPMF2gajWzpBsxdHm+aDSDSChRJdLW
         geN1jII4bc3sQGzquuobp6D29qbJVI4XDDMR24zM/KkYBYahI4f1Z53TqLgX8aIvF/dt
         H2txn9010wWPVmv+B/Y61SKaONU9QwC83lWsULYw7aR/qFWnxC/x+BqqLjFVxSWl88Kf
         LXNDavMtcASOGk2x+OaKcRRsVJ7vtDiLLZUtTcDlBO1sVDrX3JeoPHBsyyDzlITfzmyt
         m3vxNk3vIOCJtZDLkqQDSt/3S5JfEL2EAW3S+OD+OzSeVEthfYXdIYXHOOAE/gDrgM2W
         gzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJxbEgfPji/V7S3dzM977q+//oEdUg1UPmQY/fizZSE=;
        b=37+bBXu+1+SduooqU8/+4SEWVTPMFzvzBAka/g6/OHFgNE6dPBOQPxXRsSSVOLdJLS
         /a04lcnRxKo2Ki9idkWR2QMUXh5y+Bs5PAamWrE7YZ5VwVc41bbsO4LD8pa6S5jemkTQ
         PjA0d1LodR6a1ZhkoOGsKS2V5ZZqe9sN2ZvlXFw9bTgHCow/a0spDAO/MGQ1bj1degT/
         MQgFAa+Q4gR4JeW1mI+NiTwX+YmGROvajMrYhYOcGqH/ro5T/p3vXeZyf4GV+/QXC+aS
         KUUCzaEhllnfwA9kYhxwcmlOis+tLBRrfYBysLwF5zaFO90zQZIIwZRfIxFeozMUIgyQ
         xnbg==
X-Gm-Message-State: ANoB5pnpFmzCnwZdl6Lc2vki6gE3AzhEHNcrUvbJcimIKsAUEP4V3eok
        gfTIcgHyXu2rDp8u1eT7hmZI9qM435QHwAhM2LU=
X-Google-Smtp-Source: AA0mqf6Ii5cSqtrr7GH33L601h2aCLbHS8YNtynf9j9cxeZ2U5cA4j7FablV0tOkvz4nDR2Hqd8QXg==
X-Received: by 2002:a17:90a:db54:b0:1fe:b9b:7d31 with SMTP id u20-20020a17090adb5400b001fe0b9b7d31mr9416877pjx.152.1668797707654;
        Fri, 18 Nov 2022 10:55:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902ea0a00b00186ae20e8dcsm4009436plg.271.2022.11.18.10.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 10:55:07 -0800 (PST)
Message-ID: <6377d50b.170a0220.cbf49.7113@mx.google.com>
Date:   Fri, 18 Nov 2022 10:55:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master cros-ec: 8 runs,
 5 regressions (renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967)
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

renesas/master cros-ec: 8 runs, 5 regressions (renesas-devel-2022-11-17-v6.=
1-rc5-5-gf68db0d22967)

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
sas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-17-v6.1-rc5-5-gf68db0d22967
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f68db0d2296736d50da811c3d26889e9b803eb83

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


  Details:     https://kernelci.org/test/plan/id/6377c2c129a73d17ec2abd16

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/x86_64/x86_64_defconfig+x86-chromebook/g=
cc-10/lab-collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/x86_64/x86_64_defconfig+x86-chromebook/g=
cc-10/lab-collabora/cros-ec-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/amd64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
77c2c129a73d17ec2abd27
        failing since 94 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
377c2c129a73d17ec2abd29
        failing since 94 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-11-18T17:36:44.746604  / # =

    2022-11-18T17:36:44.751591  =

    2022-11-18T17:36:44.853243  / # #
    2022-11-18T17:36:44.858066  #
    2022-11-18T17:36:44.959095  / # export SHELL=3D/bin/sh
    2022-11-18T17:36:44.963840  export SHELL=3D/bin/sh
    2022-11-18T17:36:45.064760  / # . /lava-8037584/environment
    2022-11-18T17:36:45.069913  . /lava-8037584/environment
    2022-11-18T17:36:45.170883  / # /lava-8037584/bin/lava-test-runner /lav=
a-8037584/0
    2022-11-18T17:36:45.175879  /lava-8037584/bin/lava-test-runner /lava-80=
37584/0 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6377c955a3bd0643af2abd1b

  Results:     5 PASS, 2 FAIL, 12 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/arm64/defconfig+arm64-chromebook/gcc-10/=
lab-collabora/cros-ec-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/arm64/defconfig+arm64-chromebook/gcc-10/=
lab-collabora/cros-ec-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/arm64/rootfs.cpio.gz =



  * cros-ec.test_cros_ec_gyro_iio_abi: https://kernelci.org/test/case/id/63=
77c955a3bd0643af2abd2c
        failing since 94 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =


  * cros-ec.test_cros_ec_accel_iio_abi: https://kernelci.org/test/case/id/6=
377c955a3bd0643af2abd2e
        failing since 94 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1)

    2022-11-18T18:04:40.507318  / # =

    2022-11-18T18:04:40.509221  =

    2022-11-18T18:04:40.509483  =

    2022-11-18T18:04:40.615547  / ##
    2022-11-18T18:04:40.617592   #
    2022-11-18T18:04:40.617858  =

    2022-11-18T18:04:40.721276  / # export SHELL=3D/bin/sh
    2022-11-18T18:04:40.723284  export SHELL=3D/bin/sh
    2022-11-18T18:04:40.723545  =

    2022-11-18T18:04:40.826125  / # . /lava-8038521/environment =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6377c65824ab5f29452abd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/arm64/defconfig+arm64-chromebook/gcc-10/=
lab-collabora/cros-ec-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5-5-gf68db0d22967/arm64/defconfig+arm64-chromebook/gcc-10/=
lab-collabora/cros-ec-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20221107.1/arm64/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6377c65824ab5f29452abd=
12
        failing since 7 days (last pass: renesas-devel-2022-11-01-v6.1-rc3,=
 first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =20
