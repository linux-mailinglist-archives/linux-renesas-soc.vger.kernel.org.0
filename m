Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314A26D6FD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Apr 2023 00:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234499AbjDDWCg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 18:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236274AbjDDWCe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 18:02:34 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADFC10DF
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 15:02:31 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id z19so32659257plo.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2023 15:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680645750;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CtHaeO6E7siL3TkMo0lv9zDlL3BBv+A0sk8LNJiEvdM=;
        b=x5nvUWaszHGtN7s2tMtGuweTU/Hx1SbooNwSm8IhdVGbaGcfXjx04smUMuxZyiEeyV
         Sj4hu7Zn+Iug0zpB5DrOw8xV+V8fWORtHbMckrc4TMi0hyPdJLFm0cS0D6jnBtpP5HpO
         e7ve4heWfjWF7RwtiLPhxuVaJbnYT0SoNYMsmClhP/oxWtwYu3az7a6phKmRnqvJQD4o
         6qoJmCao8Eje0gR6dmnA5aHgvFnNjh7KNvbMug5witeBzfdFHIR3oKw/6KiIq4lhANSp
         W/cKObqFh+aqjNn7xMxgt1Ygayhs79oemlH21RMo+FoEf8wF9wFWwgkjRJULT+NLY0wM
         qIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680645750;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtHaeO6E7siL3TkMo0lv9zDlL3BBv+A0sk8LNJiEvdM=;
        b=RZjmtxXwpmzxIFD9Aaav8dTk5ORaMGvrdpNMDHbXmsx27Y3quA64oFzfkxHsZj9eKM
         9OpUIm2S5kfWirb497cZ4GXvN8TxPAXSyhwqxFySRHKgzE1rpTq4mL9dCP6beucW3Vnt
         sd/BD6fjJUsZQ+ugftXoRUQFmabTN4hBuF227JU7xg4N2VxSN8r829kv5dI7Z5WikYnk
         3Z1k45bZfUX8cWD72QsfuQmys5av4n2rdQDFd1qdu8vrN6nm1ftNDThpkXy2/DdxIr2w
         QLQJRLWvWGsQ8wSn6znIP0ZFrWWNPpwNsXCG8Uk3/uLB3ofvMf381qdCbTj0M49zc4nT
         NmbQ==
X-Gm-Message-State: AAQBX9ekVCu0Gsgw7QGvukuvZGmOGcMCFrdgCB/OVLpo27kv5zBJEWSm
        Z/lGX25cnISqEd0jArTJSnHNx69Zw2nNha7n3vnRSw==
X-Google-Smtp-Source: AKy350Y9JQpKldU7n/Yc5eMBeBHfetjnSZZVBkqPbd8/6HL42vy+cz6bXmG3ExHBMc76dvsk3+VNtA==
X-Received: by 2002:a05:6a20:b2b0:b0:d9:7fcf:1076 with SMTP id ei48-20020a056a20b2b000b000d97fcf1076mr3389967pzb.25.1680645749352;
        Tue, 04 Apr 2023 15:02:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b24-20020a631b18000000b0050f74d435e6sm7908724pgb.18.2023.04.04.15.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 15:02:29 -0700 (PDT)
Message-ID: <642c9e75.630a0220.33937.0d6c@mx.google.com>
Date:   Tue, 04 Apr 2023 15:02:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-04-04-v6.3-rc5
Subject: renesas/master baseline: 315 runs,
 34 regressions (renesas-devel-2023-04-04-v6.3-rc5)
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

renesas/master baseline: 315 runs, 34 regressions (renesas-devel-2023-04-04=
-v6.3-rc5)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie   | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-04-v6.3-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-04-v6.3-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      b4dd84fbb7628443a99f26465ef2fcee5c99583f =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c63a0955dcb301c79e9a7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c63a0955dcb301c79e9ac
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:51:15.554065  + set +x

    2023-04-04T17:51:15.560622  <8>[   10.449006] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865848_1.4.2.3.1>

    2023-04-04T17:51:15.665554  / # #

    2023-04-04T17:51:15.766729  export SHELL=3D/bin/sh

    2023-04-04T17:51:15.766962  #

    2023-04-04T17:51:15.867805  / # export SHELL=3D/bin/sh. /lava-9865848/e=
nvironment

    2023-04-04T17:51:15.868044  =


    2023-04-04T17:51:15.969224  / # . /lava-9865848/environment/lava-986584=
