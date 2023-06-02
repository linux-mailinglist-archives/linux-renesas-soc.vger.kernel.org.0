Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0789720875
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 19:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236775AbjFBRhL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 13:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236683AbjFBRhL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 13:37:11 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B3F132
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 10:37:05 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-53fa455cd94so1282275a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Jun 2023 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685727425; x=1688319425;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=USKwg1GKzAnFPzQ4MJF64DDZk/wEw5KS9pXdtvhErBY=;
        b=n0uc3rAM3OW9ZNEHAFyeKL7uZMD5RIlB2IilvmvLGz7Zrq9BjCqYf0N0UZ73R+aUph
         73WXXF0DLJYqnku53B8YIcc5jeIzXgUG9hoSTzlE78aReu5ProG4Yit73MkzSl6bWtHw
         hea3QYu7vWDJD2Mnd3oj81MJJMTY1gNkSMBC07TurJyXXLDudFBwtLDP6SwMoTbhCeLs
         15yoDz3iCSeU9xUq8jaiJoPqZaE/d/Nnj+Bb4E4T90ZqP166wEhxqs7KGekyi2bnG1ot
         wdERrknZR+QZB188fOoT63eJRlM1sxEYmrNsNG4pOzWRrdH9vTwuzboIDUmzsFMd19aw
         sedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685727425; x=1688319425;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USKwg1GKzAnFPzQ4MJF64DDZk/wEw5KS9pXdtvhErBY=;
        b=KjpsPSjggHvFAfzEMlfP+p+Rez/V3+Ww9tBU2ozPa/J+v47sBinH3Cuc7yMx+UeKQC
         5V8dlRFb2oKL/rQ20sdbK+SA7Mr9uJGSN5li+CtffgE6s201iSaVI502+0b5JHUXYU5I
         va9nATR3IJemoCuDWcSgFs8DA1ekzOtUc1FhjvXYmANEUau63kyoZBrxHr75LWuFjK/A
         cRyBQYgB5GXNbvL1M2p2XkKJPBKilxGTVOQf1VKdTJ23n2VdGjGp7tX/wgJtA1V7bVue
         +VAkDx2+6s49yEHhFch4jUfy08tVkKfpvvu49dzibRd9p7Sfl7JbJbaUA/Ui3w03pqPY
         lF1A==
X-Gm-Message-State: AC+VfDzyRCS+KNFKZIytrx+RE4smTMuJzV9tUQ5YfcUjOL4LvJRMvLxw
        VvgcO5dvW7VYhyVgrv8kjHZIGs/9auyFERLK3Qjcig==
X-Google-Smtp-Source: ACHHUZ4tghW+dfcE/bEv7v9Lf2526HsM+B/rzuQZ9gOwhdOsQdYoz4mh6f9fFYD+PzKWN0a03h6s6A==
X-Received: by 2002:a17:90a:9488:b0:24d:f77c:71e7 with SMTP id s8-20020a17090a948800b0024df77c71e7mr438686pjo.41.1685727423933;
        Fri, 02 Jun 2023 10:37:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d3-20020a17090a498300b00252b3328ad8sm1509977pjh.0.2023.06.02.10.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 10:37:03 -0700 (PDT)
Message-ID: <647a28bf.170a0220.9a814.3000@mx.google.com>
Date:   Fri, 02 Jun 2023 10:37:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-02-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 294 runs,
 39 regressions (renesas-next-2023-06-02-v6.4-rc1)
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

