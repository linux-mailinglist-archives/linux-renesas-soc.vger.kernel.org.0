Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D061704406
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 May 2023 05:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjEPDiW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 May 2023 23:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjEPDiV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2023 23:38:21 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA5455A7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 20:38:16 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1aaebed5bd6so96494375ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 20:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684208296; x=1686800296;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wSK1mLN5HQ5v30sJBAyjRe9Zzz06OyWNH0HEOsUmOKk=;
        b=UBGE7wfWbtC8W+C1v7nskYIWfmfjqDlWsVj7ZVI7k7LGGVpMSnsrSFS9YTgTbdn0Eu
         Ax9jIbMm8PAm3olj+lxs2E4+OKYRfSB7nKcR4p9EJ7LCcs0imQk9zP+sX+X7tEdwSNfD
         NhlSL6uinivE3INTzL4hhDdbtB6QcM10RwTgq4gF7dSJz9j01xY0WlEzWjCd6/LcSHz9
         T3Riq3tlhSHhIBRg6dxxVNYpFi94+beGd05ytn+o7Tilv5VrXdxZi3slQisuDHb662Xf
         BvpjJCMwU7GUPOSHNp9vseoTrcMIjX7gUF7s+Rz6sKIRKEYldHtWEtP8D0fa8C4+x1wP
         KI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684208296; x=1686800296;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSK1mLN5HQ5v30sJBAyjRe9Zzz06OyWNH0HEOsUmOKk=;
        b=gY0WyKgrMZiLOhw8qe8pXfn7P5198skJXP7gFcDROQcHR8pVZchrrI3EvYdIFLzmTK
         WzG5/04IMtMad0QJezi18PH3NZGG+oBjH0VS0JPCOWF1uGzee3eqKEdnC18TDvD1HkHE
         BJc+NEcpWA3V48/79JwtrMJRJLz97oLp8qWaElTpEGOY5Delk7lKXuf/88m5Auv4/r8Q
         O89MlkZMapKJYqBIRpdr17iraC86bazqO5Hj2Vf2O9mq1WdBnxe9uqtvO/IhdNaH9lY/
         6N8rH4XwfE8Vps/Xmk1k31pQNqo/G0SqM3AuZzQ6GnTpa/0uQwC8Dy37nne5Yx5Ns+Z6
         wklQ==
X-Gm-Message-State: AC+VfDzWbtMHhwjgEECqpJBNLnMfWGbHXSXw0unVpZP1H7nrNGIBy7GX
        nmxEz6eknFrABqfkyAh6iiBvWg4P/pz7cKMvIwy79g==
X-Google-Smtp-Source: ACHHUZ4J/fqaD+EZXQKNh8vHTQPJS0Xb8VKxi26MyoBlIIREk5f/D7q/nDPOO2yjYVtz8fbHP/H1NQ==
X-Received: by 2002:a17:902:d505:b0:1a6:dd9a:62c5 with SMTP id b5-20020a170902d50500b001a6dd9a62c5mr45995467plg.10.1684208295075;
        Mon, 15 May 2023 20:38:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m15-20020a17090a668f00b0025063e893c9sm381846pjj.55.2023.05.15.20.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 20:38:14 -0700 (PDT)
