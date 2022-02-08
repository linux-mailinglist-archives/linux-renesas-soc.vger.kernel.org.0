Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13AB34ADBBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 15:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378684AbiBHO4I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 09:56:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378722AbiBHO4A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 09:56:00 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3871C0612C3
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 06:55:58 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id i186so19333408pfe.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Feb 2022 06:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NskQ92ODUg2n0Yf157nNm3fOXs0uIS2RGU26m2gdpzs=;
        b=M4RCp+Q1WTOOS8czHptKOnvtShMHPFmBdoLZmC/TXp3eQY88b3a7xandqo4y9d5E6l
         oteBBw+9E/yoHzIO0JrP9QKhYm0U3CewQdlL3xzWU6m/q/rvKpBL0yPwN2f7mJtUikO/
         P3bYG9Wdq+W/PZpd11JlOGsWKEOduo8Q4LVXol2gEBj10dA+0LFkhWeIe4blbdP1cTA0
         54WX9PGsoE6PJNgnpsMvqg4PIKMyZJmLF+YfveDWLQrFcmrs8lNNO8SMjSNq98Kacxij
         xN4ReM0J84I2a2jgg15bXnV3msDnXymvp80ebf3gxD/NZ4og1gPERICD+I8waE0eW0oi
         MDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NskQ92ODUg2n0Yf157nNm3fOXs0uIS2RGU26m2gdpzs=;
        b=NYjvjgH4bunYXTqZ+ZwPhHzJ69JhgCPj4oDnUs0/lfrP1bHugfU9jgSotZhxw9THJn
         d3onWjHyimZmP1zLOjpgyV8c6DW6dGSTsO2oL53JrCiDXVsLH8a4bOONLNUPQlwwixIR
         FVggsTCQZhS5Puztt4FDfPNkAOrIcMYmy1zem4sozRHWjNXe+uaGbrRUvE57VQ8d0WhI
         ZZ7+RDOHCmclEgn8pXsgJlKqyAay3Ayj0E7vSguEq6RzDXlUbzQiAIFGiRpsoi8UuPCu
         yPnj4f8pwp6jiAxcxXTtKtMmh1hpgimbCw4IziJhD7i3W5TH6KOQ35UOKNtT/eyO1xb4
         zp8w==
X-Gm-Message-State: AOAM533uPRkaF0p3W0wzNYvNkH2S0RNfivARYl8Q35xLd2NlWnp4tHiU
        10IyNdORbWPmSrAVegt8d2sVNldDi/vqPnFB
X-Google-Smtp-Source: ABdhPJy5Ki6JhTItEAn2H3/2x0TB+u6Is4OQHO61IfYFLdJTTBDjyp2x3su7PJB8P6f8D+74gqzaoQ==
X-Received: by 2002:a62:1c8b:: with SMTP id c133mr4686952pfc.33.1644332158051;
        Tue, 08 Feb 2022 06:55:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o7sm15202153pfk.184.2022.02.08.06.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 06:55:57 -0800 (PST)
Message-ID: <6202847d.1c69fb81.35eff.6eef@mx.google.com>
Date:   Tue, 08 Feb 2022 06:55:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-02-08-v5.17-rc1
Subject: renesas/next baseline: 298 runs,
 16 regressions (renesas-next-2022-02-08-v5.17-rc1)
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

renesas/next baseline: 298 runs, 16 regressions (renesas-next-2022-02-08-v5=
.17-rc1)

Regressions Summary
-------------------

platform               | arch  | lab          | compiler | defconfig     | =
regressions
-----------------------+-------+--------------+----------+---------------+-=
-----------
imx8mn-ddr4-evk        | arm64 | lab-baylibre | gcc-10   | defconfig+ima | =
2          =

imx8mn-ddr4-evk        | arm64 | lab-baylibre | gcc-10   | defconfig     | =
2          =

imx8mn-ddr4-evk        | arm64 | lab-nxp      | gcc-10   | defconfig+ima | =
2          =

imx8mn-ddr4-evk        | arm64 | lab-nxp      | gcc-10   | defconfig     | =
2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron  | gcc-10   | defconfig+ima | =
2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron  | gcc-10   | defconfig     | =
2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron  | gcc-10   | defconfig+ima | =
2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron  | gcc-10   | defconfig     | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-08-v5.17-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-08-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      65a3b7e5807616a88f3c6a25ce47cbc706676b63 =



