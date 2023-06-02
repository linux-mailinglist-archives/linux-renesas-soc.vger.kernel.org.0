Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DED7720876
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 19:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236683AbjFBRhM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 13:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236767AbjFBRhL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 13:37:11 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667831B8
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 10:37:06 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b01dac1a82so13564905ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Jun 2023 10:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685727425; x=1688319425;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6sx1Oi7EBuUFE2FnonzY8GNhDNFt7L4AJX5/j7YqAEo=;
        b=Rmf1PA4jQ/TfwgN3IvKZ78jspEvfvZ6lPtSUd5nEG2D4BmCkw+lpZZDVMuH7R1uXyL
         HcNp4eRlKDK6CQ2kkOSSb8DeUwq6gja8wABZ0An08M5bsSabFEW6FgFD6zln7BhL+cqz
         SOxAIFwYnPG3tQNmlhrq1f2AdYY1o6SZdT3GSLdqWyBgZ1P5+z7TFqsDEaU8SOCP5r+Y
         E4rbAQznfEchhJfLavRBRg68UMurCrCM+vw9h72zAvmteh3JRQmkwGZK94yZKncEdjOa
         H1ysFsldUfeZ3s6aFtasd/YQDlNosC23K4pT6oLyx96Vo3QyybI2rnxNXCy4plKTmG78
         WiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685727425; x=1688319425;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sx1Oi7EBuUFE2FnonzY8GNhDNFt7L4AJX5/j7YqAEo=;
        b=VfZXJ9xvcgST1+RQSk2e5o08LKaBxNqKEITC0J9HUXO7Hw7IJ/Z80KoycZcSKak/Gf
         6C0FZ3hASGqX4LAjeXdwute6FrVlsx2xSbkoTmO7jPsB+EfC02Rx38+bghqmmjagYCm2
         MXsB++hLTgJtFe+mSzbbK4twOV1rj2uFSUjJDylbwiv0CduJgaMoVlAiBAMUslJ1763C
         db9uuPiyiGpT19f4IU8BEyRnHgwMTs3zxqH0/BlKYL826VV8wwfOi1A2T2uf+mcIQW8r
         dHaBx1UvjIqaYeduFk1Zfn8ux5KweiZuYwSR9CSfSYPYkjmF8L3B1Xj1VDnqL5yS2ksX
         vcag==
X-Gm-Message-State: AC+VfDzWvHqDQHxyRfuL0M7/+RAOQD5zYZ2NviPNizSFkNhhIzpuGFAF
        YoTL2ZVoWYP3Jneqw6COQG/AnRhkN46+z3GfKWfeHg==
X-Google-Smtp-Source: ACHHUZ7R1W8u50csfjOFvb58Puohq53wgLdRLMytviU1ub0QZM5PWcoTvreBoJ5E0LXwWR05fOAz0Q==
X-Received: by 2002:a17:902:e886:b0:1ae:4553:edfa with SMTP id w6-20020a170902e88600b001ae4553edfamr714384plg.29.1685727424386;
        Fri, 02 Jun 2023 10:37:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902f54800b001ab1d23bf5dsm1615219plf.258.2023.06.02.10.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 10:37:03 -0700 (PDT)
Message-ID: <647a28bf.170a0220.4cdb9.332d@mx.google.com>
Date:   Fri, 02 Jun 2023 10:37:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-02-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 114 runs,
 26 regressions (renesas-next-2023-06-02-v6.4-rc1)
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

renesas/next baseline-nfs: 114 runs, 26 regressions (renesas-next-2023-06-0=
2-v6.4-rc1)

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

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

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
v7_defc...CONFIG_SMP=3Dn | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-02-v6.4-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
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


  Details:     https://kernelci.org/test/plan/id/6479ef335aab0709e4f5dea3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479ef335aab0709e4f5deac
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:31:08.916588  + set +x

    2023-06-02T13:31:08.923290  <8>[   19.461784] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565067_1.5.2.3.1>

    2023-06-02T13:31:09.029360  #

    2023-06-02T13:31:09.130275  / # #export SHELL=3D/bin/sh

    2023-06-02T13:31:09.130479  =


    2023-06-02T13:31:09.231017  / # export SHELL=3D/bin/sh. /lava-10565067/=
environment

    2023-06-02T13:31:09.231202  =


    2023-06-02T13:31:09.331755  / # . /lava-10565067/environment/lava-10565=
067/bin/lava-test-runner /lava-10565067/1

    2023-06-02T13:31:09.332030  =


    2023-06-02T13:31:09.338269  / # /lava-10565067/bin/lava-test-runner /la=
