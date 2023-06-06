Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD53724450
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 15:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbjFFNYS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 09:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233703AbjFFNYP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 09:24:15 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12149118
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 06:24:11 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-653436fcc1bso2494480b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686057850; x=1688649850;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cIv8Q0TbEIxjVLhdgE4PkqfzHpSQBsXuiEQnIWDnwhg=;
        b=ki4jgpR36jC9k1lbNwLpXdLfI6aRUmiqv/Sz79ZMraEFr8gSIaCZCunnLJkg8fhSbl
         5IRI7B4n4OkvuL7pf1x6uCxj2ljiOQArEkXc1uoyHKsQyZHTG7EqAIXDdz/9p1XWPS0+
         GZL0L3mpAhxWeeOT9wVLNloCf0FLhkdMXjHVDoZlFmFTCYrGqoMq8vLyFKDnwQTiW/Ov
         5vyr/3DIJM3UDJHp5Uoqfu5dxZspjin3cy8t3aMro2ijjkXJbmSeqk4DDLp+/yx2drsQ
         op9L3QrtjMVXq4i68c+YcItTkFCa4GM0AMisb+C2nz+Ti2H+stsEmLY2Teo/WjkaI0HD
         h7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057850; x=1688649850;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIv8Q0TbEIxjVLhdgE4PkqfzHpSQBsXuiEQnIWDnwhg=;
        b=mA+sc9StwEZkVD/wsmk19evbg4nLpB8wpYCHlO1c23AGirEGOl3Oai25JtoGD8iZVy
         NhKt4jf8GwKbNVvl7I8T/8CnI1k1w3j4O0xsJ08nyKS0QY5w2SUIjcMqwHIWZHqO1xXe
         ZfDpvnClGOAs5SBD9HfSKB5wGWmboRJXCs9SHLXPTGqeMiKgEROf3boLSCcNWxJSHAqW
         lDYIyIJYb99wy3ofiNBKbzgtR7jiDzx834HmYcPrpWHm6G/76ys98e64csWr/rX/yHrw
         L+ObRRghtY6f9SBHX7T0eoeN+8juO0XnCou7tlKdufRfbyIiLzZPvpTeT3QJ4M2Ua0JZ
         d95g==
X-Gm-Message-State: AC+VfDxgiFXSkAl3nF2BJOFWwuRirI63n0mG9bL/rFQEQj5Grcqgnz5T
        5O1O6VLLMXt+yFxq0jX5fgf56QBjq7lSWyUOs+3CXQ==
X-Google-Smtp-Source: ACHHUZ5ASm5KM3F9LDrSxyz3/T1e0iRC2/iat4+9iZYAIzhV1nH39yyQ7/ve8LyYVcuOHsxN9WSxwg==
X-Received: by 2002:a05:6a20:d806:b0:10b:4e9c:ee25 with SMTP id iv6-20020a056a20d80600b0010b4e9cee25mr991912pzb.16.1686057848635;
        Tue, 06 Jun 2023 06:24:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902eb1100b001aad714400asm8497321plb.229.2023.06.06.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:24:08 -0700 (PDT)
Message-ID: <647f3378.170a0220.a27c2.f9cf@mx.google.com>
Date:   Tue, 06 Jun 2023 06:24:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-06-v6.4-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 448 runs,
 49 regressions (renesas-devel-2023-06-06-v6.4-rc5)
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

renesas/master baseline: 448 runs, 49 regressions (renesas-devel-2023-06-06=
-v6.4-rc5)

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

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-06-v6.4-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-06-v6.4-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      06b45cc7ec76298d4d2f6d4da1550f05fa1beefd =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efb0088ae7d29e7f5de33

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efb0088ae7d29e7f5de3c
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:23:04.923318  <8>[   10.406218] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603161_1.4.2.3.1>

    2023-06-06T09:23:04.926856  + set +x

    2023-06-06T09:23:05.028275  /#

    2023-06-06T09:23:05.129232   # #export SHELL=3D/bin/sh

    2023-06-06T09:23:05.129449  =


    2023-06-06T09:23:05.229941  / # export SHELL=3D/bin/sh. /lava-10603161/=
environment

    2023-06-06T09:23:05.230157  =


    2023-06-06T09:23:05.330676  / # . /lava-10603161/environment/lava-10603=
