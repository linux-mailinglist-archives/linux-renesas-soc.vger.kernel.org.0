Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15E4873E18F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jun 2023 16:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjFZOGk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jun 2023 10:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjFZOGj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2023 10:06:39 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0940DD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2023 07:06:34 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-668711086f4so2151185b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2023 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687788394; x=1690380394;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JV8rljXWhmMPIv83YrcBROabPJfBNt04sSCqI1mdrqo=;
        b=NnpQERTQzd5RKKDgxsoccQAQw+adCY/Zsvg7gtq02tx3ZiSNW/ENJl8/hRYIXrZTTh
         nRz5t5RiHz2TcTyDsUmm0wWGTx/Os1eSTJ+KLm+4lsxwQxg/d5yyeTtH7LZBxMfzqH+I
         jmJcGXzwuLk/Tj4h0bFZztYDrf4LuxFfyrcrdU7OD4l5W9L7xtLd1+oRdneqj/ViEQv9
         IXoosOgNpkj5SlQ4+X5quGbp772Tq1b7xevY9DdY1eiKkJHekgqoYhylhmEVUazrX1uX
         AJ0DAA46DEquc4W+pA9YKzuhdBNjlnmMHKbj8/iHCZ6Per4sYIAJ8KDW4wiB4N3jkIkn
         uPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687788394; x=1690380394;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JV8rljXWhmMPIv83YrcBROabPJfBNt04sSCqI1mdrqo=;
        b=Z3mhNFjdzG4p5K+u7ebjZ3XYLJKOyVuM3YyMzdfp1eAwWch/KJsiI7CxFUYJq5PzUh
         IoXxSP7PqWoOSC8oFapZJxhfwiqIt/K4QsCkuGKAufOCDlmJzZKbXd2sWVJFceBd92oh
         7wf2hYwZ+oqWezNgmVcEFF41k4RdN4jL2iC3D1b/6oEmdKfaUPsRfc3Tg8ObIei1Ym0K
         UZ0f1uUZUgDpd6t99YtrnJy2XN8NW2Kdx+70ib9nmQCJm7XnRsQGevq0ONgTCQT5w4Mc
         sNI7nkub5efnemEgl2wQPYTpzmrKazxb/rhNczHXgY8ZzFazJwNKcGtWVFc3H8vxlQf6
         9tuA==
X-Gm-Message-State: AC+VfDz9z36sfgvCW20qbFugYyYU2pkkvVfoejcUMaDVJciHAUlx2HHH
        mo7a8h2du5iNgzJYlFy4336dI0PNvc+dR9kZu+R1iQ==
X-Google-Smtp-Source: ACHHUZ4Tm63s1NPZnTcUsQrtzPYWIWR+liojo5W8RUAJINePGsn2TBIewxrd4hsR+RCRZjVwADc4DQ==
X-Received: by 2002:a05:6a20:8f17:b0:129:9ba0:1f44 with SMTP id b23-20020a056a208f1700b001299ba01f44mr615991pzk.10.1687788391463;
        Mon, 26 Jun 2023 07:06:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u22-20020aa78496000000b00640f1e4a811sm2250230pfn.22.2023.06.26.07.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:06:30 -0700 (PDT)
Message-ID: <64999b66.a70a0220.e2af6.3a4e@mx.google.com>
Date:   Mon, 26 Jun 2023 07:06:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-06-26-v6.4
Subject: renesas/master baseline: 348 runs,
 50 regressions (renesas-devel-2023-06-26-v6.4)
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

renesas/master baseline: 348 runs, 50 regressions (renesas-devel-2023-06-26=
-v6.4)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | omap2p=
lus_defconfig          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

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

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-26-v6.4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-26-v6.4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      10028679766543b0f6c7b33a01d9b19cf7d35851 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64996133fe7acd67c9306148

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64996133fe7acd67c9306151
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T09:58:14.892658  <8>[   11.052714] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910695_1.4.2.3.1>

    2023-06-26T09:58:14.895689  + set +x

    2023-06-26T09:58:15.000295  #

    2023-06-26T09:58:15.102697  / # #export SHELL=3D/bin/sh

    2023-06-26T09:58:15.102857  =


    2023-06-26T09:58:15.203477  / # export SHELL=3D/bin/sh. /lava-10910695/=
