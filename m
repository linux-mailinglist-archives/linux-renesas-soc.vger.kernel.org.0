Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6052D540112
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 16:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239473AbiFGOUr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 10:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244312AbiFGOUr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 10:20:47 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66BAC9646
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 07:20:44 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n8so14962530plh.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2022 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SwTdsRNjiM8YdVdlP4p8+OGoFzPswCo7cKEZ74zoXzM=;
        b=ZQttB0FnQ4U8KEq5TZVveVO6e75V9SNtw8GheJQ5+cqXt0x0Xojg/nEZuCLdYdowOc
         deNR5nHHvTcQyoKFNoVXahyTjhQJt2L8xitE7y71DM4Wf8DBVec6iIbzrIOZv4LB/qOt
         OZUo/DBiVn89eBnUGXfRR34hSc41UX0olaGC41ibQ6tZVJN/Ly5KFCHOeU8sL8Q2gHPc
         tnAvEIr1YIiUwN+HunxihXNZOFrBJWoeeguaUgnWvhQVYhqHwel7PYCXHPiHP0Zve6Xc
         NRcxs/iW4ry3irmHOcNivREAyxam+Riq1GW1o7rTfSnRkKdBsnY9rZm1QcbXWvZGoeZY
         ndMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SwTdsRNjiM8YdVdlP4p8+OGoFzPswCo7cKEZ74zoXzM=;
        b=zCoQ+f1w/TOkgvPnx0mZESiqh11P1anO6zMxNYTk3w89s/C5b4ZfKFy4nsMMPl3ksi
         wjh+hk8LD7Eb1JA3Rx3N+4rhGduqphiCeEEpZ6yj2yfEz0B/doR41OcjpJDLH6u+lBc+
         GO5lrEZ4XebopbtizEWvpTOfLWL/WYzelL7nPdRf+u0pEFItVXc7NC8DCxm8GS9cbaMQ
         kGJMExx+ygQq6XO3e8CRBPNyyTyrzQf1HRqzpKfeYyCvKcgvNIcwXS/bQtWHXIH2jgzw
         P6LLS91nxGibbOnRreilM3NqnMcxeUXeq1oUs0hIhGhg+LOE6fSZWUNhVzqwyHZgJwgt
         pQeQ==
X-Gm-Message-State: AOAM531Z6+q7OwQ0HLhcTwijQx4dFhNnzolu/r/p0QUKhi8YAGbOG5Xt
        oppP6azyZ2DAIXRmnwJLUCb7wZ2BEwVJBLeGDvc=
X-Google-Smtp-Source: ABdhPJx/vvBq4bjLJgIRW0SX+BM2abya6zBlvs2JK6tNSmFM6BG2OKoxg7DzYyjGzusUlTzwcnsn6A==
X-Received: by 2002:a17:90b:1d8c:b0:1e6:8032:a8dc with SMTP id pf12-20020a17090b1d8c00b001e68032a8dcmr31692712pjb.99.1654611643710;
        Tue, 07 Jun 2022 07:20:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x6-20020a170902ea8600b00163e5f99ee9sm12490076plb.166.2022.06.07.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 07:20:43 -0700 (PDT)
Message-ID: <629f5ebb.1c69fb81.fd664.c140@mx.google.com>
Date:   Tue, 07 Jun 2022 07:20:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-07-v5.19-rc1
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 308 runs,
 26 regressions (renesas-devel-2022-06-07-v5.19-rc1)
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

