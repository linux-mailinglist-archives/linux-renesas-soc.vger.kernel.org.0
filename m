Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF9B704405
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 May 2023 05:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjEPDiU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 May 2023 23:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjEPDiU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2023 23:38:20 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E0455A4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 20:38:16 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-52c30fbccd4so12587477a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 20:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684208295; x=1686800295;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p+gcoashtzT/I5fy9pLzdkTA6dTMZK/ZD0dY9lVgvhM=;
        b=3KxTgoK819Kjh6FT0BNtfrmisePxG3hzqZxDzj9kwP+0EbfBSZs2zGTh7m6Uz2Uvyi
         823I9U+UlYPF1sqkP8WSSqJ5XfhsnyOKt7ZV9WSv8z2BbfPZpUMbI1a+qp7GdtU7mBNA
         Inb4i1P760UPJ3yTp0k/cbSFpFPaf/xN8dKJ4ORPKOhZDHIqMfp28UvKbthKBxWi9n4R
         Bwdoy85DgpIxbiEGTJKt4s4ntlCPttNmh0PFcO02vBaCcO7pFyurtpjdgYTPkmRY20A/
         /Khnq6yO6SjJThm4Nw9PmwHRHv+wOeFebDQZI9cQku8RLOn+YzlNOPEf3EwWBuLR2iAb
         jFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684208295; x=1686800295;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+gcoashtzT/I5fy9pLzdkTA6dTMZK/ZD0dY9lVgvhM=;
        b=Nt+CKqiWILRN97vYm8E2p7jR22EwfCf/fuHUy+Cusoqrj7lclibpc9vv6i+/EF3nTl
         y+o02Nt8kpP5C3VqrIntq6rprMc5CjF8VdoGQTmwEhmMOQrrQuB7a6gpcQsNHOpJBSlo
         uh5zAyJ6ZvbSQ64/SJbt6ihZEKcfN/WeNXuKiwoUj71p6XMv2GNr+0SW34mS1BIbQqkL
         wWnMxqi+gw1W0+qxy3qQPMQAlQDXgOhrHQXWg8+lrvtL+iG8uCkLHG4k0O/mTQdQb7gQ
         3DK/Cyv3NxUCbgEZgiWdF+SWzrWodReImPwNXWqW6/aq0fUJz7KVw0I/fZiNJXBiXEwJ
         dHnw==
X-Gm-Message-State: AC+VfDxaxn5bt2+UjCEJyQ/f7PLj/C4wLzFZpShnSSEtKObGbQbZ/o7K
        cb9J0ttaXvU25ImPp4ZKogviMgbBOqngNniYXJ+RnQ==
X-Google-Smtp-Source: ACHHUZ5dB2BUWkgHbLuNNEqZx69+TMlow3tvrOi4kEz0Xzr9ZHNbMii7JF7fktl7bnLVg/R+bb4FWg==
X-Received: by 2002:a05:6a20:918a:b0:105:c74:6a4b with SMTP id v10-20020a056a20918a00b001050c746a4bmr12962069pzd.57.1684208294422;
        Mon, 15 May 2023 20:38:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r19-20020a635d13000000b0052c3f0ae381sm12323142pgb.78.2023.05.15.20.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 20:38:13 -0700 (PDT)
Message-ID: <6462faa5.630a0220.ba206.6460@mx.google.com>
Date:   Mon, 15 May 2023 20:38:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-05-15-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 87 runs,
 21 regressions (renesas-next-2023-05-15-v6.4-rc1)
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

renesas/next baseline-nfs: 87 runs, 21 regressions (renesas-next-2023-05-15=
-v6.4-rc1)

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

beaglebone-black             | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+ima       | 1          =

