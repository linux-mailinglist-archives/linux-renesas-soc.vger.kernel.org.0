Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27C56FCBE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 18:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbjEIQ4c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 12:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjEIQ4b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 12:56:31 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311585257
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 09:56:01 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-52c690f7fa4so4055595a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683651360; x=1686243360;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3R801O65XCBuwTqaM48U8zLZyN8McTGiqF2+QaV/LmY=;
        b=VcIf8rHiDY6+nKNImbxrFP/jSfTgJ0v1LkLQXDNbmVDpJ9dUMztNBJ9bHz4kDaENMb
         AP9g8wTpUxzoTs8GNPWSsbqQ+hzykx6+dn7IcP/PR94SZMi0VWNjEY9cXtisg5GmV2Xs
         ulRXBJk2EHkhyTpteH8sH7EmyTWqnMD+qKklTela04JljjvRUBfPx7yb/rlZvm/nGCo+
         vU89p7aJ5BdE+trq23vu3ony5rTBOcg0kIeu3KjP+rsY4/XSFmyZ5QJ/vZNWL577H5cE
         QkkLuoZ/6m/g/mSHnXZuLaynco1yAP2dT1Omszf0i3KdJra1H73ziJ5ottMqwmq9m90s
         ei7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683651360; x=1686243360;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3R801O65XCBuwTqaM48U8zLZyN8McTGiqF2+QaV/LmY=;
        b=ChbsNPdZJ8OCneyLrqlg1glvFGADG/rGYbkK4N1A8wrS/wQCSXcpgA6khe/PBWGdD0
         wk1YZO3Dk0nPV0BHmccnax7WfEMFie3A+vn/mD/75SgsNwh5zW7RKmV6nIqfLkyqn7JL
         07lFiujVu9At1NJ3jKspdlzBYKy26eibCsCiMwsq70c+QtSa603pshtuXKmqoNhi86sm
         c/wuHMBSCXCYtRCr59e+p8Ho3S2UBJ6QECLbenayf5t9bofaal8V1G8uldauK3jmLbME
         PjJH3IHuYp5TFAIh1IT4R2kJalfGcdUWGcS+BRlMpRVhFdK3vMJ3NSme4LQkgcmSmqY6
         z6CQ==
X-Gm-Message-State: AC+VfDw1UPebso4fFCEDr/hY7qCuQtHza73MIVnoo8Jvitz++dbxagTO
        urMPeqVywsH09IPHkbKJcdCtWpHNBpkOoMtL/DxmQw==
X-Google-Smtp-Source: ACHHUZ7Yly9EnNty6S96RfvjKmVGESXzq4bjC3aY+OFqWMw1HgUaPlSFyGq9CsYPdGGluWT8WNF72Q==
X-Received: by 2002:a17:902:b696:b0:1aa:f203:781c with SMTP id c22-20020a170902b69600b001aaf203781cmr12662933pls.44.1683651359289;
        Tue, 09 May 2023 09:55:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902b40500b001a922d43779sm1857805plr.27.2023.05.09.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 09:55:58 -0700 (PDT)
Message-ID: <645a7b1e.170a0220.7d31b.39ab@mx.google.com>
Date:   Tue, 09 May 2023 09:55:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-09-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline: 275 runs,
 36 regressions (renesas-devel-2023-05-09-v6.4-rc1)
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

renesas/master baseline: 275 runs, 36 regressions (renesas-devel-2023-05-09=
-v6.4-rc1)

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
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | renesa=
s_defconfig            | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-09-v6.4-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-09-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dce70215cdd5598b16b34f41c88d168ad124cd45 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a427da12b49c2ce2e8605

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a427da12b49c2ce2e860a
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T12:54:01.010811  + set +x

    2023-05-09T12:54:01.017492  <8>[   11.083549] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258220_1.4.2.3.1>

    2023-05-09T12:54:01.119843  =


    2023-05-09T12:54:01.220510  / # #export SHELL=3D/bin/sh

    2023-05-09T12:54:01.220771  =


    2023-05-09T12:54:01.321291  / # export SHELL=3D/bin/sh. /lava-10258220/=
