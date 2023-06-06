Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56EEE724393
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 15:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237896AbjFFNFU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 09:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237886AbjFFNEv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 09:04:51 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA86E7A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 06:04:47 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-650352b89f6so3109480b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686056686; x=1688648686;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cL62Tmev8E2gzEPuy91yZrCYr8UcQ3l00D3oY7wTwTQ=;
        b=IDRusqNX6o38OsA3byodN+Xb5GCPdXIdFZ6Oyc2W9GQE35LVXAswmClmf+fk18GNAh
         sIWhJnxzlPKJYIPieRUfjejN7wgIYMMpauymJaRbTphVdfxdbPfUQLI0g/gxsbWS8q3c
         YQBFD1FLyHlSHrti5PNZJJwTIE6XLJvjbHzxq1afJY1wLxKKcHRNDYAW+DLvQILB0EmJ
         /FGAy7kBsxYmnIx5lVO4Pbd6bA0z28I6JyfqfcDmGlZyPpQ4nJVowFrqfrEEYj6HWwpx
         wKovpp48I/YSs61qzBodpi6omPWMTQGnKCwfZjp/zmXaBHmaGPPnQHKSzs2FBc6Mn+vn
         YBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686056686; x=1688648686;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL62Tmev8E2gzEPuy91yZrCYr8UcQ3l00D3oY7wTwTQ=;
        b=JqNGZlbH1z5fnxXKgerIGnULSs0hTUSaQuUUoLeqNE6n/D5l6cwLVzZl1YlGhb8WL0
         +v38bFwDZWAqFjPR3aq4KYtPUOy3Gx7LfMJvb24yyFYy/YRKdgNeSo3hG1+mQNaRrrrz
         WNm/8HRdtOMpuSo3qc/AxIySTt8yBPBxitxKsGxT26B9rhnsjjqaQO8FKD7Zak70PD3o
         TU3eKNnmM7mBbRA1EmHjJNFdkInBFfkb6vxU1zDgHzrXMT/hfuh0icAwBpgUhqt2uWB2
         hxFxhi1GzVTxZkZ06OR8wkbWDduU4eOZpBjeKQvdFL2/HJVHuBXUt9TRaUiIfOJGTpyA
         qHQw==
X-Gm-Message-State: AC+VfDwGTX8SR8LU3WqwTF9CbfjZAcw3YyrNTPIWCJLKPiqsW18+UusZ
        e1jwZDgHvhP2R6qHNbzcV59owZX50SEfBWrarwqyHw==
X-Google-Smtp-Source: ACHHUZ7Rt2nDwEzgvZPoHSExpkjQVZrIo7FvwI1kkGracq401VJyQ6+5tj0ugygeQP3jBo0Esvup0Q==
X-Received: by 2002:a05:6a00:b55:b0:661:237d:6c1f with SMTP id p21-20020a056a000b5500b00661237d6c1fmr270517pfo.3.1686056684539;
        Tue, 06 Jun 2023 06:04:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x26-20020aa7919a000000b0064d413caea6sm7014347pfa.179.2023.06.06.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:04:42 -0700 (PDT)
Message-ID: <647f2eea.a70a0220.6ea0b.c328@mx.google.com>
Date:   Tue, 06 Jun 2023 06:04:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-06-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 113 runs,
 25 regressions (renesas-next-2023-06-06-v6.4-rc1)
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