161/bin/lava-test-runner /lava-10603161/1

    2023-06-06T09:23:05.331039  =


    2023-06-06T09:23:05.337394  / # /lava-10603161/bin/lava-test-runner /la=
va-10603161/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd6df26c4c2ae3f5df13

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efd6df26c4c2ae3f5df1c
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:25.520205  + set +x

    2023-06-06T09:33:25.526548  <8>[   12.019838] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603474_1.4.2.3.1>

    2023-06-06T09:33:25.630653  / # #

    2023-06-06T09:33:25.731356  export SHELL=3D/bin/sh

    2023-06-06T09:33:25.731571  #

    2023-06-06T09:33:25.832123  / # export SHELL=3D/bin/sh. /lava-10603474/=
environment

    2023-06-06T09:33:25.832329  =


    2023-06-06T09:33:25.932855  / # . /lava-10603474/environment/lava-10603=
474/bin/lava-test-runner /lava-10603474/1

    2023-06-06T09:33:25.933145  =


    2023-06-06T09:33:25.939222  / # /lava-10603474/bin/lava-test-runner /la=
va-10603474/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f008dfa31185beff5de25

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647f008dfa31185beff5de2e
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:46:45.615287  + set +x

    2023-06-06T09:46:45.621721  <8>[   13.166787] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603784_1.4.2.3.1>

    2023-06-06T09:46:45.725998  / # #

    2023-06-06T09:46:45.826543  export SHELL=3D/bin/sh

    2023-06-06T09:46:45.826713  #

    2023-06-06T09:46:45.927232  / # export SHELL=3D/bin/sh. /lava-10603784/=
environment

    2023-06-06T09:46:45.927400  =


    2023-06-06T09:46:46.027879  / # . /lava-10603784/environment/lava-10603=
784/bin/lava-test-runner /lava-10603784/1

    2023-06-06T09:46:46.028252  =


    2023-06-06T09:46:46.033951  / # /lava-10603784/bin/lava-test-runner /la=
va-10603784/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efba4c8192764ecf5de3c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efba4c8192764ecf5de45
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:25:36.756547  + set<8>[   11.871321] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10603188_1.4.2.3.1>

    2023-06-06T09:25:36.756648   +x

    2023-06-06T09:25:36.860578  / # #

    2023-06-06T09:25:36.961276  export SHELL=3D/bin/sh

    2023-06-06T09:25:36.962042  #

    2023-06-06T09:25:37.063303  / # export SHELL=3D/bin/sh. /lava-10603188/=
environment

    2023-06-06T09:25:37.063475  =


    2023-06-06T09:25:37.164032  / # . /lava-10603188/environment/lava-10603=
188/bin/lava-test-runner /lava-10603188/1

    2023-06-06T09:25:37.164298  =


    2023-06-06T09:25:37.169097  / # /lava-10603188/bin/lava-test-runner /la=
va-10603188/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd81796760eda2f5de3b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efd81796760eda2f5de44
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:30.564913  + set<8>[   11.927837] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10603510_1.4.2.3.1>

    2023-06-06T09:33:30.564998   +x

    2023-06-06T09:33:30.669274  / # #

    2023-06-06T09:33:30.769923  export SHELL=3D/bin/sh

    2023-06-06T09:33:30.770121  #

    2023-06-06T09:33:30.870629  / # export SHELL=3D/bin/sh. /lava-10603510/=
environment

    2023-06-06T09:33:30.870822  =


    2023-06-06T09:33:30.971346  / # . /lava-10603510/environment/lava-10603=
510/bin/lava-test-runner /lava-10603510/1

    2023-06-06T09:33:30.971635  =


    2023-06-06T09:33:30.976182  / # /lava-10603510/bin/lava-test-runner /la=
va-10603510/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/647f0096c11d7cd801f5de32

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/647f0096c11d7cd=
801f5de35
        failing since 56 days (last pass: renesas-devel-2023-04-04-v6.3-rc5=
, first fail: renesas-devel-2023-04-10-v6.3-rc6)
        3 lines

    2023-06-06T09:47:00.172937  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-06T09:47:00.179379  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-06T09:47:00.185940  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-06T09:47:00.192750  <8>[   15.664863] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647f0096c11d7cd801f5de3b
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:47:00.196853  + set +x

    2023-06-06T09:47:00.203522  <8>[   15.681080] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603764_1.4.2.3.1>

    2023-06-06T09:47:00.308097  / # #

    2023-06-06T09:47:00.408730  export SHELL=3D/bin/sh

    2023-06-06T09:47:00.408982  #

    2023-06-06T09:47:00.509563  / # export SHELL=3D/bin/sh. /lava-10603764/=
