Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A56C6D6FD1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Apr 2023 00:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbjDDWCf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 18:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234499AbjDDWCe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 18:02:34 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3D0A1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 15:02:30 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id x15so32044763pjk.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Apr 2023 15:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680645750;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+MhEYd+4yGs/ZnaJ/8DKd+kK6nQCJR3ONtEEUXZXyec=;
        b=bVcTxeD4Sd+jpLqOT17QXMcOlJG97QQsedbAHXbhRgmG5iYLwPZ53VZkBHinXjuHS1
         WVz/gtBkfkseGkciqlwEYiItWRZa79/B+JAbM2qIebdtMG3h8p0vkw24m6xl9rnAOyW3
         Kyio7tqI3NkiVkK3g+n5PdTP9R0QTYfH7kGkg4+ajrMlFoxacBJT1g75BFf1dpSP30+p
         sHbBdwDNmWVVX2L93wSAN0vMW102I0vj3K2dR9+5EsuJUFNNEabfmHj/laWIVbtzFzzL
         t9wcFay0USg4L9BRxGMgNbFa9eJLESznxDGfU2ypznlQ4TA1xDLwYgN/XPNo4tDMkcux
         P2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680645750;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MhEYd+4yGs/ZnaJ/8DKd+kK6nQCJR3ONtEEUXZXyec=;
        b=bHQRx5oWhvRjMX/dqEnc8qUDkBnjuGqEWPDw7pLSmTwYigVe7ijVibpC+xoDYQByyE
         cMw3tv5O7k2geEVnd2XtIpkcg/Tp+YWlDOzYRIUFBzULpt6wP8LqUTe5wE8kvRL3AA6T
         lbZB6UOejzH+o1BZxn4ufI5nhXqqB+oTZ4IHmmF4I7q2C+Lp5J7q6oS4FeEGSR6qirKW
         ef+lZKnrzVFpc/v1STmnhYNRYtuvUQfs47CuVBRzegYNb3r1riulHFSbe/iYXoNXiMfo
         eR3+7TmdD8u/0wyc0Do+kfFjoCal1+Ne9vHw9euYJCKYPtQ+astyy/7sK580ISYuLr2Y
         6fAw==
X-Gm-Message-State: AAQBX9fHfR3hX5RjyQU1FCSd05zco/4EEvWG7vHwrINKBNEucCM7xnty
        PcnbrEHsZblQBceLMfdUqYacOZEjOIEN6a9drN/1Yw==
X-Google-Smtp-Source: AKy350a7nzuvxkVZ3IxVkQCPBryFYDw7C9LD+ufZboHasQSuOzUEjIw3E6NInoKii29OSAe5a4aIhQ==
X-Received: by 2002:a17:902:e748:b0:19d:1fce:c9ec with SMTP id p8-20020a170902e74800b0019d1fcec9ecmr5193734plf.37.1680645748978;
        Tue, 04 Apr 2023 15:02:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902bb8100b0019a7c890c5asm8774151pls.263.2023.04.04.15.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 15:02:28 -0700 (PDT)
Message-ID: <642c9e74.170a0220.bed1b.271b@mx.google.com>
Date:   Tue, 04 Apr 2023 15:02:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2023-04-04-v6.3-rc5
Subject: renesas/master baseline-nfs: 120 runs,
 37 regressions (renesas-devel-2023-04-04-v6.3-rc5)
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

renesas/master baseline-nfs: 120 runs, 37 regressions (renesas-devel-2023-0=
4-04-v6.3-rc5)

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

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

at91sam9g20ek                | arm    | lab-broonie   | gcc-10   | at91_dt_=
defconfig            | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

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

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-04-v6.3-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
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


  Details:     https://kernelci.org/test/plan/id/642c63cd6d18229ae579e93a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c63cd6d18229ae579e93f
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:51:56.410838  + set +x

    2023-04-04T17:51:56.417168  [   18.748912] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9865870_1.5.2.3.1>

    2023-04-04T17:51:56.522434  / ##

    2023-04-04T17:51:56.623463  export SHELL=3D/bin/sh

    2023-04-04T17:51:56.623663   #

    2023-04-04T17:51:56.724674  / # export SHELL=3D/bin/sh. /lava-9865870/e=
