Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C64325904CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Aug 2022 18:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237704AbiHKQry (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 12:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238164AbiHKQrd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 12:47:33 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7171092
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 09:20:15 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id pm17so18115844pjb.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=ioX+CfjpWbebzX4I/ljsHwWRui/8/4fw2sNxKkZ/75U=;
        b=gYpQgRyvyTppiHiAH9UlbahI9L27uR+fzdE+mY/wuIm6bgHRy2dW7qfV4q96LYqttB
         1XcYfnDLzAP84wIadiv/spXMSr/gyrBbJmv8rm/HRLMKhaqEaWy07xSZ3SGXbpvgITCL
         RnDP65AXpw+/HYOjo4wwbXCq0rv9JCo7dhzlX7DqNAz8Lg6CHT0NmAe5pM0+QnGzeiF6
         GScybuVs8k+Q9TOqugIhRZ3YIxEbsaU/SH1nGVqHFj0r5Jd0uYkwS4r/ZCE2cLxN3XQh
         Kkj1gILKYrrtMpMxo8bQsn4goJFM0+Aa/vqbeodqpAXPmxtFTJUnFNxHjb32mzq53/fN
         DKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=ioX+CfjpWbebzX4I/ljsHwWRui/8/4fw2sNxKkZ/75U=;
        b=VkpVPMCm3Q2oXnDZbMCl6GhvG8eX3+Dwwq2/4QMZzwA5Tv4AYqsWR+Emnau7c9tVYY
         HZ/dxk29K7PAuIL4T4cpIdzfMiyoWGNrqTmJIwP3ntMLP7IgPXhjJ0bsVq5++vZ41eSg
         m2pIx9/R4l2vSvwRFjYna3lskcnIDKZSJpxPpxo5bOofARrh1HW0WI087bv4cwvwl0BF
         bTJFqP/qKWIDlwz2GY/uHFn39pLj1ZFfK5qOr+W7BlVxgrIsZe9cmdvQlRFhZvdAmUsa
         GhrK9NWJGLLQCmjts0nlBq5A+TGL0ZMJ74rPlkN8UaqoY3z78rub6Riw7Nm9XUDrYW5R
         nCgg==
X-Gm-Message-State: ACgBeo0YJ88Tu/0PSssNvbVq67ffmMq1f0mGh1FFc/KMfhL/3V4oa8Uk
        +OAfISHQcHKI3Obj3Q96FyStNBh/3a4sq8ld1yo=
X-Google-Smtp-Source: AA6agR59mOMxQ7A7zlnGY84WJtJjFkFr0jLGl/BnMikyKp4C4LzPvkeN+0Px286+hXLAkwBkmqkV1w==
X-Received: by 2002:a17:902:e848:b0:170:84c5:ae15 with SMTP id t8-20020a170902e84800b0017084c5ae15mr51391plg.43.1660234814837;
        Thu, 11 Aug 2022 09:20:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k2-20020a170902c40200b0016bc947c5b7sm15679031plk.38.2022.08.11.09.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 09:20:14 -0700 (PDT)
Message-ID: <62f52c3e.170a0220.f31cf.a97a@mx.google.com>
Date:   Thu, 11 Aug 2022 09:20:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-11-v5.19
Subject: renesas/master baseline-nfs: 125 runs,
 7 regressions (renesas-devel-2022-08-11-v5.19)
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

renesas/master baseline-nfs: 125 runs, 7 regressions (renesas-devel-2022-08=
-11-v5.19)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
             | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------+------------
at91sam9g20ek                | arm   | lab-broonie  | gcc-10   | at91_dt_de=
fconfig      | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-10   | multi_v7_d=
efconfig+ima | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto       | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
debug        | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig =
             | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-11-v5.19/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-11-v5.19
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      afa6e8225571047286d61812f393c879ef344b1d =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
             | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------+------------
at91sam9g20ek                | arm   | lab-broonie  | gcc-10   | at91_dt_de=
fconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4f202e557339851daf064

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220805.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62f4f202e55733985=
1daf065
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch  | lab          | compiler | defconfig =
             | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-10   | multi_v7_d=
efconfig+ima | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4f6a47155600499daf085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm/multi_v7_defconfig+ima/gcc-10/lab-kontron/baseline-nfs-=
kontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm/multi_v7_defconfig+ima/gcc-10/lab-kontron/baseline-nfs-=
kontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220805.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62f4f6a4715560049=
9daf086
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch  | lab          | compiler | defconfig =
             | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4f530ee5fde793adaf079

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220805.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62f4f530ee5fde793=
adaf07a
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch  | lab          | compiler | defconfig =
             | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto       | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4f9cebd3913ae75daf0c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220805.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62f4f9cebd3913ae7=
5daf0c7
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch  | lab          | compiler | defconfig =
             | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
debug        | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4fb489af76d84d2daf081

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-nfs-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220805.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62f4fb489af76d84d=
2daf082
        failing since 0 day (last pass: renesas-devel-2022-07-05-v5.19-rc5,=
 first fail: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch  | lab          | compiler | defconfig =
             | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre | gcc-10   | defconfig =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4f4cae6d629f083daf063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-gxm-=
khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-gxm-=
khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220805.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62f4f4cae6d629f08=
3daf064
        failing since 0 day (last pass: renesas-devel-2021-12-06-v5.16-rc4-=
15-g9f95ae4ce1f1, first fail: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch  | lab          | compiler | defconfig =
             | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto       | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4f88381e5a8910fdaf07f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8a=
77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220805.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62f4f88381e5a8910=
fdaf080
        new failure (last pass: renesas-devel-2022-08-11-v5.19-rc8) =

 =20
