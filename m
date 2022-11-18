Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6DD62EB85
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 02:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235042AbiKRB7z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 20:59:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbiKRB7y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 20:59:54 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED5574AA0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 17:59:51 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id o13so3755043pgu.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 17:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=asDEEc9qDQsyKGHH9r59IxyCiX6Fu79ADQAko8d0RXU=;
        b=Oo32MG0e8BL7VJpHm2qgqNWzcUVT4hy/Wk8+r5vK/wr/mKFsoVotwm9Nq9hb/aOckr
         Zb4u1nviMM43js2mqz3ckXOh3c7ruEuCQ+tFHiJLmmncTvJIJWWDRUtkDrOBGq1OUTOP
         qIbZwy1y/kzjn0OlVfGJjJ820VIvjHvrAhJvm6+MkxVQjB83g/3jEq2hehaP81PVZFXN
         UlXpq1tiMz83GSVoia6OpNy+mdnI+8FqkHwgNRp7UGzbjDFOChCzkQroDH7tEg9VQSRu
         7wxGlxLmqjuuhrGZ6mTlO2Nj5edDw8QcyWyLyhrnAijs95QOIjQTNvMwi/3idiCC3Dv9
         uhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asDEEc9qDQsyKGHH9r59IxyCiX6Fu79ADQAko8d0RXU=;
        b=dIPRAiWfrTmCGIXb9Oa94m7TZqsBmbzCjLbIIO/T5iq3ae8RpPNCT8MhKXtMFTRRA1
         Wjf9pJLwOd9XprMUMiegZJH70sKlgQdYTS088DyIb9v/Ij4nGmEi57ZJDx93BItw8iw4
         oKECf8/KViwFxP4GlyRqHyxDqeAy3Ajgdu4B7MaIcP+GagLQfercVW3pUGvUbGD4ZpUx
         e6uE3UlufqJ6CgXt6MV20idfIN9BnSEmGjSoR+rs0Pz4rSYK4LgVriqDotrdQsntFB0H
         HqPtjWt5dO1+VbU9Hf8GHycpQDi5T+uMQyGPVzI+3pvZXwSBq52F8H6pU6e77vHrYdcs
         rLsw==
X-Gm-Message-State: ANoB5pkH4p3cxFKGKFAeMcsN9E1V1rqQpHxakGaHNHWPd7q2PtxZ6mG+
        zcAxuA0E4rzwu0xDGFuHCkaX/rMZSIdEt6LK06Y=
X-Google-Smtp-Source: AA0mqf7eDWDzb661oFIcQY1LfsgiWsxXW9H9BdAsn6egFK8uKv+qvcAuvw5wR5NO7NWgrrVPksyjAA==
X-Received: by 2002:a63:4081:0:b0:46f:e657:7d25 with SMTP id n123-20020a634081000000b0046fe6577d25mr4508385pga.347.1668736790671;
        Thu, 17 Nov 2022 17:59:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x23-20020aa79ad7000000b0056bcb102e7bsm1866109pfp.68.2022.11.17.17.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 17:59:20 -0800 (PST)
Message-ID: <6376e6f8.a70a0220.eb887.31e9@mx.google.com>
Date:   Thu, 17 Nov 2022 17:59:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-11-17-v6.1-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 467 runs,
 28 regressions (renesas-devel-2022-11-17-v6.1-rc5)
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