nvironment

    2023-04-04T17:51:56.724965  =


    2023-04-04T17:51:56.825919  / # . /lava-9865870/environment/lava-986587=
0/bin/lava-test-runner /lava-9865870/1

    2023-04-04T17:51:56.826243  =


    2023-04-04T17:51:56.831599  / # /lava-9865870/bin/lava-test-runner /lav=
a-9865870/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6445c437d69b6a79e968

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6445c437d69b6a79e96d
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:53:54.890965  + set +x

    2023-04-04T17:53:54.897673  <8>[   19.882786] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866062_1.5.2.3.1>

    2023-04-04T17:53:55.003329  / # #

    2023-04-04T17:53:55.104392  export SHELL=3D/bin/sh

    2023-04-04T17:53:55.104633  #

    2023-04-04T17:53:55.205515  / # export SHELL=3D/bin/sh. /lava-9866062/e=
nvironment

    2023-04-04T17:53:55.205760  =


    2023-04-04T17:53:55.306715  / # . /lava-9866062/environment/lava-986606=
2/bin/lava-test-runner /lava-9866062/1

    2023-04-04T17:53:55.307066  =


    2023-04-04T17:53:55.312751  / # /lava-9866062/bin/lava-test-runner /lav=
a-9866062/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c686158d5cc86d379e94a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c686158d5cc86d379e94f
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:11:24.334463  + set +x

    2023-04-04T18:11:24.341081  [   22.524180] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9866362_1.5.2.3.1>

    2023-04-04T18:11:24.448851  #

    2023-04-04T18:11:24.549955  / # #export SHELL=3D/bin/sh

    2023-04-04T18:11:24.550163  =


    2023-04-04T18:11:24.651082  / # export SHELL=3D/bin/sh. /lava-9866362/e=
nvironment

    2023-04-04T18:11:24.651295  =


    2023-04-04T18:11:24.752225  / # . /lava-9866362/environment/lava-986636=
2/bin/lava-test-runner /lava-9866362/1

    2023-04-04T18:11:24.752624  =


    2023-04-04T18:11:24.758614  / # /lava-9866362/bin/lava-test-runner /lav=
a-9866362/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c65a9108d17d0bb79e94e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c65a9108d17d0bb79e953
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:59:50.789478  + <8>[   20.058528] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9866082_1.5.2.3.1>

    2023-04-04T17:59:50.790018  set +x

    2023-04-04T17:59:50.897972  #

    2023-04-04T17:59:50.999425  / # #export SHELL=3D/bin/sh

    2023-04-04T17:59:51.000282  =


    2023-04-04T17:59:51.102222  / # export SHELL=3D/bin/sh. /lava-9866082/e=
nvironment

    2023-04-04T17:59:51.103222  =


    2023-04-04T17:59:51.205180  / # . /lava-9866082/environment/lava-986608=
2/bin/lava-test-runner /lava-9866082/1

    2023-04-04T17:59:51.206386  =


    2023-04-04T17:59:51.208159  / # /lava-9866082/bin/lava-test-runner /lav=
a-9866082/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c650bb4486a5bb279e92a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c650bb4486a5bb279e92f
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:57:19.131424  <8>[   18.374982] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865851_1.5.2.3.1>

    2023-04-04T17:57:19.236432  / # #

    2023-04-04T17:57:19.337484  export SHELL=3D/bin/sh

    2023-04-04T17:57:19.337713  #

    2023-04-04T17:57:19.438611  / # export SHELL=3D/bin/sh. /lava-9865851/e=
nvironment

    2023-04-04T17:57:19.438881  =


    2023-04-04T17:57:19.539775  / # . /lava-9865851/environment/lava-986585=
