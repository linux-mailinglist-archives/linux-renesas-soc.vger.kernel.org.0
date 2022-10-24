Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1350160AF68
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 17:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiJXPs2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 11:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbiJXPsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 11:48:12 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D397710DE52
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 07:41:07 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id n7so8634656plp.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NnrHq+V0fDYwlxztLrNfPJ3XRX5E89cecUmQNN1ixNs=;
        b=VywJ3tK78ooNlpwrzGI+ea3zZCobPygT8YcJ4KhhFPBx7xUh3ZUSM/Air/v7jWuxn7
         1wINA3koP19+AWAFwJwVKeT69k1AGNtLd41ZYpCtVFnJ+TiD51pvAiNhpq3GPdPFXMSm
         eyHhLCP2hlc+VjLGjeTLwYCcUG8H+ejPmu/JjA/Vv+0M5LglHNpH3eDNE1sTZl/gVwSL
         eZwb5BrApV0yVtD5etZAW8r9cbNOe7Sad2TzyCwL2uxVqOJQj+kh3RXJJp0+HUpSMOnw
         USl6JHdyTK55ktGp9MRADi6mzdCGbtk6xzhETs1t15D7a+ecLbPwrfaJEDk5XDDrjjyj
         mlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnrHq+V0fDYwlxztLrNfPJ3XRX5E89cecUmQNN1ixNs=;
        b=iKa3GcT8NXEg63y7h94IyO8WhBp5yKliITTFqCFQDUFmmTQyJoFE+/zY++Gt0iE20q
         liF8iRJ7cx2rduIlslygb6DAjCC6gWFNujaFTZhy3PPn7MStgRnJHKxdi0sWPh9RhJPA
         R39/wwnk9OuDoiamON2YVYC4FsL1ADaDM4/XNw2YF6P6zsD9Vrh4B7JbnjHocULXxnt8
         tbIxvcjE85h8tMFg8b8qLdQFSMRi9D0TdELziq9t160HGWKtpBjuhNQ903eINY/NtCeD
         l0EviyKWtUEP5hpwkijlRoRpDUImAfRakiCZuL/F7NBLLmJt+wDrRnOyfy7FMRDBfEZh
         lyZg==
X-Gm-Message-State: ACrzQf2tKMUo0S+C0pxuc6n4sn+VQuNaOa4R2y8W6rEFPdD5nXAMqCDq
        +5vxTwRY84VAo09HVm4wQjLsWSmH/WDUrnuV
X-Google-Smtp-Source: AMsMyM50ALq0Kph7AT0eLQrvUJ4oKeXtQIzl3tkc+tDY7DQcXhpZqFfk7z+cNJctFzMJ4or6U2W6yg==
X-Received: by 2002:a17:903:22cb:b0:186:a8ae:d107 with SMTP id y11-20020a17090322cb00b00186a8aed107mr5560803plg.119.1666622337008;
        Mon, 24 Oct 2022 07:38:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ij4-20020a170902ab4400b0017f8edd3d8asm19436343plb.177.2022.10.24.07.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:38:56 -0700 (PDT)
Message-ID: <6356a380.170a0220.40c67.4c8c@mx.google.com>
Date:   Mon, 24 Oct 2022 07:38:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-10-24-v6.1-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 390 runs,
 9 regressions (renesas-devel-2022-10-24-v6.1-rc2)
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

renesas/master baseline: 390 runs, 9 regressions (renesas-devel-2022-10-24-=
v6.1-rc2)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig           | 1          =

qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config              | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-24-v6.1-rc2/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-24-v6.1-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      547a476a7857aadfcaa264982527697926c55d6a =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63566e42351b18c0de5e5b52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63566e42351b18c0de5e5=
b53
        failing since 177 days (last pass: renesas-devel-2022-04-13-v5.18-r=
c2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63566cbd7e85e220805e5b3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63566cbd7e85e220805e5=
b3f
        failing since 69 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6356680a008a41d9c65e5b59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox82=
0-cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6356680a008a41d9c65e5=
b5a
        failing since 6 days (last pass: renesas-devel-2022-10-04-v6.0, fir=
st fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/63566a22f6d69e9bfb5e5b4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63566a22f6d69e9bfb5e5=
b50
        new failure (last pass: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/63566bdd4f8f16362d5e5b9f

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/63566bdd4f8f16362d5e5bc5
        failing since 229 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-10-24T10:41:23.123516  /lava-7695206/1/../bin/lava-test-case
    2022-10-24T10:41:23.135390  <8>[   40.705758] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63566bde4f8f16362d5e5be8
        failing since 139 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-10-24T10:41:20.134056  /lava-7695206/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63566bde4f8f16362d5e5be9
        failing since 139 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-10-24T10:41:18.063904  <8>[   35.633530] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-10-24T10:41:19.095731  /lava-7695206/1/../bin/lava-test-case
    2022-10-24T10:41:19.105290  <8>[   36.675257] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63566bde4f8f16362d5e5bea
        failing since 139 days (last pass: renesas-devel-2022-05-23-v5.18, =
first fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-10-24T10:41:16.967887  <8>[   34.537156] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-10-24T10:41:18.050410  /lava-7695206/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/63566daaee219493835e5ba3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-24-v6.1-rc2/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63566daaee219493835e5=
ba4
        new failure (last pass: renesas-devel-2022-10-17-v6.1-rc1) =

 =20
