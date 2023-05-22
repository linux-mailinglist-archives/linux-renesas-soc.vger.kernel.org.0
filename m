Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE8970C1F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 17:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbjEVPHW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 11:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233265AbjEVPHV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 11:07:21 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01346BB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 08:07:16 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64d2981e3abso3288111b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 08:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684768036; x=1687360036;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=USxdeiXdcLrY85rt8hUcA1ws9C7qNvFjMnBGtF9hog0=;
        b=kayG4X2JxPRGrFsnblgNu4NyoNR8ZlFS3kCJUfQvyIsOHcF9V3vR2mQ+SmQkCdfL0o
         LvMXcn/Ds/xy82K5BbTztakqC4dSSwB5sFiYp3Gih2yLZosSVBl8btRm+WwT0javoZtA
         WWNI/1BexkhWgXeZgdx9vcv6RaX2hLlP5gyQmBp4zhss4tFxSsX+7QyFWvkMUtK+FMST
         7esb4x7xzbXPhLdtFQgL1GeuHaNv2w+WWNv+7AIAz+UKJ5LfunrrRbmOa+7hkwGLh388
         n3NqM7oOCkhBqqkh1dcrxP4/5nQfnR/Z4/3DK4RlW3SD/NRuMJociuwBvsMvoottC8b9
         kJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684768036; x=1687360036;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USxdeiXdcLrY85rt8hUcA1ws9C7qNvFjMnBGtF9hog0=;
        b=BVsguOXq21o3BVmQP1xQ51TdyMovsPR05Pk+rkl6V668eSKGRyPXJnRNMSNRmpWLdQ
         CXmefvSbwfv8lLRYMXzZzXj+sKSn4uzZ3H7TJL8G6xDhsFrwBVt/HBrA4y0XI2pLAJYN
         hK/nyWxkMiCRgoacKfajXXKlkgLj9i6Z33OEvzMBCiQq9/Pf5wpOeP4pT3wgd2QNJCZ3
         50be3krHnqtIutFgsy1Bn8GtiWsNuNWqtiLdMdo43/1EbQwF4pJh04kirwdt/Wl2bmCX
         iQ0ruqqkZ+FIGf7uvTudM2YSwpVFm6yR0AOOKqb8g8FG3UzjaYecfNZODB81uABBu4st
         4k6A==
X-Gm-Message-State: AC+VfDysolVuPpBi1r8isbbNR1CsqNFizAxq6+Wj7vjgPqA3gvMV9j1v
        APLnY/Eo2mznc1s7SXFKyFtYt/wY1+nBZpI+kMiCPA==
X-Google-Smtp-Source: ACHHUZ7NG5V9Qtl8kFqcwML4rCXQCcANQFaKDdGdZGT0yYAlXnWV9NmBPcvxuGxgcS98QbUFsFIbug==
X-Received: by 2002:a05:6a21:1011:b0:104:6f59:3dc4 with SMTP id nk17-20020a056a21101100b001046f593dc4mr8438164pzb.62.1684768034231;
        Mon, 22 May 2023 08:07:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i28-20020a63585c000000b0051b7bcb6162sm4421541pgm.81.2023.05.22.08.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 08:07:13 -0700 (PDT)
Message-ID: <646b8521.630a0220.9faa0.6921@mx.google.com>
Date:   Mon, 22 May 2023 08:07:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-22-v6.4-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 169 runs,
 53 regressions (renesas-devel-2023-05-22-v6.4-rc3)
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

renesas/master baseline-nfs: 169 runs, 53 regressions (renesas-devel-2023-0=
5-22-v6.4-rc3)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-22-v6.4-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-22-v6.4-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      44b93b667d845927e0168aa763b3a14e93b21a66 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cd9879fa31d962e85f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4cd9879fa31d962e85fc
        failing since 42 days (last pass: renesas-devel-2023-04-04-v6.3-rc5=
, first fail: renesas-devel-2023-04-10-v6.3-rc6)

    2023-05-22T11:06:55.299708  + set +x

    2023-05-22T11:06:55.306438  <8>[   24.210735] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409267_1.5.2.3.1>

    2023-05-22T11:06:55.418645  / # #

    2023-05-22T11:06:55.519356  export SHELL=3D/bin/sh

    2023-05-22T11:06:55.519586  #

    2023-05-22T11:06:55.620078  / # export SHELL=3D/bin/sh. /lava-10409267/=
environment

    2023-05-22T11:06:55.620333  =


    2023-05-22T11:06:55.721018  / # . /lava-10409267/environment/lava-10409=
267/bin/lava-test-runner /lava-10409267/1

    2023-05-22T11:06:55.721299  =


    2023-05-22T11:06:55.727090  / # /lava-10409267/bin/lava-test-runner /la=
va-10409267/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c8ae797e7b3702e85ea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4c8ae797e7b3702e85ef
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:31.924123  + set +x

    2023-05-22T11:05:31.931090  [   25.275500] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409307_1.5.2.3.1>

    2023-05-22T11:05:32.045477  / # #

    2023-05-22T11:05:32.147651  export SHELL=3D/bin/sh

    2023-05-22T11:05:32.147848  #

    2023-05-22T11:05:32.248380  / # export SHELL=3D/bin/sh. /lava-10409307/=
