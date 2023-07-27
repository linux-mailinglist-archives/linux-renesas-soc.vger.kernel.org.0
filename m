Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1938765A5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 19:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbjG0Rdd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 13:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjG0Rdc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 13:33:32 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78972D68
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 10:33:30 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b9ecf0cb4cso8476345ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 10:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690479209; x=1691084009;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=THhBtK272vS8q3XGuI13CfTilYC9pgFyXvQhtktvkZ4=;
        b=Omfj+9vYUOL4KrKqRH90ypYcYcBIpWrJfqtEvcbdqh6lcwPnfLY2vlvVu/bqMtqc8Z
         qhRcG81gyu8aILA0yauxgqh3jmcMGUjHdfzNn0WKq6sJtow8RWqvNx++sy6oRhI4VqYK
         UYb90VpUuzje9v69SZFgkBQyZ6rMM565ONQRi2Vh8720ypopmgWDelQl5L71MPTznemX
         b5+iMnqA7R+ez8znRZO6QTH1E+jTukY5gGcNwoZYvz+m4OLRNQCrffqeIPMSyu0OZTOY
         MpdU3mWzr6cSnMag2gSov4xMU9xekCPy2vCSW0a/ul9O1Kx8ArDIYsXE0zlD7hFjlcnw
         EBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690479209; x=1691084009;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THhBtK272vS8q3XGuI13CfTilYC9pgFyXvQhtktvkZ4=;
        b=CGvdr+XCiPrVoxKz/dhIuYsopAK5s5ggav6QyhOsDRHPMl9qqori12lWMe9KxXaLlO
         32LqQb4ab+cardBO+5eIINQ9Gqbr9M+spt2gMn2DYE57xbcJ00MQ3aB3UxLEKSdTDjR7
         0/nCPlBtWRM5FKQeI71yToZIpnIYDc2P3m7mzs1hoPCo/qI4gulHvKLxkPuu38YlOo9F
         Bi/CFFZ/gOgcfnKlNhMJTe6aMKt6mJn86SWo2l7Kp+TUmWlciFKjMGqUYpUfyin/Krwp
         6aVyUf91q6g1KqJyfWud/2QOlAjzeBEU5rhR+fYFcl9+NGL69pF7DEm6PcS8dw3S7BZe
         8VKg==
X-Gm-Message-State: ABy/qLbggdEJfjAyA0ugpk/ymwwWcSDCvoRyQ23GoNyTAP4CiI64y029
        ms+tCSWjbXuRO66yMhNBpz8dmiaIdTPEMLEcVY9giA==
X-Google-Smtp-Source: APBJJlGmGvoj9PvO9LMEeAu43jNNxy7pXKcYi9qiv4vrhprIxyWOxvjRITTiGhuD3O4Bnu0+se0v5A==
X-Received: by 2002:a17:903:120d:b0:1bb:833c:6ba8 with SMTP id l13-20020a170903120d00b001bb833c6ba8mr5521485plh.56.1690479209579;
        Thu, 27 Jul 2023 10:33:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902748600b001b392bf9192sm1910352pll.145.2023.07.27.10.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:33:28 -0700 (PDT)
Message-ID: <64c2aa68.170a0220.eb4e8.3e6e@mx.google.com>
Date:   Thu, 27 Jul 2023 10:33:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2023-07-27-v6.5-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 50 runs,
 6 regressions (renesas-next-2023-07-27-v6.5-rc1)
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

