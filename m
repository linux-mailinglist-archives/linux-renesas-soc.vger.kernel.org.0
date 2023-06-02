Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3B17208E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 20:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235724AbjFBSQi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 14:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbjFBSQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 14:16:37 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68F018D
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 11:16:32 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b04949e4e9so12767535ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Jun 2023 11:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685729792; x=1688321792;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LI6tMEM4xfA58fMguRR2KkArzXUgV/aQmQaXoiP4MVU=;
        b=twcjv9aBFY+HqP3/hZVKxtMHgWoNmZKqtJJvuhL9isGJsVQbzV90ZylO27gi0CJWjq
         AsfhRYamjtldRBLM7xQiHnPj05lbjDu/UgOdxCMO6k4gnUqQJ3MYGSy9byiehotgP0gx
         PitzLlp02z7xOSbijS+MoObwN6mHgG7zMogAVuTXQOx3xQJostF50fx9Bc69SM9cPVi1
         Ku3ns6VpT2ed6N+cKTeMLaWSmilaHQuPzHDNMP/IE9zoqd3RV7xnlXLaAfRTeEooUumB
         UnqoR8FvxbDSvK8UfDl+mOEjX8uVtW0JY4u5Prki9DdfgBJWxu2YPjzrdm/WbQZJ96Fo
         2imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685729792; x=1688321792;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LI6tMEM4xfA58fMguRR2KkArzXUgV/aQmQaXoiP4MVU=;
        b=X+7vN5PKhDOH62SDW0KglL/j1KVvu1JHCq5EU5+pPPSYr1yT/5qqXUXX89gJe6xSeq
         L40t+qYHWHwOx8O6WuqRmJfyrY91xHVarIOD49P7+tIGcOuLxs0+4S6L7aMevaQUPgbY
         24g9XA0X8ChpDJgVAZ3MI5y98Sn1JdCoRTM0luk0tOir0XKnG8H8RL94cShsE2zoGXj5
         ME6LE/BaW1xDcsZmPwUyLmYkfYvxF7QJ+4KH9QeN7hUH29UfArgD1jgMWyQDpO/lKWKY
         I69kl8Nl6JIXaYAM4ghsyyniL7pNVV68SH+p5Xgd+ZVqwPB9bSdnyoL40vH3V5Mzfl/K
         tShg==
X-Gm-Message-State: AC+VfDz6d2/yvOIs84rgyAv4RxATHK9scpYHDGD/Xg1C8Xitz+UG45uf
        zihmzBJ/4aK3OzGHJZUz1J82at6kQ/IImEJTATuNcA==
X-Google-Smtp-Source: ACHHUZ5LTU1FnowI7b4T24YrDShY7n4mobl0qjmv/4sHEfSg8LQqafIX4J1Qayb7ulYzXKDWASNGRA==
X-Received: by 2002:a17:903:50c:b0:1af:ea40:34e6 with SMTP id jn12-20020a170903050c00b001afea4034e6mr549001plb.60.1685729790729;
        Fri, 02 Jun 2023 11:16:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o13-20020a170903210d00b001aae625e422sm1691702ple.37.2023.06.02.11.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 11:16:30 -0700 (PDT)
Message-ID: <647a31fe.170a0220.b85aa.3483@mx.google.com>
Date:   Fri, 02 Jun 2023 11:16:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-02-v6.4-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 301 runs,
 48 regressions (renesas-devel-2023-06-02-v6.4-rc4)
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

renesas/master baseline: 301 runs, 48 regressions (renesas-devel-2023-06-02=
-v6.4-rc4)

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

beaglebone-black             | arm    | lab-cip         | gcc-10   | omap2p=
lus_defconfig          | 3          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

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

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-02-v6.4-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-02-v6.4-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c6f027b1ddedc24bffa0d60dc92d2e774cf3e19e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f779e93beb62c3f5de4e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f779e93beb62c3f5de57
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:06:39.858292  + set +x

    2023-06-02T14:06:39.865457  <8>[   10.575217] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565874_1.4.2.3.1>

    2023-06-02T14:06:39.969432  / # #

    2023-06-02T14:06:40.070108  export SHELL=3D/bin/sh

    2023-06-02T14:06:40.070292  #

    2023-06-02T14:06:40.170811  / # export SHELL=3D/bin/sh. /lava-10565874/=
