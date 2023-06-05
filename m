Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285CC722E53
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jun 2023 20:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235588AbjFESGw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jun 2023 14:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235595AbjFESGk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2023 14:06:40 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881A3E58
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 11:05:54 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-656923b7c81so1135972b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jun 2023 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685988352; x=1688580352;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4rDiZGD534tAe0AW+eRQm1YxN1577NuGbKC29aYC5cA=;
        b=3+pngRsvBXZY61rlBiGB2OcAWA+tXI3fKoWHtwHRqHItZTepSbkibDdT5pyFsNpTXi
         xdFnO7V2QRmM1ey1KScnZvqfnp4pUnHT7hZDjT4dZfqxr8fCN1ZVXI6DJuQbnmkCB8Rd
         km9L/VQA3dVeSBPLtyz9P3X5aPEqz6sSqax3kNo/Mp/T+SrZUBbzUYenaPZbG4MftQh7
         u10fhjHDyZf2mABkbdU/A8Jx4Q0FgPbQl2a3vrX4ZBTxEh9tl7IpjiOCoUyGpnenXO6q
         ypEE5JnPKybea63jw5fm1NrN3ZBOpbDbOZfTXcOrNqTNnCZNnoUhHYZD1vhMC+YyHwVD
         sFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685988352; x=1688580352;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rDiZGD534tAe0AW+eRQm1YxN1577NuGbKC29aYC5cA=;
        b=KJcHAwi+QJWt75PBSb23Pii9BoKRE5a1iRmD6dkcz6QUpONICzi1BbfW0TJ88Pdx0H
         6FEcfXNg6i1rmxhIpMlcKeI0HRKa3kh4Cv8kAMYmC6Pn17yyN4Dp3mbyOampPn7zPHZ8
         EmHXyrFAhQtX5RFEP6LJEhEpFy3UobmxiWT3dJ2aDP60PI39C7IV3Y+MLZsGpVoiga/4
         bVSfkhoJCSWlnxfCdRiVRgU78ytS9Pvwh6OzRazxLAZnfb0E/Nw0UexdTDWPGXNuwvBJ
         rAueJK2Eixu+NaHmDv5D5sKSrt4pKv4/aJpQx+BgaRl8LPaDzQzwyOivX7K3yVGCGNqJ
         5Tgw==
X-Gm-Message-State: AC+VfDxUiVfdT8JaRntiAe9ScsdPPB9+Vy6BBVWtN3eya3hjKnGxcjyk
        qivGuOnM0vD62jqtYwh/Htei00qwiIRgOudpqbYdAQ==
X-Google-Smtp-Source: ACHHUZ5LvkbRsLVlMdK29PvvtjjYgUToILiazFeiRZjAfA6FVe6fEcaei8XiIrt/RNKoxG0Lemoo/w==
X-Received: by 2002:a05:6a20:5486:b0:117:a86:6c7a with SMTP id i6-20020a056a20548600b001170a866c7amr1536962pzk.12.1685988351198;
        Mon, 05 Jun 2023 11:05:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w23-20020a170902a71700b001b04dfbe5d0sm6811462plq.309.2023.06.05.11.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 11:05:50 -0700 (PDT)
Message-ID: <647e23fe.170a0220.2075a.bcfb@mx.google.com>
Date:   Mon, 05 Jun 2023 11:05:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-05-v6.4-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 162 runs,
 42 regressions (renesas-devel-2023-06-05-v6.4-rc5)
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

renesas/master baseline-nfs: 162 runs, 42 regressions (renesas-devel-2023-0=
6-05-v6.4-rc5)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

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
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-05-v6.4-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-05-v6.4-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f669ef29adafb15e4632ab82c733cdf32339a90e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647df2502824de3ea4f5de32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647df2502824de3ea4f5de3b
        failing since 56 days (last pass: renesas-devel-2023-04-04-v6.3-rc5=
, first fail: renesas-devel-2023-04-10-v6.3-rc6)

    2023-06-05T14:33:42.593740  + set +x

    2023-06-05T14:33:42.600252  <8>[   22.802633] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10593179_1.5.2.3.1>

    2023-06-05T14:33:42.706828  / # #

    2023-06-05T14:33:42.808891  export SHELL=3D/bin/sh

    2023-06-05T14:33:42.809730  #

    2023-06-05T14:33:42.911326  / # export SHELL=3D/bin/sh. /lava-10593179/=