Test Regressions
---------------- =



platform               | arch  | lab          | compiler | defconfig     | =
regressions
-----------------------+-------+--------------+----------+---------------+-=
-----------
imx8mn-ddr4-evk        | arm64 | lab-baylibre | gcc-10   | defconfig+ima | =
2          =


  Details:     https://kernelci.org/test/plan/id/62024b57155a1123af5d6f09

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62024b57155a112=
3af5d6f10
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        12 lines

    2022-02-08T10:51:49.612801  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   10.694687] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-02-08T10:51:49.614179  at virtual address 0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62024b57155a112=
3af5d6f11
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        2 lines

    2022-02-08T10:51:49.619396  kern  :alert : Mem abort info:
    2022-02-08T10:51:49.620736  kern  :alert :   ESR =3D 0x96000006
    2022-02-08T10:51:49.621844  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-08T10:51:49.623027  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-08T10:51:49.624211  kern  :alert :   EA<8>[   10.720422] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-02-08T10:51:49.625333   =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab          | compiler | defconfig     | =
regressions
-----------------------+-------+--------------+----------+---------------+-=
-----------
imx8mn-ddr4-evk        | arm64 | lab-baylibre | gcc-10   | defconfig     | =
2          =


  Details:     https://kernelci.org/test/plan/id/62024d4e72aa92e5d45d6f08

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62024d4e72aa92e=
5d45d6f0f
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        12 lines

    2022-02-08T10:59:53.715552  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   10.727821] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62024d4e72aa92e=
5d45d6f10
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        2 lines

    2022-02-08T10:59:53.740063  at virtual address 0000000000000000
    2022-02-08T10:59:53.741303  kern  :alert : Mem abort info:
    2022-02-08T10:59:53.742546  kern  :alert :   ESR =3D 0x96000006
    2022-02-08T10:59:53.744222  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-08T10:59:53.745310  kern  :alert :   SET =3D <8>[   10.752506] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-02-08T10:59:53.746511  0, FnV =3D 0
    2022-02-08T10:59:53.747618  kern  :alert :   EA =3D<8>[   10.762758] <L=
AVA_SIGNAL_ENDRUN 0_dmesg 1515375_1.5.2.4.1>
    2022-02-08T10:59:53.748715   0, S1PTW =3D 0
    2022-02-08T10:59:53.749800  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-02-08T10:59:53.751064  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab          | compiler | defconfig     | =
regressions
-----------------------+-------+--------------+----------+---------------+-=
-----------
imx8mn-ddr4-evk        | arm64 | lab-nxp      | gcc-10   | defconfig+ima | =
2          =


  Details:     https://kernelci.org/test/plan/id/62024b9d55171f40465d6ef0

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62024b9d55171f4=
0465d6ef7
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        12 lines

    2022-02-08T10:52:49.016898  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   18.156136] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-08T10:52:49.017324  0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62024b9d55171f4=
0465d6ef8
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)
        2 lines

    2022-02-08T10:52:49.018786  kern  :alert : Mem abort info:
    2022-02-08T10:52:49.019034  kern  :alert :   ESR =3D 0x96000006
    2022-02-08T10:52:49.019269  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-08T10:52:49.019500  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-08T10:52:49.019725  kern  :alert :   EA<8>[   18.183428] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-02-08T10:52:49.019951   =3D 0, S1PTW =3D 0
    2022-02-08T10:52:49.020171  kern  :alert :  <8>[   18.193394] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 834096_1.5.2.4.1>
    2022-02-08T10:52:49.020391   FSC =3D 0x06: level 2 translation fault
    2022-02-08T10:52:49.020608  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab          | compiler | defconfig     | =
regressions
-----------------------+-------+--------------+----------+---------------+-=
-----------
imx8mn-ddr4-evk        | arm64 | lab-nxp      | gcc-10   | defconfig     | =
2          =


  Details:     https://kernelci.org/test/plan/id/62024d149f0f89ee835d6f08

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62024d149f0f89e=
e835d6f0f
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        12 lines

    2022-02-08T10:59:08.485820  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   15.290462] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62024d149f0f89e=