environment

    2023-05-22T11:05:32.248583  =


    2023-05-22T11:05:32.349129  / # . /lava-10409307/environment/lava-10409=
307/bin/lava-test-runner /lava-10409307/1

    2023-05-22T11:05:32.349419  =


    2023-05-22T11:05:32.354978  / # /lava-10409307/bin/lava-test-runner /la=
va-10409307/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4ca86d29ab80572e8625

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4ca86d29ab80572e862a
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:06:00.598332  + set +x

    2023-05-22T11:06:00.604111  [   22.005946] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409332_1.5.2.3.1>

    2023-05-22T11:06:00.709509  / ##

    2023-05-22T11:06:00.810221  export SHELL=3D/bin/sh

    2023-05-22T11:06:00.810548   #

    2023-05-22T11:06:00.911586  / # export SHELL=3D/bin/sh. /lava-10409332/=
environment

    2023-05-22T11:06:00.911886  =


    2023-05-22T11:06:01.012757  / # . /lava-10409332/environment/lava-10409=
332/bin/lava-test-runner /lava-10409332/1

    2023-05-22T11:06:01.014146  =


    2023-05-22T11:06:01.019494  / # /lava-10409332/bin/lava-test-runner /la=
va-10409332/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4dd733251ac3022e85f6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4dd733251ac3022e85fb
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:55.435591  + set +x

    2023-05-22T11:10:55.442483  <8>[   19.703367] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409477_1.5.2.3.1>

    2023-05-22T11:10:55.547528  / # #

    2023-05-22T11:10:55.649944  export SHELL=3D/bin/sh

    2023-05-22T11:10:55.650692  #

    2023-05-22T11:10:55.752180  / # export SHELL=3D/bin/sh. /lava-10409477/=
environment

    2023-05-22T11:10:55.752880  =


    2023-05-22T11:10:55.854414  / # . /lava-10409477/environment/lava-10409=
477/bin/lava-test-runner /lava-10409477/1

    2023-05-22T11:10:55.855556  =


    2023-05-22T11:10:55.860805  / # /lava-10409477/bin/lava-test-runner /la=
va-10409477/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4dbcffc78f5d3a2e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4dbcffc78f5d3a2e85eb
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:27.395453  + set +x

    2023-05-22T11:10:27.401587  <8>[   17.202802] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409484_1.5.2.3.1>

    2023-05-22T11:10:27.508949  =


    2023-05-22T11:10:27.610508  / # #export SHELL=3D/bin/sh

    2023-05-22T11:10:27.611151  =


    2023-05-22T11:10:27.712497  / # export SHELL=3D/bin/sh. /lava-10409484/=
environment

    2023-05-22T11:10:27.713134  =


    2023-05-22T11:10:27.814533  / # . /lava-10409484/environment/lava-10409=
484/bin/lava-test-runner /lava-10409484/1

    2023-05-22T11:10:27.814863  =


    2023-05-22T11:10:27.817645  / # /lava-10409484/bin/lava-test-runner /la=
va-10409484/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/646b4c8dffe12f316f2e85f9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4c8dffe12f316f2e85fe
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:24.790146  + set +x

    2023-05-22T11:05:24.793347  [   24.336166] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409309_1.5.2.3.1>

    2023-05-22T11:05:24.899980  / # #

    2023-05-22T11:05:25.000535  export SHELL=3D/bin/sh

    2023-05-22T11:05:25.000707  #

    2023-05-22T11:05:25.101203  / # export SHELL=3D/bin/sh. /lava-10409309/=
environment

    2023-05-22T11:05:25.101401  =


    2023-05-22T11:05:25.201974  / # . /lava-10409309/environment/lava-10409=
309/bin/lava-test-runner /lava-10409309/1

    2023-05-22T11:05:25.202232  =


    2023-05-22T11:05:25.207148  / # /lava-10409309/bin/lava-test-runner /la=
va-10409309/1
 =

    ... (13 line(s) more)  =


  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/646b4c8dffe=
12f316f2e8600
        failing since 66 days (last pass: renesas-devel-2023-03-07-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2)
        3 lines

    2023-05-22T11:05:24.748190  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-05-22T11:05:24.754526  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-05-22T11:05:24.761553  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-05-22T11:05:24.787077  [   24.326488] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cbcbceab040012e8628

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4cbcbceab040012e862d
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:06:23.416848  + <8>[   15.573285] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10409364_1.5.2.3.1>

    2023-05-22T11:06:23.416936  set +x

    2023-05-22T11:06:23.521184  / # #

    2023-05-22T11:06:23.621723  export SHELL=3D/bin/sh

    2023-05-22T11:06:23.621936  #

    2023-05-22T11:06:23.722450  / # export SHELL=3D/bin/sh. /lava-10409364/=
environment

    2023-05-22T11:06:23.722637  =


    2023-05-22T11:06:23.823145  / # . /lava-10409364/environment/lava-10409=