renesas/master baseline: 308 runs, 26 regressions (renesas-devel-2022-06-07=
-v5.19-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | renesas=
_defconfig            | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-07-v5.19-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-07-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4d4136360b30e8e454df0f7a2166303438081616 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629f26f392a1d144b3a39bf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/basel=
ine-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/basel=
ine-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f26f392a1d144b3a39=
bf1
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/629f4ea534a3c1d79ba39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f4ea534a3c1d79ba39=
bdd
        failing since 28 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629f4761cef9a96659a39bfb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f4761cef9a96659a39=
bfc
        failing since 28 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629f4cb24e529a01b8a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/ba=
seline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/ba=
seline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f4cb24e529a01b8a39=
bd3
        failing since 0 day (last pass: renesas-devel-2021-12-06-v5.16-rc4-=
15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/629f509a7c52ff33b2a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f509a7c52ff33b2a39=
bd3
        failing since 0 day (last pass: renesas-devel-2021-12-06-v5.16-rc4-=
15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629f5126679dcc9d50a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f5126679dcc9d50a39=
bd9
        failing since 0 day (last pass: renesas-devel-2021-12-06-v5.16-rc4-=
15-g9f95ae4ce1f1, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629f5b9965f47a3370a39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f5b9965f47a3370a39=
be9
        failing since 14 days (last pass: renesas-devel-2022-05-09-v5.18-rc=
6, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/629f2895948da637d9a39bf6

  Results:     93 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
9f2895948da637d9a39bff
        failing since 0 day (last pass: renesas-devel-2022-05-23-v5.18, fir=
st fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-06-07T10:29:32.544787  /lava-125423/1/../bin/lava-test-case
    2022-06-07T10:29:32.588333  <8>[   16.345400] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-06-07T10:29:32.588664  /lava-125423/1/../bin/lava-test-case
    2022-06-07T10:29:32.588855  <8>[   16.358017] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-06-07T10:29:32.589041  /lava-125423/1/../bin/lava-test-case
    2022-06-07T10:29:32.589221  <8>[   16.370700] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-06-07T10:29:32.589399  /lava-125423/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/629f2c56e8e8460b33a39bda

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a=
1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a=
1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/629f2c56e8e8460=
b33a39be3
        failing since 0 day (last pass: renesas-devel-2022-05-23-v5.18, fir=
st fail: renesas-devel-2022-06-06-v5.19-rc1)
        2 lines

    2022-06-07T10:44:54.914853  kern  :emerg : BUG: spinlock already unlock=
ed on CPU#2, pr/scif0/13
    2022-06-07T10:44:54.915069  kern  :emerg :  lock: sci_ports+0x0/0x4da0,=
 .magic: dead4ead, .owner: <none>/-1, .owner_cpu: -1
    2022-06-07T10:44:54.927697  <8>[   28.099082] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-07T10:44:54.927915  + set +x   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | gcc-10   | renesas=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/629f2b3fba2a9fdbd7a39bdc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774b=
1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774b=
1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/629f2b3fba2a9fd=
bd7a39be5
        failing since 0 day (last pass: renesas-devel-2022-05-23-v5.18, fir=
st fail: renesas-devel-2022-06-06-v5.19-rc1)
        2 lines

    2022-06-07T10:40:45.819614  kern  :emerg : BUG: spinlock already unlock=
ed on CPU#0, pr/scif0/13
    2022-06-07T10:40:45.819734  kern  :emerg :  lock: sci_ports+0x0/0x4da0,=
 .magic:<8>[   21.487091] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | renesas=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/629f2e02d0a368c8b5a39c0d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/629f2e02d0a368c=
8b5a39c14
        failing since 0 day (last pass: renesas-devel-2022-05-23-v5.18, fir=
st fail: renesas-devel-2022-06-06-v5.19-rc1)
        2 lines

    2022-06-07T10:52:44.372576  kern  :emerg : BUG: spinlock wrong owner on=
 CPU#1, pr/scif0/13
    2022-06-07T10:52:44.372829  kern  :emerg :  lock: sci_ports+0x0/0x4da0,=
 .magic: dead4ead, .owner: swapper/0/<8>[   18.337082] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629f27152e445dc5b7a39bfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-br=
oonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-br=
oonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f27152e445dc5b7a39=
bff
        failing since 0 day (last pass: renesas-devel-2022-05-23-v5.18, fir=
st fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629f2b12a40e69ec65a39c57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-br=
oonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-br=
oonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f2b12a40e69ec65a39=
c58
        new failure (last pass: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629f297a10a4864ef5a39bfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun=
8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun=
8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f297a10a4864ef5a39=
bfd
        failing since 0 day (last pass: renesas-devel-2022-05-23-v5.18, fir=
st fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629f2cebade0b6e5fba39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/basel=
ine-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/basel=
ine-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f2cebade0b6e5fba39=
bda
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629f297e10a4864ef5a39c0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun=
8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun=
8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f297e10a4864ef5a39=
c0b
        failing since 0 day (last pass: renesas-devel-2022-05-23-v5.18, fir=
st fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/629f304c1678db73efa39c55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline=
-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline=
-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f304c1678db73efa39=
c56
        failing since 0 day (last pass: renesas-devel-2022-05-17-v5.18-rc7,=
 first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629f2afaa40e69ec65a39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-=
h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-=
h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f2afaa40e69ec65a39=
bd7
        failing since 0 day (last pass: renesas-devel-2022-05-17-v5.18-rc7,=
 first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/629f2a37e718ac7896a39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline=
-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline=
-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f2a37e718ac7896a39=
bd8
        failing since 0 day (last pass: renesas-devel-2022-05-17-v5.18-rc7,=
 first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629f26a151bbc3100ea39bf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-=
h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-=
h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f26a151bbc3100ea39=
bf9
        failing since 0 day (last pass: renesas-devel-2022-05-17-v5.18-rc7,=
 first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/629f4ffa600f1740c6a39bf7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-te=
gra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-te=
gra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f4ffa600f1740c6a39=
bf8
        failing since 14 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629f5455563fb3455aa39beb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/base=
line-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/base=
line-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f5455563fb3455aa39=
bec
        failing since 0 day (last pass: renesas-devel-2022-05-23-v5.18, fir=
st fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/629f569413ae0f5597a39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baselin=
e-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f569413ae0f5597a39=
be2
        failing since 0 day (last pass: renesas-devel-2022-05-17-v5.18-rc7,=
 first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629f5809d69038ea4ea39bf1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f5809d69038ea4ea39=
bf2
        failing since 14 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629f5a4e9c2d055869a39bd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f5a4e9c2d055869a39=
bd5
        failing since 14 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629f55243a7dd3d7aaa39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra=
124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-07-v5.19-rc1/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra=
124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629f55243a7dd3d7aaa39=
be0
        new failure (last pass: renesas-devel-2022-06-06-v5.19-rc1) =

 =20
