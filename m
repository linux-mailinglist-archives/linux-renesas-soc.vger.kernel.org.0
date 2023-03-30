Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1036D1113
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 23:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjC3VxF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 17:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjC3VxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 17:53:04 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F68610402
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 14:53:01 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id kq3so19411165plb.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 14:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680213180;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jMldZjuIC90+79Gwo1p1p0Qdk0ykHuX5MnbCV4Qp8Cc=;
        b=OV1ORuRL70x/zmsQorMygksDD6VPS97mjfHIKZWZCbTs8Yd9bC78UbgZ5MsIcunzgF
         GhFgQG/r23QNg0EbN9y98QAELcoEnTv58eypNVqVGz4iivf8VQOUaL5w/YFe8Gh94yRC
         JcHzr+YWvdrs1nFEGk+j5ZKsjzG/0ygODKHPsKkRdLNGHHp7+DttGZQznLV0V4bMf1WY
         5jOec47KD3aefEDzpisWu0+ANryLOHXU0ZfTyRX3k6gDw8R2GRbrCtJLQMu4TWqOfXFX
         FtJa7QeutSaM/XU5WmU4cOJWw6kjYdhglGMeNfnXtFcX2OcscnbZ3UM/AVxaECNLyjB8
         tkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213180;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMldZjuIC90+79Gwo1p1p0Qdk0ykHuX5MnbCV4Qp8Cc=;
        b=KXXIDSJLPptGWJm0ftH196YqSU+N8QSehiNBSBhHg30KbseNmgb9k7nfUWTiBD8sof
         wDxEvYeDcTbTX4Sy6EVsY1e0P4s9EDCIyPwb86FU4GmZ1wyaiIA+s/xTMVRjaGgvptWK
         /ly/tzXgrgDJf0fUAoavTTNDwGYpTv8cUB4M/Jw72Pm7uoGsYsoM52q3sz7DY9+p6xQC
         DW9kF1EABYHK8bgSS28yD3+K9HzRWjgEEBJv4vgbpAGHJXBYkVfGLfiiYsXQ7FWHXtZv
         1hYesXGpampLcJBWrqDoyvQqLC1iUoBMXYh/SVrJ0KL+MSu+Z/mBT9XGLLhRY1EJobGW
         +89Q==
X-Gm-Message-State: AAQBX9cCBv3EZEu1GHH8jD/35ZdtEzzhqLGM8zu2aOZ3pWr/w8ME9ZJD
        jVrqOqY83pqzHKL7cE4YtB3e+G0YJU6cN68rkug=
X-Google-Smtp-Source: AKy350ZzqTewY4LSF3EPEjWAUCzqghLLsly+GaV17z4MU/MPwN1QyskF8Hz06VcYjYN0Dyish8oAmw==
X-Received: by 2002:a17:903:18b:b0:19e:8267:9590 with SMTP id z11-20020a170903018b00b0019e82679590mr29322952plg.41.1680213178940;
        Thu, 30 Mar 2023 14:52:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709028f9500b00198f36a8941sm166977plo.221.2023.03.30.14.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:52:58 -0700 (PDT)