environment

    2023-06-02T14:06:40.171004  =


    2023-06-02T14:06:40.271481  / # . /lava-10565874/environment/lava-10565=
874/bin/lava-test-runner /lava-10565874/1

    2023-06-02T14:06:40.271725  =


    2023-06-02T14:06:40.277573  / # /lava-10565874/bin/lava-test-runner /la=
va-10565874/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9d1c894475fa3f5de34

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f9d1c894475fa3f5de3d
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:16:37.914308  <8>[   10.353260] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10566026_1.4.2.3.1>

    2023-06-02T14:16:37.917681  + set +x

    2023-06-02T14:16:38.023074  #

    2023-06-02T14:16:38.024395  =


    2023-06-02T14:16:38.126228  / # #export SHELL=3D/bin/sh

    2023-06-02T14:16:38.127037  =


    2023-06-02T14:16:38.228614  / # export SHELL=3D/bin/sh. /lava-10566026/=
environment

    2023-06-02T14:16:38.229443  =


    2023-06-02T14:16:38.331099  / # . /lava-10566026/environment/lava-10566=
026/bin/lava-test-runner /lava-10566026/1

    2023-06-02T14:16:38.332510  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f77b30eac93d65f5de27

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f77b30eac93d65f5de30
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:06:34.469068  + set<8>[   11.234068] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10565849_1.4.2.3.1>

    2023-06-02T14:06:34.469154   +x

    2023-06-02T14:06:34.573551  / # #

    2023-06-02T14:06:34.674150  export SHELL=3D/bin/sh

    2023-06-02T14:06:34.674302  #

    2023-06-02T14:06:34.774823  / # export SHELL=3D/bin/sh. /lava-10565849/=
environment

    2023-06-02T14:06:34.774973  =


    2023-06-02T14:06:34.875568  / # . /lava-10565849/environment/lava-10565=
849/bin/lava-test-runner /lava-10565849/1

    2023-06-02T14:06:34.875856  =


    2023-06-02T14:06:34.880587  / # /lava-10565849/bin/lava-test-runner /la=
va-10565849/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f98c00e79c9c24f5de38

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f98c00e79c9c24f5de41
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:15:15.759719  + <8>[   11.206342] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10566049_1.4.2.3.1>

    2023-06-02T14:15:15.760263  set +x

    2023-06-02T14:15:15.868797  / # #

    2023-06-02T14:15:15.971031  export SHELL=3D/bin/sh

    2023-06-02T14:15:15.971708  #

    2023-06-02T14:15:16.073049  / # export SHELL=3D/bin/sh. /lava-10566049/=
environment

    2023-06-02T14:15:16.073726  =


    2023-06-02T14:15:16.175158  / # . /lava-10566049/environment/lava-10566=
049/bin/lava-test-runner /lava-10566049/1

    2023-06-02T14:15:16.176522  =


    2023-06-02T14:15:16.181205  / # /lava-10566049/bin/lava-test-runner /la=
va-10566049/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f775e93beb62c3f5de3e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f775e93beb62c3f5de47
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:06:22.420761  <8>[   10.370641] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565865_1.4.2.3.1>

    2023-06-02T14:06:22.424300  + set +x

    2023-06-02T14:06:22.525714  =


    2023-06-02T14:06:22.626313  / # #export SHELL=3D/bin/sh

    2023-06-02T14:06:22.626500  =


    2023-06-02T14:06:22.727031  / # export SHELL=3D/bin/sh. /lava-10565865/=
environment

    2023-06-02T14:06:22.727215  =


    2023-06-02T14:06:22.827696  / # . /lava-10565865/environment/lava-10565=
