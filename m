Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D699C6D6F17
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 23:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235705AbjDDVkF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 17:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236279AbjDDVkE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 17:40:04 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D112421F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 14:39:57 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id o11so32632317ple.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2023 14:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680644397;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IXgSzEaOF8ZOzDWb7IUCjWiRG33Hjat8nlTCzDwp22w=;
        b=lWl3MaqPhiHpz2vdtLtuwHZDBcyoZFAglQOcLX9gbYW/nXs/R6FT685UVjBOymiOoF
         nT4A0AGSdqmu/dvohLeQCQ9rVh5kujPu/oxEHSZYf/IPTq3CW0Afd3aCj+v2Y4HfCc6P
         z+GHUYRkb4Ibm2p9XqTTql1LiSl6/53IDDLBqSEvECtDCS9/mFXExm2QYryiMJ1IXOQI
         Quh2kr8vMsETtvaZ+htrSivvzX3nRQTK52tqtiWsJmFVnxevuxmp5NVO16TVp76p+CC8
         3mVDcUnoMK0SN8bBs7i9iaK7tcQ9bDCmPsYCnNxWXwJDfj6Ry8WtQzGtK95d7Cb4Gzqz
         r66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680644397;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXgSzEaOF8ZOzDWb7IUCjWiRG33Hjat8nlTCzDwp22w=;
        b=WOwoGbHQjCd0LgG4+S7vFUTfc+jvOp6N0u1dS9L5YZGWeCOI7ZKsw4O91n2Hq2Cvea
         DYyRNYUbvYHquMbwTD4vDfcB01L9xSbsA8ctv4aMmHxE2hOsQ+kK0kSEnRiAVnB1sXux
         mVmkL71lZMe6q2vESnWw40fNW+TDEy761CwJD+WjM7rxkE3bEL+U37izQ83tQyHm6LxI
         1o2F5jrEdb/PTAmL0PIWPUVJznjtpiyaopthD2VSAjzrLUJmbQ90iL8GFtrAb5qo7Zq9
         1WYhjnAJD0K/s4rNFUDY11WH8VwY4uBBMAHa7GjH97RPrt7Rpv3ge1qCVHsxs3kRZz9V
         Hr5w==
X-Gm-Message-State: AAQBX9cYtykrxhxdj7knAW+xxaSG9vYTTkWDuTdCBLKOyxLDeMwyv249
        NbbNyuy40RY/bwEFN2a8m/OJREJqHyRLzxOpSAm4UA==
X-Google-Smtp-Source: AKy350aNWeaOgChuCIJ+gR/pMA/7mtS2G8YzANo/2obRKwNMSn8St8Rzzsn9d3aER24n+g1XXcjBTw==
X-Received: by 2002:a17:903:1211:b0:1a2:9ce6:648b with SMTP id l17-20020a170903121100b001a29ce6648bmr4333366plh.12.1680644396092;
        Tue, 04 Apr 2023 14:39:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902c18400b00195f0fb0c18sm8804754pld.31.2023.04.04.14.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 14:39:55 -0700 (PDT)
Message-ID: <642c992b.170a0220.d0abf.29db@mx.google.com>
Date:   Tue, 04 Apr 2023 14:39:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2023-04-04-v6.3-rc1
Subject: renesas/next baseline-nfs: 71 runs,
 21 regressions (renesas-next-2023-04-04-v6.3-rc1)
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

renesas/next baseline-nfs: 71 runs, 21 regressions (renesas-next-2023-04-04=
-v6.3-rc1)

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

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-04-04-v6.3-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-04-04-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f03a6e4e947dd4a5bc4ed681fc586098fd389f3 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c60b7c00c389d1579e92e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c60b7c00c389d1579e933
        failing since 4 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:38:40.599504  + set +x[   18.778389] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9865504_1.5.2.3.1>

    2023-04-04T17:38:40.599602  =


    2023-04-04T17:38:40.704570  / #

    2023-04-04T17:38:40.805915  # #export SHELL=3D/bin/sh

    2023-04-04T17:38:40.806149  =


    2023-04-04T17:38:40.907148  / # export SHELL=3D/bin/sh. /lava-9865504/e=
nvironment

    2023-04-04T17:38:40.907509  =


    2023-04-04T17:38:41.008816  / # . /lava-9865504/environment/lava-986550=
4/bin/lava-test-runner /lava-9865504/1

    2023-04-04T17:38:41.009120  =


    2023-04-04T17:38:41.014039  / # /lava-9865504/bin/lava-test-runner /lav=
