Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11BA44BEEC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Feb 2022 02:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237695AbiBVAWZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 19:22:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237677AbiBVAWY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 19:22:24 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2542924F23
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 16:21:59 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id i1so344192plr.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 16:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ovCgHhlwsI6AvIuoCNTBr3ONROF0djTMuy/Kadrgbyc=;
        b=bFl21xkpfPEfGVrxCHJy9XDTTp22RYGCsTfe+nO1I96wGVe0MQ9eJHsUUu4BBXxE5L
         VaoQbY6sf1aB26HUMqP0lAYHKdA7oLCN7mqvHBUkfHNzfQL6vziBsoZc47Lw+0Bted2m
         /n1pCttiMy8M/Y+hnZUcAFmsTMql8eHSkyut95O11NVLi4xa8MosUmrx8rDanwr4tycN
         THz7gpnEpODnouKjXFGwf7YKXlnkKXN4EsIna+9xvYVLiYHK0ejzQF1VsBLYxwxj99eq
         XkqGnf8/emNVosA7mU/AJXx5AV4je1YGQz+mlTEG0SZLj6KpMGVUtOZ5G3dSUj8MrFoM
         KfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ovCgHhlwsI6AvIuoCNTBr3ONROF0djTMuy/Kadrgbyc=;
        b=55yjhWBbmYylns8u63JaamtueXlp3y4M7gRwZ7dTOk0BdCYv2FJOhL5sggnAEDU0lh
         NPYLtVuagNZrJ8XMgOgL/VDnP7M30dDS0D1yS1McVLTkyElrWZifn44cgzb8npUQs216
         jwDPC9WG9B3YbmO9DqYSXvE8f+5gKQaphkRxMZ9T6UC62kWbVl8426z3R98sJ8Y49hBC
         3y8vjK6t/fOQ8xV40cpXniByeU4+D9AUAaWjmmdW85MzUeuICrOewhASJQgkAl/BWN06
         jOaf6bOlwDWL/8h5VVXlrH7z4Pj3nzhcD1GpmOMqMUUkO8k9sYNua0oOzBhvDeVmgDcj
         5cYA==
X-Gm-Message-State: AOAM531n6PXUA6MHJCUjJExsw6ltrPsqPAQGYfFCIEan4CKGXWtrYwzk
        NekdDYSGTlP/FtRgqU3qZ4lAwJAtwO74nmg7
X-Google-Smtp-Source: ABdhPJzSRRn6iAG4Lz72Ws++WI6vJDYMtyr7sWBufrKkUIa3ol95t8q8eOBKB8ZINNdED+n+/Pi80Q==
X-Received: by 2002:a17:90b:3a85:b0:1b9:e751:2335 with SMTP id om5-20020a17090b3a8500b001b9e7512335mr1407781pjb.43.1645489317949;
        Mon, 21 Feb 2022 16:21:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p16sm19051814pgj.79.2022.02.21.16.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 16:21:57 -0800 (PST)
Message-ID: <62142ca5.1c69fb81.b4b8e.39f0@mx.google.com>
Date:   Mon, 21 Feb 2022 16:21:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-02-21-v5.17-rc1
Subject: renesas/next baseline: 229 runs,
 26 regressions (renesas-next-2022-02-21-v5.17-rc1)
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

renesas/next baseline: 229 runs, 26 regressions (renesas-next-2022-02-21-v5=
.17-rc1)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6ul-14x14-evk         | arm    | lab-nxp       | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 2          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+im=
a                | 2          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+cr=
ypto             | 2          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+im=
a                | 2          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-21-v5.17-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-21-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ee30666d75e27c8e1eb2dd1070527c011c5fbab7 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6ul-14x14-evk         | arm    | lab-nxp       | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6213f5f36d2ef99f5bc6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6213f5f36d2ef99f5bc62=
970
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6213ee1c6420cada14c6296f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn=
-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn=
-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6213ee1c6420cad=
a14c62973
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)
        12 lines

    2022-02-21T19:54:48.377082  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   10.874911] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-21T19:54:48.378491  0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6213ee1c6420cad=
a14c62974
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)
        2 lines

    2022-02-21T19:54:48.383813  kern  :alert : Mem abort info:
    2022-02-21T19:54:48.384927  kern  :alert :   ESR =3D 0x96000006
    2022-02-21T19:54:48.386059  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-21T19:54:48.387190  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-21T19:54:48.388288  kern  :alert :   EA<8>[   10.901950] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-02-21T19:54:48.389389   =3D 0, S1PTW =3D 0   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+im=