environment

    2023-06-05T14:33:42.911968  =


    2023-06-05T14:33:43.013379  / # . /lava-10593179/environment/lava-10593=
179/bin/lava-test-runner /lava-10593179/1

    2023-06-05T14:33:43.013673  =


    2023-06-05T14:33:43.019758  / # /lava-10593179/bin/lava-test-runner /la=
va-10593179/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647debc4d8e689adb4f5de3a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647debc4d8e689adb4f5de43
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:05:43.374442  + set +x<8>[   18.890079] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10592781_1.5.2.3.1>

    2023-06-05T14:05:43.374577  =


    2023-06-05T14:05:43.479528  / ##

    2023-06-05T14:05:43.580273  export SHELL=3D/bin/sh

    2023-06-05T14:05:43.580467   #

    2023-06-05T14:05:43.680926  / # export SHELL=3D/bin/sh. /lava-10592781/=
environment

    2023-06-05T14:05:43.681139  =


    2023-06-05T14:05:43.781709  / # . /lava-10592781/environment/lava-10592=
781/bin/lava-test-runner /lava-10592781/1

    2023-06-05T14:05:43.782029  =


    2023-06-05T14:05:43.787018  / # /lava-10592781/bin/lava-test-runner /la=
va-10592781/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647dedba30e7d323cbf5de44

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647dedba30e7d323cbf5de4d
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:14:04.765064  + set +x

    2023-06-05T14:14:04.771751  <8>[   19.656773] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10592946_1.5.2.3.1>

    2023-06-05T14:14:04.876854  / # #

    2023-06-05T14:14:04.977505  export SHELL=3D/bin/sh

    2023-06-05T14:14:04.977740  #

    2023-06-05T14:14:05.078290  / # export SHELL=3D/bin/sh. /lava-10592946/=
environment

    2023-06-05T14:14:05.078525  =


    2023-06-05T14:14:05.179071  / # . /lava-10592946/environment/lava-10592=
946/bin/lava-test-runner /lava-10592946/1

    2023-06-05T14:14:05.179454  =


    2023-06-05T14:14:05.185583  / # /lava-10592946/bin/lava-test-runner /la=
va-10592946/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647df24dee7c65351cf5de2c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647df24dee7c65351cf5de35
        failing since 66 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:33:22.475175  + set +x

    2023-06-05T14:33:22.481935  [   24.316815] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10593177_1.5.2.3.1>

    2023-06-05T14:33:22.590076  #

    2023-06-05T14:33:22.690951  / # #export SHELL=3D/bin/sh

    2023-06-05T14:33:22.691179  =


    2023-06-05T14:33:22.791796  / # export SHELL=3D/bin/sh. /lava-10593177/=
environment

    2023-06-05T14:33:22.792040  =


    2023-06-05T14:33:22.892573  / # . /lava-10593177/environment/lava-10593=
177/bin/lava-test-runner /lava-10593177/1

    2023-06-05T14:33:22.892928  =


    2023-06-05T14:33:22.939560  / # /lava-10593177/bin/lava-test-runner /la=
va-10593177/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647debb2217dc18b7bf5de53

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647debb2217dc18b7bf5de5c
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:05:38.136921  + set +x

    2023-06-05T14:05:38.143581  <8>[   19.908875] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10592728_1.5.2.3.1>

    2023-06-05T14:05:38.254135  / # #

    2023-06-05T14:05:38.356728  export SHELL=3D/bin/sh

    2023-06-05T14:05:38.356956  #

    2023-06-05T14:05:38.457512  / # export SHELL=3D/bin/sh. /lava-10592728/=
environment

    2023-06-05T14:05:38.457737  =


    2023-06-05T14:05:38.558332  / # . /lava-10592728/environment/lava-10592=
728/bin/lava-test-runner /lava-10592728/1

    2023-06-05T14:05:38.558604  =


    2023-06-05T14:05:38.563655  / # /lava-10592728/bin/lava-test-runner /la=