renesas/master baseline: 467 runs, 28 regressions (renesas-devel-2022-11-17=
-v6.1-rc5)

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

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-17-v6.1-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-17-v6.1-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      882ccb9771f9e9985a9ada17c5e35b4863258378 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b5abe0533a426b2abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b5abe0533a426b2ab=
cfb
        failing since 7 days (last pass: renesas-devel-2022-09-19-v6.0-rc6,=
 first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b097c834c7726a2abcfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b097c834c7726a2ab=
cfd
        failing since 7 days (last pass: renesas-devel-2022-09-19-v6.0-rc6,=
 first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6376baea7bb4d8226d2abd14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376baea7bb4d8226d2ab=
d15
        failing since 79 days (last pass: renesas-devel-2022-07-22-v5.19-rc=
7, first fail: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b982f0e2a347062abd10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b982f0e2a347062ab=
d11
        failing since 51 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6376bc52bfc214375c2abd1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/bas=
eline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/bas=
eline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376bc52bfc214375c2ab=
d1b
        failing since 51 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6376bdbb5317d902112abd0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376bdbb5317d902112ab=
d0b
        failing since 51 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6376bf863860334e6e2abd1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376bf863860334e6e2ab=
d1e
        failing since 51 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6376c12cc2ebf5f2432abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-im=
x7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-im=
x7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376c12cc2ebf5f2432ab=
cfb
        failing since 51 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6376acae1fba8f57092abd1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376acae1fba8f57092ab=
d20
        failing since 93 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6376a6d0907a7fad3c2abcff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376a6d0907a7fad3c2ab=
d00
        failing since 30 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b0a3ad6347738b2abd22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b0a3ad6347738b2ab=
d23
        failing since 30 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b0919d084bc87e2abd12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b0919d084bc87e2ab=
d13
        failing since 30 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b0859d084bc87e2abd0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b0859d084bc87e2ab=
d0e
        failing since 30 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b0a9ad6347738b2abd27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b0a9ad6347738b2ab=
d28
        failing since 30 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b1e35ce93f22a12abd22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b1e35ce93f22a12ab=
d23
        failing since 30 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b0a5db0356a6b92abd00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b0a5db0356a6b92ab=
d01
        failing since 30 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b092ddb79adc872abd0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b092ddb79adc872ab=
d0f
        failing since 30 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b084494e9ec2662abd15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b084494e9ec2662ab=
d16
        failing since 30 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b0a7ddb79adc872abd18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baselin=
e-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b0a7ddb79adc872ab=
d19
        failing since 30 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6376b1e2457c2d943a2abcfb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376b1e2457c2d943a2ab=
cfc
        failing since 30 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6376a8fd8c5cc45d832abd17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376a8fd8c5cc45d832ab=
d18
        failing since 7 days (last pass: renesas-devel-2022-11-01-v6.1-rc3,=
 first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6376a80d5429a27cdf2abd10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1=
-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1=
-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376a80d5429a27cdf2ab=
d11
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/6376ad11aeb825cc9b2abd04

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6376ad11aeb825cc9b2abd26
        failing since 254 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-11-17T21:51:54.672951  /lava-8023201/1/../bin/lava-test-case
    2022-11-17T21:51:54.691481  <8>[   49.579873] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/6376ad11aeb825cc9b2abd49
        failing since 164 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-11-17T21:51:50.620561  =

    2022-11-17T21:51:51.655301  /lava-8023201/1/../bin/lava-test-case
    2022-11-17T21:51:51.674324  <8>[   46.561585] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/6376ad11aeb825cc9b2abd4a
        failing since 164 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-11-17T21:51:49.557026  <8>[   44.443851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-11-17T21:51:50.606329  /lava-8023201/1/../bin/lava-test-case
    2022-11-17T21:51:50.607021  =

    2022-11-17T21:51:50.620021  <8>[   45.507673] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/6376ad11aeb825cc9b2abd4b
        failing since 164 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-11-17T21:51:48.455716  =

    2022-11-17T21:51:49.537507  /lava-8023201/1/../bin/lava-test-case
    2022-11-17T21:51:49.537821     =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6376ae0203423315c92abd30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376ae0203423315c92ab=
d31
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6376acd8f50953546d2abd52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-17-v6.1-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6376acd8f50953546d2ab=
d53
        failing since 24 days (last pass: renesas-devel-2022-10-17-v6.1-rc1=
, first fail: renesas-devel-2022-10-24-v6.1-rc2) =

 =20