865/bin/lava-test-runner /lava-10565865/1

    2023-06-02T14:06:22.827958  =


    2023-06-02T14:06:22.832834  / # /lava-10565865/bin/lava-test-runner /la=
va-10565865/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9743b40200365f5de3c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f9743b40200365f5de44
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:15:05.748536  <8>[   10.400383] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10566028_1.4.2.3.1>

    2023-06-02T14:15:05.752136  + set +x

    2023-06-02T14:15:05.857515  #

    2023-06-02T14:15:05.858904  =


    2023-06-02T14:15:05.960761  / # #export SHELL=3D/bin/sh

    2023-06-02T14:15:05.961612  =


    2023-06-02T14:15:06.063125  / # export SHELL=3D/bin/sh. /lava-10566028/=
environment

    2023-06-02T14:15:06.063884  =


    2023-06-02T14:15:06.165457  / # . /lava-10566028/environment/lava-10566=
028/bin/lava-test-runner /lava-10566028/1

    2023-06-02T14:15:06.166855  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fbc7d754a3e927f5de30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479fbc7d754a3e927f5d=
e31
        failing since 87 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | omap2p=
lus_defconfig          | 3          =


  Details:     https://kernelci.org/test/plan/id/647a0951c305abc40af5decb

  Results:     48 PASS, 6 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.usb0-musb-dsps-probed: https://kernelci.org/test/case/i=
d/647a0951c305abc40af5dee6
        failing since 3 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T15:22:50.378892  /lava-949883/1/../bin/lava-test-case
    2023-06-02T15:22:50.427045  <8>[   19.513295] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb0-musb-dsps-probed RESULT=3Dfail>   =


  * baseline.bootrr.usb1-musb-dsps-probed: https://kernelci.org/test/case/i=
d/647a0951c305abc40af5dee7
        failing since 3 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T15:22:51.470313  /lava-949883/1/../bin/lava-test-case
    2023-06-02T15:22:51.517430  <8>[   20.603714] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb1-musb-dsps-probed RESULT=3Dfail>   =


  * baseline.bootrr.am335x-phy-driver-present: https://kernelci.org/test/ca=
se/id/647a0951c305abc40af5dee8
        failing since 3 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T15:22:52.550719  /lava-949883/1/../bin/lava-test-case
    2023-06-02T15:22:52.597327  <8>[   21.683364] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dam335x-phy-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f7ebde791491e3f5de29

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f7ebde791491e3f5de32
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:08:27.442390  + set +x

    2023-06-02T14:08:27.449247  <8>[   10.516178] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565883_1.4.2.3.1>

    2023-06-02T14:08:27.557623  / # #

    2023-06-02T14:08:27.660035  export SHELL=3D/bin/sh

    2023-06-02T14:08:27.660816  #

    2023-06-02T14:08:27.762374  / # export SHELL=3D/bin/sh. /lava-10565883/=
environment

    2023-06-02T14:08:27.763177  =


    2023-06-02T14:08:27.864913  / # . /lava-10565883/environment/lava-10565=
883/bin/lava-test-runner /lava-10565883/1

    2023-06-02T14:08:27.866184  =


    2023-06-02T14:08:27.871135  / # /lava-10565883/bin/lava-test-runner /la=
va-10565883/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f973c83e486af5f5de4b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f973c83e486af5f5de54
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:14:58.474304  + set +x

    2023-06-02T14:14:58.480416  <8>[    8.120585] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10566002_1.4.2.3.1>

    2023-06-02T14:14:58.588441  / # #

    2023-06-02T14:14:58.690756  export SHELL=3D/bin/sh

    2023-06-02T14:14:58.691433  #

    2023-06-02T14:14:58.792785  / # export SHELL=3D/bin/sh. /lava-10566002/=
environment

    2023-06-02T14:14:58.793500  =


    2023-06-02T14:14:58.894832  / # . /lava-10566002/environment/lava-10566=
002/bin/lava-test-runner /lava-10566002/1

    2023-06-02T14:14:58.895217  =


    2023-06-02T14:14:58.899833  / # /lava-10566002/bin/lava-test-runner /la=
