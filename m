Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0906372444F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 15:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbjFFNYR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 09:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbjFFNYP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 09:24:15 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88CCF12F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 06:24:10 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-33c37f62e24so22485285ab.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 06:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686057849; x=1688649849;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qhtxoPzgkdgou38ZG0gjP5ZLgUWfAOJhd30IM9Itw4c=;
        b=TPxawoOs7nt5LI4YwTe4AKImwjUhK8gNrMP4ogKCFl5v9hdzNq8ixI25J6V/fLLaBL
         dnhSckY6R+usmzPUbtoOt+ctpHwZx5Hb2VfYoZrfNRkQLoHIemmVmYi+NPjdukC+LDb2
         I/Mv+kYmL8s87mBAXlYzKscYq3Ra2sJNeHr/zP88+BN1SUrcJpl4/4E1o+aPMSCnVsFs
         Hc8QNOq1xiUgazzH0+SJMMztVoIY6Fnmbvqi7oNltoU8tdxK8nu778KE3xgBG+hzuv1k
         eyotPsGTXld+v7usf/5njI0pC3SLITLQEty95vbKqQtKk5jknfhnEmZwJFvYm4wBbuNE
         KyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057849; x=1688649849;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhtxoPzgkdgou38ZG0gjP5ZLgUWfAOJhd30IM9Itw4c=;
        b=Ir75grvtz4LAAN2zYXUDDikeC4iCEj9Noc1ecseBLEUPEYCEr4UDFhpcmwdPFKtu/O
         v6XhuNjMht7+HuXuwJQ8cNaaX8mbxotn0Chz98Mq9JJdF6oQF6E3HqsoFzp/hmXaPPGR
         yAXSMOknQhpOZp+p6UroQCKEa3KChGqeB3agDWGupDTPbEn3B+wMtAurPFvlJH+QTv+I
         9dYv6H+YDaYWLxHL5jU3xszx9K+BVz0qjxpmRFifXcihz0qmZ0b2qBniEHHc71ix6dMB
         YUAomabl5+RhPJGoh1SsqPKkZ6d+6e+e28lCiDXI2ma5pNAkTj/k0pt8eKDb7M0Ic+8N
         YjLQ==
X-Gm-Message-State: AC+VfDw/LeYQe/c3A2UTmlayIT2TYMltDR7hDK3cb1RHxkGK8ts5NH7c
        DkbBVH0cRJyxxWn7qWa4Cr2YZESx9BdOZCWPTKGFGQ==
X-Google-Smtp-Source: ACHHUZ5yzyhfGKwr4ZEUn+wx3o/0g4u+S8SIkjZoUgDlWrfuTMzyJxtc8NvBNKjC3dvzUSgL26/Y1g==
X-Received: by 2002:a92:d692:0:b0:335:9220:2ec2 with SMTP id p18-20020a92d692000000b0033592202ec2mr2088994iln.26.1686057848001;
        Tue, 06 Jun 2023 06:24:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s29-20020a63525d000000b005302682a668sm7168903pgl.17.2023.06.06.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:24:07 -0700 (PDT)
Message-ID: <647f3377.630a0220.58187.cd55@mx.google.com>
Date:   Tue, 06 Jun 2023 06:24:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-06-v6.4-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 190 runs,
 45 regressions (renesas-devel-2023-06-06-v6.4-rc5)
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

renesas/master baseline-nfs: 190 runs, 45 regressions (renesas-devel-2023-0=
6-06-v6.4-rc5)

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
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

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
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-06-v6.4-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-06-v6.4-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      06b45cc7ec76298d4d2f6d4da1550f05fa1beefd =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f008ccb4e24f539f5de89

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f008ccb4e24f539f5de92
        failing since 56 days (last pass: renesas-devel-2023-04-04-v6.3-rc5=
, first fail: renesas-devel-2023-04-10-v6.3-rc6)

    2023-06-06T09:46:38.401679  + set +x

    2023-06-06T09:46:38.408206  [   28.901229] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10603777_1.5.2.3.1>

    2023-06-06T09:46:38.512759  / # #

    2023-06-06T09:46:38.613464  export SHELL=3D/bin/sh

    2023-06-06T09:46:38.613665  #

    2023-06-06T09:46:38.714191  / # export SHELL=3D/bin/sh. /lava-10603777/=