1/bin/lava-test-runner /lava-9865851/1

    2023-04-04T17:57:19.540056  =


    2023-04-04T17:57:19.544951  / # /lava-9865851/bin/lava-test-runner /lav=
a-9865851/1

    2023-04-04T17:57:19.622079  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c65290b45b88cab79e923

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c65290b45b88cab79e928
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:57:49.002382  + set<8>[   17.816998] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9866059_1.5.2.3.1>

    2023-04-04T17:57:49.002489   +x

    2023-04-04T17:57:49.107566  / # #

    2023-04-04T17:57:49.208671  export SHELL=3D/bin/sh

    2023-04-04T17:57:49.208911  #

    2023-04-04T17:57:49.309658  / # export SHELL=3D/bin/sh. /lava-9866059/e=
nvironment

    2023-04-04T17:57:49.309901  =


    2023-04-04T17:57:49.410916  / # . /lava-9866059/environment/lava-986605=
9/bin/lava-test-runner /lava-9866059/1

    2023-04-04T17:57:49.411290  =


    2023-04-04T17:57:49.416828  / # /lava-9866059/bin/lava-test-runner /lav=
a-9866059/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/642c68505a1528831379e95e

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c68505a1528831379e963
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:11:15.980012  + set +x

    2023-04-04T18:11:15.983355  [   24.878221] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9866385_1.5.2.3.1>

    2023-04-04T18:11:16.096195  / # #

    2023-04-04T18:11:16.199685  export SHELL=3D/bin/sh

    2023-04-04T18:11:16.200642  #

    2023-04-04T18:11:16.201105  / # [   25.041904] platform AMDI5682:00: de=
ferred probe pending

    2023-04-04T18:11:16.303301  export SHELL=3D/bin/sh. /lava-9866385/envir=
onment

    2023-04-04T18:11:16.304335  =


    2023-04-04T18:11:16.406461  / # . /lava-9866385/environment/lava-986638=
5/bin/lava-test-runner /lava-9866385/1

    2023-04-04T18:11:16.407962  =

 =

    ... (13 line(s) more)  =


  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/642c68505a1=
528831379e965
        failing since 19 days (last pass: renesas-devel-2023-03-07-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2)
        3 lines

    2023-04-04T18:11:15.928745  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-04T18:11:15.935296  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-04-04T18:11:15.941982  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-04T18:11:15.976718  [   24.868578] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6d7f2afbaffce279e927

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6d7f2afbaffce279e92c
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:33:28.414101  <8>[   16.329937] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866112_1.5.2.3.1>

    2023-04-04T18:33:28.417142  + set +x

    2023-04-04T18:33:28.518881  #

    2023-04-04T18:33:28.620100  / # #export SHELL=3D/bin/sh

    2023-04-04T18:33:28.620305  =


    2023-04-04T18:33:28.721166  / # export SHELL=3D/bin/sh. /lava-9866112/e=
nvironment

    2023-04-04T18:33:28.721401  =


    2023-04-04T18:33:28.822420  / # . /lava-9866112/environment/lava-986611=
2/bin/lava-test-runner /lava-9866112/1

    2023-04-04T18:33:28.822737  =


    2023-04-04T18:33:28.827618  / # /lava-9866112/bin/lava-test-runner /lav=
a-9866112/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6d9d77eab256d779e96d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6d9d77eab256d779e972
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:33:55.261167  <8>[   17.653145] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865873_1.5.2.3.1>

    2023-04-04T18:33:55.264552  + set +x

    2023-04-04T18:33:55.375093  / # #

    2023-04-04T18:33:55.476592  export SHELL=3D/bin/sh

    2023-04-04T18:33:55.476975  #

    2023-04-04T18:33:55.578436  / # export SHELL=3D/bin/sh. /lava-9865873/e=
nvironment

    2023-04-04T18:33:55.579332  =


    2023-04-04T18:33:55.681565  / # . /lava-9865873/environment/lava-986587=