va-10566002/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f776983b423238f5de50

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f776983b423238f5de59
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:06:34.126648  + <8>[   10.994785] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10565847_1.4.2.3.1>

    2023-06-02T14:06:34.126732  set +x

    2023-06-02T14:06:34.231274  / # #

    2023-06-02T14:06:34.331919  export SHELL=3D/bin/sh

    2023-06-02T14:06:34.332119  #

    2023-06-02T14:06:34.432633  / # export SHELL=3D/bin/sh. /lava-10565847/=
environment

    2023-06-02T14:06:34.432837  =


    2023-06-02T14:06:34.533374  / # . /lava-10565847/environment/lava-10565=
847/bin/lava-test-runner /lava-10565847/1

    2023-06-02T14:06:34.533668  =


    2023-06-02T14:06:34.538159  / # /lava-10565847/bin/lava-test-runner /la=
va-10565847/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9793b40200365f5de54

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f9793b40200365f5de5d
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:15:08.338093  + <8>[   10.686766] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10566003_1.4.2.3.1>

    2023-06-02T14:15:08.338175  set +x

    2023-06-02T14:15:08.442616  / # #

    2023-06-02T14:15:08.543193  export SHELL=3D/bin/sh

    2023-06-02T14:15:08.543383  #

    2023-06-02T14:15:08.643863  / # export SHELL=3D/bin/sh. /lava-10566003/=
environment

    2023-06-02T14:15:08.644054  =


    2023-06-02T14:15:08.744570  / # . /lava-10566003/environment/lava-10566=
003/bin/lava-test-runner /lava-10566003/1

    2023-06-02T14:15:08.744835  =


    2023-06-02T14:15:08.749224  / # /lava-10566003/bin/lava-test-runner /la=
va-10566003/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f83f23406741a4f5de3b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f83f23406741a4f5de44
        failing since 123 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-02T14:09:43.570898  + set +x
    2023-06-02T14:09:43.571144  [   13.149059] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965878_1.5.2.3.1>
    2023-06-02T14:09:43.679442  / # #
    2023-06-02T14:09:43.781142  export SHELL=3D/bin/sh
    2023-06-02T14:09:43.781708  #
    2023-06-02T14:09:43.883155  / # export SHELL=3D/bin/sh. /lava-965878/en=
vironment
    2023-06-02T14:09:43.883664  =

    2023-06-02T14:09:43.985043  / # . /lava-965878/environment/lava-965878/=
bin/lava-test-runner /lava-965878/1
    2023-06-02T14:09:43.985730  =

    2023-06-02T14:09:43.989188  / # /lava-965878/bin/lava-test-runner /lava=
-965878/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f95799d6343f01f5de35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f95799d6343f01f5de3e
        failing since 123 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-02T14:14:25.291573  + set +x
    2023-06-02T14:14:25.291741  [   13.172693] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965894_1.5.2.3.1>
    2023-06-02T14:14:25.399160  / # #
    2023-06-02T14:14:25.501082  export SHELL=3D/bin/sh
    2023-06-02T14:14:25.501608  #
    2023-06-02T14:14:25.602900  / # export SHELL=3D/bin/sh. /lava-965894/en=
vironment
    2023-06-02T14:14:25.603392  =

    2023-06-02T14:14:25.704668  / # . /lava-965894/environment/lava-965894/=
bin/lava-test-runner /lava-965894/1
    2023-06-02T14:14:25.705322  =

    2023-06-02T14:14:25.708831  / # /lava-965894/bin/lava-test-runner /lava=
-965894/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9bb9a66e64da6f5de53

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f9bb9a66e64da6f5de5c
        failing since 123 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-02T14:16:02.801965  + set +x
    2023-06-02T14:16:02.802134  [   12.827280] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965902_1.5.2.3.1>
    2023-06-02T14:16:02.909615  / # #
    2023-06-02T14:16:03.011186  export SHELL=3D/bin/sh
    2023-06-02T14:16:03.011606  #
    2023-06-02T14:16:03.112833  / # export SHELL=3D/bin/sh. /lava-965902/en=