Message-ID: <642604ba.170a0220.e15a.0d9d@mx.google.com>
Date:   Thu, 30 Mar 2023 14:52:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-03-30-v6.3-rc4
Subject: renesas/master baseline: 451 runs,
 49 regressions (renesas-devel-2023-03-30-v6.3-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 451 runs, 49 regressions (renesas-devel-2023-03-30=
-v6.3-rc4)

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

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

fsl-lx2160a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

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

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

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

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-30-v6.3-rc4/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-30-v6.3-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0bdeaa9d6106a95da9fe0d7e1fcf8a196e91805c =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cb0a03f4b81ddf62f777

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cb0a03f4b81ddf62f77c
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:46:27.856707  <8>[   10.621048] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820795_1.4.2.3.1>

    2023-03-30T17:46:27.859726  + set +x

    2023-03-30T17:46:27.967752  / # #

    2023-03-30T17:46:28.070142  export SHELL=3D/bin/sh

    2023-03-30T17:46:28.070890  #

    2023-03-30T17:46:28.172879  / # export SHELL=3D/bin/sh. /lava-9820795/e=
nvironment

    2023-03-30T17:46:28.173632  =


    2023-03-30T17:46:28.275376  / # . /lava-9820795/environment/lava-982079=
5/bin/lava-test-runner /lava-9820795/1

    2023-03-30T17:46:28.277199  =


    2023-03-30T17:46:28.282245  / # /lava-9820795/bin/lava-test-runner /lav=
a-9820795/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cbe4a6c5c2183262f782

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cbe4a6c5c2183262f787
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:50:10.432675  <8>[   10.106525] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820905_1.4.2.3.1>

    2023-03-30T17:50:10.436021  + set +x

    2023-03-30T17:50:10.540684  / # #

    2023-03-30T17:50:10.641769  export SHELL=3D/bin/sh

    2023-03-30T17:50:10.642008  #

    2023-03-30T17:50:10.742915  / # export SHELL=3D/bin/sh. /lava-9820905/e=
nvironment

    2023-03-30T17:50:10.743132  =


    2023-03-30T17:50:10.844066  / # . /lava-9820905/environment/lava-982090=
5/bin/lava-test-runner /lava-9820905/1

    2023-03-30T17:50:10.844412  =


    2023-03-30T17:50:10.850516  / # /lava-9820905/bin/lava-test-runner /lav=
a-9820905/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cec2eb31ea788162f77a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cec2eb31ea788162f77f
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:02:30.889392  + set +x

    2023-03-30T18:02:30.895754  <8>[   13.441190] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821265_1.4.2.3.1>

    2023-03-30T18:02:31.000555  / # #

    2023-03-30T18:02:31.101554  export SHELL=3D/bin/sh

    2023-03-30T18:02:31.101825  #

    2023-03-30T18:02:31.202664  / # export SHELL=3D/bin/sh. /lava-9821265/e=
nvironment

    2023-03-30T18:02:31.202880  =


    2023-03-30T18:02:31.303761  / # . /lava-9821265/environment/lava-982126=
5/bin/lava-test-runner /lava-9821265/1

    2023-03-30T18:02:31.304079  =


    2023-03-30T18:02:31.309817  / # /lava-9821265/bin/lava-test-runner /lav=
a-9821265/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cae4be14006bd962f778

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cae4be14006bd962f77d
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:45:51.273190  + <8>[   11.007365] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9820794_1.4.2.3.1>

    2023-03-30T17:45:51.273641  set +x

    2023-03-30T17:45:51.381313  / # #

    2023-03-30T17:45:51.484086  export SHELL=3D/bin/sh

    2023-03-30T17:45:51.484909  #

    2023-03-30T17:45:51.586907  / # export SHELL=3D/bin/sh. /lava-9820794/e=
nvironment

    2023-03-30T17:45:51.587793  =


    2023-03-30T17:45:51.689710  / # . /lava-9820794/environment/lava-982079=
4/bin/lava-test-runner /lava-9820794/1

    2023-03-30T17:45:51.690971  =


    2023-03-30T17:45:51.695810  / # /lava-9820794/bin/lava-test-runner /lav=
a-9820794/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cbadaaaf33ecfb62f7b0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cbadaaaf33ecfb62f7b5
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:49:21.602205  + set<8>[   11.494004] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9820907_1.4.2.3.1>

    2023-03-30T17:49:21.602735   +x

    2023-03-30T17:49:21.710651  / # #

    2023-03-30T17:49:21.813036  export SHELL=3D/bin/sh

    2023-03-30T17:49:21.813784  #

    2023-03-30T17:49:21.915577  / # export SHELL=3D/bin/sh. /lava-9820907/e=
nvironment

    2023-03-30T17:49:21.916380  =


    2023-03-30T17:49:22.018177  / # . /lava-9820907/environment/lava-982090=
7/bin/lava-test-runner /lava-9820907/1

    2023-03-30T17:49:22.019368  =


    2023-03-30T17:49:22.023720  / # /lava-9820907/bin/lava-test-runner /lav=
a-9820907/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425ceb96018c0fbde62f778

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425ceb96018c0fbde62f77d
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:02:14.543489  + set +x

    2023-03-30T18:02:14.546525  <8>[   12.982004] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821248_1.4.2.3.1>

    2023-03-30T18:02:14.652638  / # #

    2023-03-30T18:02:14.755598  export SHELL=3D/bin/sh

    2023-03-30T18:02:14.756443  #

    2023-03-30T18:02:14.858336  / # export SHELL=3D/bin/sh. /lava-9821248/e=
nvironment

    2023-03-30T18:02:14.859224  =


    2023-03-30T18:02:14.961187  / # . /lava-9821248/environment/lava-982124=
8/bin/lava-test-runner /lava-9821248/1

    2023-03-30T18:02:14.962499  =


    2023-03-30T18:02:14.967331  / # /lava-9821248/bin/lava-test-runner /lav=
a-9821248/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cab8a1edcf716062f7de

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cab9a1edcf716062f7e3
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:45:08.085728  <8>[    7.433003] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820779_1.4.2.3.1>

    2023-03-30T17:45:08.089305  + set +x

    2023-03-30T17:45:08.190863  /#

    2023-03-30T17:45:08.292146   # #export SHELL=3D/bin/sh

    2023-03-30T17:45:08.292337  =


    2023-03-30T17:45:08.393224  / # export SHELL=3D/bin/sh. /lava-9820779/e=
nvironment

    2023-03-30T17:45:08.393427  =


    2023-03-30T17:45:08.494319  / # . /lava-9820779/environment/lava-982077=
9/bin/lava-test-runner /lava-9820779/1

    2023-03-30T17:45:08.494839  =


    2023-03-30T17:45:08.500062  / # /lava-9820779/bin/lava-test-runner /lav=
a-9820779/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cba57177d35e6d62f801

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cba57177d35e6d62f806
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:49:07.034361  <8>[   10.098779] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820917_1.4.2.3.1>

    2023-03-30T17:49:07.037428  + set +x

    2023-03-30T17:49:07.138985  #

    2023-03-30T17:49:07.240278  / # #export SHELL=3D/bin/sh

    2023-03-30T17:49:07.240525  =


    2023-03-30T17:49:07.341403  / # export SHELL=3D/bin/sh. /lava-9820917/e=
nvironment

    2023-03-30T17:49:07.341619  =


    2023-03-30T17:49:07.442526  / # . /lava-9820917/environment/lava-982091=
7/bin/lava-test-runner /lava-9820917/1

    2023-03-30T17:49:07.442847  =


    2023-03-30T17:49:07.447548  / # /lava-9820917/bin/lava-test-runner /lav=
a-9820917/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cec0d5a1e4287b62f7f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cec0d5a1e4287b62f7f9
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:02:23.188811  <8>[   11.860927] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821236_1.4.2.3.1>

    2023-03-30T18:02:23.191984  + set +x

    2023-03-30T18:02:23.293574  #

    2023-03-30T18:02:23.293839  =


    2023-03-30T18:02:23.394769  / # #export SHELL=3D/bin/sh

    2023-03-30T18:02:23.394937  =


    2023-03-30T18:02:23.495817  / # export SHELL=3D/bin/sh. /lava-9821236/e=
nvironment

    2023-03-30T18:02:23.495994  =


    2023-03-30T18:02:23.596877  / # . /lava-9821236/environment/lava-982123=
6/bin/lava-test-runner /lava-9821236/1

    2023-03-30T18:02:23.597150  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6425ce4dce467f81d862f7f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425ce4dce467f81d862f=
7fa
        failing since 24 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-lx2160a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d27b402672c9ee62f86b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-fsl-lx216=
0a-rdb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-fsl-lx216=
0a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425d27b402672c9ee62f86e
        failing since 24 days (last pass: renesas-devel-2022-11-17-v6.1-rc5=
, first fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:18:05.420786  [   62.860733] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1190721_1.5.2.4.1>
    2023-03-30T18:18:05.526964  / # #
    2023-03-30T18:18:05.629351  export SHELL=3D/bin/sh
    2023-03-30T18:18:05.630107  #
    2023-03-30T18:18:05.731704  / # export SHELL=3D/bin/sh. /lava-1190721/e=
nvironment
    2023-03-30T18:18:05.732221  =

    2023-03-30T18:18:05.833871  / # . /lava-1190721/environment/lava-119072=
1/bin/lava-test-runner /lava-1190721/1
    2023-03-30T18:18:05.834767  =

    2023-03-30T18:18:05.836390  / # /lava-1190721/bin/lava-test-runner /lav=
a-1190721/1
    2023-03-30T18:18:05.861388  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cbe97ad84f73e962f76b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cbe97ad84f73e962f770
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:50:19.397350  + set +x

    2023-03-30T17:50:19.403526  <8>[   11.047337] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820813_1.4.2.3.1>

    2023-03-30T17:50:19.508414  / # #

    2023-03-30T17:50:19.609543  export SHELL=3D/bin/sh

    2023-03-30T17:50:19.609868  #

    2023-03-30T17:50:19.710838  / # export SHELL=3D/bin/sh. /lava-9820813/e=
nvironment

    2023-03-30T17:50:19.711050  =


    2023-03-30T17:50:19.811973  / # . /lava-9820813/environment/lava-982081=
3/bin/lava-test-runner /lava-9820813/1

    2023-03-30T17:50:19.812317  =


    2023-03-30T17:50:19.817199  / # /lava-9820813/bin/lava-test-runner /lav=
a-9820813/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cc3b0812c13d4162f76c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cc3b0812c13d4162f771
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:51:38.800121  + <8>[   10.507029] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9820931_1.4.2.3.1>

    2023-03-30T17:51:38.800211  set +x

    2023-03-30T17:51:38.901827  #

    2023-03-30T17:51:39.003074  / # #export SHELL=3D/bin/sh

    2023-03-30T17:51:39.003301  =


    2023-03-30T17:51:39.104214  / # export SHELL=3D/bin/sh. /lava-9820931/e=
nvironment

    2023-03-30T17:51:39.104434  =


    2023-03-30T17:51:39.205331  / # . /lava-9820931/environment/lava-982093=
1/bin/lava-test-runner /lava-9820931/1

    2023-03-30T17:51:39.205658  =


    2023-03-30T17:51:39.210290  / # /lava-9820931/bin/lava-test-runner /lav=
a-9820931/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425ceba5f7493b9f462f7d4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425ceba5f7493b9f462f7d9
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:02:10.489341  + set +x<8>[   15.659683] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9821262_1.4.2.3.1>

    2023-03-30T18:02:10.489436  =


    2023-03-30T18:02:10.595066  / # #

    2023-03-30T18:02:10.696055  export SHELL=3D/bin/sh

    2023-03-30T18:02:10.696251  #

    2023-03-30T18:02:10.797120  / # export SHELL=3D/bin/sh. /lava-9821262/e=
nvironment

    2023-03-30T18:02:10.797324  =


    2023-03-30T18:02:10.898121  / # . /lava-9821262/environment/lava-982126=
2/bin/lava-test-runner /lava-9821262/1

    2023-03-30T18:02:10.898414  =


    2023-03-30T18:02:10.902612  / # /lava-9821262/bin/lava-test-runner /lav=
a-9821262/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cc5a6a88c5b0ef62f76c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cc5a6a88c5b0ef62f771
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:52:18.539798  <8>[   10.867224] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820830_1.4.2.3.1>

    2023-03-30T17:52:18.543149  + set +x

    2023-03-30T17:52:18.648536  #

    2023-03-30T17:52:18.649809  =


    2023-03-30T17:52:18.751843  / # #export SHELL=3D/bin/sh

    2023-03-30T17:52:18.752715  =


    2023-03-30T17:52:18.854636  / # export SHELL=3D/bin/sh. /lava-9820830/e=
nvironment

    2023-03-30T17:52:18.855360  =


    2023-03-30T17:52:18.957202  / # . /lava-9820830/environment/lava-982083=
0/bin/lava-test-runner /lava-9820830/1

    2023-03-30T17:52:18.958369  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cea9bec65db01462f790

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cea9bec65db01462f794
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:01:57.169069  + set +x

    2023-03-30T18:01:57.176135  <8>[   13.556054] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821238_1.4.2.3.1>

    2023-03-30T18:01:57.280505  / # #

    2023-03-30T18:01:57.381595  export SHELL=3D/bin/sh

    2023-03-30T18:01:57.381864  #

    2023-03-30T18:01:57.482823  / # export SHELL=3D/bin/sh. /lava-9821238/e=
nvironment

    2023-03-30T18:01:57.483051  =


    2023-03-30T18:01:57.583997  / # . /lava-9821238/environment/lava-982123=
8/bin/lava-test-runner /lava-9821238/1

    2023-03-30T18:01:57.584276  =


    2023-03-30T18:01:57.589858  / # /lava-9821238/bin/lava-test-runner /lav=
a-9821238/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cad2ad1e17675562f771

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cad2ad1e17675562f776
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:45:45.869983  + set<8>[   11.246964] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9820823_1.4.2.3.1>

    2023-03-30T17:45:45.870070   +x

    2023-03-30T17:45:45.974613  / # #

    2023-03-30T17:45:46.075538  export SHELL=3D/bin/sh

    2023-03-30T17:45:46.075735  #

    2023-03-30T17:45:46.176625  / # export SHELL=3D/bin/sh. /lava-9820823/e=
nvironment

    2023-03-30T17:45:46.176824  =


    2023-03-30T17:45:46.277714  / # . /lava-9820823/environment/lava-982082=
3/bin/lava-test-runner /lava-9820823/1

    2023-03-30T17:45:46.277985  =


    2023-03-30T17:45:46.282158  / # /lava-9820823/bin/lava-test-runner /lav=
a-9820823/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cbc8254d76c41b62f7b3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cbc8254d76c41b62f7b8
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:49:46.482454  + set<8>[   11.414626] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9820937_1.4.2.3.1>

    2023-03-30T17:49:46.482559   +x

    2023-03-30T17:49:46.587450  / # #

    2023-03-30T17:49:46.688515  export SHELL=3D/bin/sh

    2023-03-30T17:49:46.688890  #

    2023-03-30T17:49:46.790091  / # export SHELL=3D/bin/sh. /lava-9820937/e=
nvironment

    2023-03-30T17:49:46.790342  =


    2023-03-30T17:49:46.891252  / # . /lava-9820937/environment/lava-982093=
7/bin/lava-test-runner /lava-9820937/1

    2023-03-30T17:49:46.892434  =


    2023-03-30T17:49:46.897377  / # /lava-9820937/bin/lava-test-runner /lav=
a-9820937/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425ceb474356a7eda62f776

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425ceb474356a7eda62f77b
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:02:20.389647  + set +x

    2023-03-30T18:02:20.393134  <8>[   14.071293] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9821237_1.4.2.3.1>

    2023-03-30T18:02:20.502946  / # #

    2023-03-30T18:02:20.605373  export SHELL=3D/bin/sh

    2023-03-30T18:02:20.606167  #

    2023-03-30T18:02:20.708085  / # export SHELL=3D/bin/sh. /lava-9821237/e=
nvironment

    2023-03-30T18:02:20.708845  =


    2023-03-30T18:02:20.810677  / # . /lava-9821237/environment/lava-982123=
7/bin/lava-test-runner /lava-9821237/1

    2023-03-30T18:02:20.811823  =


    2023-03-30T18:02:20.816196  / # /lava-9821237/bin/lava-test-runner /lav=
a-9821237/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d45c7e6d73daf462f79a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/base=
line-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d45c7e6d73daf462f=
79b
        failing since 139 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-11-10-v6.1-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cae96bbb57dbc862f776

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cae96bbb57dbc862f77b
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:46:02.139880  <8>[   12.067287] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820814_1.4.2.3.1>

    2023-03-30T17:46:02.245105  / # #

    2023-03-30T17:46:02.346136  export SHELL=3D/bin/sh

    2023-03-30T17:46:02.346429  #

    2023-03-30T17:46:02.447381  / # export SHELL=3D/bin/sh. /lava-9820814/e=
nvironment

    2023-03-30T17:46:02.447598  =


    2023-03-30T17:46:02.548503  / # . /lava-9820814/environment/lava-982081=
4/bin/lava-test-runner /lava-9820814/1

    2023-03-30T17:46:02.548859  =


    2023-03-30T17:46:02.553433  / # /lava-9820814/bin/lava-test-runner /lav=
a-9820814/1

    2023-03-30T17:46:02.559910  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cbc5d7cc95973362ffe1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cbc5d7cc95973362ffe6
        new failure (last pass: renesas-devel-2023-03-27-v6.3-rc4)

    2023-03-30T17:49:47.663524  <8>[   11.368801] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9820936_1.4.2.3.1>

    2023-03-30T17:49:47.768223  / # #

    2023-03-30T17:49:47.869323  export SHELL=3D/bin/sh

    2023-03-30T17:49:47.869602  #

    2023-03-30T17:49:47.970521  / # export SHELL=3D/bin/sh. /lava-9820936/e=
nvironment

    2023-03-30T17:49:47.970855  =


    2023-03-30T17:49:48.071825  / # . /lava-9820936/environment/lava-982093=
6/bin/lava-test-runner /lava-9820936/1

    2023-03-30T17:49:48.072185  =


    2023-03-30T17:49:48.076842  / # /lava-9820936/bin/lava-test-runner /lav=
a-9820936/1

    2023-03-30T17:49:48.083210  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cead5f7493b9f462f77b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cead5f7493b9f462f780
        new failure (last pass: renesas-devel-2023-03-16-v6.3-rc2)

    2023-03-30T18:01:57.829211  + set<8>[   14.439282] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9821256_1.4.2.3.1>

    2023-03-30T18:01:57.829301   +x

    2023-03-30T18:01:57.934472  / # #

    2023-03-30T18:01:58.035482  export SHELL=3D/bin/sh

    2023-03-30T18:01:58.035697  #

    2023-03-30T18:01:58.136544  / # export SHELL=3D/bin/sh. /lava-9821256/e=
nvironment

    2023-03-30T18:01:58.136861  =


    2023-03-30T18:01:58.237891  / # . /lava-9821256/environment/lava-982125=
6/bin/lava-test-runner /lava-9821256/1

    2023-03-30T18:01:58.238228  =


    2023-03-30T18:01:58.242629  / # /lava-9821256/bin/lava-test-runner /lav=
a-9821256/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d0229c90ec119362f781

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d0229c90ec119362f=
782
        failing since 38 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d0af5be298d13562f7cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-me=
son-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-me=
son-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d0af5be298d13562f=
7ce
        failing since 38 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cf177ff95d78ea62f796

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425cf177ff95d78ea62f=
797
        failing since 44 days (last pass: renesas-devel-2023-01-30-v6.2-rc6=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6425ceee25d552926162f7a4

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/6425ceee25d552926162f856
        failing since 24 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:02:57.140111  /lava-9821283/1/../bin/lava-test-case

    2023-03-30T18:02:57.146409  <8>[   20.964134] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/6425ceee25d552926162f857
        failing since 24 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:02:56.120441  /lava-9821283/1/../bin/lava-test-case

    2023-03-30T18:02:56.126669  <8>[   19.944576] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/6425ceee25d552926162f858
        failing since 24 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:02:55.100748  /lava-9821283/1/../bin/lava-test-case

    2023-03-30T18:02:55.106974  <8>[   18.924652] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cf843aea55367562f76d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425cf843aea55367562f=
76e
        failing since 44 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d633c015eee78562f76c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d633c015eee78562f=
76d
        failing since 163 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d4590913ae90f662f802

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d4590913ae90f662f=
803
        failing since 163 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d6d15dba9b87a262f795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d6d15dba9b87a262f=
796
        failing since 163 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d4527e6d73daf462f77b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d4527e6d73daf462f=
77c
        failing since 163 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d6f919d103d89962f76e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d6f919d103d89962f=
76f
        failing since 163 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d45a40fa34d34862f786

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d45a40fa34d34862f=
787
        failing since 163 days (last pass: renesas-devel-2022-09-27-v6.0-rc=
7, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d631a2669c6aa262f7c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline=
-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d631a2669c6aa262f=
7c5
        failing since 163 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d4510913ae90f662f789

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseli=
ne-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d4510913ae90f662f=
78a
        failing since 163 days (last pass: renesas-devel-2022-09-19-v6.0-rc=
6, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d3f370a361e7ce62f775

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d3f370a361e7ce62f=
776
        new failure (last pass: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d407b688cc3da962f779

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d407b688cc3da962f=
77a
        failing since 52 days (last pass: renesas-devel-2023-01-26-v6.2-rc5=
, first fail: renesas-devel-2023-02-06-v6.2-rc7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cf94846cb85cb962f77e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425cf94846cb85cb962f=
77f
        failing since 87 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cc1e35b39be51b62f7c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425cc1e35b39be51b62f=
7c9
        failing since 87 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cf318ad765175f62f899

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425cf318ad765175f62f=
89a
        failing since 44 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d037b8d040139662f76c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d037b8d040139662f=
76d
        failing since 38 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425ce61f4fc93f2c962f78c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425ce61f4fc93f2c962f=
78d
        failing since 44 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6425cee625d552926162f792

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6425cee625d552926162f797
        failing since 24 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-03-30T18:02:56.888770  / # =


    2023-03-30T18:02:56.890480  <3>[   16.243475] Bluetooth: hci0: Opcode 0=
x203b failed: -16

    2023-03-30T18:02:56.896777  =


    2023-03-30T18:02:57.002349  / # #

    2023-03-30T18:02:57.011451  #

    2023-03-30T18:02:57.113820  / # export SHELL=3D/bin/sh

    2023-03-30T18:02:57.114670  <6>[   16.443549] usb 2-1.3: new SuperSpeed=
 USB device number 3 using xhci-hcd

    2023-03-30T18:02:57.127153  export SHELL=3D/bin/sh<6>[   16.521628] usb=
core: registered new device driver r8152-cfgselector

    2023-03-30T18:02:57.127606  =


    2023-03-30T18:02:57.229498  / # . /lava-9821288/environment
 =

    ... (53 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6425ceb36018c0fbde62f771

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425ceb36018c0fbde62f=
772
        failing since 44 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d2158c226493d462f779

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d2158c226493d462f=
77a
        failing since 38 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6425d0850d418f45aa62f781

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-30-v6.3-rc4/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6425d0850d418f45aa62f=
782
        failing since 24 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =20