environment

    2023-05-09T12:54:01.321486  =


    2023-05-09T12:54:01.422025  / # . /lava-10258220/environment/lava-10258=
220/bin/lava-test-runner /lava-10258220/1

    2023-05-09T12:54:01.422355  =


    2023-05-09T12:54:01.427876  / # /lava-10258220/bin/lava-test-runner /la=
va-10258220/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a444ed1e87b191f2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a444ed1e87b191f2e85eb
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:01:47.174184  + set +x

    2023-05-09T13:01:47.180390  <8>[   10.561313] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258395_1.4.2.3.1>

    2023-05-09T13:01:47.287869  / # #

    2023-05-09T13:01:47.388607  export SHELL=3D/bin/sh

    2023-05-09T13:01:47.388840  #

    2023-05-09T13:01:47.489691  / # export SHELL=3D/bin/sh. /lava-10258395/=
environment

    2023-05-09T13:01:47.490354  =


    2023-05-09T13:01:47.591689  / # . /lava-10258395/environment/lava-10258=
395/bin/lava-test-runner /lava-10258395/1

    2023-05-09T13:01:47.592126  =


    2023-05-09T13:01:47.597560  / # /lava-10258395/bin/lava-test-runner /la=
va-10258395/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a426bde2cf38ff02e85e9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a426bde2cf38ff02e85ee
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T12:53:44.146294  + <8>[   11.674279] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10258245_1.4.2.3.1>

    2023-05-09T12:53:44.146492  set +x

    2023-05-09T12:53:44.251311  / # #

    2023-05-09T12:53:44.352139  export SHELL=3D/bin/sh

    2023-05-09T12:53:44.352408  #

    2023-05-09T12:53:44.453099  / # export SHELL=3D/bin/sh. /lava-10258245/=
environment

    2023-05-09T12:53:44.453443  =


    2023-05-09T12:53:44.554141  / # . /lava-10258245/environment/lava-10258=
245/bin/lava-test-runner /lava-10258245/1

    2023-05-09T12:53:44.554531  =


    2023-05-09T12:53:44.558758  / # /lava-10258245/bin/lava-test-runner /la=
va-10258245/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a441bb5ef62c76d2e85ef

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a441bb5ef62c76d2e85f4
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:01:01.035089  + set<8>[   11.320907] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10258398_1.4.2.3.1>

    2023-05-09T13:01:01.035228   +x

    2023-05-09T13:01:01.139538  / # #

    2023-05-09T13:01:01.240118  export SHELL=3D/bin/sh

    2023-05-09T13:01:01.240354  #

    2023-05-09T13:01:01.340917  / # export SHELL=3D/bin/sh. /lava-10258398/=
environment

    2023-05-09T13:01:01.341119  =


    2023-05-09T13:01:01.441675  / # . /lava-10258398/environment/lava-10258=
398/bin/lava-test-runner /lava-10258398/1

    2023-05-09T13:01:01.441957  =


    2023-05-09T13:01:01.446456  / # /lava-10258398/bin/lava-test-runner /la=
va-10258398/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4269a3e411e6402e8607

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a4269a3e411e6402e860c
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T12:53:45.681363  <8>[   11.482045] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258232_1.4.2.3.1>

    2023-05-09T12:53:45.684152  + set +x

    2023-05-09T12:53:45.785970  #

    2023-05-09T12:53:45.786448  =


    2023-05-09T12:53:45.887242  / # #export SHELL=3D/bin/sh

    2023-05-09T12:53:45.887554  =


    2023-05-09T12:53:45.988223  / # export SHELL=3D/bin/sh. /lava-10258232/=
environment

    2023-05-09T12:53:45.988576  =


    2023-05-09T12:53:46.089258  / # . /lava-10258232/environment/lava-10258=
232/bin/lava-test-runner /lava-10258232/1

    2023-05-09T12:53:46.089770  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a441244a4ccaf252e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a441244a4ccaf252e85eb
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:00:51.997996  <8>[   11.452860] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258392_1.4.2.3.1>

    2023-05-09T13:00:52.001500  + set +x

    2023-05-09T13:00:52.102819  #

    2023-05-09T13:00:52.103169  =


    2023-05-09T13:00:52.203773  / # #export SHELL=3D/bin/sh

    2023-05-09T13:00:52.204055  =


    2023-05-09T13:00:52.304674  / # export SHELL=3D/bin/sh. /lava-10258392/=