3/bin/lava-test-runner /lava-9865873/1

    2023-04-04T18:33:55.682652  =


    2023-04-04T18:33:55.687729  / # /lava-9865873/bin/lava-test-runner /lav=
a-9865873/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6dcabcab53c59579e97b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6dcabcab53c59579e980
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:34:37.491968  + set +x

    2023-04-04T18:34:37.498450  <8>[   22.344269] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866379_1.5.2.3.1>

    2023-04-04T18:34:37.604781  / # #

    2023-04-04T18:34:37.705806  export SHELL=3D/bin/sh

    2023-04-04T18:34:37.706074  #

    2023-04-04T18:34:37.807074  / # export SHELL=3D/bin/sh. /lava-9866379/e=
nvironment

    2023-04-04T18:34:37.807317  =


    2023-04-04T18:34:37.908265  / # . /lava-9866379/environment/lava-986637=
9/bin/lava-test-runner /lava-9866379/1

    2023-04-04T18:34:37.908578  =


    2023-04-04T18:34:37.913787  / # /lava-9866379/bin/lava-test-runner /lav=
a-9866379/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91sam9g20ek                | arm    | lab-broonie   | gcc-10   | at91_dt_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/642c64ae95a878564879e932

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/642c64ae95a878564=
879e933
        new failure (last pass: renesas-devel-2023-04-03-v6.3-rc5) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6cbf8496f8230c79e923

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6cbf8496f8230c79e928
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:30:09.881338  + set[   18.900842] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9865866_1.5.2.3.1>

    2023-04-04T18:30:09.881446   +x

    2023-04-04T18:30:09.986158  / # #

    2023-04-04T18:30:10.087279  export SHELL=3D/bin/sh

    2023-04-04T18:30:10.087531  #

    2023-04-04T18:30:10.188453  / # export SHELL=3D/bin/sh. /lava-9865866/e=
nvironment

    2023-04-04T18:30:10.188702  =


    2023-04-04T18:30:10.289666  / # . /lava-9865866/environment/lava-986586=
6/bin/lava-test-runner /lava-9865866/1

    2023-04-04T18:30:10.290014  =


    2023-04-04T18:30:10.294557  / # /lava-9865866/bin/lava-test-runner /lav=
a-9865866/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6cdcdc272f2acb79e92e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6cdcdc272f2acb79e933
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:30:29.772421  + set[   18.393161] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9866122_1.5.2.3.1>

    2023-04-04T18:30:29.775575   +x

    2023-04-04T18:30:29.880072  / # #

    2023-04-04T18:30:29.981035  export SHELL=3D/bin/sh

    2023-04-04T18:30:29.981223  #

    2023-04-04T18:30:30.082136  / # export SHELL=3D/bin/sh. /lava-9866122/e=
nvironment

    2023-04-04T18:30:30.082353  =


    2023-04-04T18:30:30.183255  / # . /lava-9866122/environment/lava-986612=
2/bin/lava-test-runner /lava-9866122/1

    2023-04-04T18:30:30.183573  =


    2023-04-04T18:30:30.188210  / # /lava-9866122/bin/lava-test-runner /lav=
a-9866122/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6cf46c2c2356f879e9a5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6cf46c2c2356f879e9aa
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:31:01.058229  + set +x

    2023-04-04T18:31:01.064584  [   34.556598] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9866348_1.5.2.3.1>

    2023-04-04T18:31:01.172942  #

    2023-04-04T18:31:01.274168  / # #export SHELL=3D/bin/sh

    2023-04-04T18:31:01.274345  =


    2023-04-04T18:31:01.375224  / # export SHELL=3D/bin/sh. /lava-9866348/e=
nvironment

    2023-04-04T18:31:01.375410  =


    2023-04-04T18:31:01.476307  / # . /lava-9866348/environment/lava-986634=
8/bin/lava-test-runner /lava-9866348/1

    2023-04-04T18:31:01.476616  =


    2023-04-04T18:31:01.481540  / # /lava-9866348/bin/lava-test-runner /lav=