environment

    2023-06-06T09:46:38.714388  =


    2023-06-06T09:46:38.814929  / # . /lava-10603777/environment/lava-10603=
777/bin/lava-test-runner /lava-10603777/1

    2023-06-06T09:46:38.815288  =


    2023-06-06T09:46:38.820495  / # /lava-10603777/bin/lava-test-runner /la=
va-10603777/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efb6446dd937a1cf5de6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efb6446dd937a1cf5de75
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:24:45.086503  + set +x

    2023-06-06T09:24:45.093469  <8>[   16.672442] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603240_1.5.2.3.1>

    2023-06-06T09:24:45.203273  / # #

    2023-06-06T09:24:45.306093  export SHELL=3D/bin/sh

    2023-06-06T09:24:45.306901  #

    2023-06-06T09:24:45.408184  / # export SHELL=3D/bin/sh. /lava-10603240/=
environment

    2023-06-06T09:24:45.408710  =


    2023-06-06T09:24:45.509907  / # . /lava-10603240/environment/lava-10603=
240/bin/lava-test-runner /lava-10603240/1

    2023-06-06T09:24:45.511135  =


    2023-06-06T09:24:45.516919  / # /lava-10603240/bin/lava-test-runner /la=
va-10603240/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd8a4689a3d7eff5de3b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efd8a4689a3d7eff5de44
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:38.297396  [   21.728174] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10603513_1.5.2.3.1>

    2023-06-06T09:33:38.300759  + set +x

    2023-06-06T09:33:38.417699  / ##

    2023-06-06T09:33:38.518379  export SHELL=3D/bin/sh

    2023-06-06T09:33:38.518633   #

    2023-06-06T09:33:38.619188  / # export SHELL=3D/bin/sh. /lava-10603513/=
environment

    2023-06-06T09:33:38.619431  =


    2023-06-06T09:33:38.719972  / # . /lava-10603513/environment/lava-10603=
513/bin/lava-test-runner /lava-10603513/1

    2023-06-06T09:33:38.720293  =


    2023-06-06T09:33:38.726380  / # /lava-10603513/bin/lava-test-runner /la=
va-10603513/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f00a2051ce83542f5de57

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f00a2051ce83542f5de60
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:47:03.952316  + set +x

    2023-06-06T09:47:03.958566  <8>[   26.183045] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603780_1.5.2.3.1>

    2023-06-06T09:47:04.064591  #

    2023-06-06T09:47:04.165462  / # #export SHELL=3D/bin/sh

    2023-06-06T09:47:04.165710  =


    2023-06-06T09:47:04.266292  / # export SHELL=3D/bin/sh. /lava-10603780/=
environment

    2023-06-06T09:47:04.266541  =


    2023-06-06T09:47:04.367126  / # . /lava-10603780/environment/lava-10603=
780/bin/lava-test-runner /lava-10603780/1

    2023-06-06T09:47:04.367464  =


    2023-06-06T09:47:04.373122  / # /lava-10603780/bin/lava-test-runner /la=
va-10603780/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efaf0dc0f2cf5bef5de63

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efaf0dc0f2cf5bef5de6c
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:22:46.214085  + set +x

    2023-06-06T09:22:46.220422  <8>[   19.788073] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603227_1.5.2.3.1>

    2023-06-06T09:22:46.327513  / # #

    2023-06-06T09:22:46.428367  export SHELL=3D/bin/sh

    2023-06-06T09:22:46.428637  #

    2023-06-06T09:22:46.529229  / # export SHELL=3D/bin/sh. /lava-10603227/=
environment

    2023-06-06T09:22:46.529481  =


    2023-06-06T09:22:46.630068  / # . /lava-10603227/environment/lava-10603=
227/bin/lava-test-runner /lava-10603227/1

    2023-06-06T09:22:46.630455  =


    2023-06-06T09:22:46.632313  / # /lava-10603227/bin/lava-test-runner /la=
va-10603227/1
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efc08d7a9497431f5dec3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efc08d7a9497431f5decc
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:27:28.103992  + set +x<8>[   18.115817] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10603191_1.5.2.3.1>

    2023-06-06T09:27:28.104430  =


    2023-06-06T09:27:28.210767  / # #

    2023-06-06T09:27:28.312849  export SHELL=3D/bin/sh

    2023-06-06T09:27:28.313541  #

    2023-06-06T09:27:28.414955  / # export SHELL=3D/bin/sh. /lava-10603191/=
