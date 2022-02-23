Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 197B74C0ACB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 05:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237252AbiBWEHi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Feb 2022 23:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbiBWEHh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 23:07:37 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3B24BFC3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 20:07:09 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id 4so8908437pll.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 20:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CY8oERXBJR7x48TBIZ7VNgma/2wbrobpozkBAMy+Rfs=;
        b=nbX/3NBT5ofyGfpDsjglp+TNvSNYJE/amfWeoXAF5pMVSYVNMeR46979N1aTINCBoY
         Z0zkedghDLeFMkmEqvLzT9zI+oZKjPdFxqS1LF8G4+JS+wRWKzMn8Ap8e5GNgVdQUNiN
         iVOd6sR2C59llrZ8tBDYZV6zaXO+YHjnJMyrC7/a96Q9LxyV0KnTsuofR0uZ2iCwOJVB
         UDODOH1XaRVhJrFcZ4BX2Am5lmFntWLx9joxbKZo9Jq7gnH5CGaCuhCCk4TaI7wWot75
         bBdMGZp3XJ7QGRVAFlFgRVbxm61BWBdeEroQRIIjzy6g7L7ZjNpRekNeVeQXYo4os4cB
         H7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CY8oERXBJR7x48TBIZ7VNgma/2wbrobpozkBAMy+Rfs=;
        b=TXl+WIcnIi1i4sL91Eh2hzwTfsMS+tX6AAB22gy39GCli/qEQAvT7FSjKUhy68H6vd
         x7h96I99EnigTrTZtI1cKs9OF6ySoHdiyPoVwLcQwNSj2VEeUfkFEhihetYkv3UVsK9K
         LlSDluRE8MzNPPnDrXFWQIxEc5HtpaBUOOMP1uo2Y7NQJivd7O/YrN7xONeNrxD+zsYp
         sz71Jmldhr/Bf/F6fb+xN+hrpz3ng9fEFKWLQ3RhkG+px5aaIgjKvOGEkm/Ggrr0XPay
         nB5GsJLF2mhoQH4F8So/HjuVksqUgFruqqr7lt/LUYaSBRKRuPa79qvXIuocuaC3/fw1
         tQBw==
X-Gm-Message-State: AOAM532EMhIzP9DHZlKFBR8AjZNmEh6Fp+Ei2QUFBsw1COm3LyFGu8jl
        Ltb72/MKsK99ceB9NPIFlO/knq7kE24tWHjk
X-Google-Smtp-Source: ABdhPJyIZrZz/OwE/QE/Q35G8SJ2nl2gR1z5OoiQFfrjpqwi0DsJp46QbAvbgpPMRr5SNwZjLIJovQ==
X-Received: by 2002:a17:90a:de15:b0:1b5:9208:58b5 with SMTP id m21-20020a17090ade1500b001b5920858b5mr7433474pjv.142.1645589229259;
        Tue, 22 Feb 2022 20:07:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x8-20020a17090a788800b001bc4e79e917sm4327489pjk.3.2022.02.22.20.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 20:07:08 -0800 (PST)
Message-ID: <6215b2ec.1c69fb81.ef780.c8e5@mx.google.com>
Date:   Tue, 22 Feb 2022 20:07:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-22-v5.17-rc5
Subject: renesas/master baseline-nfs: 86 runs,
 4 regressions (renesas-devel-2022-02-22-v5.17-rc5)
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

renesas/master baseline-nfs: 86 runs, 4 regressions (renesas-devel-2022-02-=
22-v5.17-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
beaglebone-black             | arm   | lab-cip      | gcc-10   | multi_v7_d=
efconfig | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto   | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto   | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima      | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-22-v5.17-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-22-v5.17-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      764d9473182a7a0e7d0fd7f57c5157204abc9dba =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
beaglebone-black             | arm   | lab-cip      | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/62157e6a0801e11d1ec62991

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62157e6a0801e11d1=
ec62992
        new failure (last pass: renesas-devel-2022-02-21-v5.17-rc5) =

 =



platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto   | 1          =


  Details:     https://kernelci.org/test/plan/id/621579a2c173a9d193c629f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/621579a2c173a9d19=
3c629f4
        new failure (last pass: renesas-devel-2022-02-21-v5.17-rc5) =

 =



platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto   | 1          =


  Details:     https://kernelci.org/test/plan/id/6215787d6caf0a114ac629da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs=
-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6215787d6caf0a114=
ac629db
        new failure (last pass: renesas-devel-2022-02-21-v5.17-rc5) =

 =



platform                     | arch  | lab          | compiler | defconfig =
         | regressions
-----------------------------+-------+--------------+----------+-----------=
---------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima      | 1          =


  Details:     https://kernelci.org/test/plan/id/62158347784f461c14c629a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/62158347784f461c1=
4c629a9
        new failure (last pass: renesas-devel-2022-02-21-v5.17-rc5) =

 =20