environment

    2023-06-26T09:58:15.204122  =


    2023-06-26T09:58:15.305461  / # . /lava-10910695/environment/lava-10910=
695/bin/lava-test-runner /lava-10910695/1

    2023-06-26T09:58:15.306567  =


    2023-06-26T09:58:15.312631  / # /lava-10910695/bin/lava-test-runner /la=
va-10910695/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649962fa1d5e5538b7306175

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649962fa1d5e5538b730617e
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:05:35.825536  + set +x

    2023-06-26T10:05:35.832342  <8>[   10.406097] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910843_1.4.2.3.1>

    2023-06-26T10:05:35.936605  / # #

    2023-06-26T10:05:36.037096  export SHELL=3D/bin/sh

    2023-06-26T10:05:36.037244  #

    2023-06-26T10:05:36.137699  / # export SHELL=3D/bin/sh. /lava-10910843/=
environment

    2023-06-26T10:05:36.137846  =


    2023-06-26T10:05:36.238347  / # . /lava-10910843/environment/lava-10910=
843/bin/lava-test-runner /lava-10910843/1

    2023-06-26T10:05:36.238630  =


    2023-06-26T10:05:36.243654  / # /lava-10910843/bin/lava-test-runner /la=
va-10910843/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6499610f79474ec69130615e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6499610f79474ec691306167
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T09:57:25.724745  + set<8>[   11.415587] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10910705_1.4.2.3.1>

    2023-06-26T09:57:25.724840   +x

    2023-06-26T09:57:25.828779  / # #

    2023-06-26T09:57:25.929388  export SHELL=3D/bin/sh

    2023-06-26T09:57:25.929610  #

    2023-06-26T09:57:26.030156  / # export SHELL=3D/bin/sh. /lava-10910705/=
environment

    2023-06-26T09:57:26.030351  =


    2023-06-26T09:57:26.130846  / # . /lava-10910705/environment/lava-10910=
705/bin/lava-test-runner /lava-10910705/1

    2023-06-26T09:57:26.131178  =


    2023-06-26T09:57:26.135599  / # /lava-10910705/bin/lava-test-runner /la=
va-10910705/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649962e3fb978ee5ea306143

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649962e3fb978ee5ea30614c
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:05:08.148784  + set<8>[   11.070595] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10910818_1.4.2.3.1>

    2023-06-26T10:05:08.149284   +x

    2023-06-26T10:05:08.256319  / # #

    2023-06-26T10:05:08.358776  export SHELL=3D/bin/sh

    2023-06-26T10:05:08.359572  #

    2023-06-26T10:05:08.460997  / # export SHELL=3D/bin/sh. /lava-10910818/=
environment

    2023-06-26T10:05:08.461838  =


    2023-06-26T10:05:08.563410  / # . /lava-10910818/environment/lava-10910=
818/bin/lava-test-runner /lava-10910818/1

    2023-06-26T10:05:08.564755  =


    2023-06-26T10:05:08.569136  / # /lava-10910818/bin/lava-test-runner /la=
va-10910818/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649961190b119c3aeb306155

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649961190b119c3aeb30615e
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T09:57:25.914997  <8>[    9.990869] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910707_1.4.2.3.1>

    2023-06-26T09:57:25.918674  + set +x

    2023-06-26T09:57:26.024476  #

    2023-06-26T09:57:26.025812  =


    2023-06-26T09:57:26.127684  / # #export SHELL=3D/bin/sh

    2023-06-26T09:57:26.128500  =


    2023-06-26T09:57:26.229965  / # export SHELL=3D/bin/sh. /lava-10910707/=
environment

    2023-06-26T09:57:26.230761  =


    2023-06-26T09:57:26.332273  / # . /lava-10910707/environment/lava-10910=