environment

    2023-05-09T13:00:52.304940  =


    2023-05-09T13:00:52.405499  / # . /lava-10258392/environment/lava-10258=
392/bin/lava-test-runner /lava-10258392/1

    2023-05-09T13:00:52.405798  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4669ba9acc431c2e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a4669ba9acc431c2e8=
5e9
        failing since 63 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a44c4ab8401c7822e8615

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a44c4ab8401c7822e861a
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:03:50.444703  + set +x

    2023-05-09T13:03:50.451396  <8>[   10.579923] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258210_1.4.2.3.1>

    2023-05-09T13:03:50.555462  / # #

    2023-05-09T13:03:50.656080  export SHELL=3D/bin/sh

    2023-05-09T13:03:50.656288  #

    2023-05-09T13:03:50.756823  / # export SHELL=3D/bin/sh. /lava-10258210/=
environment

    2023-05-09T13:03:50.757014  =


    2023-05-09T13:03:50.857518  / # . /lava-10258210/environment/lava-10258=
210/bin/lava-test-runner /lava-10258210/1

    2023-05-09T13:03:50.857828  =


    2023-05-09T13:03:50.862333  / # /lava-10258210/bin/lava-test-runner /la=
va-10258210/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a45039bb9ef714f2e8607

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a45039bb9ef714f2e860c
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:04:56.533967  + set +x

    2023-05-09T13:04:56.540572  <8>[   10.421526] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258397_1.4.2.3.1>

    2023-05-09T13:04:56.648578  / # #

    2023-05-09T13:04:56.750929  export SHELL=3D/bin/sh

    2023-05-09T13:04:56.751767  #

    2023-05-09T13:04:56.853194  / # export SHELL=3D/bin/sh. /lava-10258397/=
environment

    2023-05-09T13:04:56.853943  =


    2023-05-09T13:04:56.955134  / # . /lava-10258397/environment/lava-10258=
397/bin/lava-test-runner /lava-10258397/1

    2023-05-09T13:04:56.955420  =


    2023-05-09T13:04:56.960057  / # /lava-10258397/bin/lava-test-runner /la=
va-10258397/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a43a34921f802032e8665

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a43a34921f802032e866a
        failing since 36 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-04-03-v6.3-rc5)

    2023-05-09T12:58:56.053870  + set +x

    2023-05-09T12:58:56.060644  <8>[   10.705639] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258222_1.4.2.3.1>

    2023-05-09T12:58:56.165140  / # #

    2023-05-09T12:58:56.267388  export SHELL=3D/bin/sh

    2023-05-09T12:58:56.268180  #

    2023-05-09T12:58:56.369669  / # export SHELL=3D/bin/sh. /lava-10258222/=
environment

    2023-05-09T12:58:56.370407  =


    2023-05-09T12:58:56.471899  / # . /lava-10258222/environment/lava-10258=
222/bin/lava-test-runner /lava-10258222/1

    2023-05-09T12:58:56.473135  =


    2023-05-09T12:58:56.478733  / # /lava-10258222/bin/lava-test-runner /la=
va-10258222/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a443466540019352e85e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a443466540019352e85ed
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:01:27.094173  <8>[   10.449068] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258359_1.4.2.3.1>

    2023-05-09T13:01:27.097398  + set +x

    2023-05-09T13:01:27.198812  =


    2023-05-09T13:01:27.299442  / # #export SHELL=3D/bin/sh

    2023-05-09T13:01:27.299642  =


    2023-05-09T13:01:27.400130  / # export SHELL=3D/bin/sh. /lava-10258359/=
environment

    2023-05-09T13:01:27.400365  =


    2023-05-09T13:01:27.500969  / # . /lava-10258359/environment/lava-10258=
359/bin/lava-test-runner /lava-10258359/1

    2023-05-09T13:01:27.501270  =


    2023-05-09T13:01:27.506530  / # /lava-10258359/bin/lava-test-runner /la=