8/bin/lava-test-runner /lava-9865848/1

    2023-04-04T17:51:15.970392  =


    2023-04-04T17:51:15.976058  / # /lava-9865848/bin/lava-test-runner /lav=
a-9865848/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c643c6b12fc1c9579ea49

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c643c6b12fc1c9579ea4e
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:53:47.085699  <8>[   10.501613] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866067_1.4.2.3.1>

    2023-04-04T17:53:47.088786  + set +x

    2023-04-04T17:53:47.193372  / # #

    2023-04-04T17:53:47.294415  export SHELL=3D/bin/sh

    2023-04-04T17:53:47.294615  #

    2023-04-04T17:53:47.395543  / # export SHELL=3D/bin/sh. /lava-9866067/e=
nvironment

    2023-04-04T17:53:47.395803  =


    2023-04-04T17:53:47.496774  / # . /lava-9866067/environment/lava-986606=
7/bin/lava-test-runner /lava-9866067/1

    2023-04-04T17:53:47.497178  =


    2023-04-04T17:53:47.502517  / # /lava-9866067/bin/lava-test-runner /lav=
a-9866067/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c68319d78bbaa2379e932

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c68319d78bbaa2379e937
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:10:42.311761  + set +x

    2023-04-04T18:10:42.318307  <8>[   13.153220] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866382_1.4.2.3.1>

    2023-04-04T18:10:42.423474  / # #

    2023-04-04T18:10:42.524543  export SHELL=3D/bin/sh

    2023-04-04T18:10:42.524744  #

    2023-04-04T18:10:42.625682  / # export SHELL=3D/bin/sh. /lava-9866382/e=
nvironment

    2023-04-04T18:10:42.625887  =


    2023-04-04T18:10:42.726805  / # . /lava-9866382/environment/lava-986638=
2/bin/lava-test-runner /lava-9866382/1

    2023-04-04T18:10:42.727112  =


    2023-04-04T18:10:42.733012  / # /lava-9866382/bin/lava-test-runner /lav=
a-9866382/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c64e9a91ebbafcc79e9ad

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c64e9a91ebbafcc79e9b2
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:56:34.930973  + set<8>[   11.144934] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9865849_1.4.2.3.1>

    2023-04-04T17:56:34.931548   +x

    2023-04-04T17:56:35.039244  / # #

    2023-04-04T17:56:35.141964  export SHELL=3D/bin/sh

    2023-04-04T17:56:35.142249  #

    2023-04-04T17:56:35.243281  / # export SHELL=3D/bin/sh. /lava-9865849/e=
nvironment

    2023-04-04T17:56:35.244156  =


    2023-04-04T17:56:35.346221  / # . /lava-9865849/environment/lava-986584=
9/bin/lava-test-runner /lava-9865849/1

    2023-04-04T17:56:35.346494  =


    2023-04-04T17:56:35.350975  / # /lava-9865849/bin/lava-test-runner /lav=
a-9865849/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6504534a7dec5779e927

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6504534a7dec5779e92c
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:57:05.971538  + <8>[   11.520172] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9866066_1.4.2.3.1>

    2023-04-04T17:57:05.971658  set +x

    2023-04-04T17:57:06.076650  / # #

    2023-04-04T17:57:06.177829  export SHELL=3D/bin/sh

    2023-04-04T17:57:06.178070  #

    2023-04-04T17:57:06.279051  / # export SHELL=3D/bin/sh. /lava-9866066/e=
nvironment

    2023-04-04T17:57:06.279272  =


    2023-04-04T17:57:06.379991  / # . /lava-9866066/environment/lava-986606=
6/bin/lava-test-runner /lava-9866066/1

    2023-04-04T17:57:06.380370  =


    2023-04-04T17:57:06.385285  / # /lava-9866066/bin/lava-test-runner /lav=
a-9866066/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6838e024082f1579e949

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6838e024082f1579e94e
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:10:58.183103  + set +x

    2023-04-04T18:10:58.186026  <8>[   12.810437] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866354_1.4.2.3.1>

    2023-04-04T18:10:58.292023  / # #

    2023-04-04T18:10:58.393173  export SHELL=3D/bin/sh

    2023-04-04T18:10:58.393970  #

    2023-04-04T18:10:58.495733  / # export SHELL=3D/bin/sh. /lava-9866354/e=
nvironment

    2023-04-04T18:10:58.495952  =


    2023-04-04T18:10:58.597086  / # . /lava-9866354/environment/lava-986635=