beaglebone-black             | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

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

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-05-15-v6.4-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-05-15-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      21330625d0f5970080f69db3d7634441d6484a07 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646214342cf27be0492e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646214342cf27be0492e85eb
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:14:43.126173  + set +x

    2023-05-15T11:14:43.132358  [   33.416712] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10322044_1.5.2.3.1>

    2023-05-15T11:14:43.236694  / # #

    2023-05-15T11:14:43.337300  export SHELL=3D/bin/sh

    2023-05-15T11:14:43.337552  #

    2023-05-15T11:14:43.438126  / # export SHELL=3D/bin/sh. /lava-10322044/=
environment

    2023-05-15T11:14:43.438345  =


    2023-05-15T11:14:43.538902  / # . /lava-10322044/environment/lava-10322=
044/bin/lava-test-runner /lava-10322044/1

    2023-05-15T11:14:43.539269  =


    2023-05-15T11:14:43.544049  / # /lava-10322044/bin/lava-test-runner /la=
va-10322044/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216c6163336136a2e85ea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646216c6163336136a2e85ef
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:42.030994  + set +x

    2023-05-15T11:25:42.036905  <8>[   20.587096] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322195_1.5.2.3.1>

    2023-05-15T11:25:42.148577  / # #

    2023-05-15T11:25:42.251278  export SHELL=3D/bin/sh

    2023-05-15T11:25:42.252068  #

    2023-05-15T11:25:42.353623  / # export SHELL=3D/bin/sh. /lava-10322195/=
environment

    2023-05-15T11:25:42.354271  =


    2023-05-15T11:25:42.455781  / # . /lava-10322195/environment/lava-10322=
195/bin/lava-test-runner /lava-10322195/1

    2023-05-15T11:25:42.457026  =


    2023-05-15T11:25:42.463067  / # /lava-10322195/bin/lava-test-runner /la=
va-10322195/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216bfec38d1fb9e2e8605

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646216bfec38d1fb9e2e860a
        failing since 122 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2023-01-12-v6.2-rc1)

    2023-05-15T11:25:34.589099  + set +x

    2023-05-15T11:25:34.595476  [   23.946485] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10322200_1.5.2.3.1>

    2023-05-15T11:25:34.701718  / # #

    2023-05-15T11:25:34.802336  export SHELL=3D/bin/sh

    2023-05-15T11:25:34.802512  #

    2023-05-15T11:25:34.903091  / # export SHELL=3D/bin/sh. /lava-10322200/=
environment

    2023-05-15T11:25:34.903296  =


    2023-05-15T11:25:35.003932  / # . /lava-10322200/environment/lava-10322=
200/bin/lava-test-runner /lava-10322200/1

    2023-05-15T11:25:35.004238  =


    2023-05-15T11:25:35.009075  / # /lava-10322200/bin/lava-test-runner /la=
va-10322200/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646214875e89efdcd72e862b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646214875e89efdcd72e8630
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:16:15.737593  <8>[   18.124484] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322002_1.5.2.3.1>

    2023-05-15T11:16:15.842864  / # #

    2023-05-15T11:16:15.945209  export SHELL=3D/bin/sh

    2023-05-15T11:16:15.945471  #

    2023-05-15T11:16:16.046092  / # export SHELL=3D/bin/sh. /lava-10322002/=
environment

    2023-05-15T11:16:16.046979  =


    2023-05-15T11:16:16.148542  / # . /lava-10322002/environment/lava-10322=
002/bin/lava-test-runner /lava-10322002/1

    2023-05-15T11:16:16.149712  =


    2023-05-15T11:16:16.154791  / # /lava-10322002/bin/lava-test-runner /la=
va-10322002/1

    2023-05-15T11:16:16.236503  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216c0d6906ef6be2e864c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646216c0d6906ef6be2e8651
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:33.437461  + [   18.078625] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10322204_1.5.2.3.1>

    2023-05-15T11:25:33.437558  set +x

    2023-05-15T11:25:33.542520  / # #

    2023-05-15T11:25:33.645106  export SHELL=3D/bin/sh

    2023-05-15T11:25:33.645780  #

    2023-05-15T11:25:33.747094  / # export SHELL=3D/bin/sh. /lava-10322204/=