environment

    2023-06-06T09:27:28.415195  =


    2023-06-06T09:27:28.515899  / # . /lava-10603191/environment/lava-10603=
191/bin/lava-test-runner /lava-10603191/1

    2023-06-06T09:27:28.517015  =


    2023-06-06T09:27:28.522015  / # /lava-10603191/bin/lava-test-runner /la=
va-10603191/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd85796760eda2f5de60

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efd85796760eda2f5de69
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:35.666657  [   18.632919] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10603476_1.5.2.3.1>

    2023-06-06T09:33:35.771554  / # #

    2023-06-06T09:33:35.872268  export SHELL=3D/bin/sh

    2023-06-06T09:33:35.872547  #

    2023-06-06T09:33:35.973127  / # export SHELL=3D/bin/sh. /lava-10603476/=
environment

    2023-06-06T09:33:35.973359  =


    2023-06-06T09:33:36.074049  / # . /lava-10603476/environment/lava-10603=
476/bin/lava-test-runner /lava-10603476/1

    2023-06-06T09:33:36.074372  =


    2023-06-06T09:33:36.079392  / # /lava-10603476/bin/lava-test-runner /la=
va-10603476/1

    2023-06-06T09:33:36.153649  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/647f00a1e1d57b19b3f5de75

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/647f00a2e1d=
57b19b3f5de78
        failing since 81 days (last pass: renesas-devel-2023-03-07-v6.3-rc1=
, first fail: renesas-devel-2023-03-16-v6.3-rc2)
        3 lines

    2023-06-06T09:46:57.880379  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-06T09:46:57.886818  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-06T09:46:57.893232  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-06T09:46:57.925997  <8>[   24.637450] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f00a2e1d57b19b3f5de7e
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:46:57.932613  + set<8>[   24.647395] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10603785_1.5.2.3.1>

    2023-06-06T09:46:57.932752   +x

    2023-06-06T09:46:58.040216  / # #

    2023-06-06T09:46:58.142314  export SHELL=3D/bin/sh

    2023-06-06T09:46:58.142989  #

    2023-06-06T09:46:58.244449  / # export SHELL=3D/bin/sh. /lava-10603785/=
environment

    2023-06-06T09:46:58.245154  =


    2023-06-06T09:46:58.346485  / # . /lava-10603785/environment/lava-10603=
785/bin/lava-test-runner /lava-10603785/1

    2023-06-06T09:46:58.347801  =


    2023-06-06T09:46:58.352718  / # /lava-10603785/bin/lava-test-runner /la=
va-10603785/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efbf036db195836f5dea7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efbf036db195836f5deb0
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:27:07.044219  <8>[   20.272530] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603172_1.5.2.3.1>

    2023-06-06T09:27:07.044323  + set +x

    2023-06-06T09:27:07.148569  / # #

    2023-06-06T09:27:07.249258  export SHELL=3D/bin/sh

    2023-06-06T09:27:07.249487  #

    2023-06-06T09:27:07.350151  / # export SHELL=3D/bin/sh. /lava-10603172/=
environment

    2023-06-06T09:27:07.350398  =


    2023-06-06T09:27:07.451112  / # . /lava-10603172/environment/lava-10603=
172/bin/lava-test-runner /lava-10603172/1

    2023-06-06T09:27:07.451405  =


    2023-06-06T09:27:07.456633  / # /lava-10603172/bin/lava-test-runner /la=
va-10603172/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd8194f9a1f545f5de70

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efd8194f9a1f545f5de79
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:28.380167  [   15.608082] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10603483_1.5.2.3.1>

    2023-06-06T09:33:28.383468  + set +x

    2023-06-06T09:33:28.489444  / # #

    2023-06-06T09:33:28.590220  export SHELL=3D/bin/sh

    2023-06-06T09:33:28.590472  #

    2023-06-06T09:33:28.691052  / # export SHELL=3D/bin/sh. /lava-10603483/=
environment

    2023-06-06T09:33:28.691294  =


    2023-06-06T09:33:28.791890  / # . /lava-10603483/environment/lava-10603=
483/bin/lava-test-runner /lava-10603483/1

    2023-06-06T09:33:28.792327  =


    2023-06-06T09:33:28.796551  / # /lava-10603483/bin/lava-test-runner /la=