va-10592728/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647dec0bc5d1f1c243f5de39

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647dec0bc5d1f1c243f5de42
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:06:50.228038  + <8>[   18.540598] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10592721_1.5.2.3.1>

    2023-06-05T14:06:50.228607  set +x

    2023-06-05T14:06:50.336742  / # #

    2023-06-05T14:06:50.439218  export SHELL=3D/bin/sh

    2023-06-05T14:06:50.440004  #

    2023-06-05T14:06:50.541496  / # export SHELL=3D/bin/sh. /lava-10592721/=
environment

    2023-06-05T14:06:50.541907  =


    2023-06-05T14:06:50.643059  / # . /lava-10592721/environment/lava-10592=
721/bin/lava-test-runner /lava-10592721/1

    2023-06-05T14:06:50.644395  =


    2023-06-05T14:06:50.648908  / # /lava-10592721/bin/lava-test-runner /la=
va-10592721/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647dee6eb042105c92f5de99

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647dee6eb042105c92f5dea2
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:17:00.502930  + [   18.374790] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10592929_1.5.2.3.1>

    2023-06-05T14:17:00.503017  set +x

    2023-06-05T14:17:00.607337  / # #

    2023-06-05T14:17:00.708034  export SHELL=3D/bin/sh

    2023-06-05T14:17:00.708270  #

    2023-06-05T14:17:00.808890  / # export SHELL=3D/bin/sh. /lava-10592929/=
environment

    2023-06-05T14:17:00.809105  =


    2023-06-05T14:17:00.909660  / # . /lava-10592929/environment/lava-10592=
929/bin/lava-test-runner /lava-10592929/1

    2023-06-05T14:17:00.910044  =


    2023-06-05T14:17:00.914879  / # /lava-10592929/bin/lava-test-runner /la=
va-10592929/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/647df260222f324731f5de35

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/647df260222=
f324731f5de38
        failing since 80 days (last pass: renesas-devel-2023-03-07-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2)
        3 lines

    2023-06-05T14:33:45.506294  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-05T14:33:45.512828  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-05T14:33:45.519895  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-05T14:33:45.546491  [   24.607833] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647df260222f324731f5de3e
        failing since 66 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:33:45.552817  + set[   24.617522] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10593188_1.5.2.3.1>

    2023-06-05T14:33:45.552907   +x

    2023-06-05T14:33:45.664623  / # #

    2023-06-05T14:33:45.766747  export SHELL=3D/bin/sh

    2023-06-05T14:33:45.767391  #

    2023-06-05T14:33:45.868758  / # export SHELL=3D/bin/sh. /lava-10593188/=
environment

    2023-06-05T14:33:45.869416  =


    2023-06-05T14:33:45.970798  / # . /lava-10593188/environment/lava-10593=
188/bin/lava-test-runner /lava-10593188/1

    2023-06-05T14:33:45.971827  =


    2023-06-05T14:33:45.977052  / # /lava-10593188/bin/lava-test-runner /la=
va-10593188/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647debc17df11039e6f5de2c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647debc17df11039e6f5de35
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:05:43.221572  + set +x

    2023-06-05T14:05:43.228550  <8>[   18.628150] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10592783_1.5.2.3.1>

    2023-06-05T14:05:43.337374  / # #

    2023-06-05T14:05:43.438018  export SHELL=3D/bin/sh

    2023-06-05T14:05:43.438232  #

    2023-06-05T14:05:43.538785  / # export SHELL=3D/bin/sh. /lava-10592783/=
environment

    2023-06-05T14:05:43.538991  =


    2023-06-05T14:05:43.639740  / # . /lava-10592783/environment/lava-10592=
783/bin/lava-test-runner /lava-10592783/1

    2023-06-05T14:05:43.640875  =


    2023-06-05T14:05:43.645867  / # /lava-10592783/bin/lava-test-runner /la=
va-10592783/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647df23d503ad5f611f5de4a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647df23d503ad5f611f5de53
        failing since 66 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:33:17.299493  + set +x

    2023-06-05T14:33:17.305786  [   21.007368] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10593151_1.5.2.3.1>

    2023-06-05T14:33:17.412919  /#

    2023-06-05T14:33:17.513721   # #export SHELL=3D/bin/sh

    2023-06-05T14:33:17.513899  =


    2023-06-05T14:33:17.614488  / # export SHELL=3D/bin/sh. /lava-10593151/=
