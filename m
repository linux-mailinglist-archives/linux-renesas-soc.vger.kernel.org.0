Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612186B581F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 04:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjCKDyS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 22:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjCKDyR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 22:54:17 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DA2140DDB
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 19:54:16 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id p6so7724753plf.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 19:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678506855;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1zEmORzEFpHrXlSOk+zIzUPe786pGJZ6NONLQSdQbcA=;
        b=M9SEcajpOZOeL0/lZitABQy3Ib/rtPWdxjIQqiGoJX4TkfHHMGJzBEbi/H2wMM9uH4
         G5me666LNWNqhGQdLnwoUymGuT3Rfx98UA5UA/FJd1dTpNAuGNPZYB0uQGGDXOqvp3Oj
         t1cDSnVOUU51zDNENwu5hdz4jOv1PExfIFvf6bu6qHQRx6aTnQDMU3q/7WEte2VEv5CB
         JPOiqjWCJ3z3NF2xXj7SjGwOgBdyM++zpx0QArsAI6A3Av4hIZCosfanhh7S3LtyMMfE
         OvZuAZcO19VGmB1ILr8joHXhGj9ErH/w6bFIEDwAFks6EzrZcREOcgui4G8Yitnyb3lU
         sx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678506855;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zEmORzEFpHrXlSOk+zIzUPe786pGJZ6NONLQSdQbcA=;
        b=rp+NY1B6W27eGF96l5tIC3WJhmntKPJpy39CKVvN/Yg4J20rdhe8jayjrUqGxqGinC
         yfj+XpgKa4HboctyofLL8igUZNPnwVxcq4Ii6gxiYhzieKsK1ZIF9xiPvBKRa2c/+iLO
         rUNp1FZCCD944cls0x6wodxnHQUbHTI+6dM/WUkU7H13ODPyBkF2oNGEzu3IS/8nIB8E
         Y1OhERceQEKg5EE511ZNMV8bpOYy0+DSjAk3n4dRZ1AD/4YJXL5CH9wZyPDVVSdmgtp9
         wjzDpildkJN1fjLjhKfcICsMfZgtTuNcmKWBg3zWGMIB1UAZfFtjUtBazhlvBQPuXcbF
         1otQ==
X-Gm-Message-State: AO0yUKUW0Sf1QuP3USxKvKAL6DmGqEHCMDKwCVoLzI53RvQgb4AHtdik
        AScO5hqGrS7t43BBjFYdZS7RgU7CxymVuaLrnxL3anVQ
X-Google-Smtp-Source: AK7set/eR+XMTkoxM5sa0EGjFojftKyOfSBlv96pBqLntnsMhgoJQ9xAPryhSCmfiO1xNFpAWIAb+w==
X-Received: by 2002:a17:903:258b:b0:19a:973b:b615 with SMTP id jb11-20020a170903258b00b0019a973bb615mr24255876plb.36.1678506855387;
        Fri, 10 Mar 2023 19:54:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id la7-20020a170902fa0700b0019f0eb301f6sm648700plb.241.2023.03.10.19.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 19:54:15 -0800 (PST)
Message-ID: <640bfb67.170a0220.ffc3f.1d43@mx.google.com>
Date:   Fri, 10 Mar 2023 19:54:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-10-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 122 runs,
 7 regressions (renesas-devel-2023-03-10-v6.3-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 122 runs, 7 regressions (renesas-devel-2023-03=
-10-v6.3-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+crypto             | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-10-v6.3-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-10-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c520d1376b59c054cec31c3ca09f4df3eddd5296 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640bd00f84536b32278c877c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-nfs-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-nfs-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bd00f84536b322=
78c877d
        failing since 3 days (last pass: renesas-devel-2023-02-20-v6.2, fir=
st fail: renesas-devel-2023-03-07-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/640bd0c281d9b4820d8c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bd0c281d9b4820=
d8c8659
        failing since 3 days (last pass: renesas-devel-2023-02-20-v6.2, fir=
st fail: renesas-devel-2023-03-07-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/640bd5d52f3bf2e3f28c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-k=
ontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-k=
ontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bd5d52f3bf2e3f=
28c863f
        failing since 3 days (last pass: renesas-devel-2023-02-21-v6.2, fir=
st fail: renesas-devel-2023-03-07-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/640bc6dfdfa97cd9eb8c8672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-m=
eson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-m=
eson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bc6dfdfa97cd9e=
b8c8673
        new failure (last pass: renesas-devel-2023-03-07-v6.3-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/640bc837beed783fe78c8642

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-10-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/640bc837beed783fe78c8696
        failing since 4 days (last pass: renesas-devel-2023-02-20-v6.2, fir=
st fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-11T00:15:24.546164  /lava-9548602/1/../bin/lava-test-case

    2023-03-11T00:15:24.579315  [   38.020348] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/640bc838beed783fe78c86ee
        failing since 4 days (last pass: renesas-devel-2023-02-20-v6.2, fir=
st fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-11T00:15:18.769923  /lava-9548602/1/../bin/lava-test-case

    2023-03-11T00:15:18.804263  [   32.245809] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/640bc838beed783fe78c86ef
        failing since 4 days (last pass: renesas-devel-2023-02-20-v6.2, fir=
st fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-11T00:15:17.691183  /lava-9548602/1/../bin/lava-test-case

    2023-03-11T00:15:17.722628  [   31.163971] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =20