va-10603483/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f00a3fa31185beff5de5b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f00a3fa31185beff5de64
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:47:02.888315  <8>[   22.657774] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603760_1.5.2.3.1>

    2023-06-06T09:47:02.891741  + set +x

    2023-06-06T09:47:02.995936  / # #

    2023-06-06T09:47:03.096577  export SHELL=3D/bin/sh

    2023-06-06T09:47:03.096828  #

    2023-06-06T09:47:03.197359  / # export SHELL=3D/bin/sh. /lava-10603760/=
environment

    2023-06-06T09:47:03.197564  =


    2023-06-06T09:47:03.298104  / # . /lava-10603760/environment/lava-10603=
760/bin/lava-test-runner /lava-10603760/1

    2023-06-06T09:47:03.298414  =


    2023-06-06T09:47:03.303189  / # /lava-10603760/bin/lava-test-runner /la=
va-10603760/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647efef4e7848f300af5de2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baselin=
e-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647efef4e7848f300=
af5de30
        failing since 27 days (last pass: renesas-devel-2023-04-21-v6.3-rc7=
, first fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647eff8b19429d0638f5de29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647eff8b19429d063=
8f5de2a
        failing since 6 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647f00f3d7e5ac95aff5de42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/baseline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/baseline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647f00f3d7e5ac95a=
ff5de43
        failing since 3 days (last pass: renesas-devel-2023-05-30-v6.4-rc4,=
 first fail: renesas-devel-2023-06-02-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0cd4e9541df6e2f5de2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-nfs-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647f0cd4e9541df6e=
2f5de2d
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647f11d68cbf780770f5defa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/bas=
eline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/bas=
eline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647f11d68cbf78077=
0f5defb
        failing since 3 days (last pass: renesas-devel-2023-05-30-v6.4-rc4,=
 first fail: renesas-devel-2023-06-02-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efcb938d8b0ca56f5def9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efcb938d8b0ca56f5df02
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:30:13.842583  + <8>[   27.088371] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10603209_1.5.2.3.1>

    2023-06-06T09:30:13.842684  set +x

    2023-06-06T09:30:13.947424  / # #

    2023-06-06T09:30:14.049449  export SHELL=3D/bin/sh

    2023-06-06T09:30:14.050085  #

    2023-06-06T09:30:14.151447  / # export SHELL=3D/bin/sh. /lava-10603209/=
environment

    2023-06-06T09:30:14.152089  =


    2023-06-06T09:30:14.253454  / # . /lava-10603209/environment/lava-10603=
209/bin/lava-test-runner /lava-10603209/1

    2023-06-06T09:30:14.254473  =


    2023-06-06T09:30:14.259326  / # /lava-10603209/bin/lava-test-runner /la=
va-10603209/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647eff606aac5a12fff5de85

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647eff606aac5a12fff5de8e
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:41:38.304333  + set +x[   23.059234] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10603498_1.5.2.3.1>

    2023-06-06T09:41:38.304467  =


    2023-06-06T09:41:38.409455  / # #

    2023-06-06T09:41:38.511708  export SHELL=3D/bin/sh

    2023-06-06T09:41:38.512429  #

    2023-06-06T09:41:38.613758  / # export SHELL=3D/bin/sh. /lava-10603498/=
environment

    2023-06-06T09:41:38.614416  =


    2023-06-06T09:41:38.716132  / # . /lava-10603498/environment/lava-10603=
498/bin/lava-test-runner /lava-10603498/1

    2023-06-06T09:41:38.717240  =


    2023-06-06T09:41:38.721988  / # /lava-10603498/bin/lava-test-runner /la=
va-10603498/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f014b50f0fb7164f5de2b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f014b50f0fb7164f5de34
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:49:58.932553  + set +x

    2023-06-06T09:49:58.939111  [   35.341060] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10603797_1.5.2.3.1>

    2023-06-06T09:49:59.051788  #

    2023-06-06T09:49:59.154624  / # #export SHELL=3D/bin/sh

    2023-06-06T09:49:59.155470  =


    2023-06-06T09:49:59.257071  / # export SHELL=3D/bin/sh. /lava-10603797/=
environment

    2023-06-06T09:49:59.257875  =


    2023-06-06T09:49:59.359436  / # . /lava-10603797/environment/lava-10603=
797/bin/lava-test-runner /lava-10603797/1

    2023-06-06T09:49:59.360696  =


    2023-06-06T09:49:59.365856  / # /lava-10603797/bin/lava-test-runner /la=
va-10603797/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd6cf26c4c2ae3f5df08

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efd6cf26c4c2ae3f5df11
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:13.529421  + set +x<8>[   17.161069] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10603479_1.5.2.3.1>

    2023-06-06T09:33:13.529524  =


    2023-06-06T09:33:13.634275  / # #

    2023-06-06T09:33:13.734938  export SHELL=3D/bin/sh

    2023-06-06T09:33:13.735190  #

    2023-06-06T09:33:13.835713  / # export SHELL=3D/bin/sh. /lava-10603479/=
environment

    2023-06-06T09:33:13.835932  =


    2023-06-06T09:33:13.936427  / # . /lava-10603479/environment/lava-10603=
479/bin/lava-test-runner /lava-10603479/1

    2023-06-06T09:33:13.936725  =


    2023-06-06T09:33:13.942064  / # /lava-10603479/bin/lava-test-runner /la=
va-10603479/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f008cf08da8f5ddf5de90

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f008cf08da8f5ddf5de99
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:46:34.822133  + <8>[   23.447488] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10603791_1.5.2.3.1>

    2023-06-06T09:46:34.822593  set +x

    2023-06-06T09:46:34.930494  / # #

    2023-06-06T09:46:35.032791  export SHELL=3D/bin/sh

    2023-06-06T09:46:35.033510  #

    2023-06-06T09:46:35.134826  / # export SHELL=3D/bin/sh. /lava-10603791/=
environment

    2023-06-06T09:46:35.135664  =


    2023-06-06T09:46:35.237104  / # . /lava-10603791/environment/lava-10603=
791/bin/lava-test-runner /lava-10603791/1

    2023-06-06T09:46:35.238243  =


    2023-06-06T09:46:35.238625  / # /lava-10603791/bin/lava-test-runner /la=
va-10603791/1<6>[   23.834577] platform MX98357A:00: deferred probe pending
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efaff88ae7d29e7f5de25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efaff88ae7d29e7f5de2e
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:22:50.253758  <8>[   17.947585] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603166_1.5.2.3.1>

    2023-06-06T09:22:50.358406  / # #

    2023-06-06T09:22:50.459159  export SHELL=3D/bin/sh

    2023-06-06T09:22:50.459411  #

    2023-06-06T09:22:50.559999  / # export SHELL=3D/bin/sh. /lava-10603166/=
environment

    2023-06-06T09:22:50.560214  =


    2023-06-06T09:22:50.660790  / # . /lava-10603166/environment/lava-10603=
166/bin/lava-test-runner /lava-10603166/1

    2023-06-06T09:22:50.661097  =


    2023-06-06T09:22:50.665675  / # /lava-10603166/bin/lava-test-runner /la=
va-10603166/1

    2023-06-06T09:22:50.742592  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd7f796760eda2f5de2d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efd7f796760eda2f5de36
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:42.100851  [   18.120782] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10603482_1.5.2.3.1>

    2023-06-06T09:33:42.205299  / # #

    2023-06-06T09:33:42.306016  export SHELL=3D/bin/sh

    2023-06-06T09:33:42.306257  #

    2023-06-06T09:33:42.406759  / # export SHELL=3D/bin/sh. /lava-10603482/=
environment

    2023-06-06T09:33:42.407013  =


    2023-06-06T09:33:42.507509  / # . /lava-10603482/environment/lava-10603=
482/bin/lava-test-runner /lava-10603482/1

    2023-06-06T09:33:42.507845  =


    2023-06-06T09:33:42.512546  / # /lava-10603482/bin/lava-test-runner /la=
va-10603482/1

    2023-06-06T09:33:42.589330  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f00a0fa31185beff5de4e

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f00a0fa31185beff5de57
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:46:54.043233  + set<8>[   24.110957] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10603757_1.5.2.3.1>

    2023-06-06T09:46:54.043342   +x

    2023-06-06T09:46:54.155871  / # #

    2023-06-06T09:46:54.256461  export SHELL=3D/bin/sh

    2023-06-06T09:46:54.256632  #

    2023-06-06T09:46:54.357083  / # export SHELL=3D/bin/sh. /lava-10603757/=
environment

    2023-06-06T09:46:54.357250  =


    2023-06-06T09:46:54.457717  / # . /lava-10603757/environment/lava-10603=
757/bin/lava-test-runner /lava-10603757/1

    2023-06-06T09:46:54.457976  =


    2023-06-06T09:46:54.463395  / # /lava-10603757/bin/lava-test-runner /la=
va-10603757/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647f02067e4c26b0cef5de37

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f02067e4c26b0cef5de40
        failing since 91 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-06T09:52:54.618548  + set +x
    2023-06-06T09:52:54.618795  [   31.798811] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968758_1.6.2.3.1>
    2023-06-06T09:52:54.728665  #
    2023-06-06T09:52:54.830518  / # #export SHELL=3D/bin/sh
    2023-06-06T09:52:54.830994  =

    2023-06-06T09:52:54.932329  / # export SHELL=3D/bin/sh. /lava-968758/en=
vironment
    2023-06-06T09:52:54.932964  =

    2023-06-06T09:52:55.034436  / # . /lava-968758/environment/lava-968758/=
bin/lava-test-runner /lava-968758/1
    2023-06-06T09:52:55.035104  =

    2023-06-06T09:52:55.038147  / # /lava-968758/bin/lava-test-runner /lava=
-968758/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647f036d53c0dc963ef5de73

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f036d53c0dc963ef5de7c
        failing since 91 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-06T09:59:02.675886  + set +x
    2023-06-06T09:59:02.676186  [   29.673053] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968784_1.6.2.3.1>
    2023-06-06T09:59:02.786067  #
    2023-06-06T09:59:02.888946  / # #export SHELL=3D/bin/sh
    2023-06-06T09:59:02.889457  =

    2023-06-06T09:59:02.990752  / # export SHELL=3D/bin/sh. /lava-968784/en=
vironment
    2023-06-06T09:59:02.991291  =

    2023-06-06T09:59:03.092786  / # . /lava-968784/environment/lava-968784/=
bin/lava-test-runner /lava-968784/1
    2023-06-06T09:59:03.093455  =

    2023-06-06T09:59:03.096569  / # /lava-968784/bin/lava-test-runner /lava=
-968784/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647f03fbbf27a049b5f5deba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f03fbbf27a049b5f5dec3
        failing since 91 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-06T10:01:13.580434  + set +x
    2023-06-06T10:01:13.580735  [   28.120344] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968787_1.6.2.3.1>
    2023-06-06T10:01:13.690169  #
    2023-06-06T10:01:13.792367  / # #export SHELL=3D/bin/sh
    2023-06-06T10:01:13.792903  =

    2023-06-06T10:01:13.894191  / # export SHELL=3D/bin/sh. /lava-968787/en=
vironment
    2023-06-06T10:01:13.894659  =

    2023-06-06T10:01:13.995945  / # . /lava-968787/environment/lava-968787/=
bin/lava-test-runner /lava-968787/1
    2023-06-06T10:01:13.996669  =

    2023-06-06T10:01:13.999547  / # /lava-968787/bin/lava-test-runner /lava=
-968787/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647f071915e751b7d9f5de85

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f071a15e751b7d9f5de8e
        failing since 91 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-06T10:14:29.879344  + set +x
    2023-06-06T10:14:29.879551  [   30.070555] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968810_1.6.2.3.1>
    2023-06-06T10:14:29.989722  #
    2023-06-06T10:14:30.091927  / # #export SHELL=3D/bin/sh
    2023-06-06T10:14:30.092391  =

    2023-06-06T10:14:30.193553  / # export SHELL=3D/bin/sh. /lava-968810/en=
vironment
    2023-06-06T10:14:30.193906  =

    2023-06-06T10:14:30.295106  / # . /lava-968810/environment/lava-968810/=
bin/lava-test-runner /lava-968810/1
    2023-06-06T10:14:30.295665  =

    2023-06-06T10:14:30.298578  / # /lava-968810/bin/lava-test-runner /lava=
-968810/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647f07e33f0285d91ef5de31

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f07e33f0285d91ef5de3a
        failing since 91 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-06T10:17:52.593168  + set +x
    2023-06-06T10:17:52.593366  [   27.484382] <LAVA_SIGNAL_ENDRUN 0_dmesg =
968827_1.6.2.3.1>
    2023-06-06T10:17:52.710679  #
    2023-06-06T10:17:52.812391  / # #export SHELL=3D/bin/sh
    2023-06-06T10:17:52.812694  =

    2023-06-06T10:17:52.913850  / # export SHELL=3D/bin/sh. /lava-968827/en=
vironment
    2023-06-06T10:17:52.914220  =

    2023-06-06T10:17:53.015433  / # . /lava-968827/environment/lava-968827/=
bin/lava-test-runner /lava-968827/1
    2023-06-06T10:17:53.016050  =

    2023-06-06T10:17:53.021164  / # /lava-968827/bin/lava-test-runner /lava=
-968827/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647f022ea7c97d5be0f5de26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647f022ea7c97d5be=
0f5de27
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647f044a2893927b91f5ded9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f044a2893927b91f5dee2
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5)

    2023-06-06T10:02:36.012588  + set[   27.464369] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 968786_1.6.2.3.1>
    2023-06-06T10:02:36.012780   +x
    2023-06-06T10:02:36.120634  #
    2023-06-06T10:02:36.222483  / # #export SHELL=3D/bin/sh
    2023-06-06T10:02:36.222979  =

    2023-06-06T10:02:36.324264  / # export SHELL=3D/bin/sh. /lava-968786/en=
vironment
    2023-06-06T10:02:36.324817  =

    2023-06-06T10:02:36.426380  / # . /lava-968786/environment/lava-968786/=
bin/lava-test-runner /lava-968786/1
    2023-06-06T10:02:36.427105  =

    2023-06-06T10:02:36.429885  / # /lava-968786/bin/lava-test-runner /lava=
-968786/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647f083245115fd1bcf5de38

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f083245115fd1bcf5de41
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5)

    2023-06-06T10:19:15.025111  + set[   27.795544] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 968823_1.6.2.3.1>
    2023-06-06T10:19:15.025279   +x
    2023-06-06T10:19:15.139020  #
    2023-06-06T10:19:15.241027  / # #export SHELL=3D/bin/sh
    2023-06-06T10:19:15.241666  =

    2023-06-06T10:19:15.343025  / # export SHELL=3D/bin/sh. /lava-968823/en=
vironment
    2023-06-06T10:19:15.343509  =

    2023-06-06T10:19:15.444819  / # . /lava-968823/environment/lava-968823/=
bin/lava-test-runner /lava-968823/1
    2023-06-06T10:19:15.446029  =

    2023-06-06T10:19:15.448681  / # /lava-968823/bin/lava-test-runner /lava=
-968823/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/647f04742fda1c62fdf5de84

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-nfs-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kon=
tron/baseline-nfs-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.crit: https://kernelci.org/test/case/id/647f04742fda=
1c62fdf5de87
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5)
        1 lines

    2023-06-06T10:03:08.687891  / # =

    2023-06-06T10:03:08.699773  =

    2023-06-06T10:03:08.801567  / # export NFS_ROOTFS=3D'/var/lib/lava/disp=