environment

    2023-06-05T14:33:17.614680  =


    2023-06-05T14:33:17.715203  / # . /lava-10593151/environment/lava-10593=
151/bin/lava-test-runner /lava-10593151/1

    2023-06-05T14:33:17.715503  =


    2023-06-05T14:33:17.720286  / # /lava-10593151/bin/lava-test-runner /la=
va-10593151/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647df081952aa06641f5de40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647df081952aa0664=
1f5de41
        failing since 6 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647df1e92a194d07daf5de38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647df1e92a194d07d=
af5de39
        failing since 27 days (last pass: renesas-devel-2023-04-21-v6.3-rc7=
, first fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647df24d9232422af3f5de31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/baseline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/baseline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647df24d9232422af=
3f5de32
        failing since 3 days (last pass: renesas-devel-2023-05-30-v6.4-rc4,=
 first fail: renesas-devel-2023-06-02-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647dec0c86d93b6119f5de34

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647dec0c86d93b6119f5de3d
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:06:51.592540  + <8>[   16.351178] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10592778_1.5.2.3.1>

    2023-06-05T14:06:51.592644  set +x

    2023-06-05T14:06:51.697358  / # #

    2023-06-05T14:06:51.798096  export SHELL=3D/bin/sh

    2023-06-05T14:06:51.798332  #

    2023-06-05T14:06:51.898858  / # export SHELL=3D/bin/sh. /lava-10592778/=
environment

    2023-06-05T14:06:51.899146  =


    2023-06-05T14:06:51.999788  / # . /lava-10592778/environment/lava-10592=
778/bin/lava-test-runner /lava-10592778/1

    2023-06-05T14:06:52.000223  =


    2023-06-05T14:06:52.005150  / # /lava-10592778/bin/lava-test-runner /la=
va-10592778/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647df24c503ad5f611f5de76

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647df24c503ad5f611f5de7f
        failing since 66 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:33:41.703555  + set +x

    2023-06-05T14:33:41.710402  <8>[   37.421097] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10593160_1.5.2.3.1>

    2023-06-05T14:33:41.824049  #

    2023-06-05T14:33:41.926780  / # #export SHELL=3D/bin/sh

    2023-06-05T14:33:41.927479  =


    2023-06-05T14:33:42.028754  / # export SHELL=3D/bin/sh. /lava-10593160/=
environment

    2023-06-05T14:33:42.028984  =


    2023-06-05T14:33:42.129719  / # . /lava-10593160/environment/lava-10593=
160/bin/lava-test-runner /lava-10593160/1

    2023-06-05T14:33:42.130923  =


    2023-06-05T14:33:42.135584  / # /lava-10593160/bin/lava-test-runner /la=
va-10593160/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647dee63b042105c92f5de2a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647dee63b042105c92f5de33
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:16:48.309068  + set +x

    2023-06-05T14:16:48.315998  <8>[   17.609222] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10592959_1.5.2.3.1>

    2023-06-05T14:16:48.426453  / # #

    2023-06-05T14:16:48.527090  export SHELL=3D/bin/sh

    2023-06-05T14:16:48.527345  #

    2023-06-05T14:16:48.627917  / # export SHELL=3D/bin/sh. /lava-10592959/=
environment

    2023-06-05T14:16:48.628138  =


    2023-06-05T14:16:48.728712  / # . /lava-10592959/environment/lava-10592=
959/bin/lava-test-runner /lava-10592959/1

    2023-06-05T14:16:48.729063  =


    2023-06-05T14:16:48.734317  / # /lava-10592959/bin/lava-test-runner /la=
va-10592959/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647df251222f324731f5de28

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647df251222f324731f5de31
        failing since 66 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:33:25.376974  + [   24.528815] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10593187_1.5.2.3.1>

    2023-06-05T14:33:25.380046  set +x

    2023-06-05T14:33:25.485060  / # #

    2023-06-05T14:33:25.585756  export SHELL=3D/bin/sh

    2023-06-05T14:33:25.585973  #

    2023-06-05T14:33:25.686501  / # export SHELL=3D/bin/sh. /lava-10593187/=
environment

    2023-06-05T14:33:25.686722  =


    2023-06-05T14:33:25.787280  / # . /lava-10593187/environment/lava-10593=
187/bin/lava-test-runner /lava-10593187/1

    2023-06-05T14:33:25.787600  =


    2023-06-05T14:33:25.792743  / # /lava-10593187/bin/lava-test-runner /la=
va-10593187/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647debbe0f275756bbf5de28

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647debbe0f275756bbf5de31
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:05:37.581189  + set<8>[   17.926594] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10592765_1.5.2.3.1>

    2023-06-05T14:05:37.581675   +x

    2023-06-05T14:05:37.691274  / # #

    2023-06-05T14:05:37.793576  export SHELL=3D/bin/sh

    2023-06-05T14:05:37.794296  #

    2023-06-05T14:05:37.895742  / # export SHELL=3D/bin/sh. /lava-10592765/=
environment

    2023-06-05T14:05:37.896462  =


    2023-06-05T14:05:37.997897  / # . /lava-10592765/environment/lava-10592=
765/bin/lava-test-runner /lava-10592765/1

    2023-06-05T14:05:37.999219  =


    2023-06-05T14:05:38.004287  / # /lava-10592765/bin/lava-test-runner /la=
va-10592765/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647deda2dd148f8802f5df0a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647deda2dd148f8802f5df13
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:13:42.269919  + set +x<8>[   18.013320] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10592960_1.5.2.3.1>

    2023-06-05T14:13:42.270005  =


    2023-06-05T14:13:42.375070  / # #

    2023-06-05T14:13:42.475832  export SHELL=3D/bin/sh

    2023-06-05T14:13:42.476063  #

    2023-06-05T14:13:42.576614  / # export SHELL=3D/bin/sh. /lava-10592960/=
environment

    2023-06-05T14:13:42.576867  =


    2023-06-05T14:13:42.677429  / # . /lava-10592960/environment/lava-10592=
960/bin/lava-test-runner /lava-10592960/1

    2023-06-05T14:13:42.677803  =


    2023-06-05T14:13:42.682757  / # /lava-10592960/bin/lava-test-runner /la=
va-10592960/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647df24d503ad5f611f5de81

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647df24d503ad5f611f5de8a
        failing since 66 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:33:38.124593  + set[   23.190755] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10593193_1.5.2.3.1>

    2023-06-05T14:33:38.125097   +x

    2023-06-05T14:33:38.235917  / # #

    2023-06-05T14:33:38.338116  export SHELL=3D/bin/sh

    2023-06-05T14:33:38.338829  #

    2023-06-05T14:33:38.440127  / # export SHELL=3D/bin/sh. /lava-10593193/=
environment

    2023-06-05T14:33:38.440899  =


    2023-06-05T14:33:38.542173  / # . /lava-10593193/environment/lava-10593=
193/bin/lava-test-runner /lava-10593193/1

    2023-06-05T14:33:38.542443  =


    2023-06-05T14:33:38.542511  / # /lava-10593193/bin/lava-test-runner /la=
va-10593193/1[   23.580270] platform AMDI5682:00: deferred probe pending
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647ded34fb69daed2cf5de26

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647ded34fb69daed2cf5de2f
        failing since 90 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-05T14:11:42.161209  + set +x
    2023-06-05T14:11:42.161481  [   28.230276] <LAVA_SIGNAL_ENDRUN 0_dmesg =
967610_1.6.2.3.1>
    2023-06-05T14:11:42.270772  #
    2023-06-05T14:11:42.372988  / # #export SHELL=3D/bin/sh
    2023-06-05T14:11:42.373463  =

    2023-06-05T14:11:42.474789  / # export SHELL=3D/bin/sh. /lava-967610/en=
vironment
    2023-06-05T14:11:42.475281  =

    2023-06-05T14:11:42.577055  / # . /lava-967610/environment/lava-967610/=
bin/lava-test-runner /lava-967610/1
    2023-06-05T14:11:42.577917  =

    2023-06-05T14:11:42.581218  / # /lava-967610/bin/lava-test-runner /lava=
-967610/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647deedbcbd7bfb03af5de27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647deedbcbd7bfb03af5de30
        failing since 90 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-05T14:18:42.869737  + set +x
    2023-06-05T14:18:42.869955  [   30.461994] <LAVA_SIGNAL_ENDRUN 0_dmesg =
967627_1.6.2.3.1>
    2023-06-05T14:18:42.980517  #
    2023-06-05T14:18:43.082711  / # #export SHELL=3D/bin/sh
    2023-06-05T14:18:43.083232  =

    2023-06-05T14:18:43.184439  / # export SHELL=3D/bin/sh. /lava-967627/en=
vironment
    2023-06-05T14:18:43.184892  =

    2023-06-05T14:18:43.286212  / # . /lava-967627/environment/lava-967627/=
bin/lava-test-runner /lava-967627/1
    2023-06-05T14:18:43.286880  =

    2023-06-05T14:18:43.290323  / # /lava-967627/bin/lava-test-runner /lava=
-967627/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647def3df40995b21ef5de26

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647def3df40995b21ef5de2f
        failing since 90 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-05T14:20:37.660234  + set +x
    2023-06-05T14:20:37.660455  [   29.761048] <LAVA_SIGNAL_ENDRUN 0_dmesg =
967630_1.6.2.3.1>
    2023-06-05T14:20:37.776494  #
    2023-06-05T14:20:37.878306  / # #export SHELL=3D/bin/sh
    2023-06-05T14:20:37.878807  =

    2023-06-05T14:20:37.980149  / # export SHELL=3D/bin/sh. /lava-967630/en=
vironment
    2023-06-05T14:20:37.980649  =

    2023-06-05T14:20:38.082107  / # . /lava-967630/environment/lava-967630/=
bin/lava-test-runner /lava-967630/1
    2023-06-05T14:20:38.082780  =

    2023-06-05T14:20:38.086131  / # /lava-967630/bin/lava-test-runner /lava=
-967630/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647df16c3cc0ea0bc0f5de56

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647df16d3cc0ea0bc0f5de5f
        failing since 90 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-05T14:29:57.753484  + set +x
    2023-06-05T14:29:57.753751  [   34.331897] <LAVA_SIGNAL_ENDRUN 0_dmesg =
967637_1.6.2.3.1>
    2023-06-05T14:29:57.881038  #
    2023-06-05T14:29:57.982817  / # #export SHELL=3D/bin/sh
    2023-06-05T14:29:57.983247  =

    2023-06-05T14:29:58.084533  / # export SHELL=3D/bin/sh. /lava-967637/en=
vironment
    2023-06-05T14:29:58.085018  =

    2023-06-05T14:29:58.186221  / # . /lava-967637/environment/lava-967637/=
bin/lava-test-runner /lava-967637/1
    2023-06-05T14:29:58.186816  =

    2023-06-05T14:29:58.189999  / # /lava-967637/bin/lava-test-runner /lava=
-967637/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647df36006a64c0f50f5de3b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647df36006a64c0f50f5de44
        failing since 90 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-05T14:37:58.835727  + set +x
    2023-06-05T14:37:58.835956  [   27.150640] <LAVA_SIGNAL_ENDRUN 0_dmesg =
967654_1.6.2.3.1>
    2023-06-05T14:37:58.945051  #
    2023-06-05T14:37:59.046852  / # #export SHELL=3D/bin/sh
    2023-06-05T14:37:59.047307  =

    2023-06-05T14:37:59.148545  / # export SHELL=3D/bin/sh. /lava-967654/en=
vironment
    2023-06-05T14:37:59.148967  =

    2023-06-05T14:37:59.250219  / # . /lava-967654/environment/lava-967654/=
bin/lava-test-runner /lava-967654/1
    2023-06-05T14:37:59.250959  =

    2023-06-05T14:37:59.253879  / # /lava-967654/bin/lava-test-runner /lava=
-967654/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647deedad5e9fd8f0ef5de35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647deedad5e9fd8f0ef5de3e
        new failure (last pass: renesas-devel-2023-06-02-v6.4-rc4)

    2023-06-05T14:18:44.458258  + set[   28.306836] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 967626_1.6.2.3.1>
    2023-06-05T14:18:44.458723   +x
    2023-06-05T14:18:44.570850  / # #
    2023-06-05T14:18:44.672433  export SHELL=3D/bin/sh
    2023-06-05T14:18:44.672945  #
    2023-06-05T14:18:44.774149  / # export SHELL=3D/bin/sh. /lava-967626/en=
vironment
    2023-06-05T14:18:44.774645  =

    2023-06-05T14:18:44.875856  / # . /lava-967626/environment/lava-967626/=
bin/lava-test-runner /lava-967626/1
    2023-06-05T14:18:44.876566  =

    2023-06-05T14:18:44.879467  / # /lava-967626/bin/lava-test-runner /lava=
-967626/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/647deefacbd7bfb03af5deef

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-i=
mx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-i=
mx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.sound-card: https://kernelci.org/test/case/id/647de=
efacbd7bfb03af5defc
        new failure (last pass: renesas-devel-2023-06-02-v6.4-rc4)

    2023-06-05T14:19:15.351241  /lava-563617/1/../bin/lava-test-case
    2023-06-05T14:19:15.423544  <8>[   30.292490] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline-nfs.bootrr.sound-card-probed: https://kernelci.org/test/case/i=
d/647deefacbd7bfb03af5defd
        new failure (last pass: renesas-devel-2023-06-02-v6.4-rc4)

    2023-06-05T14:19:14.396293  /lava-563617/1/../bin/lava-test-case
    2023-06-05T14:19:14.399600  <8>[   29.181639] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/647dee2354f7bd5ddbf5de27

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-nfs=
-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-nfs=
-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647dee2354f7bd5ddbf5de2e
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-05T14:15:41.746690  / # #
    2023-06-05T14:15:41.847934  export SHELL=3D/bin/sh
    2023-06-05T14:15:41.848160  #
    2023-06-05T14:15:41.949699  / # export SHELL=3D/bin/sh. /lava-350447/en=
vironment
    2023-06-05T14:15:41.949988  =

    2023-06-05T14:15:42.051400  / # . /lava-350447/environment/lava-350447/=
bin/lava-test-runner /lava-350447/1
    2023-06-05T14:15:42.051910  =

    2023-06-05T14:15:42.060864  / # /lava-350447/bin/lava-test-runner /lava=
-350447/1
    2023-06-05T14:15:42.278585  + export TESTRUN_ID=3D1_bootrr
    2023-06-05T14:15:42.281724  + cd /lava-350447/1/tests/1_bootrr =

    ... (12 line(s) more)  =


  * baseline-nfs.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id=
/647dee2354f7bd5ddbf5de3e
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-05T14:15:46.342414  /lava-350447/1/../bin/lava-test-case
    2023-06-05T14:15:46.398390  [   22.379760] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647debbc217dc18b7bf5debd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647debbc217dc18b7bf5dec6
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:05:24.850595  <8>[   17.580545] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10592730_1.5.2.3.1>

    2023-06-05T14:05:24.955033  / # #

    2023-06-05T14:05:25.055658  export SHELL=3D/bin/sh

    2023-06-05T14:05:25.055859  #

    2023-06-05T14:05:25.156448  / # export SHELL=3D/bin/sh. /lava-10592730/=
environment

    2023-06-05T14:05:25.156629  =


    2023-06-05T14:05:25.257138  / # . /lava-10592730/environment/lava-10592=
730/bin/lava-test-runner /lava-10592730/1

    2023-06-05T14:05:25.257446  =


    2023-06-05T14:05:25.262177  / # /lava-10592730/bin/lava-test-runner /la=
va-10592730/1

    2023-06-05T14:05:25.304707  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647ded8c109e8fb718f5de4e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647ded8c109e8fb718f5de57
        failing since 66 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:13:17.862702  [   17.583236] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10592933_1.5.2.3.1>

    2023-06-05T14:13:17.967272  / # #

    2023-06-05T14:13:18.068003  export SHELL=3D/bin/sh

    2023-06-05T14:13:18.068190  #

    2023-06-05T14:13:18.168790  / # export SHELL=3D/bin/sh. /lava-10592933/=
environment

    2023-06-05T14:13:18.168993  =


    2023-06-05T14:13:18.269530  / # . /lava-10592933/environment/lava-10592=
933/bin/lava-test-runner /lava-10592933/1

    2023-06-05T14:13:18.269924  =


    2023-06-05T14:13:18.274699  / # /lava-10592933/bin/lava-test-runner /la=
va-10592933/1

    2023-06-05T14:13:18.319032  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647df24e2824de3ea4f5de27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647df24f2824de3ea4f5de30
        failing since 66 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-05T14:33:23.921743  + set +x

    2023-06-05T14:33:23.924902  [   19.790873] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10593161_1.5.2.3.1>

    2023-06-05T14:33:24.031337  / # #

    2023-06-05T14:33:24.132020  export SHELL=3D/bin/sh

    2023-06-05T14:33:24.132229  #

    2023-06-05T14:33:24.232755  / # export SHELL=3D/bin/sh. /lava-10593161/=
environment

    2023-06-05T14:33:24.232975  =


    2023-06-05T14:33:24.333532  / # . /lava-10593161/environment/lava-10593=
161/bin/lava-test-runner /lava-10593161/1

    2023-06-05T14:33:24.333865  =


    2023-06-05T14:33:24.338594  / # /lava-10593161/bin/lava-test-runner /la=
va-10593161/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647dec478a667c54abf5de2e

  Results:     28 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647dec478a667c54abf5de4e
        failing since 6 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-05T14:07:56.926638  <8>[   28.210054] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-06-05T14:07:56.928314  + set +x

    2023-06-05T14:07:56.933912  <8>[   28.221032] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10592813_1.6.2.3.1>

    2023-06-05T14:07:57.045252  #

    2023-06-05T14:07:57.148114  / # #export SHELL=3D/bin/sh

    2023-06-05T14:07:57.148802  =


    2023-06-05T14:07:57.250207  / # export SHELL=3D/bin/sh. /lava-10592813/=
environment

    2023-06-05T14:07:57.250932  =


    2023-06-05T14:07:57.352392  / # . /lava-10592813/environment/lava-10592=
813/bin/lava-test-runner /lava-10592813/1

    2023-06-05T14:07:57.353694  =

 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/647decb49c8002003bf5de3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647decb49c8002003=
bf5de3e
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647ded3c15762b2744f5de26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647ded3c15762b274=
4f5de27
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/647decacc29ff2e986f5deb6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647decacc29ff2e98=
6f5deb7
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647dee34d7dc58e234f5e04e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647dee34d7dc58e23=
4f5e04f
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/647deec9a0dfd4338ef5de26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-n=
fs-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-n=
fs-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647deec9a0dfd4338=
ef5de27
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/647def907755d5a22ff5de6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647def907755d5a22ff5de76
        failing since 14 days (last pass: renesas-devel-2023-05-09-v6.4-rc1=
, first fail: renesas-devel-2023-05-22-v6.4-rc3)

    2023-06-05T14:22:01.085495  + set +x

    2023-06-05T14:22:01.092068  [   31.292395] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10592643_1.6.2.3.1>

    2023-06-05T14:22:01.203323  / # #

    2023-06-05T14:22:01.303897  export SHELL=3D/bin/sh

    2023-06-05T14:22:01.304094  #

    2023-06-05T14:22:01.404602  / # export SHELL=3D/bin/sh. /lava-10592643/=
environment

    2023-06-05T14:22:01.404796  =


    2023-06-05T14:22:01.505344  / # . /lava-10592643/environment/lava-10592=
643/bin/lava-test-runner /lava-10592643/1

    2023-06-05T14:22:01.505633  =


    2023-06-05T14:22:01.511974  / # /lava-10592643/bin/lava-test-runner /la=
va-10592643/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647defb856044f035ef5de44

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647defb856044f035ef5de4d
        failing since 14 days (last pass: renesas-devel-2023-05-09-v6.4-rc1=
, first fail: renesas-devel-2023-05-22-v6.4-rc3)

    2023-06-05T14:22:27.253706  + [   31.953369] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10592794_1.6.2.3.1>

    2023-06-05T14:22:27.253808  set +x

    2023-06-05T14:22:27.360594  / # #

    2023-06-05T14:22:27.462978  export SHELL=3D/bin/sh

    2023-06-05T14:22:27.463746  #

    2023-06-05T14:22:27.565165  / # export SHELL=3D/bin/sh. /lava-10592794/=
environment

    2023-06-05T14:22:27.565371  =


    2023-06-05T14:22:27.666114  / # . /lava-10592794/environment/lava-10592=
794/bin/lava-test-runner /lava-10592794/1

    2023-06-05T14:22:27.667339  =


    2023-06-05T14:22:27.673370  / # /lava-10592794/bin/lava-test-runner /la=
va-10592794/1
 =

    ... (12 line(s) more)  =

 =20
