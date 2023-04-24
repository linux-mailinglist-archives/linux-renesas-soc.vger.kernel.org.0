Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F167F6ED02E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Apr 2023 16:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjDXOTQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 10:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjDXOTO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 10:19:14 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A971FEF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 07:19:09 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63b73203e0aso28092555b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682345948; x=1684937948;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HyvsQG6Btg2GOfcHHajnVHwqJvFusqB7DaQBiC1QIvo=;
        b=A7lEJARxSNVTl/MhxKXO652VTeGl0Q8/ruXjVu1lImJCbSS/j8fgOuX0AM7Evcx5zF
         0kcJJ7cRJaBn38MywV3ctd35aBy6Nb2P1Z65PiqgMepBWmCNJiyS4X3iXtVSN0txGOt8
         s3KEenq11GKfmLYkJwOjTNXGN0JwZ86Xu9SRGWwBfs1fP8TDUfJ+GSXR/JTSzknDnM2F
         fMGTDEWQ9ehfoOIxCG2gjP9+nfGm94+g0i9sJ3jfVp114Fa7nhM7v+lU6NLTjTQb2Jbn
         XJR2emjN4qOCbuHhYfC9Pq1OUKb8bAJfhsykAZfrhfB6f33c71BAawjjX6Vw1V0ZQb90
         lIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682345948; x=1684937948;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyvsQG6Btg2GOfcHHajnVHwqJvFusqB7DaQBiC1QIvo=;
        b=ItfFCnakUWKhVqFJBB8NLoNwYaq3RNVMTeZiqIybDUHj1N1/WOnJHKep+FVNJvdvdK
         w3HhBgOh67tG2Ta/ExWz7tI5C8mR/lmYiqH+5BtmsyQ1vifrl+w3ThWCR7r5ebOPVMof
         eV2mOadotIY9WvWgDjv5BuCzkk6mUbMkxAlmMN9P3qF7jkKioDCLSHS0W7PeCE6wRIQw
         brxpqh24xMWNc0gBQ2d7LDvd9mH7Jvg6yilr9LtlXpwR/zjIxgm4fp+KH4d4ozM7/TI/
         EHj002Ga/nlOJXjGIcc+rjwt5ssEV7DPthLCTqI46eOZ0M0hJQjYucBY1810oCPde8zB
         5zcA==
X-Gm-Message-State: AAQBX9d2XYZ80CehJOBuhjqV8ryHZyDixOE42GLg6xW1vL18M+HP3FAi
        gfKOPHybbxPIFyRQkZNwAGNfR6j/QU3XeoQLHXL5gQ==
X-Google-Smtp-Source: AKy350aI0qXKZSxeUbyhflHxXk1uZgXYqyHoY1UOpSGvJmHHfKnQ2AONFCnh1m/RxNbt7R5ZUXKYwQ==
X-Received: by 2002:a17:902:d2c7:b0:1a6:f93a:a136 with SMTP id n7-20020a170902d2c700b001a6f93aa136mr23831218plc.22.1682345947274;
        Mon, 24 Apr 2023 07:19:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902b28b00b001a1d41d1b8asm6667764plr.194.2023.04.24.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 07:19:06 -0700 (PDT)
Message-ID: <64468fda.170a0220.15d1b.c761@mx.google.com>
Date:   Mon, 24 Apr 2023 07:19:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-04-24-v6.3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 154 runs,
 43 regressions (renesas-devel-2023-04-24-v6.3)
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

renesas/master baseline-nfs: 154 runs, 43 regressions (renesas-devel-2023-0=
4-24-v6.3)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-24-v6.3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-24-v6.3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e5cb7b418f58d865520f56b1fb541616ee6f8754 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b5be9331ac1eb2e861e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465b5be9331ac1eb2e8623
        failing since 13 days (last pass: renesas-devel-2023-04-04-v6.3-rc5=
, first fail: renesas-devel-2023-04-10-v6.3-rc6)

    2023-04-24T10:34:58.350200  [   22.893041] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10101927_1.5.2.3.1>

    2023-04-24T10:34:58.354038  + set +x

    2023-04-24T10:34:58.461984  / # #

    2023-04-24T10:34:58.564837  export SHELL=3D/bin/sh

    2023-04-24T10:34:58.565679  #

    2023-04-24T10:34:58.667348  / # export SHELL=3D/bin/sh. /lava-10101927/=