a-9866348/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6c4d2e2a69440879e922

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6c4d2e2a69440879e927
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:28:24.256794  + set<8>[   16.802553] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9866099_1.5.2.3.1>

    2023-04-04T18:28:24.256883   +x

    2023-04-04T18:28:24.361553  / # #

    2023-04-04T18:28:24.462581  export SHELL=3D/bin/sh

    2023-04-04T18:28:24.462805  #

    2023-04-04T18:28:24.563747  / # export SHELL=3D/bin/sh. /lava-9866099/e=
nvironment

    2023-04-04T18:28:24.563948  =


    2023-04-04T18:28:24.664956  / # . /lava-9866099/environment/lava-986609=
9/bin/lava-test-runner /lava-9866099/1

    2023-04-04T18:28:24.665317  =


    2023-04-04T18:28:24.670036  / # /lava-9866099/bin/lava-test-runner /lav=
a-9866099/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6c502e2a69440879e930

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6c502e2a69440879e935
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:28:25.446845  + set[   16.992525] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9865838_1.5.2.3.1>

    2023-04-04T18:28:25.446984   +x

    2023-04-04T18:28:25.552419  / # #

    2023-04-04T18:28:25.653459  export SHELL=3D/bin/sh

    2023-04-04T18:28:25.653675  #

    2023-04-04T18:28:25.754613  / # export SHELL=3D/bin/sh. /lava-9865838/e=
nvironment

    2023-04-04T18:28:25.754800  =


    2023-04-04T18:28:25.855679  / # . /lava-9865838/environment/lava-986583=
8/bin/lava-test-runner /lava-9865838/1

    2023-04-04T18:28:25.856001  =


    2023-04-04T18:28:25.861139  / # /lava-9865838/bin/lava-test-runner /lav=
a-9865838/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6c8d417a32122679e932

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6c8d417a32122679e937
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:29:11.969400  + set +x

    2023-04-04T18:29:11.975682  <8>[   22.648176] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866363_1.5.2.3.1>

    2023-04-04T18:29:12.080956  / # #

    2023-04-04T18:29:12.181952  export SHELL=3D/bin/sh

    2023-04-04T18:29:12.182184  #

    2023-04-04T18:29:12.283136  / # export SHELL=3D/bin/sh. /lava-9866363/e=
nvironment

    2023-04-04T18:29:12.283360  =


    2023-04-04T18:29:12.384337  / # . /lava-9866363/environment/lava-986636=
3/bin/lava-test-runner /lava-9866363/1

    2023-04-04T18:29:12.384704  =


    2023-04-04T18:29:12.389893  / # /lava-9866363/bin/lava-test-runner /lav=
a-9866363/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c63b3a8ac7dff7379e92f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c63b3a8ac7dff7379e934
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:51:25.514873  + <8>[   17.595036] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9865845_1.5.2.3.1>

    2023-04-04T17:51:25.514989  set +x

    2023-04-04T17:51:25.620164  / # #

    2023-04-04T17:51:25.721265  export SHELL=3D/bin/sh

    2023-04-04T17:51:25.721521  #

    2023-04-04T17:51:25.822500  / # export SHELL=3D/bin/sh. /lava-9865845/e=
nvironment

    2023-04-04T17:51:25.822772  =


    2023-04-04T17:51:25.923836  / # . /lava-9865845/environment/lava-986584=
5/bin/lava-test-runner /lava-9865845/1

    2023-04-04T17:51:25.924152  =


    2023-04-04T17:51:25.929790  / # /lava-9865845/bin/lava-test-runner /lav=
a-9865845/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6455cc4e0e37d879e958

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6455cc4e0e37d879e95d
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:54:13.795122  <8>[   15.355437] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9866113_1.5.2.3.1>

    2023-04-04T17:54:13.904093  / # #

    2023-04-04T17:54:14.006660  export SHELL=3D/bin/sh

    2023-04-04T17:54:14.007470  #

    2023-04-04T17:54:14.109281  / # export SHELL=3D/bin/sh. /lava-9866113/e=