364/bin/lava-test-runner /lava-10409364/1

    2023-05-22T11:06:23.823396  =


    2023-05-22T11:06:23.828296  / # /lava-10409364/bin/lava-test-runner /la=
va-10409364/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4dd8290671d7972e8610

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4dd8290671d7972e8615
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:56.062969  [   18.033179] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409504_1.5.2.3.1>

    2023-05-22T11:10:56.171710  / # #

    2023-05-22T11:10:56.274288  export SHELL=3D/bin/sh

    2023-05-22T11:10:56.275135  #

    2023-05-22T11:10:56.376670  / # export SHELL=3D/bin/sh. /lava-10409504/=
environment

    2023-05-22T11:10:56.377492  =


    2023-05-22T11:10:56.479285  / # . /lava-10409504/environment/lava-10409=
504/bin/lava-test-runner /lava-10409504/1

    2023-05-22T11:10:56.480559  =


    2023-05-22T11:10:56.485871  / # /lava-10409504/bin/lava-test-runner /la=
va-10409504/1

    2023-05-22T11:10:56.591303  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c8b2cb07313162e8611

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4c8b2cb07313162e8616
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:23.442588  <8>[   22.886997] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409277_1.5.2.3.1>

    2023-05-22T11:05:23.445798  + set +x

    2023-05-22T11:05:23.552152  #

    2023-05-22T11:05:23.652991  / # #export SHELL=3D/bin/sh

    2023-05-22T11:05:23.653169  =


    2023-05-22T11:05:23.753653  / # export SHELL=3D/bin/sh. /lava-10409277/=
environment

    2023-05-22T11:05:23.753856  =


    2023-05-22T11:05:23.854398  / # . /lava-10409277/environment/lava-10409=
277/bin/lava-test-runner /lava-10409277/1

    2023-05-22T11:05:23.854652  =


    2023-05-22T11:05:23.859592  / # /lava-10409277/bin/lava-test-runner /la=
va-10409277/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cbdfcf6a8eeae2e8648

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4cbdfcf6a8eeae2e864d
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:06:11.574634  [   17.746679] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409350_1.5.2.3.1>

    2023-05-22T11:06:11.578023  + set +x

    2023-05-22T11:06:11.682612  / # #

    2023-05-22T11:06:11.783193  export SHELL=3D/bin/sh

    2023-05-22T11:06:11.783425  #

    2023-05-22T11:06:11.883938  / # export SHELL=3D/bin/sh. /lava-10409350/=
environment

    2023-05-22T11:06:11.884191  =


    2023-05-22T11:06:11.984759  / # . /lava-10409350/environment/lava-10409=
350/bin/lava-test-runner /lava-10409350/1

    2023-05-22T11:06:11.985134  =


    2023-05-22T11:06:11.990025  / # /lava-10409350/bin/lava-test-runner /la=
va-10409350/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4dd6521998261c2e8633

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4dd6521998261c2e8638
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:53.947000  + [   15.404203] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10409495_1.5.2.3.1>

    2023-05-22T11:10:53.950216  set +x

    2023-05-22T11:10:54.054792  / # #

    2023-05-22T11:10:54.155313  export SHELL=3D/bin/sh

    2023-05-22T11:10:54.155476  #

    2023-05-22T11:10:54.255971  / # export SHELL=3D/bin/sh. /lava-10409495/=
environment

    2023-05-22T11:10:54.256129  =


    2023-05-22T11:10:54.356726  / # . /lava-10409495/environment/lava-10409=
495/bin/lava-test-runner /lava-10409495/1

    2023-05-22T11:10:54.356991  =


    2023-05-22T11:10:54.361666  / # /lava-10409495/bin/lava-test-runner /la=