va-10258359/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a425ca3e411e6402e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a425ca3e411e6402e85eb
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T12:53:33.555278  + set<8>[   10.955046] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10258188_1.4.2.3.1>

    2023-05-09T12:53:33.555444   +x

    2023-05-09T12:53:33.659610  / # #

    2023-05-09T12:53:33.760394  export SHELL=3D/bin/sh

    2023-05-09T12:53:33.760595  #

    2023-05-09T12:53:33.861128  / # export SHELL=3D/bin/sh. /lava-10258188/=
environment

    2023-05-09T12:53:33.861382  =


    2023-05-09T12:53:33.961943  / # . /lava-10258188/environment/lava-10258=
188/bin/lava-test-runner /lava-10258188/1

    2023-05-09T12:53:33.962312  =


    2023-05-09T12:53:33.966997  / # /lava-10258188/bin/lava-test-runner /la=
va-10258188/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4411f5f42af5c02e861b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a4411f5f42af5c02e8620
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:00:45.245610  + set<8>[   10.931693] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10258365_1.4.2.3.1>

    2023-05-09T13:00:45.245697   +x

    2023-05-09T13:00:45.350365  / # #

    2023-05-09T13:00:45.451002  export SHELL=3D/bin/sh

    2023-05-09T13:00:45.451212  #

    2023-05-09T13:00:45.551721  / # export SHELL=3D/bin/sh. /lava-10258365/=
environment

    2023-05-09T13:00:45.551955  =


    2023-05-09T13:00:45.652534  / # . /lava-10258365/environment/lava-10258=
365/bin/lava-test-runner /lava-10258365/1

    2023-05-09T13:00:45.652846  =


    2023-05-09T13:00:45.657284  / # /lava-10258365/bin/lava-test-runner /la=
va-10258365/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4119fff6a120b72e85fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a4119fff6a120b72e85ff
        failing since 99 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-05-09T12:48:00.486690  + set +x
    2023-05-09T12:48:00.486858  [   12.181698] <LAVA_SIGNAL_ENDRUN 0_dmesg =
945346_1.5.2.3.1>
    2023-05-09T12:48:00.593809  / # #
    2023-05-09T12:48:00.695292  export SHELL=3D/bin/sh
    2023-05-09T12:48:00.695706  #
    2023-05-09T12:48:00.796878  / # export SHELL=3D/bin/sh. /lava-945346/en=
vironment
    2023-05-09T12:48:00.797245  =

    2023-05-09T12:48:00.898440  / # . /lava-945346/environment/lava-945346/=
bin/lava-test-runner /lava-945346/1
    2023-05-09T12:48:00.898993  =

    2023-05-09T12:48:00.901932  / # /lava-945346/bin/lava-test-runner /lava=
-945346/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4461f536cf103d2e8612

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a4461f536cf103d2e8617
        failing since 99 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-05-09T13:02:02.960108  + set +x
    2023-05-09T13:02:02.960552  [   14.340620] <LAVA_SIGNAL_ENDRUN 0_dmesg =
945388_1.5.2.3.1>
    2023-05-09T13:02:03.068509  / # #
    2023-05-09T13:02:03.170156  export SHELL=3D/bin/sh
    2023-05-09T13:02:03.170753  #
    2023-05-09T13:02:03.272326  / # export SHELL=3D/bin/sh. /lava-945388/en=
vironment
    2023-05-09T13:02:03.272731  =

    2023-05-09T13:02:03.373933  / # . /lava-945388/environment/lava-945388/=
bin/lava-test-runner /lava-945388/1
    2023-05-09T13:02:03.374461  =

    2023-05-09T13:02:03.377724  / # /lava-945388/bin/lava-test-runner /lava=
-945388/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/645a44b13425da4da52e85fd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a44b13425da4da52e8602
        failing since 99 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-05-09T13:03:23.773731  + set +x
    2023-05-09T13:03:23.773892  [   13.599594] <LAVA_SIGNAL_ENDRUN 0_dmesg =
945403_1.5.2.3.1>
    2023-05-09T13:03:23.881930  / # #
    2023-05-09T13:03:23.983599  export SHELL=3D/bin/sh
    2023-05-09T13:03:23.984152  #
    2023-05-09T13:03:24.085573  / # export SHELL=3D/bin/sh. /lava-945403/en=
