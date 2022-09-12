Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C985B5D6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Sep 2022 17:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbiILPkz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Sep 2022 11:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbiILPkv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2022 11:40:51 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2333A13DD8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 08:40:50 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id n23-20020a17090a091700b00202a51cc78bso6477390pjn.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 08:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=/gk2empwlb9+oFdI400JXpFBQzCm14R9tn+8kI+3Trc=;
        b=pvIDFdhr6ljNn7IkfjGjBPoyAS/QbhDPjGci1l9Qhq2lpcHGdZ4mjIy7U0hJbBZrpQ
         8Nwo9VYkC6dKi06byU0OeQQL21GGXIprsNN+Vd2XG/5qv9vhKtrL+P+fDD2yRg2KJ0IW
         KmQRlNFHkicVT5ltXErFL9LdGwiCPjsJnv70WCmdZG11AidFR68jcP+MWaebUHCmp+7F
         vof1pFI1A4Ogth1Pl8wadZq2N+6RvGlSCK8KElEgAL42Pwy1kT9DeDRKQdOw+iY3xpW1
         gXofLwYUvmKOjelTV2OLXrTFbxQEV6nmQN4h2+HIh4Vifi1O+GGmQa4csGQJsfYF7Cl8
         j8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=/gk2empwlb9+oFdI400JXpFBQzCm14R9tn+8kI+3Trc=;
        b=FGIHFJmdciOi/WbURPwnKvMY8FeARfxHt79LTXVJ49lyKRu3CNQ91XbAvutecLCwxE
         voJS8sM8PhYvNhJAJnRiWPZF9clcVjHoN8BhllZiCNWpgEb4A/E2RE173N2xcRw6PYLZ
         zx9eAu1sKz4jebxzjQFX5fdQh4YoADo8/pua7OqzdVz3C0Pwa/A45XMF8nuW5Vm80Kaz
         m6uE1QeqwQSAxP5fAyBamgKzoV7eAonE+e5qhe2cxkLpVoRSVC6mTCWp9GgxEFPmHpoa
         y9h3nMCysdtexcJo2KX3f/nSCXruVZ7U0Gs0/rk/l11oLvxv0uioq6zRe/SCezWD/Fpj
         2RuA==
X-Gm-Message-State: ACgBeo0FfHiFgdIBZFpvbXXKzsyfQnieY1L0dbSdZsPcUsHnDUsQWj+J
        g9QV00vAQXFzddvesNl4PCXH70gICElCW0xxSfI=
X-Google-Smtp-Source: AA6agR4yWzQ220fQrGMdnZ05VrmK3yUyAK6zKOESk/S/PJDVkU+Q/4r94Uj5JBz3O/Zl/8dCGCqllw==
X-Received: by 2002:a17:90b:4b43:b0:202:e09c:664d with SMTP id mi3-20020a17090b4b4300b00202e09c664dmr3507002pjb.120.1662997249335;
        Mon, 12 Sep 2022 08:40:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902654400b001749dff717dsm6114808pln.227.2022.09.12.08.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 08:40:48 -0700 (PDT)
Message-ID: <631f5300.170a0220.d67c0.9e47@mx.google.com>
Date:   Mon, 12 Sep 2022 08:40:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc5-843-g94f27a9ea269
Subject: renesas/master baseline: 321 runs,
 14 regressions (v6.0-rc5-843-g94f27a9ea269)
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

renesas/master baseline: 321 runs, 14 regressions (v6.0-rc5-843-g94f27a9ea2=
69)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v6.0=
-rc5-843-g94f27a9ea269/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: v6.0-rc5-843-g94f27a9ea269
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      94f27a9ea2691030ed8a87c33e1e6a0badc3bde9 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1ea4a6fcd98595355660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo=
.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631f1ea4a6fcd98595355=
661
        new failure (last pass: renesas-devel-2022-07-05-v5.19-rc5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1e05600bb62284355664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.=
txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631f1e05600bb62284355=
665
        new failure (last pass: renesas-devel-2022-09-02-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1f0811f02e92a035564c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631f1f0811f02e92a0355=
64d
        new failure (last pass: renesas-devel-2022-09-02-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1eb8927bb3986035564b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-ev=
k.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631f1eb8927bb39860355=
64c
        new failure (last pass: renesas-devel-2022-09-02-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/631f2b8898ba9f3bcf35565f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-=
pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-=
pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631f2b8898ba9f3bcf355=
660
        failing since 125 days (last pass: renesas-devel-2021-12-06-v5.16-r=
c4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/631f258332f20d2379355648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-i=
mx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631f258332f20d2379355=
649
        failing since 97 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/631f2afcffa9bd6db23556b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-p=
ico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-p=
ico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631f2afcffa9bd6db2355=
6b8
        failing since 125 days (last pass: renesas-devel-2021-12-06-v5.16-r=
c4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1e6724ce2dc0e43556ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631f1e6724ce2dc0e4355=
6ac
        failing since 13 days (last pass: renesas-devel-2022-07-22-v5.19-rc=
7, first fail: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1beb395f6536b6355667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseli=
ne-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseli=
ne-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631f1beb395f6536b6355=
668
        new failure (last pass: renesas-devel-2022-09-05-v6.0-rc4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1e2090b9aaf7e035567d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-=
mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-=
mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/631f1e2090b9aaf7e0355=
67e
        failing since 27 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/631f1e6024ce2dc0e4355642

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-=
rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-=
rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/631f1e6024ce2dc0e4355668
        failing since 187 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-09-12T11:55:55.799326  <8>[   40.052116] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-09-12T11:55:56.831800  /lava-7241515/1/../bin/lava-test-case
    2022-09-12T11:55:56.842265  <8>[   41.095212] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/631f1e6024ce2dc0e435568b
        failing since 97 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-09-12T11:55:54.576844  /lava-7241515/1/../bin/lava-test-case
    2022-09-12T11:55:54.588919  <8>[   38.840723] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/631f1e6024ce2dc0e435568c
        failing since 97 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-09-12T11:55:52.518836  <8>[   36.770481] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-09-12T11:55:53.544608  /lava-7241515/1/../bin/lava-test-case
    2022-09-12T11:55:53.554071  <8>[   37.806027] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/631f1e6024ce2dc0e435568d
        failing since 97 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-09-12T11:55:52.509336  /lava-7241515/1/../bin/lava-test-case   =

 =20