environment

    2023-04-24T10:34:58.668266  =


    2023-04-24T10:34:58.770150  / # . /lava-10101927/environment/lava-10101=
927/bin/lava-test-runner /lava-10101927/1

    2023-04-24T10:34:58.771660  =


    2023-04-24T10:34:58.777218  / # /lava-10101927/bin/lava-test-runner /la=
va-10101927/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654ebde5ae4d6162e862d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644654ebde5ae4d6162e8632
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:17.856999  + set +x

    2023-04-24T10:07:17.863657  [   18.172044] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10101402_1.5.2.3.1>

    2023-04-24T10:07:17.967795  / #

    2023-04-24T10:07:18.068600  # #export SHELL=3D/bin/sh

    2023-04-24T10:07:18.068800  =


    2023-04-24T10:07:18.169331  / # export SHELL=3D/bin/sh. /lava-10101402/=
environment

    2023-04-24T10:07:18.169586  =


    2023-04-24T10:07:18.270221  / # . /lava-10101402/environment/lava-10101=
402/bin/lava-test-runner /lava-10101402/1

    2023-04-24T10:07:18.270534  =


    2023-04-24T10:07:18.275811  / # /lava-10101402/bin/lava-test-runner /la=
va-10101402/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644657b7ee5789420c2e861f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644657b7ee5789420c2e8624
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:19:13.489157  + set +x

    2023-04-24T10:19:13.495831  [   19.754340] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10101702_1.5.2.3.1>

    2023-04-24T10:19:13.603636  / # #

    2023-04-24T10:19:13.705812  export SHELL=3D/bin/sh

    2023-04-24T10:19:13.706598  #

    2023-04-24T10:19:13.807993  / # export SHELL=3D/bin/sh. /lava-10101702/=
environment

    2023-04-24T10:19:13.808728  =


    2023-04-24T10:19:13.910458  / # . /lava-10101702/environment/lava-10101=
702/bin/lava-test-runner /lava-10101702/1

    2023-04-24T10:19:13.911664  =


    2023-04-24T10:19:13.917391  / # /lava-10101702/bin/lava-test-runner /la=
va-10101702/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b785aaebbd52c2e865f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465b785aaebbd52c2e8664
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:35:12.788535  + set +x

    2023-04-24T10:35:12.794513  <8>[   23.584070] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101922_1.5.2.3.1>

    2023-04-24T10:35:12.901391  / # #

    2023-04-24T10:35:13.002057  export SHELL=3D/bin/sh

    2023-04-24T10:35:13.002286  #

    2023-04-24T10:35:13.102844  / # export SHELL=3D/bin/sh. /lava-10101922/=
environment

    2023-04-24T10:35:13.103038  =


    2023-04-24T10:35:13.203621  / # . /lava-10101922/environment/lava-10101=
922/bin/lava-test-runner /lava-10101922/1

    2023-04-24T10:35:13.203909  =


    2023-04-24T10:35:13.245670  / # /lava-10101922/bin/lava-test-runner /la=
va-10101922/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64465736cddfe222cd2e86de

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465736cddfe222cd2e86e3
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:17:18.388012  + set +x

    2023-04-24T10:17:18.394590  <8>[   19.191246] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101646_1.5.2.3.1>

    2023-04-24T10:17:18.500867  #

    2023-04-24T10:17:18.601830  / # #export SHELL=3D/bin/sh

    2023-04-24T10:17:18.602529  =


    2023-04-24T10:17:18.703923  / # export SHELL=3D/bin/sh. /lava-10101646/=
environment

    2023-04-24T10:17:18.704637  =


    2023-04-24T10:17:18.806023  / # . /lava-10101646/environment/lava-10101=
646/bin/lava-test-runner /lava-10101646/1

    2023-04-24T10:17:18.807217  =


    2023-04-24T10:17:18.809502  / # /lava-10101646/bin/lava-test-runner /la=