va-10409495/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/646b75f67ba9b827242e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/646b75f67ba9b8272=
42e85fd
        failing since 31 days (last pass: renesas-devel-2023-04-17-v6.3-rc7=
, first fail: renesas-devel-2023-04-21-v6.3-rc7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/646b5a0f896f97f1972e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/646b5a0f896f97f19=
72e85e9
        failing since 12 days (last pass: renesas-devel-2023-04-21-v6.3-rc7=
, first fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cdcfe2e826b552e861e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4cdcfe2e826b552e8623
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:06:53.048679  + set +x

    2023-05-22T11:06:53.054713  [   32.275765] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409304_1.5.2.3.1>

    2023-05-22T11:06:53.163333  #

    2023-05-22T11:06:53.264190  / # #export SHELL=3D/bin/sh

    2023-05-22T11:06:53.264402  =


    2023-05-22T11:06:53.364942  / # export SHELL=3D/bin/sh. /lava-10409304/=
environment

    2023-05-22T11:06:53.365141  =


    2023-05-22T11:06:53.465754  / # . /lava-10409304/environment/lava-10409=
304/bin/lava-test-runner /lava-10409304/1

    2023-05-22T11:06:53.466064  =


    2023-05-22T11:06:53.470772  / # /lava-10409304/bin/lava-test-runner /la=
va-10409304/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cedfe2e826b552e8693

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4cedfe2e826b552e8698
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:07:06.986426  + set[   22.797304] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10409343_1.5.2.3.1>

    2023-05-22T11:07:06.986513   +x

    2023-05-22T11:07:07.090903  / # #

    2023-05-22T11:07:07.191444  export SHELL=3D/bin/sh

    2023-05-22T11:07:07.191664  #

    2023-05-22T11:07:07.292221  / # export SHELL=3D/bin/sh. /lava-10409343/=
environment

    2023-05-22T11:07:07.292444  =


    2023-05-22T11:07:07.392956  / # . /lava-10409343/environment/lava-10409=
343/bin/lava-test-runner /lava-10409343/1

    2023-05-22T11:07:07.393220  =


    2023-05-22T11:07:07.397903  / # /lava-10409343/bin/lava-test-runner /la=
va-10409343/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4db653be5042f12e8635

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4db653be5042f12e863a
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:35.558215  + <8>[   18.762398] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10409481_1.5.2.3.1>

    2023-05-22T11:10:35.558300  set +x

    2023-05-22T11:10:35.662516  / # #

    2023-05-22T11:10:35.763057  export SHELL=3D/bin/sh

    2023-05-22T11:10:35.763215  #

    2023-05-22T11:10:35.863715  / # export SHELL=3D/bin/sh. /lava-10409481/=
environment

    2023-05-22T11:10:35.863923  =


    2023-05-22T11:10:35.964445  / # . /lava-10409481/environment/lava-10409=
481/bin/lava-test-runner /lava-10409481/1

    2023-05-22T11:10:35.964689  =


    2023-05-22T11:10:35.969309  / # /lava-10409481/bin/lava-test-runner /la=
va-10409481/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c7b2e6c0d74062e8650

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4c7b2e6c0d74062e8655
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:17.259692  + set +x

    2023-05-22T11:05:17.266699  [   23.026727] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409301_1.5.2.3.1>

    2023-05-22T11:05:17.377709  #

    2023-05-22T11:05:17.480448  / # #export SHELL=3D/bin/sh

    2023-05-22T11:05:17.481148  =


    2023-05-22T11:05:17.582656  / # export SHELL=3D/bin/sh. /lava-10409301/=
environment

    2023-05-22T11:05:17.583479  =


    2023-05-22T11:05:17.685048  / # . /lava-10409301/environment/lava-10409=
301/bin/lava-test-runner /lava-10409301/1

    2023-05-22T11:05:17.686273  =


    2023-05-22T11:05:17.731539  / # /lava-10409301/bin/lava-test-runner /la=
va-10409301/1[   23.449981] platform MX98357A:00: deferred probe pending
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cde36687a7cac2e8624

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4cde36687a7cac2e8629
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:06:47.886590  + set +x

    2023-05-22T11:06:47.893435  [   18.556314] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409327_1.5.2.3.1>

    2023-05-22T11:06:48.000873  / # #

    2023-05-22T11:06:48.103565  export SHELL=3D/bin/sh

    2023-05-22T11:06:48.104407  #

    2023-05-22T11:06:48.206103  / # export SHELL=3D/bin/sh. /lava-10409327/=
environment

    2023-05-22T11:06:48.206886  =


    2023-05-22T11:06:48.308699  / # . /lava-10409327/environment/lava-10409=
327/bin/lava-test-runner /lava-10409327/1

    2023-05-22T11:06:48.310050  =


    2023-05-22T11:06:48.315995  / # /lava-10409327/bin/lava-test-runner /la=
va-10409327/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c908e0d1f0c952e8614

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4c908e0d1f0c952e8619
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:41.395130  + <8>[   24.115371] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10409270_1.5.2.3.1>

    2023-05-22T11:05:41.395733  set +x

    2023-05-22T11:05:41.505758  / # #

    2023-05-22T11:05:41.608270  export SHELL=3D/bin/sh

    2023-05-22T11:05:41.609055  #

    2023-05-22T11:05:41.710727  / # export SHELL=3D/bin/sh. /lava-10409270/=
environment

    2023-05-22T11:05:41.711585  =


    2023-05-22T11:05:41.813213  / # . /lava-10409270/environment/lava-10409=
270/bin/lava-test-runner /lava-10409270/1

    2023-05-22T11:05:41.814365  =


    2023-05-22T11:05:41.819911  / # /lava-10409270/bin/lava-test-runner /la=
va-10409270/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4cb6ca038a63162e8660

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4cb6ca038a63162e8665
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:06:12.266864  <8>[   17.644819] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409356_1.5.2.3.1>

    2023-05-22T11:06:12.371855  / # #

    2023-05-22T11:06:12.472528  export SHELL=3D/bin/sh

    2023-05-22T11:06:12.472728  #

    2023-05-22T11:06:12.573242  / # export SHELL=3D/bin/sh. /lava-10409356/=
environment

    2023-05-22T11:06:12.573482  =


    2023-05-22T11:06:12.674105  / # . /lava-10409356/environment/lava-10409=
356/bin/lava-test-runner /lava-10409356/1

    2023-05-22T11:06:12.674423  =


    2023-05-22T11:06:12.716505  / # /lava-10409356/bin/lava-test-runner /la=
va-10409356/1

    2023-05-22T11:06:12.757647  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4dc9521998261c2e85f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4dca521998261c2e85f6
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:42.708576  [   17.373091] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409424_1.5.2.3.1>

    2023-05-22T11:10:42.812430  / # #

    2023-05-22T11:10:42.913043  export SHELL=3D/bin/sh

    2023-05-22T11:10:42.913257  #

    2023-05-22T11:10:43.013793  / # export SHELL=3D/bin/sh. /lava-10409424/=
environment

    2023-05-22T11:10:43.013965  =


    2023-05-22T11:10:43.114484  / # . /lava-10409424/environment/lava-10409=
424/bin/lava-test-runner /lava-10409424/1

    2023-05-22T11:10:43.114736  =


    2023-05-22T11:10:43.119389  / # /lava-10409424/bin/lava-test-runner /la=
va-10409424/1

    2023-05-22T11:10:43.204025  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4b16a163ea6cc12e8638

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4b16a163ea6cc12e863d
        failing since 76 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-05-22T10:59:22.073682  + set +x
    2023-05-22T10:59:22.073945  [   29.607609] <LAVA_SIGNAL_ENDRUN 0_dmesg =
956116_1.6.2.3.1>
    2023-05-22T10:59:22.184087  #
    2023-05-22T10:59:22.286151  / # #export SHELL=3D/bin/sh
    2023-05-22T10:59:22.286643  =

    2023-05-22T10:59:22.387937  / # export SHELL=3D/bin/sh. /lava-956116/en=
vironment
    2023-05-22T10:59:22.388407  =

    2023-05-22T10:59:22.489702  / # . /lava-956116/environment/lava-956116/=
bin/lava-test-runner /lava-956116/1
    2023-05-22T10:59:22.490537  =

    2023-05-22T10:59:22.493522  / # /lava-956116/bin/lava-test-runner /lava=
-956116/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4daafd825fda822e865c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4daafd825fda822e8661
        failing since 76 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-05-22T11:10:12.769115  + set +x
    2023-05-22T11:10:12.769422  [   28.318175] <LAVA_SIGNAL_ENDRUN 0_dmesg =
956125_1.6.2.3.1>
    2023-05-22T11:10:12.896459  #
    2023-05-22T11:10:12.998520  / # #export SHELL=3D/bin/sh
    2023-05-22T11:10:12.999132  =

    2023-05-22T11:10:13.100535  / # export SHELL=3D/bin/sh. /lava-956125/en=
vironment
    2023-05-22T11:10:13.101059  =

    2023-05-22T11:10:13.202432  / # . /lava-956125/environment/lava-956125/=
bin/lava-test-runner /lava-956125/1
    2023-05-22T11:10:13.203238  =

    2023-05-22T11:10:13.206146  / # /lava-956125/bin/lava-test-runner /lava=
-956125/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4f9ecc332e4ca02e85f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4f9ecc332e4ca02e85f7
        failing since 76 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-05-22T11:18:36.883518  + set +x
    2023-05-22T11:18:36.883942  [   30.729312] <LAVA_SIGNAL_ENDRUN 0_dmesg =
956143_1.6.2.3.1>
    2023-05-22T11:18:36.997319  #
    2023-05-22T11:18:37.099343  / # #export SHELL=3D/bin/sh
    2023-05-22T11:18:37.099814  =

    2023-05-22T11:18:37.201020  / # export SHELL=3D/bin/sh. /lava-956143/en=
vironment
    2023-05-22T11:18:37.201467  =

    2023-05-22T11:18:37.302650  / # . /lava-956143/environment/lava-956143/=
bin/lava-test-runner /lava-956143/1
    2023-05-22T11:18:37.303206  =

    2023-05-22T11:18:37.306352  / # /lava-956143/bin/lava-test-runner /lava=
-956143/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/646b50527387fc41472e862d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b50527387fc41472e8632
        failing since 76 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-05-22T11:21:41.905808  + set +x
    2023-05-22T11:21:41.906172  [   28.117831] <LAVA_SIGNAL_ENDRUN 0_dmesg =
956151_1.6.2.3.1>
    2023-05-22T11:21:42.049991  #
    2023-05-22T11:21:42.152116  / # #export SHELL=3D/bin/sh
    2023-05-22T11:21:42.152725  =

    2023-05-22T11:21:42.254358  / # export SHELL=3D/bin/sh. /lava-956151/en=
vironment
    2023-05-22T11:21:42.255018  =

    2023-05-22T11:21:42.356263  / # . /lava-956151/environment/lava-956151/=
bin/lava-test-runner /lava-956151/1
    2023-05-22T11:21:42.356948  =

    2023-05-22T11:21:42.359863  / # /lava-956151/bin/lava-test-runner /lava=
-956151/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/646b50b6420820134a2e85f0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b50b6420820134a2e85f5
        failing since 76 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-05-22T11:23:26.915807  + set +x
    2023-05-22T11:23:26.916062  [   29.423675] <LAVA_SIGNAL_ENDRUN 0_dmesg =
956156_1.6.2.3.1>
    2023-05-22T11:23:27.031694  #
    2023-05-22T11:23:27.133611  / # #export SHELL=3D/bin/sh
    2023-05-22T11:23:27.134077  =

    2023-05-22T11:23:27.235292  / # export SHELL=3D/bin/sh. /lava-956156/en=
vironment
    2023-05-22T11:23:27.235732  =

    2023-05-22T11:23:27.337099  / # . /lava-956156/environment/lava-956156/=
bin/lava-test-runner /lava-956156/1
    2023-05-22T11:23:27.337734  =

    2023-05-22T11:23:27.340749  / # /lava-956156/bin/lava-test-runner /lava=
-956156/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/646b503e7387fc41472e85e8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b503e7387fc41472e85ed
        failing since 28 days (last pass: renesas-devel-2023-04-21-v6.3-rc7=
, first fail: renesas-devel-2023-04-24-v6.3)

    2023-05-22T11:21:27.129422  + set[   26.883282] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 956148_1.6.2.3.1>
    2023-05-22T11:21:27.129626   +x
    2023-05-22T11:21:27.237433  / # #
    2023-05-22T11:21:27.339046  export SHELL=3D/bin/sh
    2023-05-22T11:21:27.339535  #
    2023-05-22T11:21:27.440754  / # export SHELL=3D/bin/sh. /lava-956148/en=
vironment
    2023-05-22T11:21:27.441258  =

    2023-05-22T11:21:27.542453  / # . /lava-956148/environment/lava-956148/=
bin/lava-test-runner /lava-956148/1
    2023-05-22T11:21:27.543014  =

    2023-05-22T11:21:27.545903  / # /lava-956148/bin/lava-test-runner /lava=
-956148/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/646b50a2c7c0db76a42e86c8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b50a2c7c0db76a42e86cd
        new failure (last pass: renesas-devel-2023-05-09-v6.4-rc1)

    2023-05-22T11:23:05.913726  + set[   27.765563] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 956160_1.6.2.3.1>
    2023-05-22T11:23:05.913913   +x
    2023-05-22T11:23:06.019921  #
    2023-05-22T11:23:06.121862  / # #export SHELL=3D/bin/sh
    2023-05-22T11:23:06.122298  =

    2023-05-22T11:23:06.223503  / # export SHELL=3D/bin/sh. /lava-956160/en=
vironment
    2023-05-22T11:23:06.224020  =

    2023-05-22T11:23:06.325433  / # . /lava-956160/environment/lava-956160/=
bin/lava-test-runner /lava-956160/1
    2023-05-22T11:23:06.326059  =

    2023-05-22T11:23:06.328862  / # /lava-956160/bin/lava-test-runner /lava=
-956160/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/646b4b9150a7defd0e2e86ae

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4b9150a7defd0e2e86b1
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7)

    2023-05-22T11:01:24.595659  / # #
    2023-05-22T11:01:24.698305  export SHELL=3D/bin/sh
    2023-05-22T11:01:24.699025  #
    2023-05-22T11:01:24.800844  / # export SHELL=3D/bin/sh. /lava-341972/en=
vironment
    2023-05-22T11:01:24.801642  =

    2023-05-22T11:01:24.903649  / # . /lava-341972/environment/lava-341972/=
bin/lava-test-runner /lava-341972/1
    2023-05-22T11:01:24.904678  =

    2023-05-22T11:01:24.922063  / # /lava-341972/bin/lava-test-runner /lava=
-341972/1
    2023-05-22T11:01:25.137681  + export TESTRUN_ID=3D1_bootrr
    2023-05-22T11:01:25.140759  + cd /lava-341972/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline-nfs.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id=
/646b4b9250a7defd0e2e86c1
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7)

    2023-05-22T11:01:29.167548  /lava-341972/1/../bin/lava-test-case
    2023-05-22T11:01:29.225564  <8>[   22.210637] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c93ffe12f316f2e8607

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4c93ffe12f316f2e860c
        failing since 52 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:34.217326  + set +x

    2023-05-22T11:05:34.221042  <8>[   22.383109] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409292_1.5.2.3.1>

    2023-05-22T11:05:34.328468  / # #

    2023-05-22T11:05:34.429058  export SHELL=3D/bin/sh

    2023-05-22T11:05:34.429265  #

    2023-05-22T11:05:34.529745  / # export SHELL=3D/bin/sh. /lava-10409292/=