a-9865504/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c63a6955dcb301c79e9ec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c63a6955dcb301c79e9f1
        failing since 4 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:51:28.437408  + set +x

    2023-04-04T17:51:28.444078  <8>[   19.136586] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865763_1.5.2.3.1>

    2023-04-04T17:51:28.549546  / ##

    2023-04-04T17:51:28.650625  export SHELL=3D/bin/sh

    2023-04-04T17:51:28.650863   #

    2023-04-04T17:51:28.751817  / # export SHELL=3D/bin/sh. /lava-9865763/e=
nvironment

    2023-04-04T17:51:28.752064  =


    2023-04-04T17:51:28.853031  / # . /lava-9865763/environment/lava-986576=
3/bin/lava-test-runner /lava-9865763/1

    2023-04-04T17:51:28.853441  =


    2023-04-04T17:51:28.858726  / # /lava-9865763/bin/lava-test-runner /lav=
a-9865763/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c65876eabb5f11e79e9bb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c65876eabb5f11e79e9c0
        failing since 81 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1)

    2023-04-04T17:59:14.495003  + set +x

    2023-04-04T17:59:14.501138  <8>[   19.275474] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865790_1.5.2.3.1>

    2023-04-04T17:59:14.613598  =


    2023-04-04T17:59:14.715985  / # #export SHELL=3D/bin/sh

    2023-04-04T17:59:14.716690  =


    2023-04-04T17:59:14.818261  / # export SHELL=3D/bin/sh. /lava-9865790/e=
nvironment

    2023-04-04T17:59:14.818461  =


    2023-04-04T17:59:14.919372  / # . /lava-9865790/environment/lava-986579=
0/bin/lava-test-runner /lava-9865790/1

    2023-04-04T17:59:14.919755  =


    2023-04-04T17:59:14.921706  / # /lava-9865790/bin/lava-test-runner /lav=
a-9865790/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c61949cafac9be379e934

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c61949cafac9be379e939
        failing since 4 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:42:23.023462  [   18.236802] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9865481_1.5.2.3.1>

    2023-04-04T17:42:23.132110  / # #

    2023-04-04T17:42:23.234427  export SHELL=3D/bin/sh

    2023-04-04T17:42:23.235145  #

    2023-04-04T17:42:23.336878  / # export SHELL=3D/bin/sh. /lava-9865481/e=
nvironment

    2023-04-04T17:42:23.337562  =


    2023-04-04T17:42:23.439328  / # . /lava-9865481/environment/lava-986548=
1/bin/lava-test-runner /lava-9865481/1

    2023-04-04T17:42:23.440464  =


    2023-04-04T17:42:23.445654  / # /lava-9865481/bin/lava-test-runner /lav=
a-9865481/1

    2023-04-04T17:42:23.531450  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6509c10fa9a5fb79e92f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6509c10fa9a5fb79e934
        failing since 4 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:57:20.120442  <8>[   18.002029] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865769_1.5.2.3.1>

    2023-04-04T17:57:20.225768  / # #

    2023-04-04T17:57:20.326873  export SHELL=3D/bin/sh

    2023-04-04T17:57:20.327097  #

    2023-04-04T17:57:20.428098  / # export SHELL=3D/bin/sh. /lava-9865769/e=
nvironment

    2023-04-04T17:57:20.428352  =


    2023-04-04T17:57:20.529352  / # . /lava-9865769/environment/lava-986576=
9/bin/lava-test-runner /lava-9865769/1

    2023-04-04T17:57:20.529660  =


    2023-04-04T17:57:20.535024  / # /lava-9865769/bin/lava-test-runner /lav=
a-9865769/1

    2023-04-04T17:57:20.618478  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c60a8835dd9adb179e970

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c60a8835dd9adb179e975
        failing since 4 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:38:24.666954  [   18.113409] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9865480_1.5.2.3.1>

    2023-04-04T17:38:24.670111  + set +x

    2023-04-04T17:38:24.778827  / # #

    2023-04-04T17:38:24.881552  export SHELL=3D/bin/sh

    2023-04-04T17:38:24.882352  #

    2023-04-04T17:38:24.984195  / # export SHELL=3D/bin/sh. /lava-9865480/e=
nvironment

    2023-04-04T17:38:24.984899  =


    2023-04-04T17:38:25.086585  / # . /lava-9865480/environment/lava-986548=
0/bin/lava-test-runner /lava-9865480/1

    2023-04-04T17:38:25.086823  =


    2023-04-04T17:38:25.091804  / # /lava-9865480/bin/lava-test-runner /lav=
a-9865480/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6da19196487a1679e9ea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6da19196487a1679e9ef
        failing since 5 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T18:34:00.210336  <8>[   18.642425] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865739_1.5.2.3.1>

    2023-04-04T18:34:00.213547  + set +x

    2023-04-04T18:34:00.321685  / # #

    2023-04-04T18:34:00.424596  export SHELL=3D/bin/sh

    2023-04-04T18:34:00.425568  #

    2023-04-04T18:34:00.527390  / # export SHELL=3D/bin/sh. /lava-9865739/e=