environment

    2023-06-06T09:47:00.509801  =


    2023-06-06T09:47:00.610340  / # . /lava-10603764/environment/lava-10603=
764/bin/lava-test-runner /lava-10603764/1

    2023-06-06T09:47:00.610643  =


    2023-06-06T09:47:00.615413  / # /lava-10603764/bin/lava-test-runner /la=
va-10603764/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efbc8739e30216ef5debc

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efbc8739e30216ef5dec5
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:26:08.644774  <8>[   10.319348] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603212_1.4.2.3.1>

    2023-06-06T09:26:08.647973  + set +x

    2023-06-06T09:26:08.753464  #

    2023-06-06T09:26:08.754699  =


    2023-06-06T09:26:08.856526  / # #export SHELL=3D/bin/sh

    2023-06-06T09:26:08.856708  =


    2023-06-06T09:26:08.957394  / # export SHELL=3D/bin/sh. /lava-10603212/=
environment

    2023-06-06T09:26:08.958131  =


    2023-06-06T09:26:09.059530  / # . /lava-10603212/environment/lava-10603=
212/bin/lava-test-runner /lava-10603212/1

    2023-06-06T09:26:09.060037  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd6eaed15d5883f5de39

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efd6eaed15d5883f5de42
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:24.917152  <8>[   16.884690] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603499_1.4.2.3.1>

    2023-06-06T09:33:24.920715  + set +x

    2023-06-06T09:33:25.022504  =


    2023-06-06T09:33:25.123058  / # #export SHELL=3D/bin/sh

    2023-06-06T09:33:25.123312  =


    2023-06-06T09:33:25.223973  / # export SHELL=3D/bin/sh. /lava-10603499/=
environment

    2023-06-06T09:33:25.224281  =


    2023-06-06T09:33:25.325041  / # . /lava-10603499/environment/lava-10603=
499/bin/lava-test-runner /lava-10603499/1

    2023-06-06T09:33:25.326438  =


    2023-06-06T09:33:25.331368  / # /lava-10603499/bin/lava-test-runner /la=
va-10603499/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f008ec11d7cd801f5de25

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647f008ec11d7cd801f5de2e
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:46:43.030613  <8>[   15.066078] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603787_1.4.2.3.1>

    2023-06-06T09:46:43.033871  + set +x

    2023-06-06T09:46:43.135124  #

    2023-06-06T09:46:43.135371  =


    2023-06-06T09:46:43.235977  / # #export SHELL=3D/bin/sh

    2023-06-06T09:46:43.236165  =


    2023-06-06T09:46:43.336628  / # export SHELL=3D/bin/sh. /lava-10603787/=
environment

    2023-06-06T09:46:43.336817  =


    2023-06-06T09:46:43.437319  / # . /lava-10603787/environment/lava-10603=
787/bin/lava-test-runner /lava-10603787/1

    2023-06-06T09:46:43.437562  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647eff66bff88bee55f5de29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647eff66bff88bee55f5d=
e2a
        failing since 91 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647efdf22831e0f550f5de91

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efdf22831e0f550f5d=
e92
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647f03d93b700260aff5de2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f03d93b700260aff5d=
e2f
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efc8f9f53ccb0e6f5df0b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efc8f9f53ccb0e6f5df14
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:29:39.497712  + set +x

    2023-06-06T09:29:39.504452  <8>[   10.474507] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603192_1.4.2.3.1>

    2023-06-06T09:29:39.611932  / # #

    2023-06-06T09:29:39.714481  export SHELL=3D/bin/sh

    2023-06-06T09:29:39.715211  #

    2023-06-06T09:29:39.816681  / # export SHELL=3D/bin/sh. /lava-10603192/=
environment

    2023-06-06T09:29:39.817419  =


    2023-06-06T09:29:39.918853  / # . /lava-10603192/environment/lava-10603=
192/bin/lava-test-runner /lava-10603192/1

    2023-06-06T09:29:39.920199  =


    2023-06-06T09:29:39.924805  / # /lava-10603192/bin/lava-test-runner /la=