a                | 2          =


  Details:     https://kernelci.org/test/plan/id/6213f3f826ce702368c62977

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6213f3f826ce702=
368c6297b
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-02-08-v5.17-rc1)
        12 lines

    2022-02-21T20:19:49.944846  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   10.939500] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-21T20:19:49.946220  0000
    2022-02-21T20:19:49.947414  kern  :alert : Mem abort info:
    2022-02-21T20:19:49.948577  kern  :alert :   ESR =3D 0x96000006
    2022-02-21T20:19:49.949737  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-21T20:19:49.950995  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6213f3f826ce702=
368c6297c
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-02-08-v5.17-rc1)
        2 lines

    2022-02-21T20:19:49.956553  kern  :alert :   EA<8>[   10.966679] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-02-21T20:19:49.957739   =3D 0, S1PTW =3D 0   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6213f614fdd1b2ec0bc6297f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6213f614fdd1b2e=
c0bc62983
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)
        12 lines

    2022-02-21T20:28:38.143175  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   10.873017] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-21T20:28:38.144542  0000
    2022-02-21T20:28:38.145759  kern  :alert : Mem abort info:
    2022-02-21T20:28:38.146993  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6213f614fdd1b2e=
c0bc62984
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)
        2 lines

    2022-02-21T20:28:38.152583  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-21T20:28:38.153944  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-21T20:28:38.155288  kern  :alert :   EA<8>[   10.899942] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-02-21T20:28:38.156485   =3D 0, S1PTW =3D 0   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6213edfb5e9319f30fc629af

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6213edfb5e9319f=
30fc629b3
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)
        12 lines

    2022-02-21T19:53:58.992733  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   14.385910] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6213edfb5e9319f=
30fc629b4
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)
        2 lines

    2022-02-21T19:53:59.033443  at virtual address 0000000000000000
    2022-02-21T19:53:59.033873  kern  :alert : Mem abort info:
    2022-02-21T19:53:59.034027  kern  :alert :   ESR =3D 0x96000006
    2022-02-21T19:53:59.034166  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-21T19:53:59.034302  kern  :alert :   SET =3D <8>[   14.410335] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-02-21T19:53:59.034437  0, FnV =3D 0
    2022-02-21T19:53:59.034571  kern  :alert :   EA =3D<8>[   14.420949] <L=
AVA_SIGNAL_ENDRUN 0_dmesg 844930_1.5.2.4.1>
    2022-02-21T19:53:59.034700   0, S1PTW =3D 0   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+im=
a                | 2          =


  Details:     https://kernelci.org/test/plan/id/6213f3ffe4ee6b9525c6296a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6213f3ffe4ee6b9=
525c6296e
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-02-08-v5.17-rc1)
        12 lines

    2022-02-21T20:19:42.452675  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.202805] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2022-02-21T20:19:42.452963  0000
    2022-02-21T20:19:42.453171  kern  :alert : Mem abort info:
    2022-02-21T20:19:42.453338  kern  :alert :   ESR =3D 0x96000006
    2022-02-21T20:19:42.453512  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-02-21T20:19:42.453670  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-02-21T20:19:42.453826  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6213f3ffe4ee6b9=
525c6296f
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-02-08-v5.17-rc1)
        2 lines

    2022-02-21T20:19:42.454677  kern  :alert :<8>[   14.230537] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6213f63df8e56c24a2c6296b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/b=
aseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/b=
aseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6213f63df8e56c2=
4a2c6296f
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)
        12 lines

    2022-02-21T20:29:35.654428  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   14.803896] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-02-21T20:29:35.654686  at virtual address 0000000000000000
    2022-02-21T20:29:35.654874  kern  :alert : Mem abort info:
    2022-02-21T20:29:35.655081  kern  :alert :   ESR =3D 0x96000006
    2022-02-21T20:29:35.655271  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6213f63df8e56c2=
