Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B6B507AA6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 22:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbiDSUKI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 16:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350888AbiDSUKG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 16:10:06 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17353879C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 13:07:22 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id be5so16810137plb.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 13:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iYffiV9Zfb+4Sx0o/vBEt2s6bt91sAS2cPSRuo9OBFA=;
        b=aitEw3y0UUQ3Pd8rh4/Q9FzynBEAz2aQfpgM8z8RHr80SasRj7mfr9VbjiLVLK7Tvp
         bDqnXrffsivwoivy8x2ZzlhtAmhGvn+SjcpDYptS1GYhSQnee7OL74JGdhDmrCL5I4vM
         U/Pz4Od4H89uyb0wVlhndJu680Cx7qmffRFa26R3de+anzjrXR+OT5j9tUGrg5yc3Wrw
         D2WYW1ywElvwNzUftV2JB/UUbW92wANDL0QC81Sr+S0ZMNaCJe3x0yJKU5FYFlCLjODA
         EQEa0s5+KkTtAKoBTVHQjEyThusFK1iorm+7wT1uTIQOY7xGGlx97iYqvAowbr4c209B
         twCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iYffiV9Zfb+4Sx0o/vBEt2s6bt91sAS2cPSRuo9OBFA=;
        b=A5ojidQEV2ERNibFjJ86COUE7EUlZDo4VLW/AfrCpI1qwn1bVHMC66kwNjrfQlfgYF
         Vzu4Ac2GROdtCT+YJiOV72l4MKYHR0KzhThoe7g+0F33SJN1eOMDnmkuEHU0wMeY00nL
         QfuxKU5n6yJmoJ7M9+oyd3tFC/P3tY3iUPvAgCj0PAckMGQOZZaccXrGx/C5rYnstq5C
         YFGrZogsWaH9TnZBZr3kym8DuywdPUrJFfmLYUbB3/8DMa3PtkL5sZO0WoUzVk93tr+W
         zrDKZnDxFm4k927nuDtvZ5jDLiBykKOkGlAihgt6fIDjYeg6v03sc//BevZf85+VeTPx
         6QMg==
X-Gm-Message-State: AOAM530L9+DoKUiaG6VHDkr3Tq91/nCmvletpthLiqQKQqnC/Bf15jyI
        gIEuMgrXSc1RZoF7XyhigML1oPmcO4+5/rU+
X-Google-Smtp-Source: ABdhPJynaE13KMSGFEUSv++j8lv+AoP0pSsF1QADcmJBn+IGjKAUI1s3luVSMZ2bpZfYbnWxdzBOew==
X-Received: by 2002:a17:90b:1891:b0:1d2:66e1:62b2 with SMTP id mn17-20020a17090b189100b001d266e162b2mr330886pjb.56.1650398842049;
        Tue, 19 Apr 2022 13:07:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v27-20020aa799db000000b00509fbf03c91sm17366360pfi.171.2022.04.19.13.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 13:07:21 -0700 (PDT)
Message-ID: <625f1679.1c69fb81.cfa42.86e3@mx.google.com>
Date:   Tue, 19 Apr 2022 13:07:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-04-19-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 64 runs,
 3 regressions (renesas-next-2022-04-19-v5.18-rc1)
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

renesas/next baseline-nfs: 64 runs, 3 regressions (renesas-next-2022-04-19-=
v5.18-rc1)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto  =
           | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-19-v5.18-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-19-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      fc84df8749fa09bc9407dfbf3c9a67a204a31eb5 =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto  =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/625edf08807609b601ae0685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220411.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/625edf08807609b60=
1ae0686
        new failure (last pass: renesas-next-2022-04-13-v5.18-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/625ee0d85963c7f262ae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220411.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/625ee0d85963c7f26=
2ae067f
        new failure (last pass: renesas-next-2022-04-11-v5.18-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/625ee020230abf4826ae06a8

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220411.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/625ee020230abf4826ae06ca
        failing since 13 days (last pass: renesas-next-2022-02-25-v5.17-rc1=
, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-04-19T16:15:08.656009  /lava-6123945/1/../bin/lava-test-case
    2022-04-19T16:15:08.688554  [   38.407795] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