vironment
    2023-05-09T13:03:24.086110  =

    2023-05-09T13:03:24.187365  / # . /lava-945403/environment/lava-945403/=
bin/lava-test-runner /lava-945403/1
    2023-05-09T13:03:24.188043  =

    2023-05-09T13:03:24.191138  / # /lava-945403/bin/lava-test-runner /lava=
-945403/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645a45019bb9ef714f2e85ec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a45019bb9ef714f2e85f1
        failing since 99 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-05-09T13:04:40.408009  + set +x
    2023-05-09T13:04:40.408209  [   12.856973] <LAVA_SIGNAL_ENDRUN 0_dmesg =
945406_1.5.2.3.1>
    2023-05-09T13:04:40.514983  / # #
    2023-05-09T13:04:40.616694  export SHELL=3D/bin/sh
    2023-05-09T13:04:40.617097  #
    2023-05-09T13:04:40.718252  / # export SHELL=3D/bin/sh. /lava-945406/en=
vironment
    2023-05-09T13:04:40.718588  =

    2023-05-09T13:04:40.820111  / # . /lava-945406/environment/lava-945406/=
bin/lava-test-runner /lava-945406/1
    2023-05-09T13:04:40.820731  =

    2023-05-09T13:04:40.824063  / # /lava-945406/bin/lava-test-runner /lava=
-945406/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4551f29cc6ed6c2e85ed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a4551f29cc6ed6c2e85f2
        failing since 99 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2023-01-30-v6.2-rc6)

    2023-05-09T13:06:03.678862  + set +x
    2023-05-09T13:06:03.679194  [   13.119754] <LAVA_SIGNAL_ENDRUN 0_dmesg =
945413_1.5.2.3.1>
    2023-05-09T13:06:03.787367  / # #
    2023-05-09T13:06:03.888874  export SHELL=3D/bin/sh
    2023-05-09T13:06:03.889326  #
    2023-05-09T13:06:03.990863  / # export SHELL=3D/bin/sh. /lava-945413/en=
vironment
    2023-05-09T13:06:03.991394  =

    2023-05-09T13:06:04.092691  / # . /lava-945413/environment/lava-945413/=
bin/lava-test-runner /lava-945413/1
    2023-05-09T13:06:04.093380  =

    2023-05-09T13:06:04.096531  / # /lava-945413/bin/lava-test-runner /lava=
-945413/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a44751be80aee402e8665

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a44751be80aee402e866a
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:02:25.975630  + set<8>[    9.299771] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10258236_1.4.2.3.1>

    2023-05-09T13:02:25.975734   +x

    2023-05-09T13:02:26.080043  / # #

    2023-05-09T13:02:26.180676  export SHELL=3D/bin/sh

    2023-05-09T13:02:26.180868  #

    2023-05-09T13:02:26.281375  / # export SHELL=3D/bin/sh. /lava-10258236/=
environment

    2023-05-09T13:02:26.281592  =


    2023-05-09T13:02:26.382103  / # . /lava-10258236/environment/lava-10258=
236/bin/lava-test-runner /lava-10258236/1

    2023-05-09T13:02:26.382380  =


    2023-05-09T13:02:26.387086  / # /lava-10258236/bin/lava-test-runner /la=
va-10258236/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645a44c5e8b4be09392e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a44c5e8b4be09392e85eb
        failing since 39 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-05-09T13:03:48.464422  <8>[   12.089274] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10258391_1.4.2.3.1>

    2023-05-09T13:03:48.572067  / # #

    2023-05-09T13:03:48.674672  export SHELL=3D/bin/sh

    2023-05-09T13:03:48.675515  #

    2023-05-09T13:03:48.777163  / # export SHELL=3D/bin/sh. /lava-10258391/=
environment

    2023-05-09T13:03:48.778021  =


    2023-05-09T13:03:48.879729  / # . /lava-10258391/environment/lava-10258=
391/bin/lava-test-runner /lava-10258391/1

    2023-05-09T13:03:48.881163  =


    2023-05-09T13:03:48.886549  / # /lava-10258391/bin/lava-test-runner /la=
va-10258391/1

    2023-05-09T13:03:48.893136  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4271de2cf38ff02e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a4271de2cf38ff02e8=
