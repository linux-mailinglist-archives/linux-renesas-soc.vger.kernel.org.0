Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFEE451C445
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 17:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343951AbiEEPxD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 11:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbiEEPxC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 11:53:02 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC3E5A174
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 08:49:22 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id w5-20020a17090aaf8500b001d74c754128so8404020pjq.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 May 2022 08:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=czr4Y5NRw5DG8OXaX3hfUc/9BDdgdbF8AiXm7fNo5eA=;
        b=Pl9792Q820XV2e/iBon26y2u89nAgxMuBo/A+P1EsKSgjO+Ej3nHZqh63U6zqAk2gs
         zsirsvBNI2LIi9ds8XbxjoylzArJdVPPF54fnk45TDeLA7FZAVzKNV1EqGqmfguMpHIs
         4cpTq5/EisBGALN291GvIOLu4pKICKnTG0E67ybesbxPeJbvwIFHcGtjpYi7N1Rv1ywx
         ZYjiRyr54zFEaUs//O4RmYSpDaFDfYr+UP90VLg/Jdtf+j2NtQ8iE+iylVqog+RcLJv/
         KPAExzHsNf9h0hJ2pAESAbGu7APXM4Ht/DJ/Y+CbAisB25JxZIO2jMFzIEYyaObzK01z
         ++Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=czr4Y5NRw5DG8OXaX3hfUc/9BDdgdbF8AiXm7fNo5eA=;
        b=fY39LrvknVnL2qBVtTKno7LQc4VXYhPWzwygFxI5eMoEI96CrKSeNYQqxAjxqEi/u0
         tXb4AGriNkm9hIFwjIPjvMtr9w3wAJ9aUeT30A6ByDvX3fGXz7+10fvpdW6q07lSpyw7
         9MWbhmTrfe7gV3pKbxTuEknTLpi++dAfgZG4NfbrerNtOzw3TyZFogUABDHMSx0JbqMP
         A97SQDVOIXcMYH/QaKuuhXid0/TEW0KIr+lQ0TpPA7LCEs/V/LRdyDkt0Y9YPmmLTS8n
         MWU172XxrLWyJ52lItrum2NMP0t2CwKidaPyoPMIuoL8b92nYEwZ8p4s65PNi8SDY/9z
         YTXQ==
X-Gm-Message-State: AOAM532vey42rtzkWEqWnsUHpos4W8BgHpa7gMhda6sJe/JKIKurQQs7
        inGfpQvci+XhtYeTFa3aoL/wqsr72IrSpGSZbMg=
X-Google-Smtp-Source: ABdhPJyfnv9vnGrSSwKZ7kqG394K82zbYjlrBgBD2ZBzt/JwF6DPRi0UArA9lW8Yd/LCHwuEej0waA==
X-Received: by 2002:a17:90b:4a08:b0:1dc:6cc1:3d24 with SMTP id kk8-20020a17090b4a0800b001dc6cc13d24mr6983759pjb.131.1651765761505;
        Thu, 05 May 2022 08:49:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 7-20020a17090a1a0700b001dbf2aac185sm1633196pjk.1.2022.05.05.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:49:21 -0700 (PDT)
Message-ID: <6273f201.1c69fb81.6211d.3c34@mx.google.com>
Date:   Thu, 05 May 2022 08:49:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-05-05-v5.18-rc5
Subject: renesas/master baseline: 431 runs,
 4 regressions (renesas-devel-2022-05-05-v5.18-rc5)
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

renesas/master baseline: 431 runs, 4 regressions (renesas-devel-2022-05-05-=
v5.18-rc5)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
imx8mn-ddr4-evk     | arm64 | lab-nxp       | gcc-10   | defconfig         =
           | 1          =

jetson-tk1          | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_=
ARM_LPAE=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig         =
           | 1          =

rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-05-05-v5.18-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-05-05-v5.18-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d1312c8c2b58ca08cd1d871e77474e7b2af0d3ce =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
imx8mn-ddr4-evk     | arm64 | lab-nxp       | gcc-10   | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6273bf61af6f83da178f5725

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk=
.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6273bf61af6f83da178f5=
726
        new failure (last pass: renesas-devel-2022-05-03-v5.18-rc5) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
jetson-tk1          | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_=
ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6273bc84f434ba61cf8f571a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6273bc84f434ba61cf8f5=
71b
        failing since 5 days (last pass: renesas-devel-2022-04-13-v5.18-rc2=
, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/6273bdfff4f798ab498f5834

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6273bdfff4f798ab498f5=
835
        new failure (last pass: renesas-devel-2022-04-19-v5.18-rc3) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
rk3399-gru-kevin    | arm64 | lab-collabora | gcc-10   | defconfig+arm64-ch=
romebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6273bc9ce1062f4b0d8f571f

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-05-05-v5.18-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6273bc9ce1062f4b0d8f5741
        failing since 57 days (last pass: renesas-devel-2022-02-28-v5.17-rc=
6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-05-05T12:01:04.393983  <8>[   34.194012] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-05-05T12:01:05.415854  /lava-6274503/1/../bin/lava-test-case
    2022-05-05T12:01:05.430202  <8>[   35.230999] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
