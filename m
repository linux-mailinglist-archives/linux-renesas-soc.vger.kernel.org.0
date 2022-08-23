Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC12259DEE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 14:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349653AbiHWLRv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Aug 2022 07:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357762AbiHWLQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 07:16:37 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC25BD1C5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2022 02:20:13 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id x19so12280980plc.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2022 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=RIcASgJjDvj1LrjmGPm+bWHwI1zbrjMdZ01Q6MGSuVY=;
        b=m3A/+jEXy2sAyW7TF2kCX59xLxvznOme9oUOaDAYx+jB5ffVMDhSXyAkX8oKCoO4YZ
         u0/s49EITA0G8Lq7X+XdFe7gpZNpzk2v1jsA+Ne0x9HIDE7gDmX2CFuUvlihNITGkh3w
         a2jOGOaLmxCORgXOZxDPiei/yDo7z1OxWyBYrcLrd7VBIhDXvmQaq79JlpO0F9bnfoNm
         FPgrIBfOOawJ2GKjatNSvCMBBjgFQXwfNSEDgs2cxyaW+6GYTn7nFaxidPH0wPJTAPDN
         1/hTjmVPPndYAaDkMLujPTxgMyeQ8gPzQbQXwJVSAMZrNMMavN4ep26lNKR/Di+1IgiE
         QwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=RIcASgJjDvj1LrjmGPm+bWHwI1zbrjMdZ01Q6MGSuVY=;
        b=RZBdzzuxyj94mhN0FVFD9Vu5+ifGvofSom7lC7uSHlAn+S7pEvvRRgjgnzyx1xZhVy
         eUvSBFsBLLr6eCE5T6qRiZNQ4R+r3rU4DBLghu+P8JeFlAXLCnvg7W9a16zlUZTf17oc
         ef8zr3T6kMiDfPzi3Irud6LOj4giG7jpkJRKV43RyA7fJk7Wco3QASDSSa6HOd6zxf3i
         5UAi+Fxdhc7Yy4qlUWuG4rncFop/wuTgH1vYowKNUcuH0qcceRZcHBNdnXeZJ3omWzGB
         E6rClohhtJ4/E8+GR7sAWliV7M67Q6bfe5cgAOCHEbNDmE59alnkn21FWSp1Jo4ga2iN
         PXUg==
X-Gm-Message-State: ACgBeo2HlEgJwFNe+Cig2P9/03BL3t6eqsUrUoV7S+2yIsZKP7ZCzRO6
        lt6nRSrcEZFl8snC4dQi51U/UoQChNTAtZYy
X-Google-Smtp-Source: AA6agR4+Woq4CK+PHify4yb78Be5+q17i1kjRs0MKg5ChQs53/9P89ZfIiTxlU8kjGd3Ur3NWCnMdQ==
X-Received: by 2002:a17:90b:4b4d:b0:1fb:3ea7:105 with SMTP id mi13-20020a17090b4b4d00b001fb3ea70105mr2382202pjb.108.1661246411951;
        Tue, 23 Aug 2022 02:20:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902714500b0016a7b9558f7sm9836500plm.136.2022.08.23.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 02:20:09 -0700 (PDT)
Message-ID: <63049bc9.170a0220.aa124.1cf1@mx.google.com>
Date:   Tue, 23 Aug 2022 02:20:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-08-22-v6.0-rc1
Subject: renesas/next baseline-nfs: 96 runs,
 9 regressions (renesas-next-2022-08-22-v6.0-rc1)
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

renesas/next baseline-nfs: 96 runs, 9 regressions (renesas-next-2022-08-22-=
v6.0-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
                   | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto             | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig =
                   | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto             | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-08-22-v6.0-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-08-22-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      64f8982ca06974904942c8adfa51efd785044107 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630465375d9542bab7355658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630465375d9542bab=
7355659
        new failure (last pass: renesas-next-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/630466a1b30ee3adc535564c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630466a1b30ee3adc=
535564d
        new failure (last pass: renesas-next-2022-07-05-v5.19-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63046808b213771bb335567c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63046808b213771bb=
335567d
        failing since 7 days (last pass: renesas-next-2022-07-05-v5.19-rc1,=
 first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6304621661e3ca5a98355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6304621661e3ca5a9=
8355643
        failing since 7 days (last pass: renesas-next-2021-11-30-v5.16-rc1-=
14-g0940300f8e1d, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63046538c3ea9f05b7355665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63046538c3ea9f05b=
7355666
        failing since 7 days (last pass: renesas-next-2021-11-30-v5.16-rc1-=
14-g0940300f8e1d, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/63046587b442989baa355668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-gxm-=
khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-gxm-=
khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63046587b442989ba=
a355669
        new failure (last pass: renesas-next-2021-11-30-v5.16-rc1-14-g09403=
00f8e1d) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6304681d66adecf9ed355680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6304681d66adecf9e=
d355681
        failing since 7 days (last pass: renesas-next-2021-11-30-v5.16-rc1-=
14-g0940300f8e1d, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63046531c3ea9f05b735564d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63046531c3ea9f05b=
735564e
        new failure (last pass: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630467260ec6dd0178355674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-22-v6.0-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220812.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/630467260ec6dd017=
8355675
        new failure (last pass: renesas-next-2022-08-16-v6.0-rc1) =

 =20