va-10603192/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efefc80a3330342f5de33

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efefc80a3330342f5de3c
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:40:00.506514  + <8>[   20.891763] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10603502_1.4.2.3.1>

    2023-06-06T09:40:00.506611  set +x

    2023-06-06T09:40:00.607971  #

    2023-06-06T09:40:00.708904  / # #export SHELL=3D/bin/sh

    2023-06-06T09:40:00.709152  =


    2023-06-06T09:40:00.809681  / # export SHELL=3D/bin/sh. /lava-10603502/=
environment

    2023-06-06T09:40:00.809924  =


    2023-06-06T09:40:00.910493  / # . /lava-10603502/environment/lava-10603=
502/bin/lava-test-runner /lava-10603502/1

    2023-06-06T09:40:00.910829  =


    2023-06-06T09:40:00.915770  / # /lava-10603502/bin/lava-test-runner /la=
va-10603502/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f00c0ac1d27146ff5de9a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647f00c0ac1d27146ff5dea3
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:47:40.242403  + set +x

    2023-06-06T09:47:40.249211  <8>[   17.219241] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603792_1.4.2.3.1>

    2023-06-06T09:47:40.358866  / # #

    2023-06-06T09:47:40.461143  export SHELL=3D/bin/sh

    2023-06-06T09:47:40.461896  #

    2023-06-06T09:47:40.563634  / # export SHELL=3D/bin/sh. /lava-10603792/=
environment

    2023-06-06T09:47:40.564426  =


    2023-06-06T09:47:40.665864  / # . /lava-10603792/environment/lava-10603=
792/bin/lava-test-runner /lava-10603792/1

    2023-06-06T09:47:40.666917  =


    2023-06-06T09:47:40.671737  / # /lava-10603792/bin/lava-test-runner /la=
va-10603792/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efbb3739e30216ef5de25

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efbb3739e30216ef5de2e
        failing since 0 day (last pass: renesas-devel-2023-06-02-v6.4-rc4, =
first fail: renesas-devel-2023-06-05-v6.4-rc5)

    2023-06-06T09:25:51.876400  <8>[   10.325960] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603232_1.4.2.3.1>

    2023-06-06T09:25:51.879711  + set +x

    2023-06-06T09:25:51.987750  / # #

    2023-06-06T09:25:52.088440  export SHELL=3D/bin/sh

    2023-06-06T09:25:52.088650  #

    2023-06-06T09:25:52.189171  / # export SHELL=3D/bin/sh. /lava-10603232/=
environment

    2023-06-06T09:25:52.189378  =


    2023-06-06T09:25:52.290134  / # . /lava-10603232/environment/lava-10603=
232/bin/lava-test-runner /lava-10603232/1

    2023-06-06T09:25:52.291257  =


    2023-06-06T09:25:52.295974  / # /lava-10603232/bin/lava-test-runner /la=
va-10603232/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd62f26c4c2ae3f5dea8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efd62f26c4c2ae3f5deb1
        failing since 0 day (last pass: renesas-devel-2023-06-02-v6.4-rc4, =
first fail: renesas-devel-2023-06-05-v6.4-rc5)

    2023-06-06T09:33:03.208317  <8>[    8.051235] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603500_1.4.2.3.1>

    2023-06-06T09:33:03.211526  + set +x

    2023-06-06T09:33:03.313678  =


    2023-06-06T09:33:03.414350  / # #export SHELL=3D/bin/sh

    2023-06-06T09:33:03.414662  =


    2023-06-06T09:33:03.515331  / # export SHELL=3D/bin/sh. /lava-10603500/=
environment

    2023-06-06T09:33:03.515591  =


    2023-06-06T09:33:03.616152  / # . /lava-10603500/environment/lava-10603=
500/bin/lava-test-runner /lava-10603500/1

    2023-06-06T09:33:03.616622  =


    2023-06-06T09:33:03.621268  / # /lava-10603500/bin/lava-test-runner /la=
va-10603500/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0078ea7cef5e3ef5de25

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647f0078ea7cef5e3ef5de2e
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:46:16.311141  + set<8>[   15.181153] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10603743_1.4.2.3.1>

    2023-06-06T09:46:16.311240   +x

    2023-06-06T09:46:16.415731  / # #

    2023-06-06T09:46:16.516300  export SHELL=3D/bin/sh

    2023-06-06T09:46:16.516562  #

    2023-06-06T09:46:16.617141  / # export SHELL=3D/bin/sh. /lava-10603743/=
environment

    2023-06-06T09:46:16.617365  =


    2023-06-06T09:46:16.717919  / # . /lava-10603743/environment/lava-10603=