renesas/next baseline-nfs: 113 runs, 25 regressions (renesas-next-2023-06-0=
6-v6.4-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-06-v6.4-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-06-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7762defcdaf029da668d5af3304d3d940d43199e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef54e32c0785c1cf5de65

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647ef54e32c0785c1cf5de6e
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:36.327475  + set +x

    2023-06-06T08:58:36.334205  <8>[   19.198443] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10602814_1.5.2.3.1>

    2023-06-06T08:58:36.438987  #

    2023-06-06T08:58:36.539831  / # #export SHELL=3D/bin/sh

    2023-06-06T08:58:36.540042  =


    2023-06-06T08:58:36.640567  / # export SHELL=3D/bin/sh. /lava-10602814/=
environment

    2023-06-06T08:58:36.640767  =


    2023-06-06T08:58:36.741269  / # . /lava-10602814/environment/lava-10602=
814/bin/lava-test-runner /lava-10602814/1

    2023-06-06T08:58:36.741550  =


    2023-06-06T08:58:36.747405  / # /lava-10602814/bin/lava-test-runner /la=
va-10602814/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef54fc0d23afdcef5de27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647ef54fc0d23afdcef5de30
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:32.623109  + <8>[   19.238835] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10602815_1.5.2.3.1>

    2023-06-06T08:58:32.623225  set +x

    2023-06-06T08:58:32.727336  / # #

    2023-06-06T08:58:32.828008  export SHELL=3D/bin/sh

    2023-06-06T08:58:32.828216  #

    2023-06-06T08:58:32.928726  / # export SHELL=3D/bin/sh. /lava-10602815/=
environment

    2023-06-06T08:58:32.928938  =


    2023-06-06T08:58:33.029476  / # . /lava-10602815/environment/lava-10602=
815/bin/lava-test-runner /lava-10602815/1

    2023-06-06T08:58:33.029801  =


    2023-06-06T08:58:33.034441  / # /lava-10602815/bin/lava-test-runner /la=
va-10602815/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef54932c0785c1cf5de2d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647ef54932c0785c1cf5de36
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:24.638497  [   15.127135] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10602812_1.5.2.3.1>

    2023-06-06T08:58:24.641398  + set +x

    2023-06-06T08:58:24.746358  / # #

    2023-06-06T08:58:24.846888  export SHELL=3D/bin/sh

    2023-06-06T08:58:24.847055  #

    2023-06-06T08:58:24.947514  / # export SHELL=3D/bin/sh. /lava-10602812/=
environment

    2023-06-06T08:58:24.947690  =


    2023-06-06T08:58:25.048161  / # . /lava-10602812/environment/lava-10602=
812/bin/lava-test-runner /lava-10602812/1

    2023-06-06T08:58:25.048543  =


    2023-06-06T08:58:25.053695  / # /lava-10602812/bin/lava-test-runner /la=
va-10602812/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647efe23350b2436c8f5de31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/ba=
seline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/ba=
seline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647efe23350b2436c=
8f5de32
        failing since 3 days (last pass: renesas-next-2023-05-15-v6.4-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647efe37b6176331d5f5dea2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647efe37b6176331d=
5f5dea3
        new failure (last pass: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef88bc995f9b4b0f5de77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-nfs-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-nfs-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647ef88bc995f9b4b=
0f5de78
        new failure (last pass: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef5388dd1a8ba85f5de3d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647ef5388dd1a8ba85f5de46
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:24.346443  + set +x

    2023-06-06T08:58:24.352816  [   18.287421] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10602834_1.5.2.3.1>

    2023-06-06T08:58:24.457782  / # #

    2023-06-06T08:58:24.558514  export SHELL=3D/bin/sh

    2023-06-06T08:58:24.558706  #

    2023-06-06T08:58:24.659215  / # export SHELL=3D/bin/sh. /lava-10602834/=
environment

    2023-06-06T08:58:24.659421  =


    2023-06-06T08:58:24.759955  / # . /lava-10602834/environment/lava-10602=
834/bin/lava-test-runner /lava-10602834/1

    2023-06-06T08:58:24.760339  =


    2023-06-06T08:58:24.764761  / # /lava-10602834/bin/lava-test-runner /la=
va-10602834/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef540bef717c4edf5de30

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647ef540bef717c4edf5de39
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:23.465006  + set[   17.965043] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10602809_1.5.2.3.1>

    2023-06-06T08:58:23.465177   +x

    2023-06-06T08:58:23.570665  / # #

    2023-06-06T08:58:23.671526  export SHELL=3D/bin/sh

    2023-06-06T08:58:23.671762  #

    2023-06-06T08:58:23.772383  / # export SHELL=3D/bin/sh. /lava-10602809/=
environment

    2023-06-06T08:58:23.772600  =


    2023-06-06T08:58:23.873191  / # . /lava-10602809/environment/lava-10602=
809/bin/lava-test-runner /lava-10602809/1

    2023-06-06T08:58:23.873504  =


    2023-06-06T08:58:23.878679  / # /lava-10602809/bin/lava-test-runner /la=
va-10602809/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef54a303e306cdcf5de48

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647ef54a303e306cdcf5de51
        failing since 67 days (last pass: renesas-next-2023-03-06-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:29.842886  <8>[   17.615733] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10602794_1.5.2.3.1>

    2023-06-06T08:58:29.948034  / # #

    2023-06-06T08:58:30.048667  export SHELL=3D/bin/sh

    2023-06-06T08:58:30.048912  #

    2023-06-06T08:58:30.149520  / # export SHELL=3D/bin/sh. /lava-10602794/=
environment

    2023-06-06T08:58:30.149754  =


    2023-06-06T08:58:30.250304  / # . /lava-10602794/environment/lava-10602=
794/bin/lava-test-runner /lava-10602794/1

    2023-06-06T08:58:30.250672  =


    2023-06-06T08:58:30.255336  / # /lava-10602794/bin/lava-test-runner /la=
va-10602794/1

    2023-06-06T08:58:30.334900  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0116fd2e55a6d6f5de41

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f0116fd2e55a6d6f5de4a
        failing since 91 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-06-06T09:48:47.664287  + set +x
    2023-06-06T09:48:47.664551  [   27.250194] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968742_1.6.2.3.1>
    2023-06-06T09:48:47.772947  #
    2023-06-06T09:48:47.874828  / # #export SHELL=3D/bin/sh
    2023-06-06T09:48:47.875269  =

    2023-06-06T09:48:47.976735  / # export SHELL=3D/bin/sh. /lava-968742/en=
vironment
    2023-06-06T09:48:47.977403  =

    2023-06-06T09:48:48.078721  / # . /lava-968742/environment/lava-968742/=
bin/lava-test-runner /lava-968742/1
    2023-06-06T09:48:48.079417  =

    2023-06-06T09:48:48.082273  / # /lava-968742/bin/lava-test-runner /lava=
-968742/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647f03320f54827427f5de46

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f03320f54827427f5de4f
        new failure (last pass: renesas-next-2023-06-02-v6.4-rc1)

    2023-06-06T09:57:46.468551  + set[   27.986232] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 968777_1.6.2.3.1>
    2023-06-06T09:57:46.468939   +x
    2023-06-06T09:57:46.580833  / # #
    2023-06-06T09:57:46.682869  export SHELL=3D/bin/sh
    2023-06-06T09:57:46.683469  #
    2023-06-06T09:57:46.784892  / # export SHELL=3D/bin/sh. /lava-968777/en=
vironment
    2023-06-06T09:57:46.785542  =

    2023-06-06T09:57:46.887405  / # . /lava-968777/environment/lava-968777/=
bin/lava-test-runner /lava-968777/1
    2023-06-06T09:57:46.888045  =

    2023-06-06T09:57:46.891016  / # /lava-968777/bin/lava-test-runner /lava=
-968777/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/647ef5e68bb5136b21f5de43

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-nfs-kontron=
-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-nfs-kontron=
-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647ef5e68bb5136b21f5de4a
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1)

    2023-06-06T09:01:13.866461  / # #
    2023-06-06T09:01:13.967536  export SHELL=3D/bin/sh
    2023-06-06T09:01:13.967769  #
    2023-06-06T09:01:14.068693  / # export SHELL=3D/bin/sh. /lava-351224/en=
vironment
    2023-06-06T09:01:14.068922  =

    2023-06-06T09:01:14.169882  / # . /lava-351224/environment/lava-351224/=
bin/lava-test-runner /lava-351224/1
    2023-06-06T09:01:14.170263  =

    2023-06-06T09:01:14.180698  / # /lava-351224/bin/lava-test-runner /lava=
-351224/1
    2023-06-06T09:01:14.393529  + export TESTRUN_ID=3D1_bootrr
    2023-06-06T09:01:14.396656  + cd /lava-351224/1/tests/1_bootrr =

    ... (12 line(s) more)  =


  * baseline-nfs.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id=
/647ef5e68bb5136b21f5de5a
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1)

    2023-06-06T09:01:18.518177  /lava-351224/1/../bin/lava-test-case
    2023-06-06T09:01:18.582327  <8>[   22.968739] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef536d78e4f8044f5de30

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647ef536d78e4f8044f5de39
        failing since 67 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-06T08:58:20.359872  [   17.924295] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10602813_1.5.2.3.1>

    2023-06-06T08:58:20.463986  / # #

    2023-06-06T08:58:20.564587  export SHELL=3D/bin/sh

    2023-06-06T08:58:20.564772  #

    2023-06-06T08:58:20.665228  / # export SHELL=3D/bin/sh. /lava-10602813/=
environment

    2023-06-06T08:58:20.665498  =


    2023-06-06T08:58:20.766012  / # . /lava-10602813/environment/lava-10602=
813/bin/lava-test-runner /lava-10602813/1

    2023-06-06T08:58:20.766325  =


    2023-06-06T08:58:20.771219  / # /lava-10602813/bin/lava-test-runner /la=
va-10602813/1

    2023-06-06T08:58:20.815246  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef5cb13e940e88bf5de55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647ef5cb13e940e88=
bf5de56
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef5c3e6daba37bdf5de50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647ef5c3e6daba37b=
df5de51
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/647ef4e60c4a912a6ff5de2f

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/647ef4e60c4=
a912a6ff5de32
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)
        2 lines

    2023-06-06T08:56:44.732248  kern  :<8>[   32.759780] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-06-06T08:56:44.733348  alert :   CM =3D 0, WnR =3D 0

    2023-06-06T08:56:44.741202  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000005c15000

    2023-06-06T08:56:44.748453  kern  :alert : [0000000000000008] pgd=3D000=
0000000000000, p4d=3D0000000000000000

    2023-06-06T08:56:44.795138  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-06-06T08:56:44.801535  kern  :emerg : Code: 97fcad10 f9405680 5286=
4a61 72a686c1 (b9400800) =

   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/647ef4e60c4=
a912a6ff5de33
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)
        12 lines

    2023-06-06T08:56:44.688390  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-06T08:56:44.691291  kern  :alert : Mem abort info:

    2023-06-06T08:56:44.694812  kern  :alert :   ESR =3D 0x0000000096000004

    2023-06-06T08:56:44.700807  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-06T08:56:44.704730  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-06T08:56:44.707697  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-06T08:56:44.713536  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-06-06T08:56:44.717471  kern  :alert : Data abort info:

    2023-06-06T08:56:44.721215  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/647ef5dac67172e892f5de32

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-nfs-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-nfs-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/647ef5dac67=
172e892f5de35
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1)
        2 lines

    2023-06-06T09:01:06.888532  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-06-06T09:01:06.889000  kern  :emerg : Code: 97f9a110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-06-06T09:01:06.933724  <8>[   41.059397] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-06-06T09:01:06.934198  + set +x

    2023-06-06T09:01:06.934500  <8>[   41.061584] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10602849_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/647ef5dac67=