610
        failing since 84 days (last pass: renesas-devel-2023-01-30-v6.2-rc6=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/645a46516c40fba0df2e86d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a46516c40fba0df2e8=
6d1
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645a47cd695f1023282e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a47cd695f1023282e8=
5fd
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645a428c0812bda0b02e8612

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a428c0812bda0b02e8=
613
        failing since 84 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/645a46c53efc91ed9f2e8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a46c53efc91ed9f2e8=
659
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645a475be5555facc42e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a475be5555facc42e8=
608
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645a426b41f891c4a32e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a426b41f891c4a32e8=
5ee
        failing since 36 days (last pass: renesas-devel-2023-03-30-v6.3-rc4=
, first fail: renesas-devel-2023-04-03-v6.3-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | renesa=
s_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4099cb5ac573c32e8655

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1=
-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-r8a774a1=
-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645a4099cb5ac573c32e8658
        new failure (last pass: renesas-devel-2023-04-24-v6.3)

    2023-05-09T12:45:49.445218  + set +x
    2023-05-09T12:45:49.445339  <8>[   20.187137] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 927235_1.4.2.4.1>
    2023-05-09T12:45:49.552921  / # #
    2023-05-09T12:45:51.012355  export SHELL=3D/bin/sh
    2023-05-09T12:45:51.032792  #
    2023-05-09T12:45:51.032964  / # export SHELL=3D/bin/sh
    2023-05-09T12:45:52.914755  / # . /lava-927235/environment
    2023-05-09T12:45:56.365668  /lava-927235/bin/lava-test-runner /lava-927=
235/1
    2023-05-09T12:45:56.386364  . /lava-927235/environment
    2023-05-09T12:45:56.386500  / # /lava-927235/bin/lava-test-runner /lava=
-927235/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645a44b009b0299fde2e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a44b009b0299fde2e8=
608
        failing since 127 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645a4104fff6a120b72e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a4104fff6a120b72e8=
5e7
        failing since 127 days (last pass: renesas-devel-2022-12-12-v6.1, f=
irst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645a43ebe6ff5586782e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a43ebe6ff5586782e8=
5ed
        failing since 84 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/645a457baae6b775a12e8600

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645a457caae6b77=
5a12e8657
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        2 lines

    2023-05-09T13:06:43.888257  fo:

    2023-05-09T13:06:43.892844  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-09T13:06:43.898291  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-09T13:06:43.901754  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-09T13:06:43.905179  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-09T13:06:43.910920  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-09T13:06:43.914145  kern  :alert : Data abort info:

    2023-05-09T13:06:43.918083  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-09T13:06:43.921522  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-09T13:06:43.934864  kern  :alert : user pgtable: 4k pages<8>[  =
 19.648184] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645a457caae6b77=
5a12e8658
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        12 lines

    2023-05-09T13:06:43.840367  <8>[   19.558414] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-09T13:06:43.875333  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-09T13:06:43.887715  kern  :alert : Mem abort in<8>[   19.600357=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/645a4690e7aeaf10c92e85f3

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645a4690e7aeaf1=
0c92e864a
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        2 lines

    2023-05-09T13:11:08.407749  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-09T13:11:08.413922  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-09T13:11:08.417325  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-09T13:11:08.421079  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-09T13:11:08.426509  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-09T13:11:08.429616  kern  :alert : Data abort info:

    2023-05-09T13:11:08.433870  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-09T13:11:08.436884  kern  :alert :   CM =3D 0, WnR =3D 0
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645a4690e7aeaf1=
0c92e864b
        new failure (last pass: renesas-devel-2023-04-24-v6.3)
        12 lines

    2023-05-09T13:11:08.352046  <8>[   19.244615] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-09T13:11:08.390783  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-09T13:11:08.403614  kern  :alert : Mem abort in<8>[   19.289823=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>

    2023-05-09T13:11:08.403730  fo:
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645a429459e63e44952e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645a429459e63e44952e8=
5eb
        failing since 84 days (last pass: renesas-devel-2023-02-06-v6.2-rc7=
, first fail: renesas-devel-2023-02-13-v6.2-rc8) =

 =20
