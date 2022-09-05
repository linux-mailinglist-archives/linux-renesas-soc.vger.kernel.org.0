Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14ED05AD4B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Sep 2022 16:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237207AbiIEOXK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Sep 2022 10:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235407AbiIEOXI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2022 10:23:08 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC5E5A8B7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Sep 2022 07:23:04 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id x1so4303183plv.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Sep 2022 07:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=AR5vCRgHoF38dXKpKPSNOa86pEY/sTMqEl/yBABYxnc=;
        b=15dYos3xdBjxEsaNqmaJi3+t3k1d7SEaYykZKs4TduFpNM1kHdFpeo32B4JYfGtpz5
         +luntILqbVvdIbOBfVgd7hrEUGRIIeHka0Rx7L7DgpQJT9ZJzVMw1cv6nDYpLIGoAyu/
         l8vY6e+J6UYGGK4ujX/Ql5JNOVClax/FauqSE+TxV1NhE3X9zMDwsSoFVqV0BrXBgK6i
         hTnKKrFwvWbBkX3+86RVuan6KRWAlfnNoVH5zaKYgWbhbG87p6Y+ICx8ViLUkpa72qFl
         rAlKF7vXpzbsyxCcKEyaRTODaTpEY9jiCg7hhQklAnhS/lwlp50aJyyQWjYKM1MDgCHo
         BqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=AR5vCRgHoF38dXKpKPSNOa86pEY/sTMqEl/yBABYxnc=;
        b=no49Orm0YwNMtJpmhp47Cs/5teH6bg04BNcmbptKJ4s8azBbeaXpN5R+aR8PUcxByI
         TLPkeXVXmgDch113QxI9sZgUCIT7DYFJZLPT4qE7vu7wIAenRb7UQhDQ3iNgoAC+BPsT
         Mdjo1a0btAUiL1FHSqA1SLNgWceRfOqUCEFzqbAFKpekCspbP5rQzo4hCW497Q1mRH4W
         p4xH0jS6WCMnYH9b0y6TbUd/ls0Af/ZO97tao9UsgNQOdFwsM2Hm1qLXd0qmYr/IbJWO
         iPmlu1E6AtA+u9GsA+Na2O+r00yQ9lvwImLXyVODNPQUCLLX1IlrliYWq9IXGWL/q8lg
         9SUA==
X-Gm-Message-State: ACgBeo1WBEGiQiPgYQgBvNvE/pghGW/q8g9bwXl+OoFWEjeAE33IJZKb
        ms4NhrYgSZ6x+Q6E080L2ksA/3DyMeAHTh6z2r0=
X-Google-Smtp-Source: AA6agR7PwbHm1J9GRe3CiecW5Qnr0DiU1BVqTpakGUe0uj3t6ScYCilnL6y58kkuQEgZwekuJnvCzA==
X-Received: by 2002:a17:90b:4a09:b0:1fd:d4be:fed4 with SMTP id kk9-20020a17090b4a0900b001fdd4befed4mr20298671pjb.6.1662387783352;
        Mon, 05 Sep 2022 07:23:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090a630b00b001fd7fe7d369sm6781852pjj.54.2022.09.05.07.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 07:23:03 -0700 (PDT)
Message-ID: <63160647.170a0220.a20bc.99a6@mx.google.com>
Date:   Mon, 05 Sep 2022 07:23:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-09-05-v6.0-rc4
Subject: renesas/master baseline-nfs: 80 runs,
 9 regressions (renesas-devel-2022-09-05-v6.0-rc4)
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

renesas/master baseline-nfs: 80 runs, 9 regressions (renesas-devel-2022-09-=
05-v6.0-rc4)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig            | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | renesas_d=
efconfig            | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-09-05-v6.0-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-09-05-v6.0-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ce5bd4a14031a91fb83af3882c226513c60d5bf1 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6315cf57a225b5c32535565f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6315cf57a225b5c32=
5355660
        new failure (last pass: renesas-devel-2022-09-02-v6.0-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6315d303269a9fedcf355658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-m=
eson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-m=
eson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6315d303269a9fedc=
f355659
        failing since 2 days (last pass: renesas-devel-2022-08-30-v6.0-rc3,=
 first fail: renesas-devel-2022-09-02-v6.0-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6315cf6b74ff54722b3556bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6315cf6b74ff54722=
b3556bd
        failing since 24 days (last pass: renesas-devel-2021-12-14-v5.16-rc=
5, first fail: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6315d048d12459313835582f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
xm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
xm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6315d048d12459313=
8355830
        failing since 24 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6315d0b86dfd1b47a03556aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6315d0b86dfd1b47a=
03556ab
        failing since 20 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6315cf008986f08911355671

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6315cf00898=
6f08911355676
        new failure (last pass: renesas-devel-2022-09-02-v6.0-rc3)
        1 lines

    2022-09-05T10:26:31.694644  kern  :emerg : Disabling IRQ #33
    2022-09-05T10:26:35.685761  [  234.503731] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6315d0e41bb1e49e12355666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6315d0e41bb1e49e1=
2355667
        new failure (last pass: renesas-devel-2022-09-02-v6.0-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | renesas_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6315cf17442067bdf8355665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/renesas_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6315cf17442067bdf=
8355666
        new failure (last pass: renesas-devel-2022-09-02-v6.0-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6315d15c1b17b34fbf355645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-r=
k3328-rock64.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-09-05-v6.0-rc4/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-r=
k3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6315d15c1b17b34fb=
f355646
        new failure (last pass: renesas-devel-2022-09-02-v6.0-rc3) =

 =20
