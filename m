Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C773624E37
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 00:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiKJXGC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 18:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiKJXGB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 18:06:01 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4F81DA41
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 15:05:57 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id u6so2786263plq.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 15:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lrrJTGZUB/39Ziu0EEg1UBOq4QaOv+wXTXI6bKRs1FU=;
        b=X3syWU6MK+pRn1oPKOKoKnabyxeuzrkeCeQFOv5UM1LR/Dp5vPDtJ/r7wMHdc8MiHv
         f790h/YekKdoel6NR4Mc0fnvBD3Exkp8JYUb/WD7JqdZGGr75OcrTQk0Gmm1P9dCpsAY
         pmm9g75dzQIyTddwE2zWiXZK2/4yK218aBDLAhvJprnBTBkDkA5zCSQGMBh+5sOcIsPH
         HeaYxdwoxH5mX0T1OXHp4LbKnuUltNWfOr0pnxxE47GB7U/rZ/pe8YJz6eibY1e9q1BJ
         mU4886yo0Dnqs3dBrmIegjiR3i5PtLi/zEVfN26pr9FS4/Q8TE5tGeQJJadsEYTMO4IG
         1YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrrJTGZUB/39Ziu0EEg1UBOq4QaOv+wXTXI6bKRs1FU=;
        b=ky9Xz2eb63BfX9m8t8djL6VrMSB1dPxmHGjn5PGUuHYsBTpSjMOBGGEJnmdAVAk1/2
         Aetl1uEyEhSYZOFAq3HmY0A/aRQKZ0Lxs9td9kfBWKVjc5MWK73wHXafP15s27Hs1cd4
         4+MTSe6Ud9Mblns+bDS01WX+oqzQDECfjDPN24Sy5LjCa6lr5cJFvFy3elFd71Tfo9GE
         N3JnIhdtAL26FSy/JscKaDfRLUcO4ton1crVk+fxJYdArbWflwMLUs/kej5ozFxc7EEG
         c4CTlxpKcoro0afE26jTX7OrO5vOujZKQAJ/ekvHSAKmfEUBFjrue5pisyKqMwBKtOBF
         4mNg==
X-Gm-Message-State: ACrzQf3M6ctf3q2wEeINd1AGuY/a9YVRSC5fEfWu79yM8gR5scexhX50
        iqOXxAjfSwJjMnjmlENDtJDfwRC0yAc43bPMczU=
X-Google-Smtp-Source: AMsMyM7kkXpqD+AjqfLHhwnBXopbQYkw9QBlHNUL4p8HEi+f2yuPORDmwal8VZmujgE9AmPl5UyjnQ==
X-Received: by 2002:a17:903:25cd:b0:17d:6603:8e45 with SMTP id jc13-20020a17090325cd00b0017d66038e45mr2482634plb.173.1668121556858;
        Thu, 10 Nov 2022 15:05:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id iw17-20020a170903045100b00186ff402508sm185744plb.281.2022.11.10.15.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 15:05:56 -0800 (PST)
Message-ID: <636d83d4.170a0220.64de7.05f3@mx.google.com>
Date:   Thu, 10 Nov 2022 15:05:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-11-10-v6.1-rc4
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 145 runs,
 5 regressions (renesas-devel-2022-11-10-v6.1-rc4)
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

renesas/master baseline-nfs: 145 runs, 5 regressions (renesas-devel-2022-11=
-10-v6.1-rc4)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-11-10-v6.1-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-11-10-v6.1-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      35f5248b8c44355d69637ca0ae3fc3fbfc8aa2d0 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/636d5050254c4560ace7db8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bay=
libre/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/636d5050254c4560a=
ce7db8f
        failing since 44 days (last pass: renesas-devel-2022-09-19-v6.0-rc6=
, first fail: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/636d523192761b2d19e7db64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/636d523192761b2d1=
9e7db65
        failing since 37 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-04-v6.0) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/636d5488ba767fd3d3e7db56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/636d5488ba767fd3d=
3e7db57
        failing since 52 days (last pass: renesas-devel-2022-09-05-v6.0-rc4=
, first fail: renesas-devel-2022-09-19-v6.0-rc6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/636d51708d23db13f7e7db5e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-=
meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/636d51708d23db13f=
7e7db5f
        new failure (last pass: renesas-devel-2022-09-27-v6.0-rc7) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/636d4e05bc7642bcb7e7db56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-11-10-v6.1-rc4/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/636d4e05bc7642bcb=
7e7db57
        failing since 86 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =20