743/bin/lava-test-runner /lava-10603743/1

    2023-06-06T09:46:16.718252  =


    2023-06-06T09:46:16.723394  / # /lava-10603743/bin/lava-test-runner /la=
va-10603743/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efaf0575cd58114f5de45

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efaf0575cd58114f5de4e
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:22:43.567295  + set +x<8>[   11.432061] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10603182_1.4.2.3.1>

    2023-06-06T09:22:43.567402  =


    2023-06-06T09:22:43.671629  / # #

    2023-06-06T09:22:43.772327  export SHELL=3D/bin/sh

    2023-06-06T09:22:43.772559  #

    2023-06-06T09:22:43.873070  / # export SHELL=3D/bin/sh. /lava-10603182/=
environment

    2023-06-06T09:22:43.873285  =


    2023-06-06T09:22:43.973812  / # . /lava-10603182/environment/lava-10603=
182/bin/lava-test-runner /lava-10603182/1

    2023-06-06T09:22:43.974094  =


    2023-06-06T09:22:43.979107  / # /lava-10603182/bin/lava-test-runner /la=
va-10603182/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd7294f9a1f545f5de46

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efd7294f9a1f545f5de4f
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:21.603746  + <8>[   10.740325] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10603520_1.4.2.3.1>

    2023-06-06T09:33:21.603840  set +x

    2023-06-06T09:33:21.707758  / # #

    2023-06-06T09:33:21.808409  export SHELL=3D/bin/sh

    2023-06-06T09:33:21.808644  #

    2023-06-06T09:33:21.909228  / # export SHELL=3D/bin/sh. /lava-10603520/=
environment

    2023-06-06T09:33:21.909459  =


    2023-06-06T09:33:22.009977  / # . /lava-10603520/environment/lava-10603=
520/bin/lava-test-runner /lava-10603520/1

    2023-06-06T09:33:22.010277  =


    2023-06-06T09:33:22.014896  / # /lava-10603520/bin/lava-test-runner /la=
va-10603520/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f008ecb4e24f539f5de94

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647f008ecb4e24f539f5de9d
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:46:40.835435  + set +x

    2023-06-06T09:46:40.838772  <8>[   14.008218] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603796_1.4.2.3.1>

    2023-06-06T09:46:40.944743  / # #

    2023-06-06T09:46:41.045501  export SHELL=3D/bin/sh

    2023-06-06T09:46:41.045749  #

    2023-06-06T09:46:41.146332  / # export SHELL=3D/bin/sh. /lava-10603796/=
environment

    2023-06-06T09:46:41.146595  =


    2023-06-06T09:46:41.247198  / # . /lava-10603796/environment/lava-10603=
796/bin/lava-test-runner /lava-10603796/1

    2023-06-06T09:46:41.247576  =


    2023-06-06T09:46:41.252388  / # /lava-10603796/bin/lava-test-runner /la=
va-10603796/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647efc01ea861a1ec3f5de65

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efc01ea861a1ec3f5de6e
        failing since 126 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-06T09:27:09.615513  + set +x
    2023-06-06T09:27:09.615720  [   14.452937] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968757_1.5.2.3.1>
    2023-06-06T09:27:09.723904  / # #
    2023-06-06T09:27:09.826266  export SHELL=3D/bin/sh
    2023-06-06T09:27:09.826705  #
    2023-06-06T09:27:09.927928  / # export SHELL=3D/bin/sh. /lava-968757/en=
vironment
    2023-06-06T09:27:09.928467  =

    2023-06-06T09:27:10.029838  / # . /lava-968757/environment/lava-968757/=
bin/lava-test-runner /lava-968757/1
    2023-06-06T09:27:10.030618  =

    2023-06-06T09:27:10.033708  / # /lava-968757/bin/lava-test-runner /lava=
-968757/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647efcf1511117c885f5de47

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efcf1511117c885f5de50
        failing since 126 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-06T09:31:06.196521  + set +x
    2023-06-06T09:31:06.196687  [   13.183611] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968781_1.5.2.3.1>
    2023-06-06T09:31:06.304462  / # #
    2023-06-06T09:31:06.406048  export SHELL=3D/bin/sh
    2023-06-06T09:31:06.406503  #
    2023-06-06T09:31:06.507703  / # export SHELL=3D/bin/sh. /lava-968781/en=