va-10565067/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f2f622dbb5fc69f5dec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f2f622dbb5fc69f5ded0
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:47:10.541906  + set +x

    2023-06-02T13:47:10.548762  [   18.943230] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10565472_1.5.2.3.1>

    2023-06-02T13:47:10.653314  / # #

    2023-06-02T13:47:10.755249  export SHELL=3D/bin/sh

    2023-06-02T13:47:10.755480  #

    2023-06-02T13:47:10.856038  / # export SHELL=3D/bin/sh. /lava-10565472/=
environment

    2023-06-02T13:47:10.856572  =


    2023-06-02T13:47:10.957542  / # . /lava-10565472/environment/lava-10565=
472/bin/lava-test-runner /lava-10565472/1

    2023-06-02T13:47:10.957870  =


    2023-06-02T13:47:10.964179  / # /lava-10565472/bin/lava-test-runner /la=
va-10565472/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f306d3b3e0ae1df5de9a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f306d3b3e0ae1df5dea3
        failing since 140 days (last pass: renesas-next-2022-11-21-v6.1-rc1=
, first fail: renesas-next-2023-01-12-v6.2-rc1)

    2023-06-02T13:47:30.047155  + set +x

    2023-06-02T13:47:30.054010  <8>[   19.595405] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565470_1.5.2.3.1>

    2023-06-02T13:47:30.163193  =


    2023-06-02T13:47:30.263794  / # #export SHELL=3D/bin/sh

    2023-06-02T13:47:30.264019  =


    2023-06-02T13:47:30.364540  / # export SHELL=3D/bin/sh. /lava-10565470/=
environment

    2023-06-02T13:47:30.364755  =


    2023-06-02T13:47:30.465285  / # . /lava-10565470/environment/lava-10565=
470/bin/lava-test-runner /lava-10565470/1

    2023-06-02T13:47:30.465583  =


    2023-06-02T13:47:30.467672  / # /lava-10565470/bin/lava-test-runner /la=
va-10565470/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ef1d8087090c42f5de59

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479ef1d8087090c42f5de62
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:59.341111  [   18.413573] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10565081_1.5.2.3.1>

    2023-06-02T13:30:59.446488  / # #

    2023-06-02T13:30:59.549038  export SHELL=3D/bin/sh

    2023-06-02T13:30:59.549865  #

    2023-06-02T13:30:59.651380  / # export SHELL=3D/bin/sh. /lava-10565081/=
environment

    2023-06-02T13:30:59.652182  =


    2023-06-02T13:30:59.753688  / # . /lava-10565081/environment/lava-10565=
081/bin/lava-test-runner /lava-10565081/1

    2023-06-02T13:30:59.754985  =


    2023-06-02T13:30:59.760455  / # /lava-10565081/bin/lava-test-runner /la=
va-10565081/1

    2023-06-02T13:30:59.861520  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f33e1274e3cca2f5de7b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f33e1274e3cca2f5de84
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:48:26.763059  <8>[   18.283785] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565417_1.5.2.3.1>

    2023-06-02T13:48:26.872618  / # #

    2023-06-02T13:48:26.975243  export SHELL=3D/bin/sh

    2023-06-02T13:48:26.976047  #

    2023-06-02T13:48:27.077538  / # export SHELL=3D/bin/sh. /lava-10565417/=
environment

    2023-06-02T13:48:27.078224  =


    2023-06-02T13:48:27.179737  / # . /lava-10565417/environment/lava-10565=
417/bin/lava-test-runner /lava-10565417/1

    2023-06-02T13:48:27.181030  =


    2023-06-02T13:48:27.185912  / # /lava-10565417/bin/lava-test-runner /la=
va-10565417/1

    2023-06-02T13:48:27.301952  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ef10fcb67a3babf5de6a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479ef10fcb67a3babf5de73
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:33.793076  [   18.004445] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10565066_1.5.2.3.1>

    2023-06-02T13:30:33.796571  + set +x

    2023-06-02T13:30:33.904350  / # #

    2023-06-02T13:30:34.006955  export SHELL=3D/bin/sh

    2023-06-02T13:30:34.007762  #

    2023-06-02T13:30:34.109274  / # export SHELL=3D/bin/sh. /lava-10565066/=
environment

    2023-06-02T13:30:34.110058  =


    2023-06-02T13:30:34.211507  / # . /lava-10565066/environment/lava-10565=
