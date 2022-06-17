Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1239254FEDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 23:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383062AbiFQUtg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 16:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381762AbiFQUtg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 16:49:36 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED475DBED
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 13:49:34 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d5so4802748plo.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=p/j9wKbwUKFeHr1zmdBGqENYl23btDsw+/4B0EAsI5Q=;
        b=QfnQOuJTOfESlE3rlGqovSW8Moy4R0LPVXMZSGF56ONmIscoQhlleJpGI441kpkVoY
         SUsqO8JQfZcCH8vQZHmAbKYtp1By4eMHMaj81qrXH4LvXQGzzJz2wSdaYX63wizN2UD5
         M8VgZXu5JK1RGsqBEx28ykQCMIixqd4uzVXzOFdrNxcLqo8yO+Nql7fDu4xWriJWvFR2
         0bGyy9ybvmgm5ww2BMunTXEKW3C+gTik4dc4FLXz6BP+NjAmpRZ4iY0UTbFzkZLnjOgJ
         15SzBQ5h+057pWKdLocz1mf0r6jI82Z8MH79mC7RK6bSsVr1TJgWw/+k+vAi+nXP7yXY
         BspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=p/j9wKbwUKFeHr1zmdBGqENYl23btDsw+/4B0EAsI5Q=;
        b=qCyQA3EKolZ1e6kvYmJp10ZkAs6RS9Ks5IJ3w0iVvShRVQlvjNKjm1M8BOySFp+aBF
         k+zsmUWMkEsyF57tmFQF8BMtj6W47jkmSCLF669njeWBLX1Tg5ZzB6KN92HnZPd9opnc
         ClzaFIPf8nRbaAARVUdWmvcWqvT1AeFKisyGxYAI3X5bvrkUe2x2Odlsqi0U4HrDJiPt
         fRwDgIGaK/QuG0t5LXbSqiz/cvoR2sAIZF562lMGalP6qMnAWq1OfWvWNSIRj8l75ITy
         bbdcArRBGlTolrVcVLPemiiUCgXMiAA5C6ymfjF39d+w8xxqHwpAnj2WsR88QziI2ybv
         jTBw==
X-Gm-Message-State: AJIora9+Zzs1MIipd9K5L1SSyXhHCWC4nEn+ToZYb9aoCOhol7x1ZbI9
        8mg3O4snhVub4NdBsQBMd+h0MY9hRs9TRHR8s7w=
X-Google-Smtp-Source: AGRyM1tixFkeERLGoPU0jnyS/mypFi53zpMr8KD7vyA28WinzIY92WDr6Dn+rjjjWi8u47NwDLseHQ==
X-Received: by 2002:a17:90a:8546:b0:1e8:61e8:7b2a with SMTP id a6-20020a17090a854600b001e861e87b2amr23518819pjw.228.1655498974246;
        Fri, 17 Jun 2022 13:49:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bd15-20020a056a00278f00b0050dc7628182sm4088000pfb.92.2022.06.17.13.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 13:49:33 -0700 (PDT)
Message-ID: <62ace8dd.1c69fb81.96c9c.6593@mx.google.com>
Date:   Fri, 17 Jun 2022 13:49:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-06-17-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 117 runs,
 8 regressions (renesas-next-2022-06-17-v5.19-rc1)
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

renesas/next baseline-nfs: 117 runs, 8 regressions (renesas-next-2022-06-17=
-v5.19-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config              | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-06-17-v5.19-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-06-17-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      64d15244c4805618b3bfc0886094481e9ac91762 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62acb9fb382c7a15a5a39c3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62acb9fb382c7a15a=
5a39c40
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62acbcb9728ea64a65a39be6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-nf=
s-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-nf=
s-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62acbcb9728ea64a6=
5a39be7
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62acbf75318a801a0da39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62acbf75318a801a0=
da39bdc
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62acc0dde4dd00a4ffa39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62acc0dde4dd00a4f=
fa39bce
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/62acb5d30795f02f5da39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62acb5d30795f02f5=
da39bd7
        new failure (last pass: renesas-next-2022-05-05-v5.18-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62acb58cb53146042ba39bfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62acb58cb53146042=
ba39bff
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62acb6159941318684a39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62acb615994131868=
4a39bd1
        new failure (last pass: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62acb704a2c00aee61a39bcd

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/62acb704a2c00aee61a39bef
        failing since 72 days (last pass: renesas-next-2022-02-25-v5.17-rc1=
, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-06-17T17:16:29.807519  <8>[   35.696025] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-06-17T17:16:30.840518  /lava-6639748/1/../bin/lava-test-case
    2022-06-17T17:16:30.882848  <8>[   36.771253] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