172e892f5de36
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1)
        12 lines

    2023-06-06T09:01:06.777394  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-06T09:01:06.777859  kern  :alert : Mem abort info:

    2023-06-06T09:01:06.778153  kern  :alert :   ESR =3D 0x0000000096000004

    2023-06-06T09:01:06.778432  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-06T09:01:06.778699  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-06T09:01:06.778959  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-06T09:01:06.779213  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-06-06T09:01:06.779498  kern  :alert : Data abort info:

    2023-06-06T09:01:06.779752  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-06-06T09:01:06.780002  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/647efa3b1df8a50f4cf5de8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-nfs-=
rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-nfs-=
rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647efa3b1df8a50f4=
cf5de8b
        new failure (last pass: renesas-next-2023-05-15-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/647efbcb739e30216ef5ded6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399-ro=
ck-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399-ro=
ck-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/647efbcb739=
e30216ef5ded9
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)
        2 lines

    2023-06-06T09:26:13.286500  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-06-06T09:26:13.286629  kern  :emerg : Code: 97fdc910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-06-06T09:26:13.324542  <8>[   39.202678] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-06-06T09:26:13.324691  + set +x

    2023-06-06T09:26:13.324773  <8>[   39.205366] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603298_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/647efbcb739=
e30216ef5deda
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1)
        12 lines

    2023-06-06T09:26:13.179496  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-06T09:26:13.179709  kern  :alert : Mem abort info:

    2023-06-06T09:26:13.179822  kern  :alert :   ESR =3D 0x0000000096000004

    2023-06-06T09:26:13.179923  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-06T09:26:13.180022  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-06T09:26:13.180117  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-06T09:26:13.180210  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-06-06T09:26:13.180302  kern  :alert : Data abort info:

    2023-06-06T09:26:13.180400  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-06-06T09:26:13.180492  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0600e5934ce45df5de61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-sun50i-a64-=
pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-sun50i-a64-=
pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647f0600e5934ce45=
df5de62
        new failure (last pass: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef816af477f1a2bf5de34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-nfs-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-nfs-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647ef816af477f1a2=
bf5de35
        new failure (last pass: renesas-next-2023-03-10-v6.3-rc1) =

 =20