vironment
    2023-06-06T09:31:06.508151  =

    2023-06-06T09:31:06.609392  / # . /lava-968781/environment/lava-968781/=
bin/lava-test-runner /lava-968781/1
    2023-06-06T09:31:06.610083  =

    2023-06-06T09:31:06.613415  / # /lava-968781/bin/lava-test-runner /lava=
-968781/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd434604a8caaef5df00

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efd434604a8caaef5df09
        failing since 126 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-06T09:32:26.747438  + set +x
    2023-06-06T09:32:26.747611  [   12.833883] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968792_1.5.2.3.1>
    2023-06-06T09:32:26.855423  / # #
    2023-06-06T09:32:26.957027  export SHELL=3D/bin/sh
    2023-06-06T09:32:26.957505  #
    2023-06-06T09:32:27.058878  / # export SHELL=3D/bin/sh. /lava-968792/en=
vironment
    2023-06-06T09:32:27.059373  =

    2023-06-06T09:32:27.160622  / # . /lava-968792/environment/lava-968792/=
bin/lava-test-runner /lava-968792/1
    2023-06-06T09:32:27.161216  =

    2023-06-06T09:32:27.164464  / # /lava-968792/bin/lava-test-runner /lava=
-968792/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647efefbe7848f300af5de35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efefbe7848f300af5de3e
        failing since 126 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-06T09:39:45.567540  + set +x
    2023-06-06T09:39:45.567919  [   13.102931] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968808_1.5.2.3.1>
    2023-06-06T09:39:45.676136  / # #
    2023-06-06T09:39:45.777815  export SHELL=3D/bin/sh
    2023-06-06T09:39:45.778435  #
    2023-06-06T09:39:45.879945  / # export SHELL=3D/bin/sh. /lava-968808/en=
vironment
    2023-06-06T09:39:45.880504  =

    2023-06-06T09:39:45.982046  / # . /lava-968808/environment/lava-968808/=
bin/lava-test-runner /lava-968808/1
    2023-06-06T09:39:45.982661  =

    2023-06-06T09:39:45.986084  / # /lava-968808/bin/lava-test-runner /lava=
-968808/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647f009dfa31185beff5de41

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647f009dfa31185beff5de4a
        failing since 126 days (last pass: v6.1-rc8-929-g112502470f50, firs=
t fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-06-06T09:46:47.518002  + set +x
    2023-06-06T09:46:47.518207  [   12.189422] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968822_1.5.2.3.1>
    2023-06-06T09:46:47.625651  / # #
    2023-06-06T09:46:47.727726  export SHELL=3D/bin/sh
    2023-06-06T09:46:47.728165  #
    2023-06-06T09:46:47.829444  / # export SHELL=3D/bin/sh. /lava-968822/en=
vironment
    2023-06-06T09:46:47.829978  =

    2023-06-06T09:46:47.931228  / # . /lava-968822/environment/lava-968822/=
bin/lava-test-runner /lava-968822/1
    2023-06-06T09:46:47.931841  =

    2023-06-06T09:46:47.934752  / # /lava-968822/bin/lava-test-runner /lava=
-968822/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647efcf3511117c885f5de55

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efcf3511117c885f5de5e
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5)

    2023-06-06T09:31:08.293478  + set[   15.130776] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 968785_1.5.2.3.1>
    2023-06-06T09:31:08.293694   +x
    2023-06-06T09:31:08.400278  / # #
    2023-06-06T09:31:08.501735  export SHELL=3D/bin/sh
    2023-06-06T09:31:08.502223  #
    2023-06-06T09:31:08.603383  / # export SHELL=3D/bin/sh. /lava-968785/en=
vironment
    2023-06-06T09:31:08.603855  =

    2023-06-06T09:31:08.705169  / # . /lava-968785/environment/lava-968785/=
bin/lava-test-runner /lava-968785/1
    2023-06-06T09:31:08.705784  =

    2023-06-06T09:31:08.708860  / # /lava-968785/bin/lava-test-runner /lava=
-968785/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efadcdc0f2cf5bef5de25

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efadcdc0f2cf5bef5de2e
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:22:30.047061  <8>[   11.900219] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603239_1.4.2.3.1>

    2023-06-06T09:22:30.151819  / # #

    2023-06-06T09:22:30.252444  export SHELL=3D/bin/sh

    2023-06-06T09:22:30.252648  #

    2023-06-06T09:22:30.353188  / # export SHELL=3D/bin/sh. /lava-10603239/=