environment

    2023-05-22T11:05:34.529941  =


    2023-05-22T11:05:34.630433  / # . /lava-10409292/environment/lava-10409=
292/bin/lava-test-runner /lava-10409292/1

    2023-05-22T11:05:34.630722  =


    2023-05-22T11:05:34.635313  / # /lava-10409292/bin/lava-test-runner /la=
va-10409292/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4ca6bceab040012e8608

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4ca6bceab040012e860d
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:05:54.393194  [   17.938919] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409361_1.5.2.3.1>

    2023-05-22T11:05:54.497523  / # #

    2023-05-22T11:05:54.598174  export SHELL=3D/bin/sh

    2023-05-22T11:05:54.598374  #

    2023-05-22T11:05:54.698875  / # export SHELL=3D/bin/sh. /lava-10409361/=
environment

    2023-05-22T11:05:54.699121  =


    2023-05-22T11:05:54.799736  / # . /lava-10409361/environment/lava-10409=
361/bin/lava-test-runner /lava-10409361/1

    2023-05-22T11:05:54.800031  =


    2023-05-22T11:05:54.804447  / # /lava-10409361/bin/lava-test-runner /la=
va-10409361/1

    2023-05-22T11:05:54.849713  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4db70b2487d7902e8610

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4db70b2487d7902e8615
        failing since 52 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-22T11:10:31.589470  <8>[   18.275367] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409460_1.5.2.3.1>

    2023-05-22T11:10:31.694071  / # #

    2023-05-22T11:10:31.794651  export SHELL=3D/bin/sh

    2023-05-22T11:10:31.794872  #

    2023-05-22T11:10:31.895379  / # export SHELL=3D/bin/sh. /lava-10409460/=
