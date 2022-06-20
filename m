Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D373D551E2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jun 2022 16:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239787AbiFTOAi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jun 2022 10:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350193AbiFTNxH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 09:53:07 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A430DE89
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 06:19:34 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id d14so6720979pjs.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 06:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rkSk2y0JuqLiAAs3H0uoxmdcNAjFjACz2XfmF9nC0N4=;
        b=BKnxNn7mQD7OUQnWTwxu4BF65p9OUjLlMBrUBMgXwoNp40GatO/sW9pQ4kbVwgvRcR
         jCyZ81UJefQKfWkvaIY5piGXDsh2njG+16rB44bJ8rFLRvDOcN+8wOZXtkpJy2CSyIoC
         y7OM43h2AWAJUI77AqqdhVY30XQRjf/YuW3hsvPBvn3I0k98ll+pUA89o/RWcOpvDZxB
         97x14WxEJ+kPpd/i7no3jMRfIrmqfo8+M2HKyygO2Yhdx9iJgstZKCyy8zm9OZnHBMh5
         2S1/Uh0Xm3kyKtv7dQHhx+84ryb73SCoZMy5LKX19UR4MspZjPSWT+fG0LzzKt0W3ZmB
         67Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rkSk2y0JuqLiAAs3H0uoxmdcNAjFjACz2XfmF9nC0N4=;
        b=jxEkEMea8jk7K5c13gv1CNidt/uvWIkU21QbFPmeO544YfTsLaJYyDoK4s4yFPuAG+
         XdEixPmqEeCEOczthhhQot5yNoAJAUew2jCZzX8IUl/wf4WMWlLT1wklP3HgBJc4CTR6
         ZrvQGvqiHPwwDrE2gWu0MNNUoW1bzkpMqksb4Ylgn3uupwYzegC3ycwHWjw2vEMkX4ZJ
         PeUfEcYlZ+Pb1WRE8AwbSi7TTT/Hzf2OvGqu36gNIDGCwtLCvcpWgezT3JiyNwI+zqqq
         O7YOgX+MfMe7nvJx9WUOrafwRpNCShB6tEmw4W8BhEUtce4UJpOplhBWzVX1kNgJfCsI
         XZKQ==
X-Gm-Message-State: AJIora898UhLL2U5JulYkOJuUeGjYG5bW2wMX2AMI4/UIib1/d8UDxeU
        R7SZt4s9z2sJysrMUgSqkHMW7RIwdkocfTmjnPU=
X-Google-Smtp-Source: AGRyM1s6t8OgLJ36t9B3hf3K0qklNr9Seg03UKfo95UWFm7hJvQ1B8mt+Wu55vBK/13dw9KuW23Z0Q==
X-Received: by 2002:a17:902:b407:b0:168:e554:33be with SMTP id x7-20020a170902b40700b00168e55433bemr23743270plr.130.1655731134257;
        Mon, 20 Jun 2022 06:18:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id az5-20020a170902a58500b0016636256970sm6373111plb.167.2022.06.20.06.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 06:18:53 -0700 (PDT)
Message-ID: <62b073bd.1c69fb81.91078.87b0@mx.google.com>
Date:   Mon, 20 Jun 2022 06:18:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-06-20-v5.19-rc3
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 188 runs,
 11 regressions (renesas-devel-2022-06-20-v5.19-rc3)
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

renesas/master baseline-nfs: 188 runs, 11 regressions (renesas-devel-2022-0=
6-20-v5.19-rc3)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig+ima       | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre | gcc-10   | tegra_defc=
onfig              | 1          =

kontron-bl-imx8mm            | arm64 | lab-kontron  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-10   | defconfig =
                   | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto             | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

sun4i-a10-olinuxino-lime     | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-06-20-v5.19-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-06-20-v5.19-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ebde835d00b25f6852cef819b7b8c96e07c709b5 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b03be710be571b0aa39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/basel=
ine-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/basel=
ine-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b03be710be571b0=
aa39bd1
        failing since 27 days (last pass: renesas-devel-2022-05-16-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b03ea3e093575e05a39c0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b03ea3e093575e0=
5a39c0e
        failing since 27 days (last pass: renesas-devel-2022-05-16-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62b041602b3a274ac7a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline=
-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline=
-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b041602b3a274ac=
7a39bd9
        failing since 13 days (last pass: renesas-devel-2022-05-05-v5.18-rc=
5, first fail: renesas-devel-2022-06-06-v5.19-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b044ee7544f7eddba39bf3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b044ee7544f7edd=
ba39bf4
        failing since 27 days (last pass: renesas-devel-2022-05-09-v5.18-rc=
6, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b0490c6d56dcc601a39bdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b0490c6d56dcc60=
1a39bde
        failing since 27 days (last pass: renesas-devel-2022-05-16-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
jetson-tk1                   | arm   | lab-baylibre | gcc-10   | tegra_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b039c6b6442b9919a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-nfs-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b039c6b6442b991=
9a39bce
        new failure (last pass: renesas-devel-2022-06-17-v5.19-rc2) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-bl-imx8mm            | arm64 | lab-kontron  | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b03f983d29062d8fa39c33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ko=
ntron/baseline-nfs-kontron-bl-imx8mm.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ko=
ntron/baseline-nfs-kontron-bl-imx8mm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b03f983d29062d8=
fa39c34
        new failure (last pass: renesas-devel-2022-06-17-v5.19-rc2) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/62b039ff769b5941d9a39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b039ff769b5941d=
9a39bd7
        failing since 27 days (last pass: renesas-devel-2022-05-17-v5.18-rc=
7, first fail: renesas-devel-2022-05-23-v5.18) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b03c1c24fb63019ba39c3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b03c1c24fb63019=
ba39c3c
        failing since 2 days (last pass: renesas-devel-2022-05-23-v5.18, fi=
rst fail: renesas-devel-2022-06-17-v5.19-rc2) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b040018ea70317aba39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b040018ea70317a=
ba39bd1
        failing since 2 days (last pass: renesas-devel-2022-06-07-v5.19-rc1=
, first fail: renesas-devel-2022-06-17-v5.19-rc2) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun4i-a10-olinuxino-lime     | arm   | lab-baylibre | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b0505832e8fa9668a39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-sun4i-a10-olinuxino-lime.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-06-20-v5.19-rc3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-nfs=
-sun4i-a10-olinuxino-lime.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62b0505832e8fa966=
8a39be0
        new failure (last pass: renesas-devel-2022-06-07-v5.19-rc1) =

 =20