environment

    2023-06-06T09:22:30.353443  =


    2023-06-06T09:22:30.454037  / # . /lava-10603239/environment/lava-10603=
239/bin/lava-test-runner /lava-10603239/1

    2023-06-06T09:22:30.454354  =


    2023-06-06T09:22:30.459475  / # /lava-10603239/bin/lava-test-runner /la=
va-10603239/1

    2023-06-06T09:22:30.466010  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd59f26c4c2ae3f5de26

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647efd59f26c4c2ae3f5de2f
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:03.172025  <8>[   11.255294] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603485_1.4.2.3.1>

    2023-06-06T09:33:03.276355  / # #

    2023-06-06T09:33:03.377018  export SHELL=3D/bin/sh

    2023-06-06T09:33:03.377222  #

    2023-06-06T09:33:03.477714  / # export SHELL=3D/bin/sh. /lava-10603485/=
environment

    2023-06-06T09:33:03.477908  =


    2023-06-06T09:33:03.578431  / # . /lava-10603485/environment/lava-10603=
485/bin/lava-test-runner /lava-10603485/1

    2023-06-06T09:33:03.578710  =


    2023-06-06T09:33:03.583880  / # /lava-10603485/bin/lava-test-runner /la=
va-10603485/1

    2023-06-06T09:33:03.590049  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0078f08da8f5ddf5de5a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647f0078f08da8f5ddf5de63
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:46:29.185441  + <8>[   13.474202] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10603744_1.4.2.3.1>

    2023-06-06T09:46:29.185573  set +x

    2023-06-06T09:46:29.290724  / # #

    2023-06-06T09:46:29.391472  export SHELL=3D/bin/sh

    2023-06-06T09:46:29.391677  #

    2023-06-06T09:46:29.492152  / # export SHELL=3D/bin/sh. /lava-10603744/=
environment

    2023-06-06T09:46:29.492425  =


    2023-06-06T09:46:29.593061  / # . /lava-10603744/environment/lava-10603=
744/bin/lava-test-runner /lava-10603744/1

    2023-06-06T09:46:29.593430  =


    2023-06-06T09:46:29.598438  / # /lava-10603744/bin/lava-test-runner /la=
va-10603744/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/647efc5a7ebcb4685cf5de49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efc5a7ebcb4685cf5d=
e4a
        failing since 105 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/647efc1385f158451ef5de3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-me=
son-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-me=
son-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efc1385f158451ef5d=
e3e
        failing since 105 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0033d16d9e00a7f5de76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f0033d16d9e00a7f5d=
e77
        failing since 112 days (last pass: renesas-devel-2023-01-30-v6.2-rc=
6, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647f036953c0dc963ef5de35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f036953c0dc963ef5d=
e36
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0050bc77f3a99df5de58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f0050bc77f3a99df5d=
e59
        failing since 112 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647f036953c0dc963ef5de31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f036953c0dc963ef5d=
e32
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/647f020c3e58c55405f5de39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f020c3e58c55405f5d=
e3a
        new failure (last pass: renesas-devel-2023-06-02-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/647efde72831e0f550f5de50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_=
mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efde72831e0f550f5d=
e51
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647f007fc210a0e439f5de51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f007fc210a0e439f5d=
e52
        failing since 154 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647eff3f6f3ca60b8ff5de25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647eff3f6f3ca60b8ff5d=
e26
        failing since 154 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f002900a0688c52f5df31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f002900a0688c52f5d=
f32
        failing since 112 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/647efc07d7a9497431f5dec0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-=
rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efc07d7a9497431f5d=
ec1
        failing since 105 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f019561cf4b54b7f5de70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647f019561cf4b54b7f5d=
e71
        failing since 112 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/647efda399128ba471f5de25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efda399128ba471f5d=
e26
        failing since 105 days (last pass: renesas-devel-2023-02-06-v6.2-rc=
7, first fail: renesas-devel-2023-02-20-v6.2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/647efc8a9f53ccb0e6f5de87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efc8a9f53ccb0e6f5d=
e88
        failing since 91 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd04511117c885f5de9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efd04511117c885f5d=
e9b
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd5311678b07adf5de29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647efd5311678b07adf5d=
e2a
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/647effd3c829b40d8bf5de29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun=
50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun=
50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647effd3c829b40d8bf5d=
e2a
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =20
