Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEB547D3774
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 15:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjJWNJG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 09:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbjJWNJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 09:09:06 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDE910C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 06:09:03 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-27d113508bfso2793154a91.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 06:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698066542; x=1698671342; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=03vhVyMoXkoW1xNdBJJGeJz8kj4EEdc0XYJrh7Dcaqs=;
        b=QfAtRK1WGm2gO6X9R1Rfn5u54Wx1pp4HCMEAbhLbXlUooXIFFBv0SAn+9JcjEJJaVT
         X6Vyrww4eS7Nv+UoV+EAEfsL2xULNNgii+AYMmCGDFGieis77ZMmnxF1s1anmtpjweet
         K1rR93U4RBwjJtt790S/kjYU4gnXAiuhRW983bbJrKXIJpCsYRvQd0mggFRoR8sGpNzh
         qs2pJR8y4sGFoCgDYQ2ajvvBOLUFu7Ze6k7fyHwsXEh6VVeO9grNVvEjzwbb3ZsN9dV+
         vLQO6Dw4t0iS5p/rWYrtl+JU+zQezYsgsm6gJPm/A7zwZzywIKDewsHiVnnds+bIYGTw
         /RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698066542; x=1698671342;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03vhVyMoXkoW1xNdBJJGeJz8kj4EEdc0XYJrh7Dcaqs=;
        b=wQfttOTMifMFA4qzYR+AhmvFs5dxPbYcxSBBkRvC0DVpjyg7NOSGqpNXkt1jYD1rLt
         6XG++d8ZSuy/UU45NjLGrtiFNcI9agM6WbAHX3ksiJ6k7RJseAbvwUCmuBzVcqsAQlri
         /uzEityyMoLcT88ieXAmbZsdagyFRZ/PQtz5DpmAdCial2lpuzipzLenw2sALi0Om8l3
         CJFzV3DMWE+XEIruopufImW8rBQm49MtfmBl3sMMdzkzkVQIQdrPunJe9LelFvkS4KsW
         dH3sYCxEjHA4yq2FieG/dBuZbDQXd1LqBDpGqSix4QKGcdR2WS9mHKeXUgI+plQIP1Vm
         JiYg==
X-Gm-Message-State: AOJu0Ywj9O9wajSqeO8t6YPsUH5DXBOS24Mm2Pb/VJNGsPBLQkFjZBjy
        MGQu1L5v7caxRralp8dOkGOzwts/fT0pFizj2GXnlA==
X-Google-Smtp-Source: AGHT+IGMaomCsAPZDS8kUrvhpcBm6fnJ3duPkHyq44/G1ijOJmLV+nJ2xAkCeAsHRSGFTOTr5PtSuw==
X-Received: by 2002:a17:90a:355:b0:273:cb91:c74f with SMTP id 21-20020a17090a035500b00273cb91c74fmr8490916pjf.8.1698066542416;
        Mon, 23 Oct 2023 06:09:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id pj1-20020a17090b4f4100b002630c9d78aasm5473815pjb.5.2023.10.23.06.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 06:09:01 -0700 (PDT)