renesas/next baseline: 50 runs, 6 regressions (renesas-next-2023-07-27-v6.5=
-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =

r8a77960-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-07-27-v6.5-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-07-27-v6.5-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      13512fa6af4abcdd8645daabd4ad22576694c7a5 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
fsl-ls2088a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c2791afcd17e54ae8acef7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c2791afcd17e54ae8acefa
        failing since 13 days (last pass: renesas-next-2022-08-29-v6.0-rc1,=
 first fail: renesas-next-2023-07-10-v6.5-rc1)

    2023-07-27T14:02:56.660146  + [   15.954575] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1239049_1.5.2.4.1>
    2023-07-27T14:02:56.660445  set +x
    2023-07-27T14:02:56.765743  =

    2023-07-27T14:02:56.867296  / # #export SHELL=3D/bin/sh
    2023-07-27T14:02:56.867751  =

    2023-07-27T14:02:56.968921  / # export SHELL=3D/bin/sh. /lava-1239049/e=
nvironment
    2023-07-27T14:02:56.969520  =

    2023-07-27T14:02:57.070818  / # . /lava-1239049/environment/lava-123904=
9/bin/lava-test-runner /lava-1239049/1
    2023-07-27T14:02:57.071928  =

    2023-07-27T14:02:57.075654  / # /lava-1239049/bin/lava-test-runner /lav=
a-1239049/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a77960-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c278b84183ee67a38ace33

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c278b84183ee67a38ace38
        new failure (last pass: renesas-next-2023-07-11-v6.5-rc1)

    2023-07-27T14:02:46.806850  / # #

    2023-07-27T14:02:46.908983  export SHELL=3D/bin/sh

    2023-07-27T14:02:46.909681  #

    2023-07-27T14:02:47.011071  / # export SHELL=3D/bin/sh. /lava-11151520/=
environment

    2023-07-27T14:02:47.011769  =


    2023-07-27T14:02:47.113185  / # . /lava-11151520/environment/lava-11151=
520/bin/lava-test-runner /lava-11151520/1

    2023-07-27T14:02:47.114263  =


    2023-07-27T14:02:47.131301  / # /lava-11151520/bin/lava-test-runner /la=
va-11151520/1

    2023-07-27T14:02:47.180397  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T14:02:47.180926  + cd /lava-111515<8>[   19.149148] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11151520_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
r8a779m1-ulcb                | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c278b64183ee67a38ace25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c278b64183ee67a38ace2a
        new failure (last pass: renesas-next-2023-07-11-v6.5-rc1)

    2023-07-27T14:01:22.322002  / # #

    2023-07-27T14:01:23.401122  export SHELL=3D/bin/sh

    2023-07-27T14:01:23.402891  #

    2023-07-27T14:01:24.892560  / # export SHELL=3D/bin/sh. /lava-11151508/=
environment

    2023-07-27T14:01:24.894333  =


    2023-07-27T14:01:27.615365  / # . /lava-11151508/environment/lava-11151=
508/bin/lava-test-runner /lava-11151508/1

    2023-07-27T14:01:27.617497  =


    2023-07-27T14:01:27.630142  / # /lava-11151508/bin/lava-test-runner /la=
va-11151508/1

    2023-07-27T14:01:27.689174  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T14:01:27.689675  + cd /lava-111515<8>[   28.523822] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11151508_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c27992615c5257298ace29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c27992615c5257298ac=
e2a
        failing since 16 days (last pass: renesas-next-2023-06-06-v6.4-rc1,=
 first fail: renesas-next-2023-07-10-v6.5-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c278f02fbf4f0bbf8ace63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64c278f02fbf4f0bbf8ac=
e64
        failing since 51 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-06-06-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/64c278b60f884b12598ace5b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-07-27-v6.5-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pin=
e-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64c278b60f884b12598ace60
        new failure (last pass: renesas-next-2023-07-11-v6.5-rc1)

    2023-07-27T14:02:58.484112  / # #

    2023-07-27T14:02:58.586489  export SHELL=3D/bin/sh

    2023-07-27T14:02:58.587253  #

    2023-07-27T14:02:58.688697  / # export SHELL=3D/bin/sh. /lava-11151510/=
environment

    2023-07-27T14:02:58.689514  =


    2023-07-27T14:02:58.790963  / # . /lava-11151510/environment/lava-11151=
510/bin/lava-test-runner /lava-11151510/1

    2023-07-27T14:02:58.792163  =


    2023-07-27T14:02:58.808656  / # /lava-11151510/bin/lava-test-runner /la=
va-11151510/1

    2023-07-27T14:02:58.876780  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-27T14:02:58.877330  + cd /lava-11151510/1/tests/1_boot<8>[   17=
.676005] <LAVA_SIGNAL_STARTRUN 1_bootrr 11151510_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