707/bin/lava-test-runner /lava-10910707/1

    2023-06-26T09:57:26.333558  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649962edfb978ee5ea306169

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649962edfb978ee5ea306172
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:05:22.814443  <8>[   10.823747] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910823_1.4.2.3.1>

    2023-06-26T10:05:22.817937  + set +x

    2023-06-26T10:05:22.919578  =


    2023-06-26T10:05:23.020189  / # #export SHELL=3D/bin/sh

    2023-06-26T10:05:23.020389  =


    2023-06-26T10:05:23.120950  / # export SHELL=3D/bin/sh. /lava-10910823/=
environment

    2023-06-26T10:05:23.121109  =


    2023-06-26T10:05:23.221636  / # . /lava-10910823/environment/lava-10910=
823/bin/lava-test-runner /lava-10910823/1

    2023-06-26T10:05:23.221918  =


    2023-06-26T10:05:23.226934  / # /lava-10910823/bin/lava-test-runner /la=
va-10910823/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649964e0e6bf3ffe6530617a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649964e0e6bf3ffe65306=
17b
        failing since 111 days (last pass: renesas-devel-2023-02-21-v6.2, f=
irst fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64997ed26790b6ede13061b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64997ed26790b6ede1306=
1b3
        failing since 13 days (last pass: renesas-devel-2023-06-06-v6.4-rc5=
, first fail: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6499630922281533a230618a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499630922281533a2306=
18b
        new failure (last pass: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6499714e9397bfa7dd3061df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-b=
lack.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-b=
lack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499714e9397bfa7dd306=
1e0
        new failure (last pass: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649961b1c2304dc450306138

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649961b1c2304dc450306141
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:00:06.088691  + set +x

    2023-06-26T10:00:06.095185  <8>[   10.956247] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910743_1.4.2.3.1>

    2023-06-26T10:00:06.203197  / # #

    2023-06-26T10:00:06.305707  export SHELL=3D/bin/sh

    2023-06-26T10:00:06.306449  #

    2023-06-26T10:00:06.408258  / # export SHELL=3D/bin/sh. /lava-10910743/=
environment

    2023-06-26T10:00:06.409140  =


    2023-06-26T10:00:06.510841  / # . /lava-10910743/environment/lava-10910=
743/bin/lava-test-runner /lava-10910743/1

    2023-06-26T10:00:06.512084  =


    2023-06-26T10:00:06.516743  / # /lava-10910743/bin/lava-test-runner /la=
va-10910743/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6499634abf300627a030613c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6499634abf300627a0306145
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:06:52.561982  + set +x

    2023-06-26T10:06:52.568301  <8>[   10.151786] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910852_1.4.2.3.1>

    2023-06-26T10:06:52.675929  / # #

    2023-06-26T10:06:52.778294  export SHELL=3D/bin/sh

    2023-06-26T10:06:52.778995  #

    2023-06-26T10:06:52.880346  / # export SHELL=3D/bin/sh. /lava-10910852/=
environment

    2023-06-26T10:06:52.881307  =


    2023-06-26T10:06:52.982862  / # . /lava-10910852/environment/lava-10910=
852/bin/lava-test-runner /lava-10910852/1

    2023-06-26T10:06:52.983643  =


    2023-06-26T10:06:52.988411  / # /lava-10910852/bin/lava-test-runner /la=
va-10910852/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64996123edb0ae881f306132

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64996123edb0ae881f30613b
        failing since 20 days (last pass: renesas-devel-2023-06-02-v6.4-rc4=
, first fail: renesas-devel-2023-06-05-v6.4-rc5)

    2023-06-26T09:57:34.796348  + set +x

    2023-06-26T09:57:34.803182  <8>[   10.670707] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910750_1.4.2.3.1>

    2023-06-26T09:57:34.907010  =


    2023-06-26T09:57:35.009169  / # #export SHELL=3D/bin/sh

    2023-06-26T09:57:35.009832  =


    2023-06-26T09:57:35.111137  / # export SHELL=3D/bin/sh. /lava-10910750/=
environment

    2023-06-26T09:57:35.111852  =


    2023-06-26T09:57:35.213284  / # . /lava-10910750/environment/lava-10910=
750/bin/lava-test-runner /lava-10910750/1

    2023-06-26T09:57:35.214386  =


    2023-06-26T09:57:35.219529  / # /lava-10910750/bin/lava-test-runner /la=
va-10910750/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649962cf842fd9ae1d306154

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649962cf842fd9ae1d30615d
        failing since 20 days (last pass: renesas-devel-2023-06-02-v6.4-rc4=
, first fail: renesas-devel-2023-06-05-v6.4-rc5)

    2023-06-26T10:04:52.171925  <8>[   10.539413] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910841_1.4.2.3.1>

    2023-06-26T10:04:52.174646  + set +x

    2023-06-26T10:04:52.275874  #

    2023-06-26T10:04:52.276190  =


    2023-06-26T10:04:52.376778  / # #export SHELL=3D/bin/sh

    2023-06-26T10:04:52.377041  =


    2023-06-26T10:04:52.477634  / # export SHELL=3D/bin/sh. /lava-10910841/=
environment

    2023-06-26T10:04:52.477859  =


    2023-06-26T10:04:52.578447  / # . /lava-10910841/environment/lava-10910=
841/bin/lava-test-runner /lava-10910841/1

    2023-06-26T10:04:52.578742  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6499612c0e9a8c1ce1306162

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6499612c0e9a8c1ce130616b
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T09:57:43.484630  + set<8>[   11.166085] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10910744_1.4.2.3.1>

    2023-06-26T09:57:43.485170   +x

    2023-06-26T09:57:43.592407  / # #

    2023-06-26T09:57:43.694714  export SHELL=3D/bin/sh

    2023-06-26T09:57:43.695446  #

    2023-06-26T09:57:43.797031  / # export SHELL=3D/bin/sh. /lava-10910744/=
environment

    2023-06-26T09:57:43.797769  =


    2023-06-26T09:57:43.899511  / # . /lava-10910744/environment/lava-10910=
744/bin/lava-test-runner /lava-10910744/1

    2023-06-26T09:57:43.900741  =


    2023-06-26T09:57:43.905806  / # /lava-10910744/bin/lava-test-runner /la=
va-10910744/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649962ef4f5944bad830613b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649962ef4f5944bad8306144
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:05:28.416378  + <8>[   11.098309] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10910840_1.4.2.3.1>

    2023-06-26T10:05:28.416898  set +x

    2023-06-26T10:05:28.524459  / # #

    2023-06-26T10:05:28.626875  export SHELL=3D/bin/sh

    2023-06-26T10:05:28.627618  #

    2023-06-26T10:05:28.729024  / # export SHELL=3D/bin/sh. /lava-10910840/=
environment

    2023-06-26T10:05:28.729823  =


    2023-06-26T10:05:28.831267  / # . /lava-10910840/environment/lava-10910=
840/bin/lava-test-runner /lava-10910840/1

    2023-06-26T10:05:28.832429  =


    2023-06-26T10:05:28.837301  / # /lava-10910840/bin/lava-test-runner /la=
va-10910840/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6499635196f880544e30613e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6499635196f880544e306147
        failing since 146 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-26T10:06:46.946145  + set +x
    2023-06-26T10:06:46.946444  [   12.159964] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988151_1.5.2.3.1>
    2023-06-26T10:06:47.053142  / # #
    2023-06-26T10:06:47.154986  export SHELL=3D/bin/sh
    2023-06-26T10:06:47.155512  #
    2023-06-26T10:06:47.256847  / # export SHELL=3D/bin/sh. /lava-988151/en=
vironment
    2023-06-26T10:06:47.257330  =

    2023-06-26T10:06:47.358657  / # . /lava-988151/environment/lava-988151/=
bin/lava-test-runner /lava-988151/1
    2023-06-26T10:06:47.359243  =

    2023-06-26T10:06:47.362731  / # /lava-988151/bin/lava-test-runner /lava=
-988151/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649965e422eee5c70330612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649965e422eee5c703306137
        failing since 146 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-26T10:17:56.468167  + set +x
    2023-06-26T10:17:56.468346  [   12.875498] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988176_1.5.2.3.1>
    2023-06-26T10:17:56.575996  / # #
    2023-06-26T10:17:56.677864  export SHELL=3D/bin/sh
    2023-06-26T10:17:56.678358  #
    2023-06-26T10:17:56.779682  / # export SHELL=3D/bin/sh. /lava-988176/en=
vironment
    2023-06-26T10:17:56.780165  =

    2023-06-26T10:17:56.881457  / # . /lava-988176/environment/lava-988176/=
bin/lava-test-runner /lava-988176/1
    2023-06-26T10:17:56.882189  =

    2023-06-26T10:17:56.885397  / # /lava-988176/bin/lava-test-runner /lava=
-988176/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6499666f19da8bb76430612f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6499666f19da8bb764306138
        failing since 146 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-26T10:20:08.044789  + set +x
    2023-06-26T10:20:08.044952  [   14.349963] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988189_1.5.2.3.1>
    2023-06-26T10:20:08.152277  / # #
    2023-06-26T10:20:08.253932  export SHELL=3D/bin/sh
    2023-06-26T10:20:08.254419  #
    2023-06-26T10:20:08.355616  / # export SHELL=3D/bin/sh. /lava-988189/en=
vironment
    2023-06-26T10:20:08.356073  =

    2023-06-26T10:20:08.457268  / # . /lava-988189/environment/lava-988189/=
bin/lava-test-runner /lava-988189/1
    2023-06-26T10:20:08.457899  =

    2023-06-26T10:20:08.461271  / # /lava-988189/bin/lava-test-runner /lava=
-988189/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/649966bf2ec8aec99730613f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649966bf2ec8aec997306148
        failing since 146 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-26T10:21:27.358396  + set +x
    2023-06-26T10:21:27.358611  [   13.170488] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988194_1.5.2.3.1>
    2023-06-26T10:21:27.466165  / # #
    2023-06-26T10:21:27.567833  export SHELL=3D/bin/sh
    2023-06-26T10:21:27.568367  #
    2023-06-26T10:21:27.669859  / # export SHELL=3D/bin/sh. /lava-988194/en=
vironment
    2023-06-26T10:21:27.670278  =

    2023-06-26T10:21:27.771625  / # . /lava-988194/environment/lava-988194/=
bin/lava-test-runner /lava-988194/1
    2023-06-26T10:21:27.772284  =

    2023-06-26T10:21:27.775442  / # /lava-988194/bin/lava-test-runner /lava=
-988194/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/649968b46f5d0df780306132

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53=
-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53=
-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649968b46f5d0df78030613b
        failing since 146 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-26T10:29:48.801024  + set +x
    2023-06-26T10:29:48.801219  [   13.130693] <LAVA_SIGNAL_ENDRUN 0_dmesg =
988220_1.5.2.3.1>
    2023-06-26T10:29:48.908319  / # #
    2023-06-26T10:29:49.009942  export SHELL=3D/bin/sh
    2023-06-26T10:29:49.010419  #
    2023-06-26T10:29:49.111639  / # export SHELL=3D/bin/sh. /lava-988220/en=
vironment
    2023-06-26T10:29:49.112060  =

    2023-06-26T10:29:49.213267  / # . /lava-988220/environment/lava-988220/=
bin/lava-test-runner /lava-988220/1
    2023-06-26T10:29:49.213846  =

    2023-06-26T10:29:49.217154  / # /lava-988220/bin/lava-test-runner /lava=
-988220/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6499684ff18a1b7437306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499684ff18a1b7437306=
141
        failing since 227 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6499633b6215e82e05306160

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499633b6215e82e05306=
161
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6499612361261008ff306177

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6499612361261008ff306180
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T09:57:39.640233  <8>[    8.713013] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10910748_1.4.2.3.1>

    2023-06-26T09:57:39.744098  / # #

    2023-06-26T09:57:39.844727  export SHELL=3D/bin/sh

    2023-06-26T09:57:39.844948  #

    2023-06-26T09:57:39.945489  / # export SHELL=3D/bin/sh. /lava-10910748/=
environment

    2023-06-26T09:57:39.945699  =


    2023-06-26T09:57:40.046265  / # . /lava-10910748/environment/lava-10910=
748/bin/lava-test-runner /lava-10910748/1

    2023-06-26T09:57:40.046564  =


    2023-06-26T09:57:40.051245  / # /lava-10910748/bin/lava-test-runner /la=
va-10910748/1

    2023-06-26T09:57:40.057774  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649962fc454cadef00306130

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649962fc454cadef00306139
        failing since 87 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-26T10:05:23.320803  + set<8>[   12.065822] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10910859_1.4.2.3.1>

    2023-06-26T10:05:23.321284   +x

    2023-06-26T10:05:23.429593  / # #

    2023-06-26T10:05:23.532134  export SHELL=3D/bin/sh

    2023-06-26T10:05:23.532833  #

    2023-06-26T10:05:23.634201  / # export SHELL=3D/bin/sh. /lava-10910859/=
environment

    2023-06-26T10:05:23.634897  =


    2023-06-26T10:05:23.736457  / # . /lava-10910859/environment/lava-10910=
859/bin/lava-test-runner /lava-10910859/1

    2023-06-26T10:05:23.737540  =


    2023-06-26T10:05:23.742267  / # /lava-10910859/bin/lava-test-runner /la=
va-10910859/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6499641f05ac2255d8306275

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499641f05ac2255d8306=
276
        failing since 125 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6499642844277633cb306146

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499642844277633cb306=
147
        failing since 125 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649964bad50fb3418b30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649964bad50fb3418b306=
130
        failing since 132 days (last pass: renesas-devel-2023-01-30-v6.2-rc=
6, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64996852f18a1b7437306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64996852f18a1b7437306=
144
        failing since 47 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6499685237f34bea91306141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499685237f34bea91306=
142
        failing since 47 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64996763898280fc03306158

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64996763898280fc03306=
159
        failing since 251 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6499670a3362aa7dd730614c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499670a3362aa7dd7306=
14d
        failing since 251 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6499674f537cd3d5ee306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499674f537cd3d5ee306=
13a
        failing since 251 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6499670966fcc41ec1306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499670966fcc41ec1306=
144
        failing since 251 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6499679fd04c61a7a9306162

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499679fd04c61a7a9306=
163
        failing since 251 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6499670166fcc41ec1306138

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499670166fcc41ec1306=
139
        failing since 251 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6499677743b3b83aaf306138

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499677743b3b83aaf306=
139
        failing since 251 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6499670c66fcc41ec1306149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499670c66fcc41ec1306=
14a
        failing since 251 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6499653554901d76d2306189

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips=
-malta.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips=
-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499653554901d76d2306=
18a
        failing since 20 days (last pass: renesas-devel-2023-06-05-v6.4-rc5=
, first fail: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/649961894ac3df90b630613a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20=
d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20=
d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649961894ac3df90b6306=
13b
        failing since 13 days (last pass: renesas-devel-2023-06-06-v6.4-rc5=
, first fail: renesas-devel-2023-06-12-v6.4-rc6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649964680289ca05e630614d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649964690289ca05e6306=
14e
        failing since 174 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64996365bf300627a0306184

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64996365bf300627a0306=
185
        failing since 174 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649964c6d9efc1c7ec30613e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649964c6d9efc1c7ec306=
13f
        failing since 132 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6499641d12cca4844330614e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499641d12cca48443306=
14f
        failing since 125 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649964c94aa9000081306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649964c94aa9000081306=
131
        failing since 132 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649964c3d50fb3418b306137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649964c3d50fb3418b306=
138
        failing since 132 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6499642144277633cb30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499642144277633cb306=
12f
        failing since 125 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64996575b965151e8f30613b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64996575b965151e8f306=
13c
        new failure (last pass: renesas-devel-2023-06-06-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64996449c51f4db054306161

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64996449c51f4db054306=
162
        failing since 111 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/649965b268c5d67c9430612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-26-v6.4/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649965b268c5d67c94306=
12f
        failing since 20 days (last pass: renesas-devel-2023-05-30-v6.4-rc4=
, first fail: renesas-devel-2023-06-06-v6.4-rc5) =

 =20