e835d6f10
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)
        2 lines

    2022-02-08T10:59:08.487018  at virtual address 0000000000000000
    2022-02-08T10:59:08.487306  kern  :alert : Mem abort info:
    2022-02-08T10:59:08.487557  kern  :alert :   ESR =3D 0x96000006
    2022-02-08T10:59:08.487788  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-08T10:59:08.488065  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-08T10:59:08.488266  kern  :alert :   EA<8>[   15.316347] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>   =

 =



platform               | arch  | lab          | compiler | defconfig     | =
regressions
-----------------------+-------+--------------+----------+---------------+-=
-----------
kontron-kbox-a-230-ls  | arm64 | lab-kontron  | gcc-10   | defconfig+ima | =
2          =


  Details:     https://kernelci.org/test/plan/id/62024dd95dd641dcef5d6eed

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62024dda5dd641dcef5d6f2e
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)

    2022-02-08T11:02:35.303474  /lava-85161/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
24dda5dd641dcef5d6f2f
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)

    2022-02-08T11:02:35.306598  <8>[   13.862718] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T11:02:36.356103  /lava-85161/1/../bin/lava-test-case
    2022-02-08T11:02:36.356535  <8>[   14.881570] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-08T11:02:36.356777  /lava-85161/1/../bin/lava-test-case
    2022-02-08T11:02:36.357005  <8>[   14.898704] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab          | compiler | defconfig     | =
regressions
-----------------------+-------+--------------+----------+---------------+-=
-----------
kontron-kbox-a-230-ls  | arm64 | lab-kontron  | gcc-10   | defconfig     | =
2          =


  Details:     https://kernelci.org/test/plan/id/62024eca93135282345d6ef8

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62024eca93135282345d6f39
        failing since 13 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)

    2022-02-08T11:06:40.730984  /lava-85167/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
24eca93135282345d6f3a
        failing since 13 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)

    2022-02-08T11:06:40.734161  <8>[   18.338545] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T11:06:41.779961  /lava-85167/1/../bin/lava-test-case
    2022-02-08T11:06:41.780343  <8>[   19.357219] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-08T11:06:41.780556  /lava-85167/1/../bin/lava-test-case
    2022-02-08T11:06:41.780755  <8>[   19.372625] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-08T11:06:41.780953  /lava-85167/1/../bin/lava-test-case
    2022-02-08T11:06:41.781144  <8>[   19.388567] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-08T11:06:41.781334  /lava-85167/1/../bin/lava-test-case   =

 =



platform               | arch  | lab          | compiler | defconfig     | =
regressions
-----------------------+-------+--------------+----------+---------------+-=
-----------
kontron-sl28-var3-ads2 | arm64 | lab-kontron  | gcc-10   | defconfig+ima | =
2          =


  Details:     https://kernelci.org/test/plan/id/62024acf1b15b884865d6efa

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62024acf1b15b884865d6f42
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)

    2022-02-08T10:49:37.819621  /lava-85160/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
24acf1b15b884865d6f43
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)

    2022-02-08T10:49:37.821889  <8>[   13.562261] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T10:49:38.869595  /lava-85160/1/../bin/lava-test-case
    2022-02-08T10:49:38.869993  <8>[   14.580965] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-08T10:49:38.870235  /lava-85160/1/../bin/lava-test-case
    2022-02-08T10:49:38.870460  <8>[   14.596510] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab          | compiler | defconfig     | =
regressions
-----------------------+-------+--------------+----------+---------------+-=
-----------
kontron-sl28-var3-ads2 | arm64 | lab-kontron  | gcc-10   | defconfig     | =
2          =


  Details:     https://kernelci.org/test/plan/id/62024c9d10c2cbd3ec5d6f20

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/62024c9d10c2cbd3ec5d6f68
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-02-08T10:57:19.344396  /lava-85165/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
24c9d10c2cbd3ec5d6f69
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)

    2022-02-08T10:57:19.347639  <8>[   13.568825] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T10:57:20.394281  /lava-85165/1/../bin/lava-test-case
    2022-02-08T10:57:20.394695  <8>[   14.587571] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-08T10:57:20.394935  /lava-85165/1/../bin/lava-test-case
    2022-02-08T10:57:20.395161  <8>[   14.603530] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =20