4/bin/lava-test-runner /lava-9866354/1

    2023-04-04T18:10:58.598185  =


    2023-04-04T18:10:58.603305  / # /lava-9866354/bin/lava-test-runner /lav=
a-9866354/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6d167be458198f79e922

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6d167be458198f79e927
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:31:28.426544  <8>[   10.317205] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865860_1.4.2.3.1>

    2023-04-04T18:31:28.429995  + set +x

    2023-04-04T18:31:28.531329  #

    2023-04-04T18:31:28.632581  / # #export SHELL=3D/bin/sh

    2023-04-04T18:31:28.632781  =


    2023-04-04T18:31:28.733571  / # export SHELL=3D/bin/sh. /lava-9865860/e=
nvironment

    2023-04-04T18:31:28.733724  =


    2023-04-04T18:31:28.834701  / # . /lava-9865860/environment/lava-986586=
0/bin/lava-test-runner /lava-9865860/1

    2023-04-04T18:31:28.834943  =


    2023-04-04T18:31:28.840013  / # /lava-9865860/bin/lava-test-runner /lav=
a-9865860/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6d29a3b9fe64f279e922

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6d29a3b9fe64f279e927
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:31:48.412743  <8>[    8.136904] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866038_1.4.2.3.1>

    2023-04-04T18:31:48.416483  + set +x

    2023-04-04T18:31:48.522195  #

    2023-04-04T18:31:48.523502  =


    2023-04-04T18:31:48.625600  / # #export SHELL=3D/bin/sh

    2023-04-04T18:31:48.626448  =


    2023-04-04T18:31:48.728314  / # export SHELL=3D/bin/sh. /lava-9866038/e=
nvironment

    2023-04-04T18:31:48.729113  =


    2023-04-04T18:31:48.831108  / # . /lava-9866038/environment/lava-986603=
8/bin/lava-test-runner /lava-9866038/1

    2023-04-04T18:31:48.832469  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6d391478291e6879e939

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6d391478291e6879e93e
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:32:16.961184  <8>[   11.598860] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866349_1.4.2.3.1>

    2023-04-04T18:32:16.964407  + set +x

    2023-04-04T18:32:17.066114  #

    2023-04-04T18:32:17.066408  =


    2023-04-04T18:32:17.167372  / # #export SHELL=3D/bin/sh

    2023-04-04T18:32:17.167598  =


    2023-04-04T18:32:17.268559  / # export SHELL=3D/bin/sh. /lava-9866349/e=
nvironment

    2023-04-04T18:32:17.268771  =


    2023-04-04T18:32:17.369692  / # . /lava-9866349/environment/lava-986634=
9/bin/lava-test-runner /lava-9866349/1

    2023-04-04T18:32:17.370024  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie   | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/642c62d97bb1efa16679e92a

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm283=
5-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm283=
5-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c62d97bb1efa16679e95d
        failing since 1 day (last pass: renesas-devel-2023-03-30-v6.3-rc4, =
first fail: renesas-devel-2023-04-03-v6.3-rc5)

    2023-04-04T17:47:50.537311  + set +x
    2023-04-04T17:47:50.541727  <8>[   19.190971] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 276561_1.5.2.4.1>
    2023-04-04T17:47:50.675146  / # #
    2023-04-04T17:47:50.777440  export SHELL=3D/bin/sh
    2023-04-04T17:47:50.777996  #
    2023-04-04T17:47:50.879654  / # export SHELL=3D/bin/sh. /lava-276561/en=
vironment
    2023-04-04T17:47:50.880194  =

    2023-04-04T17:47:50.981975  / # . /lava-276561/environment/lava-276561/=
bin/lava-test-runner /lava-276561/1
    2023-04-04T17:47:50.982991  =

    2023-04-04T17:47:50.989336  / # /lava-276561/bin/lava-test-runner /lava=
-276561/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642c64823308dddbfa79e930

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c64823308dddbfa79e=
931
        failing since 29 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6b8c36ef173e9a79e924

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6b8c36ef173e9a79e929
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:25:01.839965  + set +x

    2023-04-04T18:25:01.846587  <8>[   10.951422] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865861_1.4.2.3.1>

    2023-04-04T18:25:01.950972  / # #

    2023-04-04T18:25:02.051970  export SHELL=3D/bin/sh

    2023-04-04T18:25:02.052256  #

    2023-04-04T18:25:02.153234  / # export SHELL=3D/bin/sh. /lava-9865861/e=
nvironment

    2023-04-04T18:25:02.153447  =


    2023-04-04T18:25:02.254364  / # . /lava-9865861/environment/lava-986586=