nvironment

    2023-04-04T17:54:14.110157  =


    2023-04-04T17:54:14.211999  / # . /lava-9866113/environment/lava-986611=
3/bin/lava-test-runner /lava-9866113/1

    2023-04-04T17:54:14.213327  =


    2023-04-04T17:54:14.218170  / # /lava-9866113/bin/lava-test-runner /lav=
a-9866113/1

    2023-04-04T17:54:14.308138  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c68515a1528831379e969

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c68515a1528831379e96d
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:11:04.094220  + <8>[   23.346037] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9866367_1.5.2.3.1>

    2023-04-04T18:11:04.094309  set +x

    2023-04-04T18:11:04.205264  / # #

    2023-04-04T18:11:04.306261  export SHELL=3D/bin/sh

    2023-04-04T18:11:04.306476  #

    2023-04-04T18:11:04.407417  / # export SHELL=3D/bin/sh. /lava-9866367/e=
nvironment

    2023-04-04T18:11:04.407626  =


    2023-04-04T18:11:04.508577  / # . /lava-9866367/environment/lava-986636=
7/bin/lava-test-runner /lava-9866367/1

    2023-04-04T18:11:04.508889  =


    2023-04-04T18:11:04.514457  / # /lava-9866367/bin/lava-test-runner /lav=
a-9866367/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c64ffca34770b8179e9f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c64ffca34770b8179e9fc
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:56:56.820314  <8>[   18.110836] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9865841_1.5.2.3.1>

    2023-04-04T17:56:56.925436  / # #

    2023-04-04T17:56:57.026495  export SHELL=3D/bin/sh

    2023-04-04T17:56:57.026747  #

    2023-04-04T17:56:57.127734  / # export SHELL=3D/bin/sh. /lava-9865841/e=
nvironment

    2023-04-04T17:56:57.127997  =


    2023-04-04T17:56:57.229008  / # . /lava-9865841/environment/lava-986584=
1/bin/lava-test-runner /lava-9865841/1

    2023-04-04T17:56:57.229425  =


    2023-04-04T17:56:57.234377  / # /lava-9865841/bin/lava-test-runner /lav=