nvironment

    2023-04-04T18:34:00.528339  =


    2023-04-04T18:34:00.630213  / # . /lava-9865739/environment/lava-986573=
9/bin/lava-test-runner /lava-9865739/1

    2023-04-04T18:34:00.631540  =


    2023-04-04T18:34:00.636905  / # /lava-9865739/bin/lava-test-runner /lav=
a-9865739/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c61b691956fc2d879e925

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c61b691956fc2d879e92a
        failing since 4 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:43:00.413244  + set +x[   18.472994] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9865485_1.5.2.3.1>

    2023-04-04T17:43:00.413347  =


    2023-04-04T17:43:00.518220  / # #

    2023-04-04T17:43:00.619321  export SHELL=3D/bin/sh

    2023-04-04T17:43:00.619521  #

    2023-04-04T17:43:00.720410  / # export SHELL=3D/bin/sh. /lava-9865485/e=
nvironment

    2023-04-04T17:43:00.720604  =


    2023-04-04T17:43:00.821556  / # . /lava-9865485/environment/lava-986548=
5/bin/lava-test-runner /lava-9865485/1

    2023-04-04T17:43:00.821845  =


    2023-04-04T17:43:00.826381  / # /lava-9865485/bin/lava-test-runner /lav=
a-9865485/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6c94c86bf51a6e79e951

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6c94c86bf51a6e79e956
        failing since 5 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T18:29:19.566813  + <8>[   15.874781] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9865755_1.5.2.3.1>

    2023-04-04T18:29:19.566909  set +x

    2023-04-04T18:29:19.671872  / # #

    2023-04-04T18:29:19.774472  export SHELL=3D/bin/sh

    2023-04-04T18:29:19.774770  #

    2023-04-04T18:29:19.876038  / # export SHELL=3D/bin/sh. /lava-9865755/e=
nvironment

    2023-04-04T18:29:19.876710  =


    2023-04-04T18:29:19.978562  / # . /lava-9865755/environment/lava-986575=
5/bin/lava-test-runner /lava-9865755/1

    2023-04-04T18:29:19.979827  =


    2023-04-04T18:29:19.984165  / # /lava-9865755/bin/lava-test-runner /lav=
a-9865755/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c612610a4feb3f879e937

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c612610a4feb3f879e93c
        failing since 4 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:40:47.952828  + set +x[   17.140605] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9865525_1.5.2.3.1>

    2023-04-04T17:40:47.953299  =


    2023-04-04T17:40:48.060875  / # #

    2023-04-04T17:40:48.163793  export SHELL=3D/bin/sh

    2023-04-04T17:40:48.164599  #

    2023-04-04T17:40:48.266360  / # export SHELL=3D/bin/sh. /lava-9865525/e=
nvironment

    2023-04-04T17:40:48.267256  =


    2023-04-04T17:40:48.369371  / # . /lava-9865525/environment/lava-986552=
5/bin/lava-test-runner /lava-9865525/1

    2023-04-04T17:40:48.370735  =


    2023-04-04T17:40:48.376153  / # /lava-9865525/bin/lava-test-runner /lav=
a-9865525/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6c538d6e3a02c679e932

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6c538d6e3a02c679e937
        failing since 5 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T18:28:11.882896  + set +x

    2023-04-04T18:28:11.889423  <8>[   18.170823] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865789_1.5.2.3.1>

    2023-04-04T18:28:11.994013  / # #

    2023-04-04T18:28:12.094980  export SHELL=3D/bin/sh

    2023-04-04T18:28:12.095187  #

    2023-04-04T18:28:12.196103  / # export SHELL=3D/bin/sh. /lava-9865789/e=
nvironment

    2023-04-04T18:28:12.196355  =


    2023-04-04T18:28:12.297227  / # . /lava-9865789/environment/lava-986578=
9/bin/lava-test-runner /lava-9865789/1

    2023-04-04T18:28:12.297508  =


    2023-04-04T18:28:12.301900  / # /lava-9865789/bin/lava-test-runner /lav=