va-10101646/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654e5d81daca05f2e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644654e5d81daca05f2e85eb
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:22.162529  + <8>[   18.200637] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10101439_1.5.2.3.1>

    2023-04-24T10:07:22.163083  set +x

    2023-04-24T10:07:22.271141  / # #

    2023-04-24T10:07:22.373589  export SHELL=3D/bin/sh

    2023-04-24T10:07:22.374444  #

    2023-04-24T10:07:22.475887  / # export SHELL=3D/bin/sh. /lava-10101439/=
environment

    2023-04-24T10:07:22.476170  =


    2023-04-24T10:07:22.576846  / # . /lava-10101439/environment/lava-10101=
439/bin/lava-test-runner /lava-10101439/1

    2023-04-24T10:07:22.577324  =


    2023-04-24T10:07:22.582404  / # /lava-10101439/bin/lava-test-runner /la=
va-10101439/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64465747152e5a034f2e864c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465747152e5a034f2e8651
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:17:30.324542  + [   17.628834] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 10101674_1.5.2.3.1>

    2023-04-24T10:17:30.324628  set +x

    2023-04-24T10:17:30.428440  / # #

    2023-04-24T10:17:30.528999  export SHELL=3D/bin/sh

    2023-04-24T10:17:30.529146  #

    2023-04-24T10:17:30.629679  / # export SHELL=3D/bin/sh. /lava-10101674/=
environment

    2023-04-24T10:17:30.629857  =


    2023-04-24T10:17:30.730400  / # . /lava-10101674/environment/lava-10101=
674/bin/lava-test-runner /lava-10101674/1

    2023-04-24T10:17:30.730656  =


    2023-04-24T10:17:30.735356  / # /lava-10101674/bin/lava-test-runner /la=
va-10101674/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/64465b880192f742f92e8656

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465b880192f742f92e865b
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:35:32.769261  + set +x

    2023-04-24T10:35:32.772256  <8>[   23.853404] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101950_1.5.2.3.1>

    2023-04-24T10:35:32.879873  / # #

    2023-04-24T10:35:32.980505  export SHELL=3D/bin/sh

    2023-04-24T10:35:32.980723  #

    2023-04-24T10:35:33.081232  / # export SHELL=3D/bin/sh. /lava-10101950/=
environment

    2023-04-24T10:35:33.081449  =


    2023-04-24T10:35:33.181977  / # . /lava-10101950/environment/lava-10101=
950/bin/lava-test-runner /lava-10101950/1

    2023-04-24T10:35:33.182278  =


    2023-04-24T10:35:33.186843  / # /lava-10101950/bin/lava-test-runner /la=
va-10101950/1
 =

    ... (13 line(s) more)  =


  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/64465b88019=
2f742f92e865d
        failing since 38 days (last pass: renesas-devel-2023-03-07-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2)
        3 lines

    2023-04-24T10:35:32.727000  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-24T10:35:32.733579  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-04-24T10:35:32.740260  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-24T10:35:32.766043  <8>[   23.843606] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654ec68c90ae3752e86fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644654ec68c90ae3752e86ff
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:12.011707  + set +x

    2023-04-24T10:07:12.017740  [   15.152984] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10101407_1.5.2.3.1>

    2023-04-24T10:07:12.122392  / # #

    2023-04-24T10:07:12.223055  export SHELL=3D/bin/sh

    2023-04-24T10:07:12.223276  #

    2023-04-24T10:07:12.323784  / # export SHELL=3D/bin/sh. /lava-10101407/=
environment

    2023-04-24T10:07:12.324009  =


    2023-04-24T10:07:12.424593  / # . /lava-10101407/environment/lava-10101=
407/bin/lava-test-runner /lava-10101407/1

    2023-04-24T10:07:12.424867  =


    2023-04-24T10:07:12.430117  / # /lava-10101407/bin/lava-test-runner /la=
va-10101407/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64465759c05a3162932e8631

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465759c05a3162932e8636
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:17:36.878847  <8>[   17.871994] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101681_1.5.2.3.1>

    2023-04-24T10:17:36.882201  + set +x

    2023-04-24T10:17:36.986356  / # #

    2023-04-24T10:17:37.086941  export SHELL=3D/bin/sh

    2023-04-24T10:17:37.087110  #

    2023-04-24T10:17:37.187662  / # export SHELL=3D/bin/sh. /lava-10101681/=