1/bin/lava-test-runner /lava-9865861/1

    2023-04-04T18:25:02.254686  =


    2023-04-04T18:25:02.258817  / # /lava-9865861/bin/lava-test-runner /lav=
a-9865861/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6bdbbd11dd8e1e79e961

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6bdbbd11dd8e1e79e966
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:26:21.850553  + <8>[   11.008541] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9866109_1.4.2.3.1>

    2023-04-04T18:26:21.850656  set +x

    2023-04-04T18:26:21.952339  #

    2023-04-04T18:26:21.952707  =


    2023-04-04T18:26:22.053817  / # #export SHELL=3D/bin/sh

    2023-04-04T18:26:22.054031  =


    2023-04-04T18:26:22.154962  / # export SHELL=3D/bin/sh. /lava-9866109/e=
nvironment

    2023-04-04T18:26:22.155180  =


    2023-04-04T18:26:22.256152  / # . /lava-9866109/environment/lava-986610=
9/bin/lava-test-runner /lava-9866109/1

    2023-04-04T18:26:22.256533  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6c2c1e14294f6079e932

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6c2c1e14294f6079e937
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:27:49.973067  + set +x<8>[   13.095203] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9866388_1.4.2.3.1>

    2023-04-04T18:27:49.973188  =


    2023-04-04T18:27:50.079199  / # #

    2023-04-04T18:27:50.180299  export SHELL=3D/bin/sh

    2023-04-04T18:27:50.180516  #

    2023-04-04T18:27:50.281479  / # export SHELL=3D/bin/sh. /lava-9866388/e=
nvironment

    2023-04-04T18:27:50.281676  =


    2023-04-04T18:27:50.382409  / # . /lava-9866388/environment/lava-986638=
8/bin/lava-test-runner /lava-9866388/1

    2023-04-04T18:27:50.382697  =


    2023-04-04T18:27:50.387584  / # /lava-9866388/bin/lava-test-runner /lav=
a-9866388/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6becf9791128fc79e9a7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6becf9791128fc79e9ac
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:26:30.598778  + set +x

    2023-04-04T18:26:30.605673  <8>[   10.091659] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865864_1.4.2.3.1>

    2023-04-04T18:26:30.708239  =


    2023-04-04T18:26:30.809338  / # #export SHELL=3D/bin/sh

    2023-04-04T18:26:30.809611  =


    2023-04-04T18:26:30.910561  / # export SHELL=3D/bin/sh. /lava-9865864/e=
nvironment

    2023-04-04T18:26:30.910785  =


    2023-04-04T18:26:31.011764  / # . /lava-9865864/environment/lava-986586=
4/bin/lava-test-runner /lava-9865864/1

    2023-04-04T18:26:31.012083  =


    2023-04-04T18:26:31.017322  / # /lava-9865864/bin/lava-test-runner /lav=
a-9865864/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6bf042f163b39679e92f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6bf042f163b39679e934
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:26:47.108366  + set<8>[   14.106755] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9866351_1.4.2.3.1>

    2023-04-04T18:26:47.108452   +x

    2023-04-04T18:26:47.212853  / # #

    2023-04-04T18:26:47.313888  export SHELL=3D/bin/sh

    2023-04-04T18:26:47.314088  #

    2023-04-04T18:26:47.414952  / # export SHELL=3D/bin/sh. /lava-9866351/e=
nvironment

    2023-04-04T18:26:47.415141  =


    2023-04-04T18:26:47.516070  / # . /lava-9866351/environment/lava-986635=
1/bin/lava-test-runner /lava-9866351/1

    2023-04-04T18:26:47.516349  =


    2023-04-04T18:26:47.521664  / # /lava-9866351/bin/lava-test-runner /lav=
a-9866351/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6bf242f163b39679e93a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6bf242f163b39679e93f
        failing since 1 day (last pass: renesas-devel-2023-03-27-v6.3-rc4, =
first fail: renesas-devel-2023-04-03-v6.3-rc5)

    2023-04-04T18:26:45.450304  + set +x<8>[   10.495882] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9866028_1.4.2.3.1>

    2023-04-04T18:26:45.450887  =


    2023-04-04T18:26:45.558086  #

    2023-04-04T18:26:45.661079  / # #export SHELL=3D/bin/sh

    2023-04-04T18:26:45.661850  =


    2023-04-04T18:26:45.763650  / # export SHELL=3D/bin/sh. /lava-9866028/e=