environment

    2023-05-15T11:25:33.747920  =


    2023-05-15T11:25:33.849518  / # . /lava-10322204/environment/lava-10322=
204/bin/lava-test-runner /lava-10322204/1

    2023-05-15T11:25:33.850766  =


    2023-05-15T11:25:33.855722  / # /lava-10322204/bin/lava-test-runner /la=
va-10322204/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6462144172b018269e2e864c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6462144172b018269e2e8651
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:14:52.261006  + set +x

    2023-05-15T11:14:52.267717  <8>[   18.703608] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322040_1.5.2.3.1>

    2023-05-15T11:14:52.372195  / # #

    2023-05-15T11:14:52.474581  export SHELL=3D/bin/sh

    2023-05-15T11:14:52.475401  #

    2023-05-15T11:14:52.576820  / # export SHELL=3D/bin/sh. /lava-10322040/=
environment

    2023-05-15T11:14:52.577158  =


    2023-05-15T11:14:52.677856  / # . /lava-10322040/environment/lava-10322=
040/bin/lava-test-runner /lava-10322040/1

    2023-05-15T11:14:52.678325  =


    2023-05-15T11:14:52.683110  / # /lava-10322040/bin/lava-test-runner /la=
va-10322040/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216d3163336136a2e860d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646216d3163336136a2e8612
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:58.281383  + set +x

    2023-05-15T11:25:58.288213  [   18.630620] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10322180_1.5.2.3.1>

    2023-05-15T11:25:58.396669  / # #

    2023-05-15T11:25:58.499000  export SHELL=3D/bin/sh

    2023-05-15T11:25:58.499837  #

    2023-05-15T11:25:58.601504  / # export SHELL=3D/bin/sh. /lava-10322180/=
environment

    2023-05-15T11:25:58.602569  =


    2023-05-15T11:25:58.704555  / # . /lava-10322180/environment/lava-10322=
180/bin/lava-test-runner /lava-10322180/1

    2023-05-15T11:25:58.705785  =


    2023-05-15T11:25:58.710914  / # /lava-10322180/bin/lava-test-runner /la=
