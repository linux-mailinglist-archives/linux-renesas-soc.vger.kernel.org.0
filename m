Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B78A9518277
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 12:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbiECKqS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 06:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbiECKqR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 06:46:17 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D012D27CE1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 03:42:45 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id n14so7726051plf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 May 2022 03:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=11x9CnshobFOoaFd9KSOT/zIgEHqx63pylsqJI2zbH8=;
        b=UG3xCnhr/8PHvS//aMaADIAmIgWMM3tSWVUyaWXdoRmQtSBr25PHIKK3jw1MabN7nx
         Qcn7Vdkn/fpMgETCzzSmFoaUcEhTSKjpfg7GWfheqfuRJPpXn7V8k6f1NIwZB87rSEpp
         Vuyf4hIT81wMBu9bk5F0ot9NJRdB8q2t2/epfWKsIvz12pW5AJTvB20TBRa8LGJlZJSJ
         GgYwTnFhlNC31iKW0XQ4oDAljH8wsQ0lFL5iWydprrS84B2TYVi11NpwTT8gDTbZL5Et
         uksCqIH4+5DPWThO8N8tRZPrW9J3J4UJEdl/zzXtFTxBXoD1yX8SdnkQvOG7+M7szKHQ
         DOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=11x9CnshobFOoaFd9KSOT/zIgEHqx63pylsqJI2zbH8=;
        b=YneruIFREFN80CYaY1oV9e07h0r9YUFlQd0GKBDLuNEwr+c3FPrCJDRTSUy3xplnjp
         slFZbSt8SzZWL7eyYHksR8L1GixNoHbvF0G1kyUFkVqIBCPW2jGdIDqBH7pn+LWWHWyb
         kmk+joUTbiOqBwUdP0ly06VYc6ft9d0LOQHPOIEdLkOSI4JDN64NuBhuX3eSWkg9gmoL
         aMx9tcpK7eQnucU2Um6MDXbkMiGaBmKrFzO3KGGsBKBlDfLzPBgxH8bybSlJxraXfyyd
         vicASC9N8CeshElG+mHk6XUF5J5t+IUJ3Gmt3Y+tX+JLJ98Vnz2IPsc6AqBq4ejXTL8G
         0b7g==
X-Gm-Message-State: AOAM532dtHZd6x5J/MWus6tiHRroQXRcVlLDE0COizwE22exh7DQ5CKE
        dgrxJXsb7U0MzGUM/4bHNo6afk13qWDkKBHhRxA=
X-Google-Smtp-Source: ABdhPJxrIqtvLbVskq+c2zrcC93TVPAno/0XnGfHf4ExwDOaHQcVzE2PpJd0cijd9MQD8F34STcwIg==
X-Received: by 2002:a17:90a:c302:b0:1d9:8222:c9a5 with SMTP id g2-20020a17090ac30200b001d98222c9a5mr3991725pjt.74.1651574565145;
        Tue, 03 May 2022 03:42:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c12-20020a17090ad90c00b001cd4989feccsm1088086pjv.24.2022.05.03.03.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 03:42:44 -0700 (PDT)
Message-ID: <62710724.1c69fb81.8673a.300d@mx.google.com>
Date:   Tue, 03 May 2022 03:42:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2022-05-02-v5.18-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 119 runs,
 6 regressions (renesas-devel-2022-05-02-v5.18-rc5)
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

renesas/master baseline-nfs: 119 runs, 6 regressions (renesas-devel-2022-05=
-02-v5.18-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-02-v5.18-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-02-v5.18-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      838711889c2bcb04dfefc610d665ce457c28d274 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6270d4d90752c7122edc7b22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/basel=
ine-nfs-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/basel=
ine-nfs-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6270d4d90752c7122=
edc7b23
        new failure (last pass: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6270daf70589137c6edc7b50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseli=
ne-nfs-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseli=
ne-nfs-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6270daf70589137c6=
edc7b51
        new failure (last pass: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6270d384c3bdebe5b6dc7b39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6270d384c3bdebe5b=
6dc7b3a
        new failure (last pass: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6270dc0ce086edeef8dc7b78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6270dc0ce086edeef=
8dc7b79
        new failure (last pass: renesas-devel-2022-04-19-v5.18-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62710601abe415c113dc7b41

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62710601abe415c11=
3dc7b42
        failing since 42 days (last pass: renesas-devel-2022-03-08-v5.17-rc=
7, first fail: renesas-devel-2022-03-21-v5.17) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6270d2d648ddb051cedc7b30

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-02-v5.18-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220428.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/6270d2d648ddb051cedc7b56
        failing since 55 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-05-03T06:59:19.287072  /lava-6245284/1/../bin/lava-test-case
    2022-05-03T06:59:19.316231  <8>[   39.013029] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