066/bin/lava-test-runner /lava-10565066/1

    2023-06-02T13:30:34.212788  =


    2023-06-02T13:30:34.217455  / # /lava-10565066/bin/lava-test-runner /la=
va-10565066/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f2b064c2dae4b7f5de4d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f2b064c2dae4b7f5de56
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:45:53.598193  <8>[   18.411170] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565444_1.5.2.3.1>

    2023-06-02T13:45:53.601093  + set +x

    2023-06-02T13:45:53.705512  / # #

    2023-06-02T13:45:53.806252  export SHELL=3D/bin/sh

    2023-06-02T13:45:53.806495  #

    2023-06-02T13:45:53.907039  / # export SHELL=3D/bin/sh. /lava-10565444/=
environment

    2023-06-02T13:45:53.907322  =


    2023-06-02T13:45:54.007908  / # . /lava-10565444/environment/lava-10565=
444/bin/lava-test-runner /lava-10565444/1

    2023-06-02T13:45:54.008229  =


    2023-06-02T13:45:54.013640  / # /lava-10565444/bin/lava-test-runner /la=
va-10565444/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f527322957e7bdf5de7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/ba=
seline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/ba=
seline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6479f527322957e7b=
df5de7f
        new failure (last pass: renesas-next-2023-05-15-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ef8bfe0df50639f5de39

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479ef8bfe0df50639f5de42
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:32:46.216485  + set +x<8>[   33.403465] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10565064_1.5.2.3.1>

    2023-06-02T13:32:46.216916  =


    2023-06-02T13:32:46.323805  / # #

    2023-06-02T13:32:46.426600  export SHELL=3D/bin/sh

    2023-06-02T13:32:46.427307  #

    2023-06-02T13:32:46.528983  / # export SHELL=3D/bin/sh. /lava-10565064/=
environment

    2023-06-02T13:32:46.529720  =


    2023-06-02T13:32:46.631160  / # . /lava-10565064/environment/lava-10565=
064/bin/lava-test-runner /lava-10565064/1

    2023-06-02T13:32:46.632304  =


    2023-06-02T13:32:46.637250  / # /lava-10565064/bin/lava-test-runner /la=
va-10565064/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f4ae756baed0a4f5deae

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f4ae756baed0a4f5deb7
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:54:37.181585  + set<8>[   18.993968] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10565442_1.5.2.3.1>

    2023-06-02T13:54:37.181687   +x

    2023-06-02T13:54:37.285677  / # #

    2023-06-02T13:54:37.386728  export SHELL=3D/bin/sh

    2023-06-02T13:54:37.387402  #

    2023-06-02T13:54:37.488775  / # export SHELL=3D/bin/sh. /lava-10565442/=
environment

    2023-06-02T13:54:37.488955  =


    2023-06-02T13:54:37.589672  / # . /lava-10565442/environment/lava-10565=
442/bin/lava-test-runner /lava-10565442/1

    2023-06-02T13:54:37.590671  =


    2023-06-02T13:54:37.595557  / # /lava-10565442/bin/lava-test-runner /la=
va-10565442/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ef08fcb67a3babf5de25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479ef08fcb67a3babf5de2e
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:28.391418  + set +x

    2023-06-02T13:30:28.397752  [   17.652314] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10565065_1.5.2.3.1>

    2023-06-02T13:30:28.502854  / # #

    2023-06-02T13:30:28.603482  export SHELL=3D/bin/sh

    2023-06-02T13:30:28.603676  #

    2023-06-02T13:30:28.704150  / # export SHELL=3D/bin/sh. /lava-10565065/=
environment

    2023-06-02T13:30:28.704398  =


    2023-06-02T13:30:28.804916  / # . /lava-10565065/environment/lava-10565=
065/bin/lava-test-runner /lava-10565065/1

    2023-06-02T13:30:28.805192  =


    2023-06-02T13:30:28.810351  / # /lava-10565065/bin/lava-test-runner /la=
va-10565065/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f305734edaafbbf5de33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f305734edaafbbf5de3c
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:47:24.675194  + set<8>[   17.646064] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10565427_1.5.2.3.1>

    2023-06-02T13:47:24.675289   +x

    2023-06-02T13:47:24.779296  / # #

    2023-06-02T13:47:24.879901  export SHELL=3D/bin/sh

    2023-06-02T13:47:24.880135  #

    2023-06-02T13:47:24.980648  / # export SHELL=3D/bin/sh. /lava-10565427/=
environment

    2023-06-02T13:47:24.980877  =


    2023-06-02T13:47:25.081421  / # . /lava-10565427/environment/lava-10565=
427/bin/lava-test-runner /lava-10565427/1

    2023-06-02T13:47:25.081698  =


    2023-06-02T13:47:25.086859  / # /lava-10565427/bin/lava-test-runner /la=
va-10565427/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ef0b37aee638eef5de2d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479ef0b37aee638eef5de36
        failing since 63 days (last pass: renesas-next-2023-03-06-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:42.737080  [   18.353866] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10565101_1.5.2.3.1>

    2023-06-02T13:30:42.847084  / # #

    2023-06-02T13:30:42.949671  export SHELL=3D/bin/sh

    2023-06-02T13:30:42.950457  #

    2023-06-02T13:30:43.051914  / # export SHELL=3D/bin/sh. /lava-10565101/=
environment

    2023-06-02T13:30:43.052183  =


    2023-06-02T13:30:43.152899  / # . /lava-10565101/environment/lava-10565=
101/bin/lava-test-runner /lava-10565101/1

    2023-06-02T13:30:43.154111  =


    2023-06-02T13:30:43.159348  / # /lava-10565101/bin/lava-test-runner /la=
va-10565101/1

    2023-06-02T13:30:43.246492  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f292ff63954c6af5de81

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f292ff63954c6af5de8a
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:45:42.670395  <8>[   16.515410] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565469_1.5.2.3.1>

    2023-06-02T13:45:42.775222  / # #

    2023-06-02T13:45:42.875977  export SHELL=3D/bin/sh

    2023-06-02T13:45:42.876220  #

    2023-06-02T13:45:42.976801  / # export SHELL=3D/bin/sh. /lava-10565469/=
environment

    2023-06-02T13:45:42.977041  =


    2023-06-02T13:45:43.077642  / # . /lava-10565469/environment/lava-10565=
469/bin/lava-test-runner /lava-10565469/1

    2023-06-02T13:45:43.077930  =


    2023-06-02T13:45:43.082945  / # /lava-10565469/bin/lava-test-runner /la=
va-10565469/1

    2023-06-02T13:45:43.160640  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647a06124122a09c77f5de87

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647a06124122a09c77f5de90
        failing since 88 days (last pass: renesas-next-2023-01-30-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-06-02T15:08:57.411751  + set +x
    2023-06-02T15:08:57.418500  [   27.659649] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965831_1.6.2.3.1>
    2023-06-02T15:08:57.552991  / # #
    2023-06-02T15:08:57.654666  export SHELL=3D/bin/sh
    2023-06-02T15:08:57.655220  #
    2023-06-02T15:08:57.756628  / # export SHELL=3D/bin/sh. /lava-965831/en=
vironment
    2023-06-02T15:08:57.757458  =

    2023-06-02T15:08:57.859444  / # . /lava-965831/environment/lava-965831/=
bin/lava-test-runner /lava-965831/1
    2023-06-02T15:08:57.860358  =

    2023-06-02T15:08:57.863305  / # /lava-965831/bin/lava-test-runner /lava=
-965831/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479ef1537aee638eef5de3f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479ef1537aee638eef5de48
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:30:37.380963  <8>[   18.349405] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565113_1.5.2.3.1>

    2023-06-02T13:30:37.486285  / # #

    2023-06-02T13:30:37.586923  export SHELL=3D/bin/sh

    2023-06-02T13:30:37.587143  #

    2023-06-02T13:30:37.687702  / # export SHELL=3D/bin/sh. /lava-10565113/=
environment

    2023-06-02T13:30:37.687926  =


    2023-06-02T13:30:37.788569  / # . /lava-10565113/environment/lava-10565=
113/bin/lava-test-runner /lava-10565113/1

    2023-06-02T13:30:37.788999  =


    2023-06-02T13:30:37.793831  / # /lava-10565113/bin/lava-test-runner /la=
va-10565113/1

    2023-06-02T13:30:37.871433  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f2e422dbb5fc69f5de35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f2e422dbb5fc69f5de3e
        failing since 63 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-03-30-v6.3-rc1)

    2023-06-02T13:46:55.263515  <8>[   18.448227] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565410_1.5.2.3.1>

    2023-06-02T13:46:55.367919  / # #

    2023-06-02T13:46:55.468503  export SHELL=3D/bin/sh

    2023-06-02T13:46:55.468688  #

    2023-06-02T13:46:55.569212  / # export SHELL=3D/bin/sh. /lava-10565410/=
environment

    2023-06-02T13:46:55.569420  =


    2023-06-02T13:46:55.670043  / # . /lava-10565410/environment/lava-10565=
410/bin/lava-test-runner /lava-10565410/1

    2023-06-02T13:46:55.671398  =


    2023-06-02T13:46:55.676213  / # /lava-10565410/bin/lava-test-runner /la=
va-10565410/1

    2023-06-02T13:46:55.732654  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f382a526ef11c5f5de3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6479f382a526ef11c=
5f5de3c
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f4dec677c26c0ff5de2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6479f4dec677c26c0=
ff5de2c
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6479f2a6a31fa40a88f5de9f

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6479f2a6a31=
fa40a88f5dea2
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        2 lines

    2023-06-02T13:45:50.103955  abort info:

    2023-06-02T13:45:50.108219  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-06-02T13:45:50.111708  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-06-02T13:45:50.118076  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000006999000

    2023-06-02T13:45:50.125828  kern  :alert : [0000000000000008] pgd=3D000=
0000000000000, p4d=3D0000000000000000

    2023-06-02T13:45:50.163711  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-06-02T13:45:50.170363  kern  :emerg : Code: 97fca510 f9405680 5286=
4a61 72a686c1 (b9400800) =

   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/6479f2a6a31=
fa40a88f5dea3
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        12 lines

    2023-06-02T13:45:50.064967  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-02T13:45:50.069111  kern  :alert : Mem abort info:

    2023-06-02T13:45:50.072413  kern  :alert :   ESR =3D 0x0000000096000004

    2023-06-02T13:45:50.078583  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-02T13:45:50.082078  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-02T13:45:50.085908  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-02T13:45:50.091374  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-06-02T13:45:50.102663  kern  :alert : Data <8>[   31.248193] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6479eeabffb16abb77f5de83

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-nfs-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-nfs-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6479eeabffb=
16abb77f5de86
        failing since 18 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-05-15-v6.4-rc1)
        2 lines

    2023-06-02T13:29:10.015997  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-06-02T13:29:10.016467  kern  :emerg : Code: 97fa5d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-06-02T13:29:10.072084  <8>[   32.671125] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-06-02T13:29:10.072582  + set +x

    2023-06-02T13:29:10.072895  <8>[   32.674483] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565040_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/6479eeabffb=
16abb77f5de87
        failing since 18 days (last pass: renesas-next-2023-03-16-v6.3-rc1,=
 first fail: renesas-next-2023-05-15-v6.4-rc1)
        12 lines

    2023-06-02T13:29:09.897957  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-02T13:29:09.898418  kern  :alert : Mem abort info:

    2023-06-02T13:29:09.898730  kern  :alert :   ESR =3D 0x0000000096000004

    2023-06-02T13:29:09.899001  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-02T13:29:09.899261  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-02T13:29:09.899510  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-02T13:29:09.899779  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-06-02T13:29:09.900042  kern  :alert : Data abort info:

    2023-06-02T13:29:09.900299  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-06-02T13:29:09.900595  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6479f2445b2f9e8d01f5de27

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399-ro=
ck-pi-4b.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig/gcc-10/lab-collabora/baseline-nfs-rk3399-ro=
ck-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/6479f2445b2=
f9e8d01f5de2a
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        2 lines

    2023-06-02T13:44:16.188459  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP

    2023-06-02T13:44:16.188956  kern  :emerg : Code: 97f34510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-06-02T13:44:16.239634  <8>[   35.712991] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-06-02T13:44:16.240107  + set +x

    2023-06-02T13:44:16.240447  <8>[   35.714725] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565314_1.6.2.4.1>
   =


  * baseline-nfs.dmesg.alert: https://kernelci.org/test/case/id/6479f2445b2=
f9e8d01f5de2b
        new failure (last pass: renesas-next-2023-03-30-v6.3-rc1)
        12 lines

    2023-06-02T13:44:16.079432  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-06-02T13:44:16.079604  kern  :alert : Mem abort info:

    2023-06-02T13:44:16.079669  kern  :alert :   ESR =3D 0x0000000096000004

    2023-06-02T13:44:16.079731  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-06-02T13:44:16.079791  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-06-02T13:44:16.079849  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-06-02T13:44:16.079904  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault

    2023-06-02T13:44:16.079976  kern  :alert : Data abort info:

    2023-06-02T13:44:16.080033  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004

    2023-06-02T13:44:16.080090  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f6630f6bc74a57f5de28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-brooni=
e/baseline-nfs-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-02-v6.4-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-brooni=
e/baseline-nfs-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6479f6630f6bc74a5=
7f5de29
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1) =

 =20