atcher/tmp/351339/extract-nfsrootfs-prujkqr6'
    2023-06-06T10:03:08.808753  export NFS_ROOTFS=3D'/var/lib/lava/dispatch=
er/tmp/351339/extract-nfsrootfs-prujkqr6'
    2023-06-06T10:03:08.910104  / # export NFS_SERVER_IP=3D'10.228.65.1'
    2023-06-06T10:03:08.920861  export NFS_SERVER_IP=3D'10.228.65.1'
    2023-06-06T10:03:09.023403  / # #
    2023-06-06T10:03:09.032700  #
    2023-06-06T10:03:09.134305  / # export SHELL=3D/bin/sh
    2023-06-06T10:03:09.144690  export SHELL=3D/bin/sh =

    ... (13 line(s) more)  =


  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/647f04742fd=
a1c62fdf5de89
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5)
        2 lines

    2023-06-06T10:03:09.640219  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2023-06-06T10:03:09.640426  kern  :emerg : Code: b9449841 51000421 b904=
9841 36ffff41 (d4210000) =

    2023-06-06T10:03:09.640791  <8>[   14.707066] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-06-06T10:03:09.640911  + <8>[   14.717702] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 351339_1.6.2.4.1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647efb0188ae7d29e7f5de3e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efb0188ae7d29e7f5de47
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:23:01.798754  + set<8>[   17.807141] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10603226_1.5.2.3.1>

    2023-06-06T09:23:01.798898   +x

    2023-06-06T09:23:01.903916  / # #

    2023-06-06T09:23:02.004671  export SHELL=3D/bin/sh

    2023-06-06T09:23:02.004983  #

    2023-06-06T09:23:02.105586  / # export SHELL=3D/bin/sh. /lava-10603226/=