environment

    2023-05-22T11:10:31.895672  =


    2023-05-22T11:10:31.996189  / # . /lava-10409460/environment/lava-10409=
460/bin/lava-test-runner /lava-10409460/1

    2023-05-22T11:10:31.996484  =


    2023-05-22T11:10:32.001512  / # /lava-10409460/bin/lava-test-runner /la=
va-10409460/1

    2023-05-22T11:10:32.044452  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c782cb07313162e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/646b4c782cb073131=
62e85ff
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/646b55146b2998a23a2e864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/646b55146b2998a23=
a2e864f
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4c906d29ab80572e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/646b4c906d29ab805=
72e85e9
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/646b549dbe8eed85a62e8706

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/646b549dbe8eed85a=
62e8707
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/646b4b9c50a7defd0e2e86f6

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/646b4b9c50a=
7defd0e2e874d
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        2 lines

    2023-05-22T11:01:23.383140  alert :   CM =3D 0, WnR =3D 0

    2023-05-22T11:01:23.390029  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000000552a000

    2023-05-22T11:01:23.397880  kern  :alert : [0000000000000008] pgd=3D000=
0000000000000, p4d=3D0000000000000000

    2023-05-22T11:01:23.448135  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-22T11:01:23.455850  kern  :emerg : Code: 97fc7110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T11:01:23.492606  <8>[   31.172279] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/646b4b9c50a=