4a2c62970
        new failure (last pass: renesas-next-2021-12-17-v5.16-rc1)
        2 lines

    2022-02-21T20:29:35.656279  kern  :alert :   SET =3D <8>[   14.827839] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2022-02-21T20:29:35.656476  0, FnV =3D 0   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6213ed4b8ba1dd18c0c629af

  Results:     91 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6213ed4b8ba1dd18c0c629f5
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-21T19:51:21.376105  /lava-91582/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
3ed4b8ba1dd18c0c629f6
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-21T19:51:21.379187  <8>[   16.984608] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-21T19:51:22.429515  /lava-91582/1/../bin/lava-test-case
    2022-02-21T19:51:22.429789  <8>[   18.004566] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-21T19:51:22.429935  /lava-91582/1/../bin/lava-test-case
    2022-02-21T19:51:22.430074  <8>[   18.020716] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-21T19:51:22.430215  /lava-91582/1/../bin/lava-test-case
    2022-02-21T19:51:22.430350  <8>[   18.036725] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-21T19:51:22.432909  /lava-91582/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =


  Details:     https://kernelci.org/test/plan/id/6213f3c6d193899df0c6297a

  Results:     91 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6213f3c7d193899df0c629c0
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)

    2022-02-21T20:18:55.611095  /lava-91597/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
3f3c7d193899df0c629c1
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-01-25-v5.17-rc1)

    2022-02-21T20:18:55.614239  <8>[   19.511640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-21T20:18:56.660156  /lava-91597/1/../bin/lava-test-case
    2022-02-21T20:18:56.660569  <8>[   20.530230] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-21T20:18:56.660810  /lava-91597/1/../bin/lava-test-case
    2022-02-21T20:18:56.661036  <8>[   20.546169] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-21T20:18:56.661261  /lava-91597/1/../bin/lava-test-case
    2022-02-21T20:18:56.661479  <8>[   20.561897] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-21T20:18:56.661695  /lava-91597/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6213f597154b261c37c629c0

  Results:     91 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6213f597154b261c37c62a06
        failing since 27 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-21T20:26:36.781082  /lava-91603/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
3f597154b261c37c62a07
        failing since 27 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-21T20:26:36.786839  <8>[   18.527893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-21T20:26:37.831990  /lava-91603/1/../bin/lava-test-case
    2022-02-21T20:26:37.832382  <8>[   19.546685] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-21T20:26:37.832586  /lava-91603/1/../bin/lava-test-case
    2022-02-21T20:26:37.832775  <8>[   19.562633] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-21T20:26:37.832970  /lava-91603/1/../bin/lava-test-case
    2022-02-21T20:26:37.833147  <8>[   19.579949] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-21T20:26:37.833320  /lava-91603/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6213edd5757a3563abc62990

  Results:     99 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6213edd5757a3563abc629dd
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-21T19:53:46.960445  /lava-91584/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
3edd5757a3563abc629de
        failing since 27 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-21T19:53:46.963633  <8>[   13.561547] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-21T19:53:48.010240  /lava-91584/1/../bin/lava-test-case
    2022-02-21T19:53:48.010654  <8>[   14.580567] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =


  Details:     https://kernelci.org/test/plan/id/6213f33a0341ae84aac629a3

  Results:     99 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6213f33a0341ae84aac629f0
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-02-08-v5.17-rc1)

    2022-02-21T20:16:43.422462  /lava-91595/1/../bin/lava-test-case
    2022-02-21T20:16:43.443293  <8>[   13.514445] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
3f33a0341ae84aac629f1
        failing since 13 days (last pass: renesas-next-2021-12-16-v5.16-rc1=
, first fail: renesas-next-2022-02-08-v5.17-rc1)

    2022-02-21T20:16:44.491880  /lava-91595/1/../bin/lava-test-case
    2022-02-21T20:16:44.492295  <8>[   14.533968] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-21T20:16:44.492542  /lava-91595/1/../bin/lava-test-case
    2022-02-21T20:16:44.492769  <8>[   14.549977] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6213f58052e864f021c629a9

  Results:     99 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6213f58152e864f021c62a00
        failing since 27 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-21T20:26:33.965415  /lava-91602/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/621=
3f58152e864f021c62a01
        failing since 27 days (last pass: renesas-next-2021-12-17-v5.16-rc1=
, first fail: v5.17-rc1-18-g925b6371c834)

    2022-02-21T20:26:33.968892  <8>[   13.490194] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-21T20:26:35.014976  /lava-91602/1/../bin/lava-test-case
    2022-02-21T20:26:35.015355  <8>[   14.508978] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6213f0adf97c01f9efc62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-21-v5.17-rc1/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6213f0adf97c01f9efc62=
982
        new failure (last pass: renesas-next-2022-02-08-v5.17-rc1) =

 =20