Message-ID: <6536706d.170a0220.992c.ee9e@mx.google.com>
Date:   Mon, 23 Oct 2023 06:09:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-10-23-v6.6-rc7
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 49 runs,
 5 regressions (renesas-devel-2023-10-23-v6.6-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 49 runs, 5 regressions (renesas-devel-2023-10-23-v=
6.6-rc7)

Regressions Summary
-------------------

platform       | arch  | lab           | compiler | defconfig      | regres=
sions
---------------+-------+---------------+----------+----------------+-------=
-----
imx8mp-evk     | arm64 | lab-broonie   | gcc-10   | defconfig      | 1     =
     =

qemu_i386      | i386  | lab-broonie   | gcc-10   | i386_defconfig | 1     =
     =

r8a774c0-ek874 | arm64 | lab-cip       | gcc-10   | defconfig      | 1     =
     =

r8a77960-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig      | 1     =
     =

r8a779m1-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig      | 1     =
     =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-10-23-v6.6-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-10-23-v6.6-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      810ad90f451c3b5c359bdd01e1b029ee3e23a532 =



Test Regressions
---------------- =



platform       | arch  | lab           | compiler | defconfig      | regres=
sions
---------------+-------+---------------+----------+----------------+-------=
-----
imx8mp-evk     | arm64 | lab-broonie   | gcc-10   | defconfig      | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/6536403f895ddd59a4efcfa3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6536403f895ddd59a4efcfac
        failing since 41 days (last pass: renesas-devel-2023-08-28-v6.5, fi=
rst fail: renesas-devel-2023-09-11-v6.6-rc1)

    2023-10-23T09:43:03.790125  + set<8>[   27.405933] <LAVA_SIGNAL_ENDRUN =
0_dmesg 187529_1.5.2.4.1>
    2023-10-23T09:43:03.790339   +x
    2023-10-23T09:43:03.893727  / # #
    2023-10-23T09:43:05.052269  export SHELL=3D/bin/sh
    2023-10-23T09:43:05.057770  #
    2023-10-23T09:43:06.548835  / # export SHELL=3D/bin/sh. /lava-187529/en=
vironment
    2023-10-23T09:43:06.554325  =

    2023-10-23T09:43:09.270434  / # . /lava-187529/environment/lava-187529/=
bin/lava-test-runner /lava-187529/1
    2023-10-23T09:43:09.277283  =

    2023-10-23T09:43:09.292358  / # /lava-187529/bin/lava-test-runner /lava=
-187529/1 =

    ... (12 line(s) more)  =

 =



platform       | arch  | lab           | compiler | defconfig      | regres=
sions
---------------+-------+---------------+----------+----------------+-------=
-----
qemu_i386      | i386  | lab-broonie   | gcc-10   | i386_defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/65363cedf83c1cc4e5efcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i38=
6.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i38=
6.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65363cedf83c1cc4e5efc=
ef4
        new failure (last pass: renesas-devel-2023-10-16-v6.6-rc6) =

 =



platform       | arch  | lab           | compiler | defconfig      | regres=
sions
---------------+-------+---------------+----------+----------------+-------=
-----
r8a774c0-ek874 | arm64 | lab-cip       | gcc-10   | defconfig      | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/653640266c7c38c474efcef7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.t=
xt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653640266c7c38c474efcf00
        failing since 97 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-23T09:42:46.778800  / # #
    2023-10-23T09:42:48.234903  export SHELL=3D/bin/sh
    2023-10-23T09:42:48.255724  #
    2023-10-23T09:42:48.256232  / # export SHELL=3D/bin/sh
    2023-10-23T09:42:50.203975  / # . /lava-1024816/environment
    2023-10-23T09:42:53.787000  /lava-1024816/bin/lava-test-runner /lava-10=
24816/1
    2023-10-23T09:42:53.808315  . /lava-1024816/environment
    2023-10-23T09:42:53.808671  / # /lava-1024816/bin/lava-test-runner /lav=
a-1024816/1
    2023-10-23T09:42:53.889160  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-23T09:42:53.889545  + cd /lava-1024816/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform       | arch  | lab           | compiler | defconfig      | regres=
sions
---------------+-------+---------------+----------+----------------+-------=
-----
r8a77960-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig      | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/65363f81f85f31aee6efcef9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65363f81f85f31aee6efcf02
        failing since 97 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-23T09:44:30.409412  / # #

    2023-10-23T09:44:30.510112  export SHELL=3D/bin/sh

    2023-10-23T09:44:30.510378  #

    2023-10-23T09:44:30.611000  / # export SHELL=3D/bin/sh. /lava-11853143/=
environment

    2023-10-23T09:44:30.611262  =


    2023-10-23T09:44:30.711926  / # . /lava-11853143/environment/lava-11853=
143/bin/lava-test-runner /lava-11853143/1

    2023-10-23T09:44:30.712426  =


    2023-10-23T09:44:30.717079  / # /lava-11853143/bin/lava-test-runner /la=
va-11853143/1

    2023-10-23T09:44:30.778745  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-23T09:44:30.778918  + cd /lava-118531<8>[   19.373393] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11853143_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform       | arch  | lab           | compiler | defconfig      | regres=
sions
---------------+-------+---------------+----------+----------------+-------=
-----
r8a779m1-ulcb  | arm64 | lab-collabora | gcc-10   | defconfig      | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/65363f92d56351275fefcf04

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-u=
lcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65363f92d56351275fefcf0d
        failing since 97 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-07-17-v6.5-rc2)

    2023-10-23T09:43:04.314383  / # #

    2023-10-23T09:43:05.394996  export SHELL=3D/bin/sh

    2023-10-23T09:43:05.396855  #

    2023-10-23T09:43:06.887454  / # export SHELL=3D/bin/sh. /lava-11853139/=
environment

    2023-10-23T09:43:06.889358  =


    2023-10-23T09:43:09.614443  / # . /lava-11853139/environment/lava-11853=
139/bin/lava-test-runner /lava-11853139/1

    2023-10-23T09:43:09.616770  =


    2023-10-23T09:43:09.622538  / # /lava-11853139/bin/lava-test-runner /la=
va-11853139/1

    2023-10-23T09:43:09.685530  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-23T09:43:09.686031  + cd /lav<8>[   28.578190] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11853139_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =20