7defd0e2e874e
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        12 lines

    2023-05-22T11:01:23.336632  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:01:23.340111  kern  :alert : Mem abort info:

    2023-05-22T11:01:23.344312  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-22T11:01:23.350244  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:01:23.353737  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:01:23.357282  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:01:23.362491  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-22T11:01:23.365569  kern  :alert : Data abort info:

    2023-05-22T11:01:23.369832  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-22T11:01:23.380132  kern  :<8>[   31.059100] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/646b54e96b2998a23a2e85e6

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/646b54e96b2=
998a23a2e863d
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        2 lines

    2023-05-22T11:40:59.065932  kern  :<8>[   32.122788] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-05-22T11:40:59.066525  alert :   CM =3D 0, WnR =3D 0

    2023-05-22T11:40:59.074349  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000000607a000

    2023-05-22T11:40:59.081229  kern  :alert : [0000000000000008] pgd=3D000=
0000000000000, p4d=3D0000000000000000

    2023-05-22T11:40:59.128872  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-22T11:40:59.135366  kern  :emerg : Code: 97fdfd10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T11:40:59.169835  <8>[   32.234399] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/646b54e96b2=
998a23a2e863e
        failing since 12 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1)
        12 lines

    2023-05-22T11:40:58.951857  <8>[   32.014098] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-22T11:40:59.020591  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:40:59.023924  kern  :alert : Mem abort info:

    2023-05-22T11:40:59.028185  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-22T11:40:59.034031  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:40:59.037367  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:40:59.040930  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:40:59.046741  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-22T11:40:59.049541  kern  :alert : Data abort info:

    2023-05-22T11:40:59.053576  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/646b4b4d2367fc33822e8608

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/646b4b4d236=
7fc33822e860f
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7)
        2 lines

    2023-05-22T11:00:18.959651  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-22T11:00:18.959909  kern  :emerg : Code: 97fdf910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T11:00:19.004196  [   33.583991] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-22T11:00:19.004672  + set +x

    2023-05-22T11:00:19.005001  [   33.588110] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409222_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/646b4b4d236=
