Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6B6624E36
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 00:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiKJXGB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 18:06:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiKJXGA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 18:06:00 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA7B5D692
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 15:05:58 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id o13so2973221pgu.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 15:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PF8RRHrnDZBG4qyFoPswcwOocB4GvmLA4riW4iqp4FU=;
        b=Pa8USjAT9XIMnCFQ6VxJmTY5uAuaHP6E+vN745fkIaWCv5bVeIHr+Q9gEBXKELtLFQ
         9ATaPDwWJdVcHiRvyaCWQu6RAqzHE7VUEqGBQ8JZbY4/RYkx4yiD+I/oxsaNKmda/fS+
         NWGEW14TIpQT8XravDA8Sys0Df2/lxq2UJwwDtyLutlxxmxVOAvn+y0qKhmzqG1DofnC
         Pse0CHjeU44pHL4H4tiUcOOWBqh79zYD/eNxt7FLbKWmUcXLh+wR/XtUz8NWp1ZDXuN6
         fSBNadU9y3dS6rhanmv1xoOrGlSXrzfV9vRlLkMwrgg8cTtIiKyKMBmUQoIYRcRKj0JK
         PCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PF8RRHrnDZBG4qyFoPswcwOocB4GvmLA4riW4iqp4FU=;
        b=aTI9pGbF/Tp0mlCYuikuQZzyVZcg8eqpyCyYvmSI9vqrCOuX0K5jN5dSCu1D0JC1Mr
         iRL8AtQBUOS78F4STFKG/SipRnQ6+S6OuQZ2E40/QNz7+zBF0YgxZYOBeihL7ixKJoXr
         04Z/rAvXNtU05rFI33v3059Dud155O/VTeHenoCvnp0eUVZcrjV8/msGlmBSJrFW7/Rf
         KCap0zrSdqiSPEvebhypguuUfkqpwSGFgxpUma9P5DzhGy4r7L1GOSMPvwzJ4bIJ6IP9
         mj1amOFRB0+8zCx0lSgHeBhcSEmNrRP1gkSEMZ0VIKcL9+7tLNmMTE4eQLBQAFhNfegb
         NDmw==
X-Gm-Message-State: ACrzQf1kGQOdzP6wanuq/OMMByyt4pgC15Pqj6EHK9L2Pg/1xgfCJXwk
        hwI44RLSe1DHdnqGniITXMG9EtbAK5C3xQk3bDs=
X-Google-Smtp-Source: AMsMyM5DnWNTzq7e2u0V0OO4cPctjOqS2pTqMkCQiWhSX89g6VkCtG0TMYFFa7j33lkIrTpDtZOafw==
X-Received: by 2002:a63:ea4c:0:b0:456:f713:c3d1 with SMTP id l12-20020a63ea4c000000b00456f713c3d1mr3641203pgk.303.1668121557757;
        Thu, 10 Nov 2022 15:05:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p2-20020a170902a40200b001885d15e3c1sm229256plq.26.2022.11.10.15.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 15:05:57 -0800 (PST)
Message-ID: <636d83d5.170a0220.9b0ac.07dc@mx.google.com>
Date:   Thu, 10 Nov 2022 15:05:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-11-10-v6.1-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 436 runs,
 20 regressions (renesas-devel-2022-11-10-v6.1-rc4)
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

renesas/master baseline: 436 runs, 20 regressions (renesas-devel-2022-11-10=
-v6.1-rc4)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =

stm32mp157c-lxa-mc1          | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-10-v6.1-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-10-v6.1-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      35f5248b8c44355d69637ca0ae3fc3fbfc8aa2d0 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636d52746e634fedd8e7db50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d52746e634fedd8e7d=
b51
        new failure (last pass: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636d52752929324fcee7db66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d52752929324fcee7d=
b67
        new failure (last pass: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/636d4d6f4277f4cdf9e7db55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-s=
db.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d4d6f4277f4cdf9e7d=
b56
        failing since 59 days (last pass: renesas-devel-2022-09-02-v6.0-rc3=
, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/636d4d5a024ab9c4d9e7db5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d4d5a024ab9c4d9e7d=
b5b
        failing since 72 days (last pass: renesas-devel-2022-07-22-v5.19-rc=
7, first fail: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/636d4eeb8bd7d7ef00e7db65

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d4eeb8bd7d7ef00e7d=
b66
        failing since 44 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/636d505a42234f0eb3e7dbb4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/bas=
eline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/bas=
eline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d505a42234f0eb3e7d=
bb5
        failing since 44 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/636d51d04c9deb266ae7db70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d51d04c9deb266ae7d=
b71
        failing since 44 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/636d53b074ce55b84be7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d53b074ce55b84be7d=
b4f
        failing since 44 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/636d56cf2287e31685e7dc05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-im=
x7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-im=
x7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d56cf2287e31685e7d=
c06
        failing since 44 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/636d4df5046dc5251fe7db74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d4df5046dc5251fe7d=
b75
        failing since 86 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/636d4a27b8730512c8e7db64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d4a27b8730512c8e7d=
b65
        failing since 23 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/636d4ad1a721ee4e0ee7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d4ad1a721ee4e0ee7d=
b4f
        failing since 17 days (last pass: renesas-devel-2022-10-17-v6.1-rc1=
, first fail: renesas-devel-2022-10-24-v6.1-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/636d68324ce37b3915e7dc3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d68324ce37b3915e7d=
c3d
        new failure (last pass: renesas-devel-2022-11-01-v6.1-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/636d4d2ac2acb8668ae7db5e

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/636d4d2ac2acb8668ae7db80
        failing since 247 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-11-10T19:12:17.530517  <8>[   48.214605] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-11-10T19:12:18.557064  /lava-7937146/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/636d4d2ac2acb8668ae7dba3
        failing since 157 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-11-10T19:12:15.583866  /lava-7937146/1/../bin/lava-test-case
    2022-11-10T19:12:15.596415  <8>[   46.281390] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/636d4d2ac2acb8668ae7dba4
        failing since 157 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-11-10T19:12:13.485859  =

    2022-11-10T19:12:14.519194  /lava-7937146/1/../bin/lava-test-case
    2022-11-10T19:12:14.534228  <8>[   45.218988] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/636d4d2ac2acb8668ae7dba5
        failing since 157 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-11-10T19:12:13.470502  /lava-7937146/1/../bin/lava-test-case
    2022-11-10T19:12:13.483725  <8>[   44.168221] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/636d4d06443305ea94e7db54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d4d06443305ea94e7d=
b55
        failing since 13 days (last pass: renesas-devel-2022-10-24-v6.1-rc2=
, first fail: renesas-devel-2022-10-28-v6.1-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/636d50626ec44308f9e7db99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d50626ec44308f9e7d=
b9a
        failing since 17 days (last pass: renesas-devel-2022-10-17-v6.1-rc1=
, first fail: renesas-devel-2022-10-24-v6.1-rc2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
stm32mp157c-lxa-mc1          | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636d530057d37757cbe7db4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-stm32mp157c-lxa-mc1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-stm32mp157c-lxa-mc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636d530057d37757cbe7d=
b50
        new failure (last pass: renesas-devel-2022-09-19-v6.0-rc6) =

 =20