vironment
    2023-06-02T14:16:03.113387  =

    2023-06-02T14:16:03.214708  / # . /lava-965902/environment/lava-965902/=
bin/lava-test-runner /lava-965902/1
    2023-06-02T14:16:03.215231  =

    2023-06-02T14:16:03.218864  / # /lava-965902/bin/lava-test-runner /lava=
-965902/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fa1f8a1846207df5de30

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479fa1f8a1846207df5de39
        failing since 123 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-02T14:17:47.518835  + set +x
    2023-06-02T14:17:47.519217  [   14.351034] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965908_1.5.2.3.1>
    2023-06-02T14:17:47.626926  / # #
    2023-06-02T14:17:47.728622  export SHELL=3D/bin/sh
    2023-06-02T14:17:47.729241  #
    2023-06-02T14:17:47.830662  / # export SHELL=3D/bin/sh. /lava-965908/en=
vironment
    2023-06-02T14:17:47.831284  =

    2023-06-02T14:17:47.932835  / # . /lava-965908/environment/lava-965908/=
bin/lava-test-runner /lava-965908/1
    2023-06-02T14:17:47.933636  =

    2023-06-02T14:17:47.936868  / # /lava-965908/bin/lava-test-runner /lava=
-965908/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fc12eccbbadabcf5de26

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479fc12eccbbadabcf5de2f
        failing since 123 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-02T14:26:01.287884  + set +x
    2023-06-02T14:26:01.288063  [   12.158683] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965914_1.5.2.3.1>
    2023-06-02T14:26:01.394429  / # #
    2023-06-02T14:26:01.495921  export SHELL=3D/bin/sh
    2023-06-02T14:26:01.496418  #
    2023-06-02T14:26:01.597702  / # export SHELL=3D/bin/sh. /lava-965914/en=
vironment
    2023-06-02T14:26:01.598127  =

    2023-06-02T14:26:01.699471  / # . /lava-965914/environment/lava-965914/=
bin/lava-test-runner /lava-965914/1
    2023-06-02T14:26:01.700016  =

    2023-06-02T14:26:01.703210  / # /lava-965914/bin/lava-test-runner /lava=
-965914/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9ba9020cea176f5de5d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f9ba9020cea176f5de66
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T14:16:03.254661  + set[   15.037023] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 965899_1.5.2.3.1>
    2023-06-02T14:16:03.254854   +x
    2023-06-02T14:16:03.361176  / # #
    2023-06-02T14:16:03.462937  export SHELL=3D/bin/sh
    2023-06-02T14:16:03.463393  #
    2023-06-02T14:16:03.564784  / # export SHELL=3D/bin/sh. /lava-965899/en=
vironment
    2023-06-02T14:16:03.565329  =

    2023-06-02T14:16:03.666684  / # . /lava-965899/environment/lava-965899/=
bin/lava-test-runner /lava-965899/1
    2023-06-02T14:16:03.667339  =

    2023-06-02T14:16:03.670770  / # /lava-965899/bin/lava-test-runner /lava=
-965899/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ff976e88f8601ef5de42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479ff976e88f8601ef5d=
e43
        failing since 203 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9e1c894475fa3f5de7c

  Results:     29 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.dwhdmi-imx-driver-present: https://kernelci.org/test/ca=
se/id/6479f9e1c894475fa3f5de87
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T14:16:39.370871  /lava-552673/1/../bin/lava-test-case
    2023-06-02T14:16:39.400665  <8>[   25.553391] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwhdmi-imx-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f7ee21b68711d7f5de36

  Results:     29 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q=
-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q=
-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.dwhdmi-imx-driver-present: https://kernelci.org/test/ca=
se/id/6479f7ee21b68711d7f5de41
        failing since 3 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T14:08:18.702803  /lava-552575/1/../bin/lava-test-case
    2023-06-02T14:08:18.731265  <8>[   24.712375] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwhdmi-imx-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9e3210f043712f5de2c

  Results:     29 PASS, 3 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.dwhdmi-imx-driver-present: https://kernelci.org/test/ca=