7fc33822e8610
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7)
        12 lines

    2023-05-22T11:00:18.840666  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:00:18.840825  kern  :alert : Mem abort info:

    2023-05-22T11:00:18.840888  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-22T11:00:18.840949  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:00:18.841006  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:00:18.841062  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:00:18.841117  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-22T11:00:18.841172  kern  :alert : Data abort info:

    2023-05-22T11:00:18.841226  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-22T11:00:18.841279  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/646b4de94be12f60352e8626

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-n=
fs-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-n=
fs-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/646b4de94be=
12f60352e862d
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        2 lines

    2023-05-22T11:11:23.588528  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-22T11:11:23.588627  kern  :emerg : Code: 97fd3110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T11:11:23.628452  <8>[   33.498056] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-22T11:11:23.628549  + set +x

    2023-05-22T11:11:23.628625  <8>[   33.500786] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409412_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/646b4de94be=
12f60352e862e
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        12 lines

    2023-05-22T11:11:23.484625  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:11:23.484735  kern  :alert : Mem abort info:

    2023-05-22T11:11:23.484811  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-22T11:11:23.484882  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:11:23.484951  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:11:23.485017  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:11:23.485082  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-22T11:11:23.485146  kern  :alert : Data abort info:

    2023-05-22T11:11:23.485208  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-22T11:11:23.485270  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/646b521a4a3561f8192e85f3

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-col=
labora/baseline-nfs-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-col=
labora/baseline-nfs-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/646b521a4a3=
561f8192e85fa
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        2 lines

    2023-05-22T11:29:07.708990  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-22T11:29:07.709515  kern  :emerg : Code: 97f9e510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T11:29:07.766172  [   39.678431] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-22T11:29:07.766669  + set +x

    2023-05-22T11:29:07.766990  [   39.681483] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409670_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/646b521a4a3=
561f8192e85fb
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        12 lines

    2023-05-22T11:29:07.592900  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:29:07.593399  kern  :alert : Mem abort info:

    2023-05-22T11:29:07.593691  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-22T11:29:07.593963  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:29:07.594224  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:29:07.594477  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:29:07.594725  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-22T11:29:07.594971  kern  :alert : Data abort info:

    2023-05-22T11:29:07.595216  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-22T11:29:07.595458  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/646b533a90765b97212e8636

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-nfs-rk=
3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-nfs-rk=
3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/646b533a907=
65b97212e863d
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        2 lines

    2023-05-22T11:34:09.282192  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-22T11:34:09.282448  kern  :emerg : Code: 97fe1d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-22T11:34:09.324283  [   32.218987] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-22T11:34:09.324503  + set +x

    2023-05-22T11:34:09.324622  [   32.225825] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10409700_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/646b533a907=
65b97212e863e
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        12 lines

    2023-05-22T11:34:09.184267  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-22T11:34:09.184362  kern  :alert : Mem abort info:

    2023-05-22T11:34:09.184435  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-22T11:34:09.184505  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-22T11:34:09.184570  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-22T11:34:09.184634  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-22T11:34:09.184698  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-22T11:34:09.184760  kern  :alert : Data abort info:

    2023-05-22T11:34:09.184822  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-22T11:34:09.184883  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/646b4ba3b7e36ebb342e85e8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b4ba3b7e36ebb342e85ed
        new failure (last pass: renesas-devel-2023-05-09-v6.4-rc1)

    2023-05-22T11:01:41.663891  + set +x

    2023-05-22T11:01:41.670070  <8>[   32.346607] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409234_1.6.2.3.1>

    2023-05-22T11:01:41.774843  / # #

    2023-05-22T11:01:41.878067  export SHELL=3D/bin/sh

    2023-05-22T11:01:41.878959  #

    2023-05-22T11:01:41.980914  / # export SHELL=3D/bin/sh. /lava-10409234/=
environment

    2023-05-22T11:01:41.981790  =


    2023-05-22T11:01:42.083535  / # . /lava-10409234/environment/lava-10409=
234/bin/lava-test-runner /lava-10409234/1

    2023-05-22T11:01:42.084850  =


    2023-05-22T11:01:42.091142  / # /lava-10409234/bin/lava-test-runner /la=
va-10409234/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/646b5936bcddb0dcc52e8623

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646b5936bcddb0dcc52e8628
        new failure (last pass: renesas-devel-2023-05-09-v6.4-rc1)

    2023-05-22T11:59:25.105495  + set +x

    2023-05-22T11:59:25.111967  <8>[   29.441896] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10409760_1.6.2.3.1>

    2023-05-22T11:59:25.217116  / # #

    2023-05-22T11:59:25.317981  export SHELL=3D/bin/sh

    2023-05-22T11:59:25.318299  #

    2023-05-22T11:59:25.418972  / # export SHELL=3D/bin/sh. /lava-10409760/=
environment

    2023-05-22T11:59:25.419304  =


    2023-05-22T11:59:25.519968  / # . /lava-10409760/environment/lava-10409=
760/bin/lava-test-runner /lava-10409760/1

    2023-05-22T11:59:25.520438  =


    2023-05-22T11:59:25.526051  / # /lava-10409760/bin/lava-test-runner /la=
va-10409760/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/646b73c8c75edc48012e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-22-v6.4-rc3/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-nfs=
-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230512.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/646b73c8c75edc480=
12e8609
        new failure (last pass: renesas-devel-2023-04-21-v6.3-rc7) =

 =20