renesas/next baseline: 294 runs, 39 regressions (renesas-next-2023-06-02-v6=
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

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

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

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-02-v6.4-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-02-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      256ba57a94d64c7d95e8f620dc8d1299c15fbc35 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ef138087090c42f5de3e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479ef138087090c42f5de47
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:41.103727  <8>[   41.486962] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565070_1.4.2.3.1>

    2023-06-02T13:30:41.108562  + set +x

    2023-06-02T13:30:41.216249  =


    2023-06-02T13:30:41.318506  / # #export SHELL=3D/bin/sh

    2023-06-02T13:30:41.319341  =


    2023-06-02T13:30:41.421313  / # export SHELL=3D/bin/sh. /lava-10565070/=
environment

    2023-06-02T13:30:41.422240  =


    2023-06-02T13:30:41.524115  / # . /lava-10565070/environment/lava-10565=
070/bin/lava-test-runner /lava-10565070/1

    2023-06-02T13:30:41.525514  =


    2023-06-02T13:30:41.530611  / # /lava-10565070/bin/lava-test-runner /la=
va-10565070/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f27e9f1212b4eef5de63

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f27e9f1212b4eef5de6c
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:45:28.406000  + set +x

    2023-06-02T13:45:28.413044  <8>[   25.804532] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565395_1.4.2.3.1>

    2023-06-02T13:45:28.515544  =


    2023-06-02T13:45:28.616234  / # #export SHELL=3D/bin/sh

    2023-06-02T13:45:28.616428  =


    2023-06-02T13:45:28.716979  / # export SHELL=3D/bin/sh. /lava-10565395/=
environment

    2023-06-02T13:45:28.717227  =


    2023-06-02T13:45:28.817852  / # . /lava-10565395/environment/lava-10565=
395/bin/lava-test-runner /lava-10565395/1

    2023-06-02T13:45:28.818186  =


    2023-06-02T13:45:28.823550  / # /lava-10565395/bin/lava-test-runner /la=
va-10565395/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ef09fcb67a3babf5de30

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479ef09fcb67a3babf5de39
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:36.146618  + set<8>[    9.043479] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10565100_1.4.2.3.1>

    2023-06-02T13:30:36.147210   +x

    2023-06-02T13:30:36.254741  / # #

    2023-06-02T13:30:36.357261  export SHELL=3D/bin/sh

    2023-06-02T13:30:36.358074  #

    2023-06-02T13:30:36.459692  / # export SHELL=3D/bin/sh. /lava-10565100/=
environment

    2023-06-02T13:30:36.460507  =


    2023-06-02T13:30:36.562071  / # . /lava-10565100/environment/lava-10565=
100/bin/lava-test-runner /lava-10565100/1

    2023-06-02T13:30:36.563351  =


    2023-06-02T13:30:36.568621  / # /lava-10565100/bin/lava-test-runner /la=
va-10565100/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f2ef22dbb5fc69f5de95

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f2f022dbb5fc69f5de9e
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:47:05.749174  + set<8>[   11.502539] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10565474_1.4.2.3.1>

    2023-06-02T13:47:05.749613   +x

    2023-06-02T13:47:05.858494  / # #

    2023-06-02T13:47:05.960649  export SHELL=3D/bin/sh

    2023-06-02T13:47:05.961386  #

    2023-06-02T13:47:06.062773  / # export SHELL=3D/bin/sh. /lava-10565474/=
environment

    2023-06-02T13:47:06.063587  =


    2023-06-02T13:47:06.165191  / # . /lava-10565474/environment/lava-10565=
474/bin/lava-test-runner /lava-10565474/1

    2023-06-02T13:47:06.166566  =


    2023-06-02T13:47:06.171391  / # /lava-10565474/bin/lava-test-runner /la=
va-10565474/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479eefc00804253e5f5de61

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479eefd00804253e5f5de6a
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:18.853955  <8>[   11.014292] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565072_1.4.2.3.1>

    2023-06-02T13:30:18.857489  + set +x

    2023-06-02T13:30:18.958924  =


    2023-06-02T13:30:19.059524  / # #export SHELL=3D/bin/sh

    2023-06-02T13:30:19.059772  =


    2023-06-02T13:30:19.160552  / # export SHELL=3D/bin/sh. /lava-10565072/=
environment

    2023-06-02T13:30:19.161247  =


    2023-06-02T13:30:19.262533  / # . /lava-10565072/environment/lava-10565=
072/bin/lava-test-runner /lava-10565072/1

    2023-06-02T13:30:19.262789  =


    2023-06-02T13:30:19.267838  / # /lava-10565072/bin/lava-test-runner /la=
va-10565072/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f285a832279deff5de63

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f285a832279deff5de6c
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:45:29.281549  <8>[   10.350639] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565401_1.4.2.3.1>

    2023-06-02T13:45:29.285340  + set +x

    2023-06-02T13:45:29.387009  =


    2023-06-02T13:45:29.487567  / # #export SHELL=3D/bin/sh

    2023-06-02T13:45:29.487771  =


    2023-06-02T13:45:29.588259  / # export SHELL=3D/bin/sh. /lava-10565401/=
environment

    2023-06-02T13:45:29.588457  =


    2023-06-02T13:45:29.688965  / # . /lava-10565401/environment/lava-10565=
401/bin/lava-test-runner /lava-10565401/1

    2023-06-02T13:45:29.689340  =


    2023-06-02T13:45:29.693859  / # /lava-10565401/bin/lava-test-runner /la=
va-10565401/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f6b15f18ee47fcf5de4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g=
20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g=
20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f6b15f18ee47fcf5d=
e4b
        new failure (last pass: renesas-next-2023-04-04-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f1da1535b25ec6f5de9c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f1da1535b25ec6f5d=
e9d
        failing since 87 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f21298a3f1fd84f5de48

  Results:     52 PASS, 3 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f21298a3f1fd84f5de7e
        failing since 18 days (last pass: renesas-next-2023-04-04-v6.3-rc1,=
 first fail: renesas-next-2023-05-15-v6.4-rc1)

    2023-06-02T13:43:32.525657  <8>[   22.520108] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 552199_1.5.2.4.1>
    2023-06-02T13:43:32.635819  / # #
    2023-06-02T13:43:32.738434  export SHELL=3D/bin/sh
    2023-06-02T13:43:32.739106  #
    2023-06-02T13:43:32.841329  / # export SHELL=3D/bin/sh. /lava-552199/en=
vironment
    2023-06-02T13:43:32.842366  =

    2023-06-02T13:43:32.944386  / # . /lava-552199/environment/lava-552199/=
bin/lava-test-runner /lava-552199/1
    2023-06-02T13:43:32.945248  =

    2023-06-02T13:43:32.949027  / # /lava-552199/bin/lava-test-runner /lava=
-552199/1
    2023-06-02T13:43:33.061031  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f2aca31fa40a88f5df1d

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
479f2aca31fa40a88f5df30
        new failure (last pass: renesas-next-2023-05-15-v6.4-rc1)

    2023-06-02T13:45:48.402588  /usr/bin/tpm2_getcap

    2023-06-02T13:45:52.994796  <6>[   14.994655] udevd (128) used greatest=
 stack depth: 13160 bytes left

    2023-06-02T13:45:58.619914  /lava-10565416/1/../bin/lava-test-case

    2023-06-02T13:45:58.626451  <8>[   20.624594] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ef295aab0709e4f5de30

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479ef295aab0709e4f5de39
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:31:04.014618  + set +x

    2023-06-02T13:31:04.021027  <8>[    8.193589] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565096_1.4.2.3.1>

    2023-06-02T13:31:04.129250  / # #

    2023-06-02T13:31:04.231743  export SHELL=3D/bin/sh

    2023-06-02T13:31:04.232527  #

    2023-06-02T13:31:04.334002  / # export SHELL=3D/bin/sh. /lava-10565096/=
environment

    2023-06-02T13:31:04.334810  =


    2023-06-02T13:31:04.436398  / # . /lava-10565096/environment/lava-10565=
096/bin/lava-test-runner /lava-10565096/1

    2023-06-02T13:31:04.437645  =


    2023-06-02T13:31:04.442909  / # /lava-10565096/bin/lava-test-runner /la=
va-10565096/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f44650a547e416f5de26

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f44650a547e416f5de2f
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:52:53.776689  + set +x

    2023-06-02T13:52:53.782525  <8>[   17.265628] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565414_1.4.2.3.1>

    2023-06-02T13:52:53.887554  / # #

    2023-06-02T13:52:53.988198  export SHELL=3D/bin/sh

    2023-06-02T13:52:53.988424  #

    2023-06-02T13:52:54.088986  / # export SHELL=3D/bin/sh. /lava-10565414/=
environment

    2023-06-02T13:52:54.089219  =


    2023-06-02T13:52:54.189823  / # . /lava-10565414/environment/lava-10565=
414/bin/lava-test-runner /lava-10565414/1

    2023-06-02T13:52:54.190153  =


    2023-06-02T13:52:54.194970  / # /lava-10565414/bin/lava-test-runner /la=
va-10565414/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479eee7bc77a4ac53f5de27

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479eee7bc77a4ac53f5de30
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:04.816650  + set +x<8>[   11.417560] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10565077_1.4.2.3.1>

    2023-06-02T13:30:04.817209  =


    2023-06-02T13:30:04.924678  / # #

    2023-06-02T13:30:05.025371  export SHELL=3D/bin/sh

    2023-06-02T13:30:05.025594  #

    2023-06-02T13:30:05.126138  / # export SHELL=3D/bin/sh. /lava-10565077/=
environment

    2023-06-02T13:30:05.126365  =


    2023-06-02T13:30:05.226933  / # . /lava-10565077/environment/lava-10565=
077/bin/lava-test-runner /lava-10565077/1

    2023-06-02T13:30:05.227231  =


    2023-06-02T13:30:05.232259  / # /lava-10565077/bin/lava-test-runner /la=
va-10565077/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f2a339825d78abf5de25

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f2a339825d78abf5de2e
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:45:53.928016  + <8>[    9.971874] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10565425_1.4.2.3.1>

    2023-06-02T13:45:53.928189  set +x

    2023-06-02T13:45:54.030273  #

    2023-06-02T13:45:54.131425  / # #export SHELL=3D/bin/sh

    2023-06-02T13:45:54.131762  =


    2023-06-02T13:45:54.232433  / # export SHELL=3D/bin/sh. /lava-10565425/=
environment

    2023-06-02T13:45:54.232760  =


    2023-06-02T13:45:54.333430  / # . /lava-10565425/environment/lava-10565=
425/bin/lava-test-runner /lava-10565425/1

    2023-06-02T13:45:54.333825  =


    2023-06-02T13:45:54.338647  / # /lava-10565425/bin/lava-test-runner /la=
va-10565425/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479eeff00804253e5f5de77

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479eeff00804253e5f5de80
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:24.702820  + set +x<8>[   11.210851] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10565079_1.4.2.3.1>

    2023-06-02T13:30:24.703239  =


    2023-06-02T13:30:24.810778  / # #

    2023-06-02T13:30:24.912953  export SHELL=3D/bin/sh

    2023-06-02T13:30:24.913611  #

    2023-06-02T13:30:25.014892  / # export SHELL=3D/bin/sh. /lava-10565079/=
environment

    2023-06-02T13:30:25.015565  =


    2023-06-02T13:30:25.116969  / # . /lava-10565079/environment/lava-10565=
079/bin/lava-test-runner /lava-10565079/1

    2023-06-02T13:30:25.118034  =


    2023-06-02T13:30:25.123200  / # /lava-10565079/bin/lava-test-runner /la=
va-10565079/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f28eff63954c6af5de71

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f28eff63954c6af5de7a
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:45:36.548678  + <8>[   11.466186] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10565458_1.4.2.3.1>

    2023-06-02T13:45:36.549192  set +x

    2023-06-02T13:45:36.656987  / # #

    2023-06-02T13:45:36.759105  export SHELL=3D/bin/sh

    2023-06-02T13:45:36.759797  #

    2023-06-02T13:45:36.861110  / # export SHELL=3D/bin/sh. /lava-10565458/=
environment

    2023-06-02T13:45:36.861831  =


    2023-06-02T13:45:36.963170  / # . /lava-10565458/environment/lava-10565=
458/bin/lava-test-runner /lava-10565458/1

    2023-06-02T13:45:36.963474  =


    2023-06-02T13:45:36.968064  / # /lava-10565458/bin/lava-test-runner /la=
va-10565458/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ee045bca1490d4f5de70

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479ee045bca1490d4f5de79
        new failure (last pass: renesas-next-2023-03-06-v6.3-rc1)

    2023-06-02T13:26:03.043138  + set +x
    2023-06-02T13:26:03.043425  [   13.118847] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965762_1.5.2.3.1>
    2023-06-02T13:26:03.151034  / # #
    2023-06-02T13:26:03.252804  export SHELL=3D/bin/sh
    2023-06-02T13:26:03.253497  #
    2023-06-02T13:26:03.354997  / # export SHELL=3D/bin/sh. /lava-965762/en=
vironment
    2023-06-02T13:26:03.355560  =

    2023-06-02T13:26:03.457036  / # . /lava-965762/environment/lava-965762/=
bin/lava-test-runner /lava-965762/1
    2023-06-02T13:26:03.457765  =

    2023-06-02T13:26:03.461338  / # /lava-965762/bin/lava-test-runner /lava=
-965762/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f032a75aca87e0f5de27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f032a75aca87e0f5de30
        new failure (last pass: renesas-next-2023-03-06-v6.3-rc1)

    2023-06-02T13:35:22.137012  + set +x
    2023-06-02T13:35:22.137175  [   13.139422] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965780_1.5.2.3.1>
    2023-06-02T13:35:22.244467  / # #
    2023-06-02T13:35:22.346166  export SHELL=3D/bin/sh
    2023-06-02T13:35:22.346628  #
    2023-06-02T13:35:22.447968  / # export SHELL=3D/bin/sh. /lava-965780/en=
vironment
    2023-06-02T13:35:22.448481  =

    2023-06-02T13:35:22.549743  / # . /lava-965780/environment/lava-965780/=
bin/lava-test-runner /lava-965780/1
    2023-06-02T13:35:22.550305  =

    2023-06-02T13:35:22.553742  / # /lava-965780/bin/lava-test-runner /lava=
-965780/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f081de1a8a04a2f5de40

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f082de1a8a04a2f5de49
        new failure (last pass: renesas-next-2023-03-06-v6.3-rc1)

    2023-06-02T13:36:41.740529  + set +x
    2023-06-02T13:36:41.740812  [   12.916137] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965784_1.5.2.3.1>
    2023-06-02T13:36:41.848657  / # #
    2023-06-02T13:36:41.950554  export SHELL=3D/bin/sh
    2023-06-02T13:36:41.951164  #
    2023-06-02T13:36:42.052458  / # export SHELL=3D/bin/sh. /lava-965784/en=
vironment
    2023-06-02T13:36:42.052965  =

    2023-06-02T13:36:42.154274  / # . /lava-965784/environment/lava-965784/=
bin/lava-test-runner /lava-965784/1
    2023-06-02T13:36:42.155043  =

    2023-06-02T13:36:42.158119  / # /lava-965784/bin/lava-test-runner /lava=
-965784/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f38ea526ef11c5f5de40

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f38ea526ef11c5f5de49
        new failure (last pass: renesas-next-2023-03-06-v6.3-rc1)

    2023-06-02T13:49:45.478964  + set +x
    2023-06-02T13:49:45.479132  [   14.371148] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965807_1.5.2.3.1>
    2023-06-02T13:49:45.586697  / # #
    2023-06-02T13:49:45.688377  export SHELL=3D/bin/sh
    2023-06-02T13:49:45.688852  #
    2023-06-02T13:49:45.790162  / # export SHELL=3D/bin/sh. /lava-965807/en=
vironment
    2023-06-02T13:49:45.790640  =

    2023-06-02T13:49:45.891990  / # . /lava-965807/environment/lava-965807/=
bin/lava-test-runner /lava-965807/1
    2023-06-02T13:49:45.892700  =

    2023-06-02T13:49:45.896013  / # /lava-965807/bin/lava-test-runner /lava=
-965807/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f58288547d0ec0f5de4e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f58288547d0ec0f5de57
        failing since 123 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2023-01-30-v6.2-rc1)

    2023-06-02T13:58:00.733211  + set +x
    2023-06-02T13:58:00.733416  [   12.096371] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965835_1.5.2.3.1>
    2023-06-02T13:58:00.840249  / # #
    2023-06-02T13:58:00.941945  export SHELL=3D/bin/sh
    2023-06-02T13:58:00.942371  #
    2023-06-02T13:58:01.043644  / # export SHELL=3D/bin/sh. /lava-965835/en=
vironment
    2023-06-02T13:58:01.044104  =

    2023-06-02T13:58:01.145330  / # . /lava-965835/environment/lava-965835/=
bin/lava-test-runner /lava-965835/1
    2023-06-02T13:58:01.149994  =

    2023-06-02T13:58:01.153077  / # /lava-965835/bin/lava-test-runner /lava=
-965835/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479efbfac23f2b6f1f5debf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479efbfac23f2b6f1f5d=
ec0
        new failure (last pass: renesas-next-2023-05-15-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479eef300804253e5f5de32

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479eef300804253e5f5de3b
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:20.919607  <8>[   11.994329] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565107_1.4.2.3.1>

    2023-06-02T13:30:21.023938  / # #

    2023-06-02T13:30:21.124521  export SHELL=3D/bin/sh

    2023-06-02T13:30:21.124662  #

    2023-06-02T13:30:21.225163  / # export SHELL=3D/bin/sh. /lava-10565107/=
environment

    2023-06-02T13:30:21.225308  =


    2023-06-02T13:30:21.325836  / # . /lava-10565107/environment/lava-10565=
107/bin/lava-test-runner /lava-10565107/1

    2023-06-02T13:30:21.326085  =


    2023-06-02T13:30:21.330771  / # /lava-10565107/bin/lava-test-runner /la=
va-10565107/1

    2023-06-02T13:30:21.337258  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f2809f1212b4eef5de79

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6479f2809f1212b4eef5de82
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:45:29.411005  <8>[   11.493828] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565465_1.4.2.3.1>

    2023-06-02T13:45:29.515435  / # #

    2023-06-02T13:45:29.616135  export SHELL=3D/bin/sh

    2023-06-02T13:45:29.616362  #

    2023-06-02T13:45:29.716905  / # export SHELL=3D/bin/sh. /lava-10565465/=
environment

    2023-06-02T13:45:29.717136  =


    2023-06-02T13:45:29.817703  / # . /lava-10565465/environment/lava-10565=
465/bin/lava-test-runner /lava-10565465/1

    2023-06-02T13:45:29.818055  =


    2023-06-02T13:45:29.822811  / # /lava-10565465/bin/lava-test-runner /la=
va-10565465/1

    2023-06-02T13:45:29.829379  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f37bbf9c0dc0c9f5de5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f37bbf9c0dc0c9f5d=
e60
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f537b5c786aae2f5de43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f537b5c786aae2f5d=
e44
        failing since 87 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f4c60221e75c99f5de7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f4c60221e75c99f5d=
e80
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f535322957e7bdf5de9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f535322957e7bdf5d=
e9f
        failing since 87 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ee69b8bce5b064f5df8b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479ee69b8bce5b064f5d=
f8c
        failing since 157 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ed515c383cd917f5de33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479ed515c383cd917f5d=
e34
        failing since 157 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2022-12-26-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6479f2a3a31fa40a88f5de38

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6479f2a4a31fa40=
a88f5de3b
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        2 lines

    2023-06-02T13:45:39.771517  fo:

    2023-06-02T13:45:39.775181  kern  :alert :   ESR =3D 0x0000000096000006

    2023-06-02T13:45:39.780968  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-02T13:45:39.784457  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-02T13:45:39.787892  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-02T13:45:39.793773  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-06-02T13:45:39.796203  kern  :alert : Data abort info:

    2023-06-02T13:45:39.800667  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-06-02T13:45:39.803989  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-06-02T13:45:39.817288  kern  :alert : user pgtable: 4k pages<8>[  =
 18.499722] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6479f2a4a31fa40=
a88f5de3c
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        12 lines

    2023-06-02T13:45:39.722445  <8>[   18.410399] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-06-02T13:45:39.758476  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-02T13:45:39.770426  kern  :alert : Mem abort in<8>[   18.452677=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f54af5f0a78c7ff5de35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f54af5f0a78c7ff5d=
e36
        failing since 87 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6479ee891ba299f48df5de51

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6479ee891ba299f=
48df5de54
        failing since 18 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-05-15-v6.4-rc1)
        2 lines

    2023-06-02T13:28:32.208508  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-06-02T13:28:32.209035  kern  :emerg : Code: 97fe0d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-06-02T13:28:32.209408  <8>[   23.069424] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-06-02T13:28:32.209739  + set +x

    2023-06-02T13:28:32.210051  <8>[   23.071233] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565031_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6479ee891ba299f=
48df5de55
        failing since 18 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-05-15-v6.4-rc1)
        12 lines

    2023-06-02T13:28:32.155275  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-02T13:28:32.155803  kern  :alert : Mem abort info:

    2023-06-02T13:28:32.156147  kern  :alert :   ESR =3D 0x0000000096000006

    2023-06-02T13:28:32.156472  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-02T13:28:32.156784  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-02T13:28:32.157086  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-02T13:28:32.157423  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-06-02T13:28:32.157729  kern  :alert : Data abort info:

    2023-06-02T13:28:32.158019  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-06-02T13:28:32.158307  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6479f20eedc7f18768f5de3f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6479f20eedc7f18=
768f5de42
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        2 lines

    2023-06-02T13:43:31.215679  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-06-02T13:43:31.215865  kern  :emerg : Code: 97fde510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-06-02T13:43:31.215955  <8>[   23.647033] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-06-02T13:43:31.216036  + set +x

    2023-06-02T13:43:31.216113  <8>[   23.650097] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565313_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6479f20eedc7f18=
768f5de43
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        12 lines

    2023-06-02T13:43:31.163906  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-02T13:43:31.164328  kern  :alert : Mem abort info:

    2023-06-02T13:43:31.164649  kern  :alert :   ESR =3D 0x0000000096000006

    2023-06-02T13:43:31.164731  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-02T13:43:31.164808  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-02T13:43:31.164869  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-02T13:43:31.164959  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-06-02T13:43:31.165018  kern  :alert : Data abort info:

    2023-06-02T13:43:31.165077  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-06-02T13:43:31.165135  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f54cf5f0a78c7ff5de3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f54cf5f0a78c7ff5d=
e3c
        failing since 87 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f99098a67d7ae7f5de44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6479f99098a67d7ae7f5d=
e45
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =20