va-10322180/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/646217f80d9d07e8f92e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-nfs-=
beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-nfs-=
beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/646217f80d9d07e8f=
92e85f2
        new failure (last pass: renesas-next-2023-04-04-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64621a014253cb02c72e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64621a014253cb02c=
72e85ee
        new failure (last pass: renesas-next-2023-04-04-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64621625a0e27fc9282e8679

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64621625a0e27fc9282e867e
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:22:59.720573  + [   25.129207] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10322006_1.5.2.3.1>

    2023-05-15T11:22:59.723913  set +x

    2023-05-15T11:22:59.828178  / # #

    2023-05-15T11:22:59.930653  export SHELL=3D/bin/sh

    2023-05-15T11:22:59.931498  #

    2023-05-15T11:23:00.033142  / # export SHELL=3D/bin/sh. /lava-10322006/=
environment

    2023-05-15T11:23:00.033958  =


    2023-05-15T11:23:00.135725  / # . /lava-10322006/environment/lava-10322=
006/bin/lava-test-runner /lava-10322006/1

    2023-05-15T11:23:00.137159  =


    2023-05-15T11:23:00.142042  / # /lava-10322006/bin/lava-test-runner /la=
va-10322006/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64621715fc109387c82e861d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64621715fc109387c82e8622
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:26:58.327653  + set +x<8>[   18.460343] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10322153_1.5.2.3.1>

    2023-05-15T11:26:58.327844  =


    2023-05-15T11:26:58.432288  / # #

    2023-05-15T11:26:58.534755  export SHELL=3D/bin/sh

    2023-05-15T11:26:58.535577  #

    2023-05-15T11:26:58.637073  / # export SHELL=3D/bin/sh. /lava-10322153/=
environment

    2023-05-15T11:26:58.637905  =


    2023-05-15T11:26:58.739503  / # . /lava-10322153/environment/lava-10322=
153/bin/lava-test-runner /lava-10322153/1

    2023-05-15T11:26:58.740829  =


    2023-05-15T11:26:58.745615  / # /lava-10322153/bin/lava-test-runner /la=
va-10322153/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6462154f231c8be9842e85fd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6462154f231c8be9842e8602
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:19:24.415176  + set +x[   17.868662] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10322024_1.5.2.3.1>

    2023-05-15T11:19:24.415335  =


    2023-05-15T11:19:24.526021  / # #

    2023-05-15T11:19:24.626935  export SHELL=3D/bin/sh

    2023-05-15T11:19:24.627235  #

    2023-05-15T11:19:24.727877  / # export SHELL=3D/bin/sh. /lava-10322024/=
environment

    2023-05-15T11:19:24.728165  =


    2023-05-15T11:19:24.828814  / # . /lava-10322024/environment/lava-10322=
024/bin/lava-test-runner /lava-10322024/1

    2023-05-15T11:19:24.829243  =


    2023-05-15T11:19:24.834484  / # /lava-10322024/bin/lava-test-runner /la=
va-10322024/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216cb163336136a2e85f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646216cb163336136a2e85fc
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:39.113670  + set +x

    2023-05-15T11:25:39.119949  <8>[   17.170686] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322188_1.5.2.3.1>

    2023-05-15T11:25:39.225378  / # #

    2023-05-15T11:25:39.326240  export SHELL=3D/bin/sh

    2023-05-15T11:25:39.326520  #

    2023-05-15T11:25:39.427154  / # export SHELL=3D/bin/sh. /lava-10322188/=
environment

    2023-05-15T11:25:39.427457  =


    2023-05-15T11:25:39.528109  / # . /lava-10322188/environment/lava-10322=
188/bin/lava-test-runner /lava-10322188/1

    2023-05-15T11:25:39.528553  =


    2023-05-15T11:25:39.533323  / # /lava-10322188/bin/lava-test-runner /la=
va-10322188/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6462143f72b018269e2e8641

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6462143f72b018269e2e8646
        failing since 45 days (last pass: renesas-next-2023-03-06-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:14:49.349083  <8>[   18.070703] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10322004_1.5.2.3.1>

    2023-05-15T11:14:49.453781  / # #

    2023-05-15T11:14:49.554389  export SHELL=3D/bin/sh

    2023-05-15T11:14:49.554649  #

    2023-05-15T11:14:49.655123  / # export SHELL=3D/bin/sh. /lava-10322004/=
environment

    2023-05-15T11:14:49.655371  =


    2023-05-15T11:14:49.755907  / # . /lava-10322004/environment/lava-10322=
004/bin/lava-test-runner /lava-10322004/1

    2023-05-15T11:14:49.756334  =


    2023-05-15T11:14:49.760993  / # /lava-10322004/bin/lava-test-runner /la=
va-10322004/1

    2023-05-15T11:14:49.842523  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216d9163336136a2e861d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646216d9163336136a2e8622
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:54.627313  + set +x<8>[   18.161556] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10322166_1.5.2.3.1>

    2023-05-15T11:25:54.627432  =


    2023-05-15T11:25:54.731886  / # #

    2023-05-15T11:25:54.832599  export SHELL=3D/bin/sh

    2023-05-15T11:25:54.832795  #

    2023-05-15T11:25:54.933304  / # export SHELL=3D/bin/sh. /lava-10322166/=
environment

    2023-05-15T11:25:54.933530  =


    2023-05-15T11:25:55.034101  / # . /lava-10322166/environment/lava-10322=
166/bin/lava-test-runner /lava-10322166/1

    2023-05-15T11:25:55.034460  =


    2023-05-15T11:25:55.039768  / # /lava-10322166/bin/lava-test-runner /la=
va-10322166/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6462147a51272874d62e864b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6462147a51272874d62e8650
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:15:48.323142  [   18.391383] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10321999_1.5.2.3.1>

    2023-05-15T11:15:48.427678  / # #

    2023-05-15T11:15:48.530488  export SHELL=3D/bin/sh

    2023-05-15T11:15:48.531361  #

    2023-05-15T11:15:48.632971  / # export SHELL=3D/bin/sh. /lava-10321999/=
environment

    2023-05-15T11:15:48.633157  =


    2023-05-15T11:15:48.733715  / # . /lava-10321999/environment/lava-10321=
999/bin/lava-test-runner /lava-10321999/1

    2023-05-15T11:15:48.734244  =


    2023-05-15T11:15:48.739583  / # /lava-10321999/bin/lava-test-runner /la=
va-10321999/1

    2023-05-15T11:15:48.791341  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646216c7ec38d1fb9e2e8626

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/646216c7ec38d1fb9e2e862b
        failing since 45 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-05-15T11:25:43.266053  + set +x<8>[   18.163925] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10322208_1.5.2.3.1>

    2023-05-15T11:25:43.266649  =


    2023-05-15T11:25:43.375787  / # #

    2023-05-15T11:25:43.477843  export SHELL=3D/bin/sh

    2023-05-15T11:25:43.478680  #

    2023-05-15T11:25:43.580280  / # export SHELL=3D/bin/sh. /lava-10322208/=
environment

    2023-05-15T11:25:43.581256  =


    2023-05-15T11:25:43.683170  / # . /lava-10322208/environment/lava-10322=
208/bin/lava-test-runner /lava-10322208/1

    2023-05-15T11:25:43.684612  =


    2023-05-15T11:25:43.689500  / # /lava-10322208/bin/lava-test-runner /la=
va-10322208/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6462119c4896e50dad2e85f2

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-nfs-=
rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-nfs-=
rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6462119c489=
6e50dad2e85f9
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        2 lines

    2023-05-15T11:03:42.485065  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-15T11:03:42.485578  kern  :emerg : Code: 97fcc510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-15T11:03:42.534116  [   36.381436] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-15T11:03:42.534638  + set +x

    2023-05-15T11:03:42.534981  [   36.384409] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10321831_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/6462119c489=
6e50dad2e85fa
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        12 lines

    2023-05-15T11:03:42.374587  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-15T11:03:42.375079  kern  :alert : Mem abort info:

    2023-05-15T11:03:42.375396  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-15T11:03:42.375684  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-15T11:03:42.375964  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-15T11:03:42.376235  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-15T11:03:42.376503  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-15T11:03:42.376767  kern  :alert : Data abort info:

    2023-05-15T11:03:42.377024  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-15T11:03:42.377335  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/646215f21463077dd62e85f7

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-nfs-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-nfs-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/646215f2146=
3077dd62e85fe
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)
        2 lines

    2023-05-15T11:22:21.020496  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-05-15T11:22:21.020767  kern  :emerg : Code: 94014910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-15T11:22:21.068873  [   33.585475] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-15T11:22:21.069440  + set +x

    2023-05-15T11:22:21.069795  [   33.587346] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10322081_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/646215f2146=
3077dd62e85ff
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1)
        12 lines

    2023-05-15T11:22:20.904974  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-15T11:22:20.905070  kern  :alert : Mem abort info:

    2023-05-15T11:22:20.905144  kern  :alert :   ESR =3D 0x0000000096000004

    2023-05-15T11:22:20.905214  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-15T11:22:20.905306  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-15T11:22:20.905389  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-15T11:22:20.905471  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-05-15T11:22:20.905539  kern  :alert : Data abort info:

    2023-05-15T11:22:20.905602  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-05-15T11:22:20.905664  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =20