nvironment

    2023-04-04T18:26:45.764442  =


    2023-04-04T18:26:45.866432  / # . /lava-9866028/environment/lava-986602=
8/bin/lava-test-runner /lava-9866028/1

    2023-04-04T18:26:45.867670  =


    2023-04-04T18:26:45.873540  / # /lava-9866028/bin/lava-test-runner /lav=
a-9866028/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6395955dcb301c79e962

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6395955dcb301c79e967
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:50:58.805969  + set<8>[   11.282736] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9865822_1.4.2.3.1>

    2023-04-04T17:50:58.806079   +x

    2023-04-04T17:50:58.911153  / # #

    2023-04-04T17:50:59.012304  export SHELL=3D/bin/sh

    2023-04-04T17:50:59.012500  #

    2023-04-04T17:50:59.113454  / # export SHELL=3D/bin/sh. /lava-9865822/e=
nvironment

    2023-04-04T17:50:59.114142  =


    2023-04-04T17:50:59.215900  / # . /lava-9865822/environment/lava-986582=
2/bin/lava-test-runner /lava-9865822/1

    2023-04-04T17:50:59.216965  =


    2023-04-04T17:50:59.221962  / # /lava-9865822/bin/lava-test-runner /lav=
a-9865822/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6441c437d69b6a79e95a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6441c437d69b6a79e95f
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:53:49.783460  + set<8>[   10.876653] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9866077_1.4.2.3.1>

    2023-04-04T17:53:49.783563   +x

    2023-04-04T17:53:49.888172  / # #

    2023-04-04T17:53:49.989188  export SHELL=3D/bin/sh

    2023-04-04T17:53:49.989404  #

    2023-04-04T17:53:50.090286  / # export SHELL=3D/bin/sh. /lava-9866077/e=
nvironment

    2023-04-04T17:53:50.090493  =


    2023-04-04T17:53:50.191352  / # . /lava-9866077/environment/lava-986607=
7/bin/lava-test-runner /lava-9866077/1

    2023-04-04T17:53:50.191642  =


    2023-04-04T17:53:50.196608  / # /lava-9866077/bin/lava-test-runner /lav=
a-9866077/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c68467d94149bea79e95b

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c68467d94149bea79e960
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:11:03.212344  + set +x

    2023-04-04T18:11:03.215933  <8>[   14.504614] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866392_1.4.2.3.1>

    2023-04-04T18:11:03.325130  / # #

    2023-04-04T18:11:03.427578  export SHELL=3D/bin/sh

    2023-04-04T18:11:03.428451  #

    2023-04-04T18:11:03.530564  / # export SHELL=3D/bin/sh. /lava-9866392/e=
nvironment

    2023-04-04T18:11:03.531307  =


    2023-04-04T18:11:03.633106  / # . /lava-9866392/environment/lava-986639=
2/bin/lava-test-runner /lava-9866392/1

    2023-04-04T18:11:03.634549  =


    2023-04-04T18:11:03.639607  / # /lava-9866392/bin/lava-test-runner /lav=
a-9866392/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c644b3f1b44eece79e924

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c644b3f1b44eece79e929
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:54:02.111068  <8>[   11.632385] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865868_1.4.2.3.1>

    2023-04-04T17:54:02.220080  / # #

    2023-04-04T17:54:02.322968  export SHELL=3D/bin/sh

    2023-04-04T17:54:02.323933  #

    2023-04-04T17:54:02.425972  / # export SHELL=3D/bin/sh. /lava-9865868/e=
nvironment

    2023-04-04T17:54:02.426749  =


    2023-04-04T17:54:02.528652  / # . /lava-9865868/environment/lava-986586=
8/bin/lava-test-runner /lava-9865868/1

    2023-04-04T17:54:02.530158  =


    2023-04-04T17:54:02.534389  / # /lava-9865868/bin/lava-test-runner /lav=
a-9865868/1

    2023-04-04T17:54:02.540518  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c649af08b7386af79e931

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c649af08b7386af79e936
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:55:22.246485  <8>[   11.341723] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866116_1.4.2.3.1>

    2023-04-04T17:55:22.351369  / # #

    2023-04-04T17:55:22.452468  export SHELL=3D/bin/sh

    2023-04-04T17:55:22.452685  #

    2023-04-04T17:55:22.553669  / # export SHELL=3D/bin/sh. /lava-9866116/e=
nvironment

    2023-04-04T17:55:22.553888  =


    2023-04-04T17:55:22.654859  / # . /lava-9866116/environment/lava-986611=