environment

    2023-06-06T09:23:02.105807  =


    2023-06-06T09:23:02.206307  / # . /lava-10603226/environment/lava-10603=
226/bin/lava-test-runner /lava-10603226/1

    2023-06-06T09:23:02.206587  =


    2023-06-06T09:23:02.211625  / # /lava-10603226/bin/lava-test-runner /la=
va-10603226/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647efd6f94f9a1f545f5de30

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647efd6f94f9a1f545f5de39
        failing since 67 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:33:14.342191  [   18.067630] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10603519_1.5.2.3.1>

    2023-06-06T09:33:14.446634  / # #

    2023-06-06T09:33:14.547208  export SHELL=3D/bin/sh

    2023-06-06T09:33:14.547404  #

    2023-06-06T09:33:14.647919  / # export SHELL=3D/bin/sh. /lava-10603519/=
environment

    2023-06-06T09:33:14.648109  =


    2023-06-06T09:33:14.748627  / # . /lava-10603519/environment/lava-10603=
519/bin/lava-test-runner /lava-10603519/1

    2023-06-06T09:33:14.748931  =


    2023-06-06T09:33:14.753600  / # /lava-10603519/bin/lava-test-runner /la=
va-10603519/1

    2023-06-06T09:33:14.803176  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0091510f781176f5de32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/=