se/id/6479f9e3210f043712f5de37
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T14:16:41.670396  /lava-552702/1/../bin/lava-test-case
    2023-06-02T14:16:41.697625  <8>[   29.568146] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwhdmi-imx-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9bc707d2e3f10f5de63

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f9bc707d2e3f10f5de6c
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T14:16:14.497133  + set[   18.744480] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 965904_1.5.2.3.1>
    2023-06-02T14:16:14.497314   +x
    2023-06-02T14:16:14.603784  / # #
    2023-06-02T14:16:14.705358  export SHELL=3D/bin/sh
    2023-06-02T14:16:14.705811  #
    2023-06-02T14:16:14.807215  / # export SHELL=3D/bin/sh. /lava-965904/en=
vironment
    2023-06-02T14:16:14.807738  =

    2023-06-02T14:16:14.909149  / # . /lava-965904/environment/lava-965904/=
bin/lava-test-runner /lava-965904/1
    2023-06-02T14:16:14.909820  =

    2023-06-02T14:16:14.912881  / # /lava-965904/bin/lava-test-runner /lava=
-965904/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ff5aba508c5975f5dea5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479ff5aba508c5975f5d=
ea6
        failing since 203 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f76441c5cfa868f5dec6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f76441c5cfa868f5decf
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:06:17.399794  <8>[    9.454217] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565880_1.4.2.3.1>

    2023-06-02T14:06:17.504274  / # #

    2023-06-02T14:06:17.604825  export SHELL=3D/bin/sh

    2023-06-02T14:06:17.604962  #

    2023-06-02T14:06:17.705492  / # export SHELL=3D/bin/sh. /lava-10565880/=
environment

    2023-06-02T14:06:17.705632  =


    2023-06-02T14:06:17.806166  / # . /lava-10565880/environment/lava-10565=
880/bin/lava-test-runner /lava-10565880/1

    2023-06-02T14:06:17.806481  =


    2023-06-02T14:06:17.810915  / # /lava-10565880/bin/lava-test-runner /la=
va-10565880/1

    2023-06-02T14:06:17.817517  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9753b40200365f5de47

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f9763b40200365f5de50
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:14:58.633391  <8>[   11.739839] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10566050_1.4.2.3.1>

    2023-06-02T14:14:58.740727  / # #

    2023-06-02T14:14:58.842807  export SHELL=3D/bin/sh

    2023-06-02T14:14:58.843501  #

    2023-06-02T14:14:58.944653  / # export SHELL=3D/bin/sh. /lava-10566050/=
environment

    2023-06-02T14:14:58.944854  =


    2023-06-02T14:14:59.045421  / # . /lava-10566050/environment/lava-10566=
050/bin/lava-test-runner /lava-10566050/1

    2023-06-02T14:14:59.045735  =


    2023-06-02T14:14:59.049964  / # /lava-10566050/bin/lava-test-runner /la=
va-10566050/1

    2023-06-02T14:14:59.056936  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647a0198539eaf7bbbf5de2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647a0198539eaf7bbbf5d=
e2f
        failing since 108 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647a01ecbc2ee1d8abf5de67

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647a01ecbc2ee1d8abf5d=
e68
        failing since 227 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ff77e38c123843f5decd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479ff77e38c123843f5d=
ece
        failing since 227 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647a01edbc2ee1d8abf5de6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647a01edbc2ee1d8abf5d=
e6b
        failing since 227 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ff8af365f43ca6f5de78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479ff8af365f43ca6f5d=
e79
        failing since 227 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647a01eabc2ee1d8abf5de64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647a01eabc2ee1d8abf5d=
e65
        failing since 227 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ff7686b8bb0517f5de3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479ff7686b8bb0517f5d=
e3e
        failing since 227 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/647a01efbc2ee1d8abf5de78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647a01efbc2ee1d8abf5d=