6/bin/lava-test-runner /lava-9866116/1

    2023-04-04T17:55:22.655158  =


    2023-04-04T17:55:22.659772  / # /lava-9866116/bin/lava-test-runner /lav=
a-9866116/1

    2023-04-04T17:55:22.665756  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6a5c9bddf7994879e963

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6a5c9bddf7994879e968
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:19:59.765263  + set +x

    2023-04-04T18:19:59.768489  <8>[   11.872966] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866386_1.4.2.3.1>

    2023-04-04T18:19:59.874226  / # #

    2023-04-04T18:19:59.975196  export SHELL=3D/bin/sh

    2023-04-04T18:19:59.975384  #

    2023-04-04T18:20:00.076330  / # export SHELL=3D/bin/sh. /lava-9866386/e=
nvironment

    2023-04-04T18:20:00.076512  =


    2023-04-04T18:20:00.177417  / # . /lava-9866386/environment/lava-986638=
6/bin/lava-test-runner /lava-9866386/1

    2023-04-04T18:20:00.177668  =


    2023-04-04T18:20:00.182651  / # /lava-9866386/bin/lava-test-runner /lav=
a-9866386/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/642c6400a03aefe44b79e9a0

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/642=
c6400a03aefe44b79e9f0
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T17:52:50.660471  <8>[   22.484538] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-driver-present RESULT=3Dpass>

    2023-04-04T17:52:51.676415  /lava-9865914/1/../bin/lava-test-case

    2023-04-04T17:52:51.686830  <8>[   23.511342] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/642c6400a03aefe44b79ea42
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T17:52:48.828088  /lava-9865914/1/../bin/lava-test-case

    2023-04-04T17:52:48.837797  <8>[   20.661646] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/642c6400a03aefe44b79ea43
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T17:52:46.782966  <8>[   18.606514] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-topckgen-probed RESULT=3Dpass>

    2023-04-04T17:52:47.799033  /lava-9865914/1/../bin/lava-test-case

    2023-04-04T17:52:47.810416  <8>[   19.635390] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/642c673b30a817c24f79e995

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/642c673b30a817c24f79ea47
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:06:33.709576  /lava-9866316/1/../bin/lava-test-case

    2023-04-04T18:06:33.716002  <8>[   20.872203] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/642c673b30a817c24f79ea48
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:06:32.689526  /lava-9866316/1/../bin/lava-test-case

    2023-04-04T18:06:32.696317  <8>[   19.852453] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/642c673b30a817c24f79ea49
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:06:31.671017  /lava-9866316/1/../bin/lava-test-case

    2023-04-04T18:06:31.677245  <8>[   18.833194] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6dee34580c134d79e9a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c6dee34580c134d79e=
9a3
        failing since 1 day (last pass: renesas-devel-2023-03-30-v6.3-rc4, =
first fail: renesas-devel-2023-04-03-v6.3-rc5) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6246cbb44cf26479e926

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-i=
wg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c6246cbb44cf26479e=
927
        failing since 1 day (last pass: renesas-devel-2023-03-30-v6.3-rc4, =
first fail: renesas-devel-2023-04-03-v6.3-rc5) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642c67cac4d2aa3c0c79e932

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c67cac4d2aa3c0c79e=
933
        failing since 92 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642c66c7c2b11076d579e95b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3D=
y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c66c7c2b11076d579e=
95c
        failing since 92 days (last pass: renesas-devel-2022-12-12-v6.1, fi=
rst fail: renesas-devel-2023-01-02-v6.2-rc2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6753ed97eba2b179e922

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c6753ed97eba2b179e927
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:07:00.732238  + <8>[   16.822574] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9866311_1.5.2.3.1>

    2023-04-04T18:07:00.732357  set +x

    2023-04-04T18:07:00.837233  / # #

    2023-04-04T18:07:00.938331  export SHELL=3D/bin/sh

    2023-04-04T18:07:00.938524  #

    2023-04-04T18:07:01.039433  / # export SHELL=3D/bin/sh. /lava-9866311/e=
nvironment

    2023-04-04T18:07:01.039657  =


    2023-04-04T18:07:01.140600  / # . /lava-9866311/environment/lava-986631=
1/bin/lava-test-runner /lava-9866311/1

    2023-04-04T18:07:01.140887  =


    2023-04-04T18:07:01.147322  / # /lava-9866311/bin/lava-test-runner /lav=
a-9866311/1
 =

    ... (13 line(s) more)  =

 =20
