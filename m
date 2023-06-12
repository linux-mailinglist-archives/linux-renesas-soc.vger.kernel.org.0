Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D4472C52E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jun 2023 14:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236725AbjFLM4k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jun 2023 08:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232900AbjFLM4W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2023 08:56:22 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35ACC2955
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 05:55:22 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-25bf4b269e0so464470a91.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jun 2023 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686574497; x=1689166497;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ky5rfmUItjFph323zQbDIYPYvNQr2CEoclVKyy4phjU=;
        b=beOW7i54dfPIWjNVdItsnwYkqTfqeO6qbbNwtezmKKVUWolmjvtlZmaAgpoDaNCk7K
         BmUrHfzZVvdeXAnyHvPZDfiCvfMOvAMFaiT7AtEUh5kBgspMs53hMTCherYKNliYpoZc
         ufsAlScFSsHZUuKOo/tBaWXheSShF3X7akUWqoYreEcgK4bnDANv3IoTn30zY7/xKFck
         Zg0QCpoUZvvh0vgWJlc/Hkyi6Lsz0rOSE2Ygr0BhOQjg24I6biCCq3/bTvGj+4gmO4+Q
         EktNP2LWuhv7I7PpWNTx1wQV79Q6yCyWTYvqJ4DyRJLzNxbaElhozY9WlQH+ii9aIq7x
         VMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574497; x=1689166497;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ky5rfmUItjFph323zQbDIYPYvNQr2CEoclVKyy4phjU=;
        b=FOwbUr0txn5Fyc7amBkH1v9I2vzKViJSWnNgVwzWpUrbqPgUtnOx9bnEdlXetNDbiu
         QuQWLc1WU6vffaWY3/akOU1lmwLSRXAnH/2U4z/yRvGY6T0lU2XUJdsWPIy0KmczJH+Q
         0U3uD5tmcPAeExewxdWglxxjnsyLKTFSWRTawprY2NJQDpSpdYBBFtMFMp/Oz/9owEHb
         Nubpm/DRJKYW2lPd2E/M/m8nmRUq+JF2LucYw/boeZoAK93JlE8OgxNNtjPHwm2rjKLE
         uzYRE+PWMLLzb8x6BEFwNTdpycoSzJXgbwqNViETDBHS8hOSVkduyxoHXnfl3gXaQN50
         s1hw==
X-Gm-Message-State: AC+VfDwTNDo2UMac595eZ5kz7+FBujtoioF0655Aa30NiYcDwMmViC4c
        ZUJaoeLtbhhqBmuBi27al55ltou7CrYbDFsk/8EqZg==
X-Google-Smtp-Source: ACHHUZ7XMeXYbR9EI9WnE0bOrOoxb8qcSPsR4pviWDce9zBFjRDGnHEaYYd4gGISLZ24MlfPZqZOrQ==
X-Received: by 2002:a17:90b:3887:b0:256:9b5c:2aa2 with SMTP id mu7-20020a17090b388700b002569b5c2aa2mr10775752pjb.6.1686574497569;
        Mon, 12 Jun 2023 05:54:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a034100b0025bf9e02e1bsm1043293pjf.51.2023.06.12.05.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 05:54:56 -0700 (PDT)
Message-ID: <648715a0.170a0220.2d9e7.1696@mx.google.com>
Date:   Mon, 12 Jun 2023 05:54:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-06-12-v6.4-rc6
Subject: renesas/master ltp-ipc: 33 runs,
 7 regressions (renesas-devel-2023-06-12-v6.4-rc6)
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

renesas/master ltp-ipc: 33 runs, 7 regressions (renesas-devel-2023-06-12-v6=
.4-rc6)

Regressions Summary
-------------------

platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-broonie | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip     | gcc-10   | multi_v7_de=
fconfig+ima       | 1          =

beaglebone-black             | arm   | lab-cip     | gcc-10   | multi_v7_de=
fconfig+crypto    | 1          =

beaglebone-black             | arm   | lab-broonie | gcc-10   | omap2plus_d=
efconfig          | 1          =

beaglebone-black             | arm   | lab-cip     | gcc-10   | omap2plus_d=
efconfig          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig+a=
rm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-12-v6.4-rc6/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-12-v6.4-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eec974413697190538e69788efc6048763f9b64e

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  604701dc19c5499403ae5afe48103b8e2872952b =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-broonie | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648712ccf01cacda193061cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/ltp-ipc-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/ltp-ipc-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/648712ccf01cacda193061=
cc
        failing since 6 days (last pass: renesas-devel-2023-06-05-v6.4-rc5,=
 first fail: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-cip     | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648703459a3e99d32d306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/ltp=
-ipc-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/ltp=
-ipc-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/648703459a3e99d32d3061=
32
        failing since 6 days (last pass: renesas-devel-2023-06-05-v6.4-rc5,=
 first fail: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-cip     | gcc-10   | multi_v7_de=
fconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64870dd209c9c978d2306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/64870dd209c9c978d23061=
35
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-cip     | gcc-10   | multi_v7_de=
fconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6487122ebf50486ed3306147

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/ltp-ipc-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/ltp-ipc-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6487122ebf50486ed33061=
48
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-broonie | gcc-10   | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64871484ec2aecf0033061cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/omap2plus_defconfig/gcc-10/lab-broonie/ltp-ipc-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/omap2plus_defconfig/gcc-10/lab-broonie/ltp-ipc-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/64871484ec2aecf0033061=
ce
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
beaglebone-black             | arm   | lab-cip     | gcc-10   | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64870795647d59f2c7306138

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/omap2plus_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm/omap2plus_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/64870795647d59f2c73061=
39
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie | gcc-10   | defconfig+a=
rm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/648710606c9839c83130612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-bro=
onie/ltp-ipc-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-12-v6.4-rc6/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-bro=
onie/ltp-ipc-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/arm64/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/648710606c9839c8313061=
2f
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5) =

 =20