e79
        failing since 227 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ff8bf365f43ca6f5de7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479ff8bf365f43ca6f5d=
e7c
        failing since 227 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fbc1ead7c11d77f5de3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479fbc1ead7c11d77f5d=
e3e
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fbc2d754a3e927f5de28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479fbc2d754a3e927f5d=
e29
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fa9e6720adddddf5df58

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6479fa9e6720add=
dddf5df5c
        failing since 3 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4)
        1 lines

    2023-06-02T14:20:07.072372  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 73fbd7b0, epc =3D=3D 801ff4e8, ra =3D=
=3D 80201ee4
    2023-06-02T14:20:07.072524  =


    2023-06-02T14:20:07.095237  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-06-02T14:20:07.095372  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9b5707d2e3f10f5de4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f9b5707d2e3f10f5d=
e4c
        failing since 60 days (last pass: renesas-devel-2023-03-30-v6.3-rc4=
, first fail: renesas-devel-2023-04-03-v6.3-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fac4bd58bd2403f5de7d

  Results:     11 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline=
-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline=
-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479fac4bd58bd2403f5de8c
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T14:20:46.572080  / # #

    2023-06-02T14:20:46.674139  export SHELL=3D/bin/sh

    2023-06-02T14:20:46.674848  #

    2023-06-02T14:20:46.776241  / # export SHELL=3D/bin/sh. /lava-10565929/=
environment

    2023-06-02T14:20:46.776965  =


    2023-06-02T14:20:46.878404  / # . /lava-10565929/environment/lava-10565=
929/bin/lava-test-runner /lava-10565929/1

    2023-06-02T14:20:46.879499  =


    2023-06-02T14:20:46.895780  / # /lava-10565929/bin/lava-test-runner /la=
va-10565929/1

    2023-06-02T14:20:46.970847  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-02T14:20:46.971351  + cd /lava-10565929/1/tests/1_boot<8>[   28=
.264709] <LAVA_SIGNAL_STARTRUN 1_bootrr 10565929_1.5.2.4.5>
 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fc8fa8e1498c11f5de8b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479fc8fa8e1498c11f5d=
e8c
        failing since 151 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fd809ff15cde39f5de52

  Results:     11 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabo=
ra/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabo=
ra/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479fd809ff15cde39f5de61
        failing since 3 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T14:32:07.899248  / # #

    2023-06-02T14:32:08.001348  export SHELL=3D/bin/sh

    2023-06-02T14:32:08.002089  #

    2023-06-02T14:32:08.002451  / # <3>[   29.806632] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50

    2023-06-02T14:32:08.103721  export SHELL=3D/bin/sh. /lava-10566242/envi=
ronment

    2023-06-02T14:32:08.104430  =


    2023-06-02T14:32:08.205812  / # . /lava-10566242/environment/lava-10566=
242/bin/lava-test-runner /lava-10566242/1

    2023-06-02T14:32:08.206794  =


    2023-06-02T14:32:08.219887  / # /lava-10566242/bin/lava-test-runner /la=
va-10566242/1

    2023-06-02T14:32:08.316025  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f7f521b68711d7f5de61

  Results:     64 PASS, 5 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3=
288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3=
288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockcip-i2s-driver-present: https://kernelci.org/test/c=
ase/id/6479f7f521b68711d7f5de7d
        failing since 3 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T14:08:30.735826  <8>[   20.554815] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-dp-phy-grf-probed RESULT=3Dpass>

    2023-06-02T14:08:31.755275  /lava-10565912/1/../bin/lava-test-case

    2023-06-02T14:08:31.784571  <8>[   21.603652] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockcip-i2s-driver-present RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9bf9020cea176f5de6b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f9bf9020cea176f5d=
e6c
        failing since 151 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647a00c8b17e74e20bf5de36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647a00c8b17e74e20bf5d=
e37
        failing since 108 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647a00bbc82d29cf1ef5de2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647a00bbc82d29cf1ef5d=
e2d
        failing since 108 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =20