a-9865841/1

    2023-04-04T17:56:57.277670  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6516c10fa9a5fb79e94c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6516c10fa9a5fb79e951
        failing since 5 days (last pass: renesas-devel-2023-03-27-v6.3-rc4,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T17:57:29.867246  [   17.549851] <LAVA_SIGNAL_ENDRUN 0_dmesg =
9866100_1.5.2.3.1>

    2023-04-04T17:57:29.971605  / # #

    2023-04-04T17:57:30.072660  export SHELL=3D/bin/sh

    2023-04-04T17:57:30.072857  #

    2023-04-04T17:57:30.173749  / # export SHELL=3D/bin/sh. /lava-9866100/e=
nvironment

    2023-04-04T17:57:30.173965  =


    2023-04-04T17:57:30.274860  / # . /lava-9866100/environment/lava-986610=
0/bin/lava-test-runner /lava-9866100/1

    2023-04-04T17:57:30.275166  =


    2023-04-04T17:57:30.280555  / # /lava-9866100/bin/lava-test-runner /lav=
a-9866100/1

    2023-04-04T17:57:30.358944  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6b18fdc649c74479e927

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6b18fdc649c74479e92c
        failing since 5 days (last pass: renesas-devel-2023-03-16-v6.3-rc2,=
 first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:23:08.685858  + set<8>[   22.245614] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9866373_1.5.2.3.1>

    2023-04-04T18:23:08.685958   +x

    2023-04-04T18:23:08.792188  / # #

    2023-04-04T18:23:08.893238  export SHELL=3D/bin/sh

    2023-04-04T18:23:08.893474  #

    2023-04-04T18:23:08.994435  / # export SHELL=3D/bin/sh. /lava-9866373/e=
nvironment

    2023-04-04T18:23:08.994672  =


    2023-04-04T18:23:09.095841  / # . /lava-9866373/environment/lava-986637=
3/bin/lava-test-runner /lava-9866373/1

    2023-04-04T18:23:09.096162  =


    2023-04-04T18:23:09.100639  / # /lava-9866373/bin/lava-test-runner /lav=
a-9866373/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/642c66dfa514ae138a79e924

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/642c66dfa514ae138a79e974
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:04:50.630253  /lava-9865938/1/../bin/lava-test-case

    2023-04-04T18:04:50.657316  <8>[   36.183024] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/642c66e0a514ae138a79e9c6
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:04:45.249413  /lava-9865938/1/../bin/lava-test-case

    2023-04-04T18:04:45.283462  <8>[   30.809523] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/642c66e0a514ae138a79e9c7
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:04:44.166823  /lava-9865938/1/../bin/lava-test-case

    2023-04-04T18:04:44.190959  <8>[   29.717394] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/642c676b1730a09d5079e938

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/642c676b1730a09d5079e988
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:07:20.235537  /lava-9866298/1/../bin/lava-test-case

    2023-04-04T18:07:20.262929  <8>[   36.793974] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/642c676c1730a09d5079e9e0
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:07:14.812358  /lava-9866298/1/../bin/lava-test-case

    2023-04-04T18:07:14.839473  <8>[   31.370632] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/642c676c1730a09d5079e9e1
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:07:13.730524  /lava-9866298/1/../bin/lava-test-case

    2023-04-04T18:07:13.758247  <8>[   30.289281] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/642c642e6b12fc1c9579e973

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/642c642f6b12fc1c9579ea25
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T17:53:23.186664  /lava-9865892/1/../bin/lava-test-case

    2023-04-04T17:53:23.209897  <8>[   31.353464] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/642c642f6b12fc1c9579ea26
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T17:53:22.125775  /lava-9865892/1/../bin/lava-test-case

    2023-04-04T17:53:22.151585  <8>[   30.294945] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/642c642f6b12fc1c9579ea27
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T17:53:21.057241  /lava-9865892/1/../bin/lava-test-case

    2023-04-04T17:53:21.082343  <8>[   29.225444] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/642c675ced97eba2b179e94b

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/642c675ced97eba2b179e9fd
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:06:59.232847  /lava-9866295/1/../bin/lava-test-case

    2023-04-04T18:06:59.263819  <8>[   31.226388] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/642c675ced97eba2b179e9fe
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:06:58.169689  /lava-9866295/1/../bin/lava-test-case

    2023-04-04T18:06:58.198534  <8>[   30.160821] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/642c675ced97eba2b179e9ff
        failing since 29 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-04T18:06:57.105609  /lava-9866295/1/../bin/lava-test-case

    2023-04-04T18:06:57.137478  <8>[   29.099200] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/642c6caa5023374b6679e935

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-cip=
/baseline-nfs-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-04-v6.3-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-cip=
/baseline-nfs-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230331.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/642c6caa5023374b6679e93c
        new failure (last pass: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-04T18:29:43.700061  + set +x
    2023-04-04T18:29:43.700196  [   49.816367] <LAVA_SIGNAL_ENDRUN 0_dmesg =
897241_1.6.2.4.1>
    2023-04-04T18:29:43.982070  / # #
    2023-04-04T18:29:45.441274  export SHELL=3D/bin/sh
    2023-04-04T18:29:45.461690  #
    2023-04-04T18:29:45.461842  / # export SHELL=3D/bin/sh
    2023-04-04T18:29:47.344312  / # . /lava-897241/environment
    2023-04-04T18:29:50.796949  /lava-897241/bin/lava-test-runner /lava-897=
241/1
    2023-04-04T18:29:50.817615  . /lava-897241/environment
    2023-04-04T18:29:50.817744  / # /lava-897241/bin/lava-test-runner /lava=
-897241/1 =

    ... (13 line(s) more)  =

 =20