lab-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f0091510f781176f5de3b
        failing since 67 days (last pass: renesas-devel-2023-03-16-v6.3-rc2=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-06T09:46:39.350887  + set +x<8>[   22.487945] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10603769_1.5.2.3.1>

    2023-06-06T09:46:39.350975  =


    2023-06-06T09:46:39.458014  / # #

    2023-06-06T09:46:39.558664  export SHELL=3D/bin/sh

    2023-06-06T09:46:39.558883  #

    2023-06-06T09:46:39.659409  / # export SHELL=3D/bin/sh. /lava-10603769/=
environment

    2023-06-06T09:46:39.659613  =


    2023-06-06T09:46:39.760134  / # . /lava-10603769/environment/lava-10603=
769/bin/lava-test-runner /lava-10603769/1

    2023-06-06T09:46:39.760410  =


    2023-06-06T09:46:39.765120  / # /lava-10603769/bin/lava-test-runner /la=
va-10603769/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647f035c3faac9df00f5de66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647f035c3faac9df0=
0f5de67
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647f03603faac9df00f5de69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647f03603faac9df0=
0f5de6a
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647f02755c5a310155f5de30

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647f02755c5a310155f5de39
        failing since 14 days (last pass: renesas-devel-2023-05-09-v6.4-rc1=
, first fail: renesas-devel-2023-05-22-v6.4-rc3)

    2023-06-06T09:54:51.243175  + set +x

    2023-06-06T09:54:51.249362  <8>[   30.698269] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10603850_1.6.2.3.1>

    2023-06-06T09:54:51.353984  / # #

    2023-06-06T09:54:51.454674  export SHELL=3D/bin/sh

    2023-06-06T09:54:51.454877  #

    2023-06-06T09:54:51.555448  / # export SHELL=3D/bin/sh. /lava-10603850/=
environment

    2023-06-06T09:54:51.555638  =


    2023-06-06T09:54:51.656201  / # . /lava-10603850/environment/lava-10603=
850/bin/lava-test-runner /lava-10603850/1

    2023-06-06T09:54:51.656492  =


    2023-06-06T09:54:51.662488  / # /lava-10603850/bin/lava-test-runner /la=
va-10603850/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/647efdcbae7d73ce17f5de5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-s=
un50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-s=
un50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647efdcbae7d73ce1=
7f5de5b
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/647eff6f6aac5a12fff5ded0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig/gcc-10/lab-broonie/baseline-nfs-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647eff6f6aac5a12f=
ff5ded1
        failing since 0 day (last pass: renesas-devel-2023-05-22-v6.4-rc3, =
first fail: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/647f00ecf06d7a9991f5de2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-nfs-sun5=
0i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-nfs-sun5=
0i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647f00ecf06d7a999=
1f5de30
        new failure (last pass: renesas-devel-2023-05-22-v6.4-rc3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647f02a424ebd31387f5de34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bro=
onie/baseline-nfs-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bro=
onie/baseline-nfs-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647f02a424ebd3138=
7f5de35
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =20