a-9865789/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c60bcc00c389d1579e966

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c60bcc00c389d1579e96b
        failing since 4 days (last pass: renesas-next-2023-03-06-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:38:46.611020  <8>[   18.464002] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865497_1.5.2.3.1>

    2023-04-04T17:38:46.716505  / # #

    2023-04-04T17:38:46.817436  export SHELL=3D/bin/sh

    2023-04-04T17:38:46.817652  #

    2023-04-04T17:38:46.918621  / # export SHELL=3D/bin/sh. /lava-9865497/e=
nvironment

    2023-04-04T17:38:46.918861  =


    2023-04-04T17:38:47.019870  / # . /lava-9865497/environment/lava-986549=
7/bin/lava-test-runner /lava-9865497/1

    2023-04-04T17:38:47.020211  =


    2023-04-04T17:38:47.025560  / # /lava-9865497/bin/lava-test-runner /lav=
a-9865497/1

    2023-04-04T17:38:47.104731  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c632e2919e0f32979e98e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c632e2919e0f32979e993
        failing since 4 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:49:11.601932  + set<8>[   17.635208] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9865729_1.5.2.3.1>

    2023-04-04T17:49:11.602017   +x

    2023-04-04T17:49:11.706914  / # #

    2023-04-04T17:49:11.807945  export SHELL=3D/bin/sh

    2023-04-04T17:49:11.808140  #

    2023-04-04T17:49:11.909088  / # export SHELL=3D/bin/sh. /lava-9865729/e=
nvironment

    2023-04-04T17:49:11.909349  =


    2023-04-04T17:49:12.010309  / # . /lava-9865729/environment/lava-986572=
9/bin/lava-test-runner /lava-9865729/1

    2023-04-04T17:49:12.010642  =


    2023-04-04T17:49:12.015326  / # /lava-9865729/bin/lava-test-runner /lav=
a-9865729/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c614a4a90afc4af79e922

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c614a4a90afc4af79e927
        failing since 4 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:41:05.891751  <8>[   18.090132] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865491_1.5.2.3.1>

    2023-04-04T17:41:05.997124  / # #

    2023-04-04T17:41:06.099583  export SHELL=3D/bin/sh

    2023-04-04T17:41:06.099907  #

    2023-04-04T17:41:06.201065  / # export SHELL=3D/bin/sh. /lava-9865491/e=
nvironment

    2023-04-04T17:41:06.201838  =


    2023-04-04T17:41:06.303700  / # . /lava-9865491/environment/lava-986549=
1/bin/lava-test-runner /lava-9865491/1

    2023-04-04T17:41:06.304846  =


    2023-04-04T17:41:06.309632  / # /lava-9865491/bin/lava-test-runner /lav=
a-9865491/1

    2023-04-04T17:41:06.360892  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c64b27cec27d56879e92c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c64b27cec27d56879e931
        failing since 4 days (last pass: renesas-next-2023-03-16-v6.3-rc1, =
first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-04-04T17:55:50.317016  + <8>[   18.171085] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9865726_1.5.2.3.1>

    2023-04-04T17:55:50.317098  set +x

    2023-04-04T17:55:50.421299  / # #

    2023-04-04T17:55:50.522263  export SHELL=3D/bin/sh

    2023-04-04T17:55:50.522483  #

    2023-04-04T17:55:50.623413  / # export SHELL=3D/bin/sh. /lava-9865726/e=
nvironment

    2023-04-04T17:55:50.623634  =


    2023-04-04T17:55:50.724352  / # . /lava-9865726/environment/lava-986572=
6/bin/lava-test-runner /lava-9865726/1

    2023-04-04T17:55:50.724668  =


    2023-04-04T17:55:50.729610  / # /lava-9865726/bin/lava-test-runner /lav=
a-9865726/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/642c66d5c2b11076d579e97f

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/642c66d5c2b11076d579e9c0
        failing since 24 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-04-04T18:04:55.620450  /lava-9865963/1/../bin/lava-test-case

    2023-04-04T18:04:55.643463  [   36.415765] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/642c66d5c2b11076d579ea21
        failing since 24 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-04-04T18:04:50.546704  /lava-9865963/1/../bin/lava-test-case

    2023-04-04T18:04:50.576564  [   31.348750] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/642c66d5c2b11076d579ea22
        failing since 24 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-04-04T18:04:49.469403  /lava-9865963/1/../bin/lava-test-case

    2023-04-04T18:04:49.494841  [   30.267205] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/642c64f0ca34770b8179e92d

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-04-04-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/642c64f1ca34770b8179e9dc
        failing since 24 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-04-04T17:56:32.111989  /lava-9865967/1/../bin/lava-test-case

    2023-04-04T17:56:32.137673  <8>[   29.854525] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/642c64f1ca34770b8179e9e4
        failing since 24 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-04-04T17:56:34.250016  /lava-9865967/1/../bin/lava-test-case

    2023-04-04T17:56:34.277051  <8>[   31.994148] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/642c64f1ca34770b8179e9e5
        failing since 24 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-04-04T17:56:33.181394  /lava-9865967/1/../bin/lava-test-case

    2023-04-04T17:56:33.208994  <8>[   30.926305] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =

 =20
