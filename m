Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FED9642C7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 17:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbiLEQEz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 11:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231947AbiLEQEx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 11:04:53 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9011C426
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 08:04:52 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d3so11225416plr.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Dec 2022 08:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=//RKYA03neePVkdh13bVwKzY2kPqldJVWtCUbPNlMbQ=;
        b=0VNM2Bk3Ah5Jn/Au+ZFRABefpJfKFZL9u8EQffzUdjGoDB1sOaJ3JHc2nB1pnl/CPW
         RUsxHnN8EqPoSsByFl3FrgdlfGdTVnqeh81Khd6Y3XKQgediHlCJnEV9HF0UOiTP2/Vz
         XE2sASyVQoE/oc/Fev3LvrubLaw/V9mPiW56pc3lP7OKn60u9suEyTMLBaa/Qk2m0j/y
         bsk3INMwq5KaPb3W1cyjovmlw330xEfzALEGyDxl+vbBp624bbgmobHUpwIYoAprN80U
         civYybXSYS8VX/KcYIq1V6QdTCnN2M/JvOzdu4Q+qGhHfIG7M+3TQZwqawRlhGECpWrs
         jKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//RKYA03neePVkdh13bVwKzY2kPqldJVWtCUbPNlMbQ=;
        b=UoaTga6LNqyQdQTvDpVgRLHFsNPSrfZUl3BX5k3DszXiRPCfEsabsUP2DR1uzFmj6Q
         c6JS8yS9Q27W+myAybx6COBWCJkeYvqIfgZY2DxasgpjEuwCjpWooMq36g7XRm68dp+W
         gghlVwZSwGXBnKn8Jfe5H4xoKanUwjcfHZysPpow5PMSWnzsAyf+JQtqS62Wo01zNWJw
         zOlg4e+5KTzrC3p3pZSBMZgdz4AhL+do1iJ9OT3pwltVCR3e6gn2zu8rYkVEdNJn253/
         XOE1hbxuYJpy+cS2eWsMhtg+tRChdLehlA0U2z/55dwwX91cDDj4CBxgTqiaQXasA2KR
         j1bA==
X-Gm-Message-State: ANoB5pl8I4U4l+KPh8mkx27w62XJsAMF+QOY3ckyBZOVGXD7wGfvL3IA
        qpNsxdL+Anb/Q0boa5OUr9XX6UeoimSd2DuV4IpjvA==
X-Google-Smtp-Source: AA0mqf6Q96sdZZPW/QnerVy7EXuZ1qWCmbLFpZdiHXbm33M+YA+OO0NsFAW1+C5iwQbHXyIcp35gJQ==
X-Received: by 2002:a17:902:f78c:b0:186:8c13:50b3 with SMTP id q12-20020a170902f78c00b001868c1350b3mr65166864pln.153.1670256291758;
        Mon, 05 Dec 2022 08:04:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u9-20020a170903124900b00172f6726d8esm10885195plh.277.2022.12.05.08.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:04:51 -0800 (PST)
Message-ID: <638e16a3.170a0220.2cdc2.31f2@mx.google.com>
Date:   Mon, 05 Dec 2022 08:04:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: v6.1-rc8-929-g112502470f50
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 153 runs,
 7 regressions (v6.1-rc8-929-g112502470f50)
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

renesas/master baseline-nfs: 153 runs, 7 regressions (v6.1-rc8-929-g1125024=
70f50)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
videodec           | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
                   | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | gcc-10   | renesas_de=
fconfig            | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-10   | defconfig+=
debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v6.1=
-rc8-929-g112502470f50/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: v6.1-rc8-929-g112502470f50
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      112502470f50792e9df5df75de0090fbeb7b8500 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/638de09cc5fc78a4bf2abd6e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221125.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/638de09cc5fc78a4b=
f2abd6f
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/638de2984a13548b3c2abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/b=
aseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/b=
aseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221125.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/638de2984a13548b3=
c2abcfb
        failing since 69 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/638de4261b70581dfb2abd24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b-a31=
1d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b-a31=
1d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221125.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/638de4261b70581df=
b2abd25
        failing since 77 days (last pass: renesas-devel-2022-09-05-v6.0-rc4=
, first fail: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/638de98b4056c480ca2abd07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221125.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/638de98b4056c480c=
a2abd08
        new failure (last pass: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/638ddfbec39a365a582abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/b=
aseline-nfs-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/b=
aseline-nfs-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221125.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/638ddfbec39a365a5=
82abcfb
        new failure (last pass: renesas-devel-2022-11-01-v6.1-rc3) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | gcc-10   | renesas_de=
fconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/638de19fc395ab4bd22abd07

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hi=
hope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hi=
hope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221125.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/638de19fc39=
5ab4bd22abd0e
        new failure (last pass: renesas-devel-2022-11-21-v6.1-rc6)
        1 lines

    2022-12-05T12:18:16.222066  kern  :emerg : Disabling IRQ #35
    2022-12-05T12:18:16.621965  <8>[  108.441815] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/638de5bc4f9ce388da2abd1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.1-rc8-929-g1=
12502470f50/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221125.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/638de5bc4f9ce388d=
a2abd1d
        new failure (last pass: renesas-devel-2022-11-17-v6.1-rc5) =

 =20
