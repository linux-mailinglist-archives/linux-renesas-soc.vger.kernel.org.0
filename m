Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25DF632810
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 16:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbiKUP2R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 10:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbiKUP2C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 10:28:02 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C612015FD6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 07:27:42 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id f9so7257794pgf.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 07:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rwZO+MEul1fcKv0XkYRkNshfofYxG0OTVk9PZlVH8KQ=;
        b=Hh/CdyVVP2iMVLNASGLA2ow9lecQoGZH6XnYKTpvMrH2c0QqBYlqsWCrOSm4L2gWJW
         6uOhYEJe1Iuc9hKU4dUP6TMlZBGVryolzOklHQx1tu2ZqGbu61IPot4stLcKjihqh/UN
         hGFBKZ+uudShVbN1ShYasXzLAXW2rfSLhJ6Gfm3aMlhR5wBT8knjjaQhOs8eyj05tZ9a
         4hkosi5c4gQG2KwgfUPQHuMjj95fw7H1tylo7mRzi0DX8LxJ5KkaxrXUeZolc6zC1ftC
         Z9TPcAcgFFhR6e/Felijrr2a+lNh2xNROAon8c4TNoirVq6/khCc/w7GhIryQ2yB75I2
         5VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwZO+MEul1fcKv0XkYRkNshfofYxG0OTVk9PZlVH8KQ=;
        b=kub4dB4Cz8YXyIcLujnKf50nrJbIzufEZqYGw3aARV1me+vd/jUYR51H6VHVkgrYrq
         27PsslIX1EKRKIp2eLwQn3DOyDkoKfGnG56zZYg8H9s1e+VDwF1xWsnl9XblXrwA9FpI
         xlZsZRv2l1tkFk5VedbIIKzd8sCf4DNRYFFFBcgEjw64wnKR/2Q0USrVWukURabTTPRB
         lD1eFc87NJvlXLF93QiUBtO4kjYOIcHbbH+E9WoMdm76/8+T0D8MH+3/cGHnIoig/7eA
         QVfPsTqYVe3ynR44lxv3yPMREdI01O7Xb7aKDpVnrwWb51MMtRDLFOPawumqhsXCGiyT
         Tpgw==
X-Gm-Message-State: ANoB5plpzgv50ECOoE/N3H8I7K/XwnA5uULXCwY4Ay5bNp8V++hnmSEG
        4JjOdD7aB7olZ/fJ1zznFJBaRdKtUaNKt28tGw4=
X-Google-Smtp-Source: AA0mqf5HdctfKqQn9FI+GyrzknzJ2AwGat6m5mLZYToLudt42wLl6YEZv5LQgGOkIitp283teHbC4g==
X-Received: by 2002:a63:315:0:b0:448:5b5f:97fb with SMTP id 21-20020a630315000000b004485b5f97fbmr17930630pgd.207.1669044462125;
        Mon, 21 Nov 2022 07:27:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902db0100b00188fce6e8a5sm8264959plx.290.2022.11.21.07.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 07:27:41 -0800 (PST)
Message-ID: <637b98ed.170a0220.3b74.c05c@mx.google.com>
Date:   Mon, 21 Nov 2022 07:27:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-11-21-v6.1-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 141 runs,
 4 regressions (renesas-next-2022-11-21-v6.1-rc1)
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

renesas/next baseline-nfs: 141 runs, 4 regressions (renesas-next-2022-11-21=
-v6.1-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-11-21-v6.1-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-11-21-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      00841e945654c53409a811ab1ddaa934631ac54c =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/637b60a41cd194585c2abd2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/637b60a41cd194585=
c2abd2d
        failing since 3 days (last pass: renesas-next-2022-11-15-v6.1-rc1, =
first fail: renesas-next-2022-11-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/637b68dc7c34990cdb2abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/637b68dc7c34990cd=
b2abcfb
        failing since 98 days (last pass: renesas-next-2022-07-05-v5.19-rc1=
, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/637b6b72ac60fec7322abcfa

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/637b6b72ac60fec7322abd1c
        failing since 229 days (last pass: renesas-next-2022-02-25-v5.17-rc=
1, first fail: renesas-next-2022-04-04-v5.18-rc1)

    2022-11-21T12:13:28.400113  /lava-8063388/1/../bin/lava-test-case
    2022-11-21T12:13:28.458069  <8>[   41.707754] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug            | 1          =


  Details:     https://kernelci.org/test/plan/id/637b89a019c8110d432abd0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-21-v6.1-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/637b89a019c8110d4=
32abd0f
        new failure (last pass: renesas-next-2022-11-15-v6.1-rc1) =

 =20
