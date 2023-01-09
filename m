Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1517A662AF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jan 2023 17:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjAIQOj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Jan 2023 11:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbjAIQOh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 11:14:37 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924261C920
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jan 2023 08:14:36 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d3so10004666plr.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Jan 2023 08:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w4PnZLA8FOXmkrVz5/edq8akq50OjRZuWCLXsoZIrFg=;
        b=Aif0mzyHnn1XCiIV7WJd9ISNt4WOSvMvlvZXwqdF6xqCgJeaEyxSDPutlOe4HreNnK
         XWXc08Y1dq9sYykutjHkZv/eeNUzncT1BSLFnjpFsuFIPZNVIVlMoUbUC9NjCggZLPAX
         E7fHEi/buenhLAFV7AW9dBY/jlh7NlULILSCj/HxmK+MU+u+FZyVJW6fGoIr2BC75Li8
         za+GCY1F0Jt7Rw4uiy6d3ZY6hFSX8w7bEKEi/d46DGZcwWSzbbYKP8L0FUm7i6rXy6UD
         5ENhxb/EHMq6eXW90qScmVyfuvbpBExuGNPq05CmZHi8XFlEzrUuyPiJPckUlDDT2Nz3
         3+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4PnZLA8FOXmkrVz5/edq8akq50OjRZuWCLXsoZIrFg=;
        b=GyrqcxHj5O++rME3tFKrP0w+vB7s3iZe7iSvjJGonut6d6RhQM/vqjqfldGHK+GeoL
         fYjGHWFcL43Gv5VSYGDaMj9YBqBA/AfrSx+0+cc48UZ0l0c1/8z2yGMRznH2wt93GSw2
         GuafGIMaEqdcBw9iK2VOTvBjeOun2nGr5LqK0tqhxW/xJcEh6gno1jfN24Hqo47XtQZK
         f519XGSXi8uiTqxhRhlUUy0NHGTwhY+JaIBub53+ai2GTbaNHdp8gWcSuB/9j+1Kq+Rr
         IgzTLVitUr7yCQikhw8YjHlp2XtPwoICOypopu2JqPXGaI1l/HSuLdznXUJJtku1uyzq
         RFQw==
X-Gm-Message-State: AFqh2krEwM35NmsLJ51SrOeUTp68v8rz1KBqoDlUdSHt/gL6X9SNW7Oc
        iIppziBBzrFtzArxzSNFwg2sfE8i7rGgrWwvGZ/8Vg==
X-Google-Smtp-Source: AMrXdXvF0efxxlCRy3QFPK5xhQGIgHyh929eUUBLvlCuwxZ/qUxEUsvAMx7DB5l2HDArKWForXK08Q==
X-Received: by 2002:a17:902:bf01:b0:192:b6af:415 with SMTP id bi1-20020a170902bf0100b00192b6af0415mr33152503plb.14.1673280875747;
        Mon, 09 Jan 2023 08:14:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q11-20020a170902eb8b00b00189c93ce5easm6296179plg.166.2023.01.09.08.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 08:14:35 -0800 (PST)
Message-ID: <63bc3d6b.170a0220.311a2.9912@mx.google.com>
Date:   Mon, 09 Jan 2023 08:14:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-01-09-v6.2-rc3
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 348 runs,
 9 regressions (renesas-devel-2023-01-09-v6.2-rc3)
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

renesas/master baseline: 348 runs, 9 regressions (renesas-devel-2023-01-09-=
v6.2-rc3)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g              | regressions
-----------------------------+--------+---------------+----------+---------=
---------------+------------
imx6dl-udoo                  | arm    | lab-broonie   | gcc-10   | imx_v6_v=
7_defconfig    | 1          =

imx6q-udoo                   | arm    | lab-broonie   | gcc-10   | imx_v6_v=
7_defconfig    | 1          =

imx6sx-sdb                   | arm    | lab-nxp       | gcc-10   | imx_v6_v=
7_defconfig    | 1          =

imx7ulp-evk                  | arm    | lab-nxp       | gcc-10   | imx_v6_v=
7_defconfig    | 1          =