Message-ID: <6462faa6.170a0220.c6ab7.0fc3@mx.google.com>
Date:   Mon, 15 May 2023 20:38:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-05-15-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline: 281 runs,
 33 regressions (renesas-next-2023-05-15-v6.4-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 281 runs, 33 regressions (renesas-next-2023-05-15-v6=
.4-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =

fsl-lx2160a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-05-15-v6.4-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-05-15-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      21330625d0f5970080f69db3d7634441d6484a07 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6462141ca3cb0cf9fc2e8616

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6462141ca3cb0cf9fc2e861b
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:14:21.966490  + set +x

    2023-05-15T11:14:21.973213  <8>[    8.344679] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322037_1.4.2.3.1>

    2023-05-15T11:14:22.076219  =


    2023-05-15T11:14:22.178020  / # #export SHELL=3D/bin/sh

    2023-05-15T11:14:22.178835  =


    2023-05-15T11:14:22.280234  / # export SHELL=3D/bin/sh. /lava-10322037/=
environment

    2023-05-15T11:14:22.280443  =


    2023-05-15T11:14:22.380939  / # . /lava-10322037/environment/lava-10322=
037/bin/lava-test-runner /lava-10322037/1

    2023-05-15T11:14:22.381323  =


    2023-05-15T11:14:22.386206  / # /lava-10322037/bin/lava-test-runner /la=
va-10322037/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216b684bd911e7f2e8647

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646216b684bd911e7f2e864c
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:26.959057  <8>[   10.428774] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322174_1.4.2.3.1>

    2023-05-15T11:25:26.962248  + set +x

    2023-05-15T11:25:27.069631  / # #

    2023-05-15T11:25:27.172032  export SHELL=3D/bin/sh

    2023-05-15T11:25:27.172833  #

    2023-05-15T11:25:27.274314  / # export SHELL=3D/bin/sh. /lava-10322174/=
environment

    2023-05-15T11:25:27.275060  =


    2023-05-15T11:25:27.376485  / # . /lava-10322174/environment/lava-10322=
174/bin/lava-test-runner /lava-10322174/1

    2023-05-15T11:25:27.377818  =


    2023-05-15T11:25:27.424056  / # /lava-10322174/bin/lava-test-runner /la=
va-10322174/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646214227bfca4bfaf2e8620

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646214227bfca4bfaf2e8625
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:14:25.621200  + set<8>[   11.075113] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10322011_1.4.2.3.1>

    2023-05-15T11:14:25.621289   +x

    2023-05-15T11:14:25.726054  / # #

    2023-05-15T11:14:25.826686  export SHELL=3D/bin/sh

    2023-05-15T11:14:25.826931  #

    2023-05-15T11:14:25.927472  / # export SHELL=3D/bin/sh. /lava-10322011/=
environment

    2023-05-15T11:14:25.927693  =


    2023-05-15T11:14:26.028233  / # . /lava-10322011/environment/lava-10322=
011/bin/lava-test-runner /lava-10322011/1

    2023-05-15T11:14:26.028544  =


    2023-05-15T11:14:26.033359  / # /lava-10322011/bin/lava-test-runner /la=
va-10322011/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216b2d6906ef6be2e8632

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646216b2d6906ef6be2e8637
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:19.203896  + set +x<8>[   11.573495] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10322155_1.4.2.3.1>

    2023-05-15T11:25:19.204024  =


    2023-05-15T11:25:19.308472  / # #

    2023-05-15T11:25:19.409073  export SHELL=3D/bin/sh

    2023-05-15T11:25:19.409258  #

    2023-05-15T11:25:19.509836  / # export SHELL=3D/bin/sh. /lava-10322155/=
environment

    2023-05-15T11:25:19.510003  =


    2023-05-15T11:25:19.610537  / # . /lava-10322155/environment/lava-10322=
155/bin/lava-test-runner /lava-10322155/1

    2023-05-15T11:25:19.610812  =


    2023-05-15T11:25:19.616051  / # /lava-10322155/bin/lava-test-runner /la=
va-10322155/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64621418418e9d11092e861a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64621418418e9d11092e861f
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:14:20.931453  <8>[    7.930485] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322012_1.4.2.3.1>

    2023-05-15T11:14:20.934627  + set +x

    2023-05-15T11:14:21.036074  =


    2023-05-15T11:14:21.136654  / # #export SHELL=3D/bin/sh

    2023-05-15T11:14:21.136890  =


    2023-05-15T11:14:21.237407  / # export SHELL=3D/bin/sh. /lava-10322012/=
environment

    2023-05-15T11:14:21.237633  =


    2023-05-15T11:14:21.338225  / # . /lava-10322012/environment/lava-10322=
012/bin/lava-test-runner /lava-10322012/1

    2023-05-15T11:14:21.338648  =


    2023-05-15T11:14:21.344073  / # /lava-10322012/bin/lava-test-runner /la=
va-10322012/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216afcc1bc639762e863f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646216afcc1bc639762e8644
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:18.654926  <8>[    7.985123] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322133_1.4.2.3.1>

    2023-05-15T11:25:18.658196  + set +x

    2023-05-15T11:25:18.759579  #

    2023-05-15T11:25:18.759805  =


    2023-05-15T11:25:18.860399  / # #export SHELL=3D/bin/sh

    2023-05-15T11:25:18.860547  =


    2023-05-15T11:25:18.961065  / # export SHELL=3D/bin/sh. /lava-10322133/=
environment

    2023-05-15T11:25:18.961212  =


    2023-05-15T11:25:19.061707  / # . /lava-10322133/environment/lava-10322=
133/bin/lava-test-runner /lava-10322133/1

    2023-05-15T11:25:19.061947  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64621515e17f0b1f2c2e8611

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64621515e17f0b1f2c2e8=
612
        failing since 69 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/646211b39a8aa588f32e8621

  Results:     52 PASS, 3 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646211b49a8aa588f32e8652
        new failure (last pass: renesas-next-2023-04-04-v6.3-rc1)

    2023-05-15T11:04:05.278839  + set +x
    2023-05-15T11:04:05.282832  <8>[   22.687765] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 461270_1.5.2.4.1>
    2023-05-15T11:04:05.392587  / # #
    2023-05-15T11:04:05.494634  export SHELL=3D/bin/sh
    2023-05-15T11:04:05.495164  #
    2023-05-15T11:04:05.596590  / # export SHELL=3D/bin/sh. /lava-461270/en=
vironment
    2023-05-15T11:04:05.597138  =

    2023-05-15T11:04:05.698787  / # . /lava-461270/environment/lava-461270/=
bin/lava-test-runner /lava-461270/1
    2023-05-15T11:04:05.699802  =

    2023-05-15T11:04:05.704378  / # /lava-461270/bin/lava-test-runner /lava=
-461270/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-lx2160a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6462165945a1c924802e863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/ba=
seline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/ba=
seline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6462165945a1c924802e863d
        new failure (last pass: renesas-next-2022-11-17-v6.1-rc1)

    2023-05-15T11:23:48.400129  [   12.431119] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1221713_1.5.2.4.1>
    2023-05-15T11:23:48.504668  / # #
    2023-05-15T11:23:48.606083  export SHELL=3D/bin/sh
    2023-05-15T11:23:48.606359  #
    2023-05-15T11:23:48.707349  / # export SHELL=3D/bin/sh. /lava-1221713/e=
nvironment
    2023-05-15T11:23:48.707617  =

    2023-05-15T11:23:48.808627  / # . /lava-1221713/environment/lava-122171=
3/bin/lava-test-runner /lava-1221713/1
    2023-05-15T11:23:48.809050  =

    2023-05-15T11:23:48.810762  / # /lava-1221713/bin/lava-test-runner /lav=
a-1221713/1
    2023-05-15T11:23:48.836095  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646215ac5cfec246832e8639

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646215ac5cfec246832e863e
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:21:02.764163  + set +x

    2023-05-15T11:21:02.770315  <8>[   10.642245] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322031_1.4.2.3.1>

    2023-05-15T11:21:02.877737  / # #

    2023-05-15T11:21:02.980092  export SHELL=3D/bin/sh

    2023-05-15T11:21:02.980889  #

    2023-05-15T11:21:03.082419  / # export SHELL=3D/bin/sh. /lava-10322031/=
environment

    2023-05-15T11:21:03.083142  =


    2023-05-15T11:21:03.184393  / # . /lava-10322031/environment/lava-10322=
031/bin/lava-test-runner /lava-10322031/1

    2023-05-15T11:21:03.184722  =


    2023-05-15T11:21:03.189615  / # /lava-10322031/bin/lava-test-runner /la=
va-10322031/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6462169fd6906ef6be2e8616

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6462169fd6906ef6be2e861b
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:06.214023  + set +x

    2023-05-15T11:25:06.220093  <8>[    8.092664] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322165_1.4.2.3.1>

    2023-05-15T11:25:06.324711  / # #

    2023-05-15T11:25:06.425275  export SHELL=3D/bin/sh

    2023-05-15T11:25:06.425465  #

    2023-05-15T11:25:06.525965  / # export SHELL=3D/bin/sh. /lava-10322165/=
environment

    2023-05-15T11:25:06.526196  =


    2023-05-15T11:25:06.626691  / # . /lava-10322165/environment/lava-10322=
165/bin/lava-test-runner /lava-10322165/1

    2023-05-15T11:25:06.626986  =


    2023-05-15T11:25:06.631599  / # /lava-10322165/bin/lava-test-runner /la=
va-10322165/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64621512cd0369afed2e8602

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64621512cd0369afed2e8607
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:18:24.759709  <8>[   10.940983] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322000_1.4.2.3.1>

    2023-05-15T11:18:24.762609  + set +x

    2023-05-15T11:18:24.867034  / # #

    2023-05-15T11:18:24.967786  export SHELL=3D/bin/sh

    2023-05-15T11:18:24.968009  #

    2023-05-15T11:18:25.068604  / # export SHELL=3D/bin/sh. /lava-10322000/=
environment

    2023-05-15T11:18:25.068833  =


    2023-05-15T11:18:25.169406  / # . /lava-10322000/environment/lava-10322=
000/bin/lava-test-runner /lava-10322000/1

    2023-05-15T11:18:25.169724  =


    2023-05-15T11:18:25.174672  / # /lava-10322000/bin/lava-test-runner /la=
va-10322000/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6462169eea11352e142e8622

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6462169eea11352e142e8627
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:03.925961  <8>[   10.575528] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322145_1.4.2.3.1>

    2023-05-15T11:25:03.929335  + set +x

    2023-05-15T11:25:04.030801  #

    2023-05-15T11:25:04.131719  / # #export SHELL=3D/bin/sh

    2023-05-15T11:25:04.131959  =


    2023-05-15T11:25:04.232494  / # export SHELL=3D/bin/sh. /lava-10322145/=
environment

    2023-05-15T11:25:04.232725  =


    2023-05-15T11:25:04.333281  / # . /lava-10322145/environment/lava-10322=
145/bin/lava-test-runner /lava-10322145/1

    2023-05-15T11:25:04.333586  =


    2023-05-15T11:25:04.338347  / # /lava-10322145/bin/lava-test-runner /la=
va-10322145/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6462142d72b018269e2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6462142d72b018269e2e85eb
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:14:37.334616  + set +x<8>[   11.307279] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10322029_1.4.2.3.1>

    2023-05-15T11:14:37.335086  =


    2023-05-15T11:14:37.443602  / # #

    2023-05-15T11:14:37.544260  export SHELL=3D/bin/sh

    2023-05-15T11:14:37.544449  #

    2023-05-15T11:14:37.644918  / # export SHELL=3D/bin/sh. /lava-10322029/=
environment

    2023-05-15T11:14:37.645101  =


    2023-05-15T11:14:37.745590  / # . /lava-10322029/environment/lava-10322=
029/bin/lava-test-runner /lava-10322029/1

    2023-05-15T11:14:37.745919  =


    2023-05-15T11:14:37.750600  / # /lava-10322029/bin/lava-test-runner /la=
va-10322029/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216aa84bd911e7f2e862c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646216aa84bd911e7f2e8631
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:13.368207  + <8>[   11.655795] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10322203_1.4.2.3.1>

    2023-05-15T11:25:13.368325  set +x

    2023-05-15T11:25:13.472735  / # #

    2023-05-15T11:25:13.573373  export SHELL=3D/bin/sh

    2023-05-15T11:25:13.573622  #

    2023-05-15T11:25:13.674212  / # export SHELL=3D/bin/sh. /lava-10322203/=
environment

    2023-05-15T11:25:13.674418  =


    2023-05-15T11:25:13.774959  / # . /lava-10322203/environment/lava-10322=
203/bin/lava-test-runner /lava-10322203/1

    2023-05-15T11:25:13.775282  =


    2023-05-15T11:25:13.780605  / # /lava-10322203/bin/lava-test-runner /la=
va-10322203/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646218120ba073c2172e8613

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646218120ba073c2172e8=
614
        failing since 238 days (last pass: renesas-next-2022-08-30-v6.0-rc1=
, first fail: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6462179ac756077b8a2e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6462179ac756077b8a2e8=
5f9
        failing since 258 days (last pass: renesas-next-2022-08-29-v6.0-rc1=
, first fail: renesas-next-2022-08-30-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64621416418e9d11092e8602

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64621416418e9d11092e8607
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:14:10.443876  <8>[   11.935010] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322003_1.4.2.3.1>

    2023-05-15T11:14:10.548336  / # #

    2023-05-15T11:14:10.649079  export SHELL=3D/bin/sh

    2023-05-15T11:14:10.649335  #

    2023-05-15T11:14:10.749889  / # export SHELL=3D/bin/sh. /lava-10322003/=
environment

    2023-05-15T11:14:10.750180  =


    2023-05-15T11:14:10.850759  / # . /lava-10322003/environment/lava-10322=
003/bin/lava-test-runner /lava-10322003/1

    2023-05-15T11:14:10.851129  =


    2023-05-15T11:14:10.856311  / # /lava-10322003/bin/lava-test-runner /la=
va-10322003/1

    2023-05-15T11:14:10.863189  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216b8d6906ef6be2e863f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646216b8d6906ef6be2e8644
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:22.636019  <8>[    8.834466] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322182_1.4.2.3.1>

    2023-05-15T11:25:22.740565  / # #

    2023-05-15T11:25:22.841420  export SHELL=3D/bin/sh

    2023-05-15T11:25:22.842199  #

    2023-05-15T11:25:22.943745  / # export SHELL=3D/bin/sh. /lava-10322182/=
environment

    2023-05-15T11:25:22.944509  =


    2023-05-15T11:25:23.046023  / # . /lava-10322182/environment/lava-10322=
182/bin/lava-test-runner /lava-10322182/1

    2023-05-15T11:25:23.047280  =


    2023-05-15T11:25:23.052115  / # /lava-10322182/bin/lava-test-runner /la=
va-10322182/1

    2023-05-15T11:25:23.058511  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6462197306b0f99d0a2e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6462197306b0f99d0a2e8=
607
        failing since 185 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64621778b41819d9d02e8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64621778b41819d9d02e8=
635
        failing since 185 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646219493351d1d96c2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646219493351d1d96c2e8=
5e7
        failing since 185 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6462176fb41819d9d02e862b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6462176fb41819d9d02e8=
62c
        failing since 185 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/646219713351d1d96c2e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646219713351d1d96c2e8=
608
        failing since 185 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64621770b41819d9d02e862e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64621770b41819d9d02e8=
62f
        failing since 185 days (last pass: renesas-next-2022-09-26-v6.0-rc1=
, first fail: renesas-next-2022-11-10-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6462193558cc9486072e8628

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6462193558cc9486072e8=
629
        failing since 230 days (last pass: renesas-next-2022-09-18-v6.0-rc1=
, first fail: renesas-next-2022-09-26-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6462175bb41819d9d02e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6462175bb41819d9d02e8=
5ef
        failing since 230 days (last pass: renesas-next-2022-09-18-v6.0-rc1=
, first fail: renesas-next-2022-09-26-v6.0-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646215b55cfec246832e8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646215b55cfec246832e8=
651
        failing since 139 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6462144daa67962e0e2e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6462144daa67962e0e2e8=
5f0
        failing since 139 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6462116a1ade1c2d9e2e85f0

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6462116a1ade1c2=
d9e2e85f7
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        2 lines

    2023-05-15T11:03:01.653897  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-15T11:03:01.654411  kern  :emerg : Code: 97f9d910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-15T11:03:01.654745  <8>[   21.410763] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-15T11:03:01.655063  + set +x

    2023-05-15T11:03:01.655370  <8>[   21.413249] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10321840_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6462116a1ade1c2=
d9e2e85f8
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        12 lines

    2023-05-15T11:03:01.609385  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-15T11:03:01.609937  kern  :alert : Mem abort info:

    2023-05-15T11:03:01.610274  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-15T11:03:01.610590  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-15T11:03:01.610897  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-15T11:03:01.611193  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-15T11:03:01.611480  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-15T11:03:01.611765  kern  :alert : Data abort info:

    2023-05-15T11:03:01.612043  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-15T11:03:01.612349  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/646215e9fd142f722d2e866e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646215e9fd142f7=
22d2e8675
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)
        2 lines

    2023-05-15T11:22:03.304922  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-15T11:22:03.305482  kern  :emerg : Code: 97fd7910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-15T11:22:03.305834  <8>[   22.041171] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-15T11:22:03.306158  + set +x

    2023-05-15T11:22:03.306477  <8>[   22.043771] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322077_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646215e9fd142f7=
22d2e8676
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)
        12 lines

    2023-05-15T11:22:03.280141  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-15T11:22:03.280666  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-15T11:22:03.281010  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078ccb000

    2023-05-15T11:22:03.281331  kern  :alert : [0000000000000008] pgd=3D080=
000007911e003, p4d=3D080000007911e003, pud=3D080000007911d003, pmd=3D000000=
0000000000

    2023-05-15T11:22:03.281669  <8>[   22.017727] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =20