environment

    2023-04-24T10:17:37.187872  =


    2023-04-24T10:17:37.288399  / # . /lava-10101681/environment/lava-10101=
681/bin/lava-test-runner /lava-10101681/1

    2023-04-24T10:17:37.288641  =


    2023-04-24T10:17:37.293674  / # /lava-10101681/bin/lava-test-runner /la=
va-10101681/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b5809c57043cb2e860a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465b5809c57043cb2e860f
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:34:54.422293  + set +x

    2023-04-24T10:34:54.428707  [   18.709570] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10101917_1.5.2.3.1>

    2023-04-24T10:34:54.535706  / # #

    2023-04-24T10:34:54.636336  export SHELL=3D/bin/sh

    2023-04-24T10:34:54.636531  #

    2023-04-24T10:34:54.737016  / # export SHELL=3D/bin/sh. /lava-10101917/=
environment

    2023-04-24T10:34:54.737283  =


    2023-04-24T10:34:54.837839  / # . /lava-10101917/environment/lava-10101=
917/bin/lava-test-runner /lava-10101917/1

    2023-04-24T10:34:54.838122  =


    2023-04-24T10:34:54.842972  / # /lava-10101917/bin/lava-test-runner /la=
va-10101917/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/644656a570477cfb042e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91sa=
m9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91sa=
m9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/644656a570477cfb0=
42e85ee
        failing since 2 days (last pass: renesas-devel-2023-04-17-v6.3-rc7,=
 first fail: renesas-devel-2023-04-21-v6.3-rc7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654e18cf32651482e895c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644654e18cf32651482e8961
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:19.188011  + set<8>[   15.833007] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10101419_1.5.2.3.1>

    2023-04-24T10:07:19.188101   +x

    2023-04-24T10:07:19.292170  / # #

    2023-04-24T10:07:19.392841  export SHELL=3D/bin/sh

    2023-04-24T10:07:19.393054  #

    2023-04-24T10:07:19.493596  / # export SHELL=3D/bin/sh. /lava-10101419/=
environment

    2023-04-24T10:07:19.493810  =


    2023-04-24T10:07:19.594326  / # . /lava-10101419/environment/lava-10101=
419/bin/lava-test-runner /lava-10101419/1

    2023-04-24T10:07:19.594626  =


    2023-04-24T10:07:19.599684  / # /lava-10101419/bin/lava-test-runner /la=
va-10101419/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446574e4c024387552e862d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6446574e4c024387552e8632
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:17:26.362347  + <8>[   18.700875] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10101642_1.5.2.3.1>

    2023-04-24T10:17:26.362822  set +x

    2023-04-24T10:17:26.469765  / # #

    2023-04-24T10:17:26.570416  export SHELL=3D/bin/sh

    2023-04-24T10:17:26.570610  #

    2023-04-24T10:17:26.671250  / # export SHELL=3D/bin/sh. /lava-10101642/=
environment

    2023-04-24T10:17:26.671443  =


    2023-04-24T10:17:26.772190  / # . /lava-10101642/environment/lava-10101=
642/bin/lava-test-runner /lava-10101642/1

    2023-04-24T10:17:26.773609  =


    2023-04-24T10:17:26.778399  / # /lava-10101642/bin/lava-test-runner /la=
va-10101642/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465de493a2f19ac72e85f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465de493a2f19ac72e85f6
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:45:41.980123  + set +x

    2023-04-24T10:45:41.986430  <8>[   35.069220] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101932_1.5.2.3.1>

    2023-04-24T10:45:42.095028  #

    2023-04-24T10:45:42.195898  / # #export SHELL=3D/bin/sh

    2023-04-24T10:45:42.196133  =


    2023-04-24T10:45:42.296683  / # export SHELL=3D/bin/sh. /lava-10101932/=
environment

    2023-04-24T10:45:42.296928  =


    2023-04-24T10:45:42.397532  / # . /lava-10101932/environment/lava-10101=
932/bin/lava-test-runner /lava-10101932/1

    2023-04-24T10:45:42.397879  =


    2023-04-24T10:45:42.402386  / # /lava-10101932/bin/lava-test-runner /la=
va-10101932/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654df083e61dea62e86e2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644654df083e61dea62e86e7
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:16.235968  + set +x[   17.267679] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10101416_1.5.2.3.1>

    2023-04-24T10:07:16.236077  =


    2023-04-24T10:07:16.340879  / # #

    2023-04-24T10:07:16.441531  export SHELL=3D/bin/sh

    2023-04-24T10:07:16.441697  #

    2023-04-24T10:07:16.542193  / # export SHELL=3D/bin/sh. /lava-10101416/=
environment

    2023-04-24T10:07:16.542399  =


    2023-04-24T10:07:16.642937  / # . /lava-10101416/environment/lava-10101=
416/bin/lava-test-runner /lava-10101416/1

    2023-04-24T10:07:16.643249  =


    2023-04-24T10:07:16.648562  / # /lava-10101416/bin/lava-test-runner /la=
va-10101416/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b63e9331ac1eb2e86a5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465b63e9331ac1eb2e86aa
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:34:52.849042  + set +x

    2023-04-24T10:34:52.855476  <8>[   23.736650] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101915_1.5.2.3.1>

    2023-04-24T10:34:52.967500  #

    2023-04-24T10:34:53.070137  / # #export SHELL=3D/bin/sh

    2023-04-24T10:34:53.070971  =


    2023-04-24T10:34:53.071495  / # export SHELL=3D/bin/sh<6>[   23.935397]=
 platform MX98357A:00: deferred probe pending

    2023-04-24T10:34:53.172812  . /lava-10101915/environment

    2023-04-24T10:34:53.173073  =


    2023-04-24T10:34:53.273700  / # . /lava-10101915/environment/lava-10101=
915/bin/lava-test-runner /lava-10101915/1

    2023-04-24T10:34:53.273983  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654f0e3d2f37ef42e8609

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644654f0e3d2f37ef42e860e
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:34.267716  <8>[   18.580767] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10101437_1.5.2.3.1>

    2023-04-24T10:07:34.378078  / # #

    2023-04-24T10:07:34.480647  export SHELL=3D/bin/sh

    2023-04-24T10:07:34.481461  #

    2023-04-24T10:07:34.583116  / # export SHELL=3D/bin/sh. /lava-10101437/=
environment

    2023-04-24T10:07:34.583951  =


    2023-04-24T10:07:34.685678  / # . /lava-10101437/environment/lava-10101=
437/bin/lava-test-runner /lava-10101437/1

    2023-04-24T10:07:34.686970  =


    2023-04-24T10:07:34.692754  / # /lava-10101437/bin/lava-test-runner /la=
va-10101437/1

    2023-04-24T10:07:34.797612  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64465743152e5a034f2e85ed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465743152e5a034f2e85f2
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:17:27.036232  [   17.761294] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10101644_1.5.2.3.1>

    2023-04-24T10:17:27.141235  / # #

    2023-04-24T10:17:27.243565  export SHELL=3D/bin/sh

    2023-04-24T10:17:27.244356  #

    2023-04-24T10:17:27.345773  / # export SHELL=3D/bin/sh. /lava-10101644/=
environment

    2023-04-24T10:17:27.346061  =


    2023-04-24T10:17:27.446894  / # . /lava-10101644/environment/lava-10101=
644/bin/lava-test-runner /lava-10101644/1

    2023-04-24T10:17:27.448270  =


    2023-04-24T10:17:27.453007  / # /lava-10101644/bin/lava-test-runner /la=
va-10101644/1

    2023-04-24T10:17:27.547439  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b7de99fed39ac2e8616

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465b7de99fed39ac2e8619
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:35:24.060602  + set +x

    2023-04-24T10:35:24.063565  [   20.886219] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10101924_1.5.2.3.1>

    2023-04-24T10:35:24.178646  / # #

    2023-04-24T10:35:24.281080  export SHELL=3D/bin/sh

    2023-04-24T10:35:24.281968  #

    2023-04-24T10:35:24.383391  / # export SHELL=3D/bin/sh. /lava-10101924/=
environment

    2023-04-24T10:35:24.383633  =


    2023-04-24T10:35:24.484162  / # . /lava-10101924/environment/lava-10101=
924/bin/lava-test-runner /lava-10101924/1

    2023-04-24T10:35:24.484436  =


    2023-04-24T10:35:24.489758  / # /lava-10101924/bin/lava-test-runner /la=
va-10101924/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64465c6086895a0c742e863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465c6086895a0c742e8643
        failing since 48 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:39:15.390804  + set +x
    2023-04-24T10:39:15.390972  [   27.499432] <LAVA_SIGNAL_ENDRUN 0_dmesg =
935557_1.6.2.3.1>
    2023-04-24T10:39:15.500532  #
    2023-04-24T10:39:15.602323  / # #export SHELL=3D/bin/sh
    2023-04-24T10:39:15.602767  =

    2023-04-24T10:39:15.704046  / # export SHELL=3D/bin/sh. /lava-935557/en=
vironment
    2023-04-24T10:39:15.704555  =

    2023-04-24T10:39:15.805736  / # . /lava-935557/environment/lava-935557/=
bin/lava-test-runner /lava-935557/1
    2023-04-24T10:39:15.806363  =

    2023-04-24T10:39:15.809618  / # /lava-935557/bin/lava-test-runner /lava=
-935557/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64465cd882c5a1e6af2e8683

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-i=
mx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-i=
mx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465cd882c5a1e6af2e8688
        failing since 48 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:41:15.826046  + set +x
    2023-04-24T10:41:15.826336  [   29.047391] <LAVA_SIGNAL_ENDRUN 0_dmesg =
935561_1.6.2.3.1>
    2023-04-24T10:41:15.935621  #
    2023-04-24T10:41:16.037819  / # #export SHELL=3D/bin/sh
    2023-04-24T10:41:16.038427  =

    2023-04-24T10:41:16.139864  / # export SHELL=3D/bin/sh. /lava-935561/en=
vironment
    2023-04-24T10:41:16.140502  =

    2023-04-24T10:41:16.241865  / # . /lava-935561/environment/lava-935561/=
bin/lava-test-runner /lava-935561/1
    2023-04-24T10:41:16.242481  =

    2023-04-24T10:41:16.245976  / # /lava-935561/bin/lava-test-runner /lava=
-935561/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64465d50fa9b2b31e72e86be

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465d50fa9b2b31e72e86c3
        failing since 48 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:43:06.464567  + set +x
    2023-04-24T10:43:06.464759  [   30.038863] <LAVA_SIGNAL_ENDRUN 0_dmesg =
935575_1.6.2.3.1>
    2023-04-24T10:43:06.574705  #
    2023-04-24T10:43:06.676974  / # #export SHELL=3D/bin/sh
    2023-04-24T10:43:06.677537  =

    2023-04-24T10:43:06.778855  / # export SHELL=3D/bin/sh. /lava-935575/en=
vironment
    2023-04-24T10:43:06.779372  =

    2023-04-24T10:43:06.880769  / # . /lava-935575/environment/lava-935575/=
bin/lava-test-runner /lava-935575/1
    2023-04-24T10:43:06.881416  =

    2023-04-24T10:43:06.884197  / # /lava-935575/bin/lava-test-runner /lava=
-935575/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64465db4f7cf78d55d2e8801

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465db4f7cf78d55d2e8806
        failing since 48 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:44:59.224675  + set[   27.045066] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 935582_1.6.2.3.1>
    2023-04-24T10:44:59.224839   +x
    2023-04-24T10:44:59.333499  / # #
    2023-04-24T10:44:59.434965  export SHELL=3D/bin/sh
    2023-04-24T10:44:59.435453  #
    2023-04-24T10:44:59.536595  / # export SHELL=3D/bin/sh. /lava-935582/en=
vironment
    2023-04-24T10:44:59.536982  =

    2023-04-24T10:44:59.638167  / # . /lava-935582/environment/lava-935582/=
bin/lava-test-runner /lava-935582/1
    2023-04-24T10:44:59.638862  =

    2023-04-24T10:44:59.641799  / # /lava-935582/bin/lava-test-runner /lava=
-935582/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64465cb05d6b7ec2aa2e86eb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465cb05d6b7ec2aa2e86f0
        new failure (last pass: renesas-devel-2023-04-21-v6.3-rc7)

    2023-04-24T10:40:24.919886  + set +x
    2023-04-24T10:40:24.920266  [   28.088211] <LAVA_SIGNAL_ENDRUN 0_dmesg =
935556_1.6.2.3.1>
    2023-04-24T10:40:25.119209  #
    2023-04-24T10:40:25.221272  / # #export SHELL=3D/bin/sh
    2023-04-24T10:40:25.221736  =

    2023-04-24T10:40:25.323040  / # export SHELL=3D/bin/sh. /lava-935556/en=
vironment
    2023-04-24T10:40:25.323591  =

    2023-04-24T10:40:25.424893  / # . /lava-935556/environment/lava-935556/=
bin/lava-test-runner /lava-935556/1
    2023-04-24T10:40:25.425544  =

    2023-04-24T10:40:25.428633  / # /lava-935556/bin/lava-test-runner /lava=
-935556/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64465ddd8585fa2a892e86b4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix=
/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465ddd8585fa2a892e86b9
        new failure (last pass: renesas-devel-2023-04-21-v6.3-rc7)

    2023-04-24T10:45:34.482548  + set[   26.169442] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 935581_1.6.2.3.1>
    2023-04-24T10:45:34.482715   +x
    2023-04-24T10:45:34.590027  / # #
    2023-04-24T10:45:34.691722  export SHELL=3D/bin/sh
    2023-04-24T10:45:34.692215  #
    2023-04-24T10:45:34.793596  / # export SHELL=3D/bin/sh. /lava-935581/en=
vironment
    2023-04-24T10:45:34.794082  =

    2023-04-24T10:45:34.895373  / # . /lava-935581/environment/lava-935581/=
bin/lava-test-runner /lava-935581/1
    2023-04-24T10:45:34.896041  =

    2023-04-24T10:45:34.899290  / # /lava-935581/bin/lava-test-runner /lava=
-935581/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644654ef68c90ae3752e8708

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644654ef68c90ae3752e870d
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:07:20.494801  [   18.410071] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10101411_1.5.2.3.1>

    2023-04-24T10:07:20.603862  / # #

    2023-04-24T10:07:20.706542  export SHELL=3D/bin/sh

    2023-04-24T10:07:20.707336  #

    2023-04-24T10:07:20.808934  / # export SHELL=3D/bin/sh. /lava-10101411/=
environment

    2023-04-24T10:07:20.809736  =


    2023-04-24T10:07:20.911229  / # . /lava-10101411/environment/lava-10101=
411/bin/lava-test-runner /lava-10101411/1

    2023-04-24T10:07:20.912445  =


    2023-04-24T10:07:20.917805  / # /lava-10101411/bin/lava-test-runner /la=
va-10101411/1

    2023-04-24T10:07:21.023091  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6446574a152e5a034f2e866d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6446574a152e5a034f2e8672
        failing since 24 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:17:28.580490  [   15.337429] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10101697_1.5.2.3.1>

    2023-04-24T10:17:28.685590  / # #

    2023-04-24T10:17:28.786306  export SHELL=3D/bin/sh

    2023-04-24T10:17:28.786545  #

    2023-04-24T10:17:28.887131  / # export SHELL=3D/bin/sh. /lava-10101697/=
environment

    2023-04-24T10:17:28.887883  =


    2023-04-24T10:17:28.989221  / # . /lava-10101697/environment/lava-10101=
697/bin/lava-test-runner /lava-10101697/1

    2023-04-24T10:17:28.990263  =


    2023-04-24T10:17:28.994779  / # /lava-10101697/bin/lava-test-runner /la=
va-10101697/1

    2023-04-24T10:17:29.087903  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64465b5ce9331ac1eb2e8629

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-=
collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64465b5ce9331ac1eb2e862e
        failing since 24 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-24T10:34:38.390002  + <8>[   22.530577] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10101951_1.5.2.3.1>

    2023-04-24T10:34:38.390134  set +x

    2023-04-24T10:34:38.502350  / # #

    2023-04-24T10:34:38.603077  export SHELL=3D/bin/sh

    2023-04-24T10:34:38.603280  #

    2023-04-24T10:34:38.703819  / # export SHELL=3D/bin/sh. /lava-10101951/=
environment

    2023-04-24T10:34:38.704036  =


    2023-04-24T10:34:38.804604  / # . /lava-10101951/environment/lava-10101=
951/bin/lava-test-runner /lava-10101951/1

    2023-04-24T10:34:38.804906  =


    2023-04-24T10:34:38.809554  / # /lava-10101951/bin/lava-test-runner /la=
va-10101951/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/64465d0e490a0afdb62e85e8

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/64465d0e490a0afdb62e8638
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:03.388573  /lava-10102029/1/../bin/lava-test-case

    2023-04-24T10:42:03.417391  [   38.215608] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/64465d0e490a0afdb62e868a
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:41:56.500825  /lava-10102029/1/../bin/lava-test-case

    2023-04-24T10:41:56.530075  [   31.328320] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/64465d0e490a0afdb62e868b
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:41:55.401333  /lava-10102029/1/../bin/lava-test-case

    2023-04-24T10:41:55.434411  [   30.232460] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64465d2a36ed2e27a12e86ff

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/64465d2a36ed2e27a12e877a
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:21.066829  /lava-10102096/1/../bin/lava-test-case

    2023-04-24T10:42:21.102075  <8>[   31.467382] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/64465d2a36ed2e27a12e877b
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:19.989990  /lava-10102096/1/../bin/lava-test-case

    2023-04-24T10:42:20.022953  <8>[   30.389032] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/64465d2a36ed2e27a12e8792
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:26.914729  /lava-10102096/1/../bin/lava-test-case

    2023-04-24T10:42:26.937972  <8>[   37.303965] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/64465d1a36ed2e27a12e860c

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabo=
ra/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/64465d1a36ed2e27a12e86be
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:10.205031  /lava-10102039/1/../bin/lava-test-case

    2023-04-24T10:42:10.229895  [   30.601900] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/64465d1a36ed2e27a12e86bf
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:09.140770  /lava-10102039/1/../bin/lava-test-case

    2023-04-24T10:42:09.166448  [   29.537828] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/64465d1a36ed2e27a12e86c0
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:42:08.074673  /lava-10102039/1/../bin/lava-test-case

    2023-04-24T10:42:08.103215  [   28.474492] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64465d6242f11439682e85e6

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/64465d6342f11439682e8697
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:43:02.573766  /lava-10102086/1/../bin/lava-test-case

    2023-04-24T10:43:02.611137  <8>[   32.449777] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/64465d6342f11439682e8698
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:43:01.487700  /lava-10102086/1/../bin/lava-test-case

    2023-04-24T10:43:01.524692  <8>[   31.363716] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/64465d6342f11439682e869a
        failing since 48 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-24T10:43:00.406055  /lava-10102086/1/../bin/lava-test-case

    2023-04-24T10:43:00.437036  <8>[   30.275759] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6446615aefa9a52d8a2e8644

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-cip/bas=
eline-nfs-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-24-v6.3/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-cip/bas=
eline-nfs-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6446615aefa9a52d8a2e8647
        new failure (last pass: renesas-devel-2023-04-21-v6.3-rc7)

    2023-04-24T11:00:24.877315  + set +x
    2023-04-24T11:00:24.877545  <8>[   55.497043] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 914425_1.6.2.4.1>
    2023-04-24T11:00:25.057572  / # #
    2023-04-24T11:00:26.516721  export SHELL=3D/bin/sh
    2023-04-24T11:00:26.537150  #
    2023-04-24T11:00:26.537304  / # export SHELL=3D/bin/sh
    2023-04-24T11:00:28.418769  / # . /lava-914425/environment
    2023-04-24T11:00:31.870399  /lava-914425/bin/lava-test-runner /lava-914=
425/1
    2023-04-24T11:00:31.890994  . /lava-914425/environment
    2023-04-24T11:00:31.891116  / # /lava-914425/bin/lava-test-runner /lava=
-914425/1 =

    ... (13 line(s) more)  =

 =20