juno-uboot                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto       | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig     | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug        | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10   | x86_64_d=
efconfig+debug | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | renesas_=
defconfig      | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-09-v6.2-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-09-v6.2-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      84545c94403b4b5a90561c9c97c2c2c00091cff1 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g              | regressions
-----------------------------+--------+---------------+----------+---------=
---------------+------------
imx6dl-udoo                  | arm    | lab-broonie   | gcc-10   | imx_v6_v=
7_defconfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc060cddbaa178434eee32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bc060cddbaa178434ee=
e33
        failing since 119 days (last pass: renesas-devel-2022-07-05-v5.19-r=
c5, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g              | regressions
-----------------------------+--------+---------------+----------+---------=
---------------+------------
imx6q-udoo                   | arm    | lab-broonie   | gcc-10   | imx_v6_v=
7_defconfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc05aa5cb2dbb7d84eee2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6=
q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bc05aa5cb2dbb7d84ee=
e2c
        failing since 119 days (last pass: renesas-devel-2022-09-02-v6.0-rc=
3, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g              | regressions
-----------------------------+--------+---------------+----------+---------=
---------------+------------
imx6sx-sdb                   | arm    | lab-nxp       | gcc-10   | imx_v6_v=
7_defconfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc05a3511f0ed4844eee19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-s=
db.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bc05a3511f0ed4844ee=
e1a
        failing since 119 days (last pass: renesas-devel-2022-09-02-v6.0-rc=
3, first fail: v6.0-rc5-843-g94f27a9ea269) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g              | regressions
-----------------------------+--------+---------------+----------+---------=
---------------+------------
imx7ulp-evk                  | arm    | lab-nxp       | gcc-10   | imx_v6_v=
7_defconfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc05bee5e793df9f4eee85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bc05bee5e793df9f4ee=
e86
        failing since 132 days (last pass: renesas-devel-2022-07-22-v5.19-r=
c7, first fail: renesas-devel-2022-08-30-v6.0-rc3) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g              | regressions
-----------------------------+--------+---------------+----------+---------=
---------------+------------
juno-uboot                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto       | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc03721d2e85febc4eee3a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-=
uboot.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-=
uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bc03721d2e85febc4eee3f
        new failure (last pass: renesas-devel-2022-12-12-v6.1)

    2023-01-09T12:07:08.449895  <8>[   29.223981] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 75704_1.5.2.4.1>
    2023-01-09T12:07:08.559075  / # #
    2023-01-09T12:07:08.662132  export SHELL=3D/bin/sh
    2023-01-09T12:07:08.662904  #
    2023-01-09T12:07:08.764869  / # export SHELL=3D/bin/sh. /lava-75704/env=
ironment
    2023-01-09T12:07:08.765735  =

    2023-01-09T12:07:08.867794  / # . /lava-75704/environment/lava-75704/bi=
n/lava-test-runner /lava-75704/1
    2023-01-09T12:07:08.869215  =

    2023-01-09T12:07:08.881522  / # /lava-75704/bin/lava-test-runner /lava-=
75704/1
    2023-01-09T12:07:08.913602  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (41 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g              | regressions
-----------------------------+--------+---------------+----------+---------=
---------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc04e15bc9523a104eee1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bc04e15bc9523a104ee=
e1d
        failing since 83 days (last pass: renesas-devel-2022-10-04-v6.0, fi=
rst fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g              | regressions
-----------------------------+--------+---------------+----------+---------=
---------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug        | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc08e150be8670ae4eee56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bc08e150be8670ae4ee=
e57
        new failure (last pass: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g              | regressions
-----------------------------+--------+---------------+----------+---------=
---------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10   | x86_64_d=
efconfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc05292aa57f0b964eee19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baselin=
e-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baselin=
e-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bc05292aa57f0b964ee=
e1a
        failing since 14 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g              | regressions
-----------------------------+--------+---------------+----------+---------=
---------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | renesas_=
defconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/63bc0f0f993751a21f4eef04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1=
-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-09-v6.2-rc3/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1=
-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bc0f0f993751a21f4ee=
f05
        new failure (last pass: renesas-devel-2023-01-02-v6.2-rc2) =

 =20
