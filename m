Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0244507AA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 22:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350888AbiDSUKK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 16:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355603AbiDSUKJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 16:10:09 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4E138798
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 13:07:25 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id j8-20020a17090a060800b001cd4fb60dccso3005452pjj.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 13:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aGaOWjT1825JXzXmxF8DwvE3JZ4g5j+HAwg05M59avQ=;
        b=gb6w4QBAMrM3Sy92bkbnSfCUZgOnEeHjtTyh61YVgAEPkqbbigZjkAkU4H//L6QoJJ
         S74oCAvhuUBhSrXcT/4e4PkDr/PFKn+vpYLfCaZ0zULFlwmkiwTF5NqKjWu9R1p5i9+Q
         4YvKI9C3s1csUBNYFcdGvslwLSFFiLG6HnEajYAUtszYXX+sEG4juvU3lUogJlgMYFQv
         Jfq8VCwuZXRiyb6dcKujlxoT1iMuPtR6siaUfTpwWVwZ6xwRHDdg76G1MIGDn6z/jsu/
         pt11QDQwf7FTkVE/jcvx9we8uaW2QwC/yaM9VNJf4rBoEHtJPCCMoywy9NpRdNBWikH6
         OOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aGaOWjT1825JXzXmxF8DwvE3JZ4g5j+HAwg05M59avQ=;
        b=N4mxnSZKDkIORE82D7H+gW5DQyFooFDarHBI4bwnkWrnGJXNP8VQMOUDhVwNF8lfz/
         qCjlpFsK3IWfUxMqI0Nv5CTRTZivP68bohXva8MrxVvW07oiELz1S/nkMUV90tFKw1RP
         QGsHj2CpBqXto64a56OHQiMxpuxeJ9lbMUJi3by6a5JCHGvn8r13t/HHZmNc/LFiwkyP
         RqZRvafZPi853Bib06Q4k99SUgCNSsmafM5fQGvckqzUVz3KE/VKod6ZAixCxMdfmHSr
         MW2DKUIN5TpVZ96TDPLP5e4n5rzhO33dHOva++rsRvHwTjc9b8l2mfLhOyfZG+Ba5DuA
         CMQQ==
X-Gm-Message-State: AOAM533tKVUibZQzg+rnvnmls5Jy/JE2J+cpaOEDbOol0wE2OCn/jVwT
        JJy4awPfAoAGUAqW3YU/4rQWRlehYsSzO5CZ
X-Google-Smtp-Source: ABdhPJxja3NrEQaTfdS5XQuxSygYp7nsxTiK/L9xBIdfFqlEJDNs9qtkM3uWOx4NVOX6cmgV8WbNQg==
X-Received: by 2002:a17:90b:380e:b0:1d2:abf6:e6a2 with SMTP id mq14-20020a17090b380e00b001d2abf6e6a2mr272799pjb.231.1650398845297;
        Tue, 19 Apr 2022 13:07:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bd11-20020a656e0b000000b0039da213aa72sm17026785pgb.5.2022.04.19.13.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 13:07:25 -0700 (PDT)
Message-ID: <625f167d.1c69fb81.3a01d.9433@mx.google.com>
Date:   Tue, 19 Apr 2022 13:07:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-04-19-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 415 runs,
 4 regressions (renesas-next-2022-04-19-v5.18-rc1)
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

renesas/next baseline: 415 runs, 4 regressions (renesas-next-2022-04-19-v5.=
18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
imx8mn-ddr4-evk  | arm64 | lab-nxp       | gcc-10   | defconfig+crypto     =
        | 1          =

meson-gxbb-p200  | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...BIG_E=
NDIAN=3Dy | 1          =

panda            | arm   | lab-baylibre  | gcc-10   | omap2plus_defconfig  =
        | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-19-v5.18-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-19-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      fc84df8749fa09bc9407dfbf3c9a67a204a31eb5 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
imx8mn-ddr4-evk  | arm64 | lab-nxp       | gcc-10   | defconfig+crypto     =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/625edfffa0365c15c0ae069d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625edfffa0365c15c0ae0=
69e
        new failure (last pass: renesas-next-2022-04-13-v5.18-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
meson-gxbb-p200  | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...BIG_E=
NDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/625eeca28c9f56b0d5ae06f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625eeca28c9f56b0d5ae0=
6f1
        new failure (last pass: renesas-next-2022-04-11-v5.18-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
panda            | arm   | lab-baylibre  | gcc-10   | omap2plus_defconfig  =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/625ee1b0a91e085cdeae06a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda=
.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625ee1b0a91e085cdeae0=
6aa
        failing since 7 days (last pass: renesas-next-2022-02-24-v5.17-rc1,=
 first fail: renesas-next-2022-04-11-v5.18-rc1) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/625ee24f1f33f32243ae06ab

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-19-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/625ee24f1f33f32243ae06cd
        failing since 13 days (last pass: renesas-next-2022-02-25-v5.17-rc1=
, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-04-19T16:24:29.470885  /lava-6123967/1/../bin/lava-test-case
    2022-04-19T16:24:29.481820  <8>[   33.812852] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
