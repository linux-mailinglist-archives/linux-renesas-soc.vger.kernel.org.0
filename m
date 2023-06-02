Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A107208E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 20:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234942AbjFBSQh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 14:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbjFBSQg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 14:16:36 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BDC123
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 11:16:31 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-652426346bbso1172709b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Jun 2023 11:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685729790; x=1688321790;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kFAaTdlg2lvpueDkNVBqaHcs1Eo4OnvuwUKkGSE55mk=;
        b=CUbpw4jys6DUsRDnpFrpXwLb0P/mJTsa9AVTSH5UqA9G9aVPjU7eprm91IfK/AFhmp
         OkPYEzZhiqE9WOhC8yNHB8YdifEN6GTBKU0HsVRv49bnBP5mE6z/EwJNN1hxRVp1NtWI
         kS/GLE4aeRoJ/ee9g8xnTsUpHocVKfgCzvtSs6nlkkieACZBBDt4EQEkr9FFCkxCyRHd
         xL+4q1dFOUAJkMW+bKFyN9hsTgJphJjhwegIfzE8kRSsQEVdhIzEvgpOm7g4alHjr3iX
         JwNQrH0Am3+BFsGdkbbyPus9zdukgoj9elQprRplKisdt/bQwK1q/XbEGDaqb4adQROi
         Zuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685729790; x=1688321790;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFAaTdlg2lvpueDkNVBqaHcs1Eo4OnvuwUKkGSE55mk=;
        b=OTw4hJ+9LVbs3TAPnVd+5t4b7IPt41wplzk4eU6lpbiWH8WHB6tTfLqVHlHZywuC/j
         CFLrl0ksTSxH1xAts+5OnPJHyBy2gaqtCPbz4pNPKSfkFI+Q+XMPt/k+IoO84DptxMoW
         Jv7H/YqOaujXWm0nm5ehpbSKyYw5XJ0VM51qClxYAxEZ4V47VdN+p4jsOT88r4yAYU4x
         slVda3VLNPf39aSCDWrsB9K3L91+qRCVRcyfJhR4oSmaisI8p/CR4fo8OOxOAYyndNsp
         29eEk1x+HQe6I39OqjaIl128WRjff07l4lpfQAvDlJfqshKe/OQsR/pQ5T/qKbDddD92
         321g==
X-Gm-Message-State: AC+VfDwIBpFDL9Vare8G7/Y6HpbA/uaZadzUOrLzeuxZLiutkZttl8MD
        WE6wWRMzv6T2JYH4AjXC5UMOC2CcF72BjkgAVBwKkw==
X-Google-Smtp-Source: ACHHUZ6TEJOXAazDlwa+886ysKPLCK6QqXAHmQCLt8Dgtn9/YYaN+PO+krr+A9X6WzqKPVsn8C8Ijg==
X-Received: by 2002:a05:6a20:12d1:b0:102:d2fa:d707 with SMTP id v17-20020a056a2012d100b00102d2fad707mr9044768pzg.52.1685729790030;
        Fri, 02 Jun 2023 11:16:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v3-20020aa78083000000b0062bc045bf4fsm1335501pff.19.2023.06.02.11.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 11:16:29 -0700 (PDT)
Message-ID: <647a31fd.a70a0220.8c640.2b57@mx.google.com>
Date:   Fri, 02 Jun 2023 11:16:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-02-v6.4-rc4
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 109 runs,
 23 regressions (renesas-devel-2023-06-02-v6.4-rc4)
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

renesas/master baseline-nfs: 109 runs, 23 regressions (renesas-devel-2023-0=
6-02-v6.4-rc4)

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

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-02-v6.4-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-02-v6.4-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c6f027b1ddedc24bffa0d60dc92d2e774cf3e19e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f7a8240eeb680cf5deb7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f7a8240eeb680cf5dec0
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:07:04.203689  + set +x

    2023-06-02T14:07:04.209685  [   20.460157] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10565870_1.5.2.3.1>

    2023-06-02T14:07:04.319514  / # #

    2023-06-02T14:07:04.421999  export SHELL=3D/bin/sh

    2023-06-02T14:07:04.422816  #

    2023-06-02T14:07:04.524492  / # export SHELL=3D/bin/sh. /lava-10565870/=
environment

    2023-06-02T14:07:04.525350  =


    2023-06-02T14:07:04.627050  / # . /lava-10565870/environment/lava-10565=
870/bin/lava-test-runner /lava-10565870/1

    2023-06-02T14:07:04.628158  =


    2023-06-02T14:07:04.634162  / # /lava-10565870/bin/lava-test-runner /la=
va-10565870/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f98b49b7b98eeff5de28

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f98b49b7b98eeff5de31
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:15:23.872269  + set +x

    2023-06-02T14:15:23.878205  <8>[   19.962868] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565993_1.5.2.3.1>

    2023-06-02T14:15:23.988967  / # #

    2023-06-02T14:15:24.091792  export SHELL=3D/bin/sh

    2023-06-02T14:15:24.092689  #

    2023-06-02T14:15:24.194419  / # export SHELL=3D/bin/sh. /lava-10565993/=
environment

    2023-06-02T14:15:24.195277  =


    2023-06-02T14:15:24.296941  / # . /lava-10565993/environment/lava-10565=
993/bin/lava-test-runner /lava-10565993/1

    2023-06-02T14:15:24.298380  =


    2023-06-02T14:15:24.304320  / # /lava-10565993/bin/lava-test-runner /la=
va-10565993/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fa5fb6e622fa8ff5de35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479fa5fb6e622fa8ff5de3e
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:18:53.119101  + set +x<8>[   20.531237] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10566045_1.5.2.3.1>

    2023-06-02T14:18:53.119669  =


    2023-06-02T14:18:53.227300  / # #

    2023-06-02T14:18:53.329952  export SHELL=3D/bin/sh

    2023-06-02T14:18:53.330745  #

    2023-06-02T14:18:53.432568  / # export SHELL=3D/bin/sh. /lava-10566045/=
environment

    2023-06-02T14:18:53.433356  =


    2023-06-02T14:18:53.535121  / # . /lava-10566045/environment/lava-10566=
045/bin/lava-test-runner /lava-10566045/1

    2023-06-02T14:18:53.536399  =


    2023-06-02T14:18:53.538524  / # /lava-10566045/bin/lava-test-runner /la=
va-10566045/1
 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f781e93beb62c3f5de7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f781e93beb62c3f5de83
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:06:37.587792  [   17.550654] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10565858_1.5.2.3.1>

    2023-06-02T14:06:37.695908  / # #

    2023-06-02T14:06:37.798535  export SHELL=3D/bin/sh

    2023-06-02T14:06:37.799316  #

    2023-06-02T14:06:37.901015  / # export SHELL=3D/bin/sh. /lava-10565858/=
environment

    2023-06-02T14:06:37.901840  =


    2023-06-02T14:06:38.003568  / # . /lava-10565858/environment/lava-10565=
858/bin/lava-test-runner /lava-10565858/1

    2023-06-02T14:06:38.004836  =


    2023-06-02T14:06:38.010374  / # /lava-10565858/bin/lava-test-runner /la=
va-10565858/1

    2023-06-02T14:06:38.105443  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f78318b92262bcf5de27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f78318b92262bcf5de30
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:06:34.927503  + set +x

    2023-06-02T14:06:34.933839  [   15.299353] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10565861_1.5.2.3.1>

    2023-06-02T14:06:35.038985  / # #

    2023-06-02T14:06:35.139597  export SHELL=3D/bin/sh

    2023-06-02T14:06:35.139785  #

    2023-06-02T14:06:35.240296  / # export SHELL=3D/bin/sh. /lava-10565861/=
environment

    2023-06-02T14:06:35.240458  =


    2023-06-02T14:06:35.340988  / # . /lava-10565861/environment/lava-10565=
861/bin/lava-test-runner /lava-10565861/1

    2023-06-02T14:06:35.341296  =


    2023-06-02T14:06:35.346090  / # /lava-10565861/bin/lava-test-runner /la=
va-10565861/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f99a49b7b98eeff5de4a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f99a49b7b98eeff5de53
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:15:45.133926  <8>[   18.422693] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10566016_1.5.2.3.1>

    2023-06-02T14:15:45.137412  + set +x

    2023-06-02T14:15:45.248007  / # #

    2023-06-02T14:15:45.348696  export SHELL=3D/bin/sh

    2023-06-02T14:15:45.348881  #

    2023-06-02T14:15:45.449374  / # export SHELL=3D/bin/sh. /lava-10566016/=
environment

    2023-06-02T14:15:45.449659  =


    2023-06-02T14:15:45.550317  / # . /lava-10566016/environment/lava-10566=
016/bin/lava-test-runner /lava-10566016/1

    2023-06-02T14:15:45.550757  =


    2023-06-02T14:15:45.555901  / # /lava-10566016/bin/lava-test-runner /la=
va-10566016/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fa14e59c36001ff5de4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-n=
fs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6479fa14e59c36001=
ff5de4f
        failing since 3 days (last pass: renesas-devel-2023-05-22-v6.4-rc3,=
 first fail: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6479fd5d8209eb98a5f5de58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/baseline-nfs-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/baseline-nfs-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6479fd5d8209eb98a=
5f5de59
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/647a01458934b34a82f5de82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-nfs-=
beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-nfs-=
beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647a01458934b34a8=
2f5de83
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f84e2779dceebff5de28

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f84e2779dceebff5de31
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:10:02.391352  + set<8>[   38.035942] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10565885_1.5.2.3.1>

    2023-06-02T14:10:02.391444   +x

    2023-06-02T14:10:02.496071  / # #

    2023-06-02T14:10:02.596749  export SHELL=3D/bin/sh

    2023-06-02T14:10:02.596932  #

    2023-06-02T14:10:02.697444  / # export SHELL=3D/bin/sh. /lava-10565885/=
environment

    2023-06-02T14:10:02.697625  =


    2023-06-02T14:10:02.798147  / # . /lava-10565885/environment/lava-10565=
885/bin/lava-test-runner /lava-10565885/1

    2023-06-02T14:10:02.798436  =


    2023-06-02T14:10:02.803196  / # /lava-10565885/bin/lava-test-runner /la=
va-10565885/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f9b69a66e64da6f5de46

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f9b79a66e64da6f5de4f
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:16:10.442217  + set<8>[   22.310821] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10566064_1.5.2.3.1>

    2023-06-02T14:16:10.442785   +x

    2023-06-02T14:16:10.550716  / # #

    2023-06-02T14:16:10.651624  export SHELL=3D/bin/sh

    2023-06-02T14:16:10.652399  #

    2023-06-02T14:16:10.753875  / # export SHELL=3D/bin/sh. /lava-10566064/=
environment

    2023-06-02T14:16:10.754600  =


    2023-06-02T14:16:10.856086  / # . /lava-10566064/environment/lava-10566=
064/bin/lava-test-runner /lava-10566064/1

    2023-06-02T14:16:10.857185  =


    2023-06-02T14:16:10.861849  / # /lava-10566064/bin/lava-test-runner /la=
va-10566064/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f77ee93beb62c3f5de6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f77ee93beb62c3f5de75
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:06:39.822465  + set[   17.735803] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10565860_1.5.2.3.1>

    2023-06-02T14:06:39.822570   +x

    2023-06-02T14:06:39.926886  / # #

    2023-06-02T14:06:40.029150  export SHELL=3D/bin/sh

    2023-06-02T14:06:40.029997  #

    2023-06-02T14:06:40.131340  / # export SHELL=3D/bin/sh. /lava-10565860/=
environment

    2023-06-02T14:06:40.131653  =


    2023-06-02T14:06:40.232565  / # . /lava-10565860/environment/lava-10565=
860/bin/lava-test-runner /lava-10565860/1

    2023-06-02T14:06:40.233727  =


    2023-06-02T14:06:40.239399  / # /lava-10565860/bin/lava-test-runner /la=
va-10565860/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f78f30eac93d65f5de63

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f78f30eac93d65f5de6a
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:06:46.624308  [   18.313826] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10565877_1.5.2.3.1>

    2023-06-02T14:06:46.728992  / # #

    2023-06-02T14:06:46.831444  export SHELL=3D/bin/sh

    2023-06-02T14:06:46.832210  #

    2023-06-02T14:06:46.933715  / # export SHELL=3D/bin/sh. /lava-10565877/=
environment

    2023-06-02T14:06:46.934486  =


    2023-06-02T14:06:47.036286  / # . /lava-10565877/environment/lava-10565=
877/bin/lava-test-runner /lava-10565877/1

    2023-06-02T14:06:47.037664  =


    2023-06-02T14:06:47.042917  / # /lava-10565877/bin/lava-test-runner /la=
va-10565877/1

    2023-06-02T14:06:47.139130  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f98a16d408b72af5de35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f98a16d408b72af5de3e
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:15:13.181175  <8>[   18.252208] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565992_1.5.2.3.1>

    2023-06-02T14:15:13.289743  / # #

    2023-06-02T14:15:13.391865  export SHELL=3D/bin/sh

    2023-06-02T14:15:13.392585  #

    2023-06-02T14:15:13.494086  / # export SHELL=3D/bin/sh. /lava-10565992/=
environment

    2023-06-02T14:15:13.494799  =


    2023-06-02T14:15:13.596115  / # . /lava-10565992/environment/lava-10565=
992/bin/lava-test-runner /lava-10565992/1

    2023-06-02T14:15:13.597276  =


    2023-06-02T14:15:13.603214  / # /lava-10565992/bin/lava-test-runner /la=
va-10565992/1

    2023-06-02T14:15:13.685343  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647a08ce376242c880f5de30

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647a08ce376242c880f5de39
        failing since 87 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-02T15:20:25.687325  + set +x
    2023-06-02T15:20:25.687710  [   30.059566] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965875_1.6.2.3.1>
    2023-06-02T15:20:25.798145  #
    2023-06-02T15:20:25.900156  / # #export SHELL=3D/bin/sh
    2023-06-02T15:20:25.900711  =

    2023-06-02T15:20:26.001946  / # export SHELL=3D/bin/sh. /lava-965875/en=
vironment
    2023-06-02T15:20:26.002519  =

    2023-06-02T15:20:26.103908  / # . /lava-965875/environment/lava-965875/=
bin/lava-test-runner /lava-965875/1
    2023-06-02T15:20:26.104591  =

    2023-06-02T15:20:26.107471  / # /lava-965875/bin/lava-test-runner /lava=
-965875/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647a0cf27964c2d50cf5de31

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647a0cf27964c2d50cf5de3a
        failing since 87 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-02T15:38:20.127167  + set +x
    2023-06-02T15:38:20.127403  [   30.781400] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965893_1.6.2.3.1>
    2023-06-02T15:38:20.237349  #
    2023-06-02T15:38:20.339212  / # #export SHELL=3D/bin/sh
    2023-06-02T15:38:20.339741  =

    2023-06-02T15:38:20.441026  / # export SHELL=3D/bin/sh. /lava-965893/en=
vironment
    2023-06-02T15:38:20.441658  =

    2023-06-02T15:38:20.543149  / # . /lava-965893/environment/lava-965893/=
bin/lava-test-runner /lava-965893/1
    2023-06-02T15:38:20.543880  =

    2023-06-02T15:38:20.546578  / # /lava-965893/bin/lava-test-runner /lava=
-965893/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647a0d58b12ec07ad0f5de27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647a0d58b12ec07ad0f5de30
        failing since 87 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-02T15:39:57.047290  + set +x
    2023-06-02T15:39:57.047483  [   28.236833] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965900_1.6.2.3.1>
    2023-06-02T15:39:57.156006  #
    2023-06-02T15:39:57.258095  / # #export SHELL=3D/bin/sh
    2023-06-02T15:39:57.258560  =

    2023-06-02T15:39:57.360056  / # export SHELL=3D/bin/sh. /lava-965900/en=
vironment
    2023-06-02T15:39:57.360519  =

    2023-06-02T15:39:57.461776  / # . /lava-965900/environment/lava-965900/=
bin/lava-test-runner /lava-965900/1
    2023-06-02T15:39:57.462356  =

    2023-06-02T15:39:57.465283  / # /lava-965900/bin/lava-test-runner /lava=
-965900/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647a0dcf6e83b0db01f5de32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647a0dcf6e83b0db01f5de3b
        failing since 87 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-02T15:41:46.275429  + set +x
    2023-06-02T15:41:46.275611  [   32.325382] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965905_1.6.2.3.1>
    2023-06-02T15:41:46.385059  #
    2023-06-02T15:41:46.486674  / # #export SHELL=3D/bin/sh
    2023-06-02T15:41:46.486968  =

    2023-06-02T15:41:46.588131  / # export SHELL=3D/bin/sh. /lava-965905/en=
vironment
    2023-06-02T15:41:46.588508  =

    2023-06-02T15:41:46.689733  / # . /lava-965905/environment/lava-965905/=
bin/lava-test-runner /lava-965905/1
    2023-06-02T15:41:46.690299  =

    2023-06-02T15:41:46.693518  / # /lava-965905/bin/lava-test-runner /lava=
-965905/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647a0e328d453b8fdaf5de7e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647a0e328d453b8fdaf5de87
        failing since 87 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-06-02T15:43:37.966161  + set +x
    2023-06-02T15:43:37.966356  [   27.389306] <LAVA_SIGNAL_ENDRUN 0_dmesg =
965911_1.6.2.3.1>
    2023-06-02T15:43:38.075548  #
    2023-06-02T15:43:38.177446  / # #export SHELL=3D/bin/sh
    2023-06-02T15:43:38.177997  =

    2023-06-02T15:43:38.279361  / # export SHELL=3D/bin/sh. /lava-965911/en=
vironment
    2023-06-02T15:43:38.279867  =

    2023-06-02T15:43:38.381019  / # . /lava-965911/environment/lava-965911/=
bin/lava-test-runner /lava-965911/1
    2023-06-02T15:43:38.381688  =

    2023-06-02T15:43:38.384727  / # /lava-965911/bin/lava-test-runner /lava=
-965911/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647a0befa1da9eac0bf5de2e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/647a0befa1da9eac0bf5de37
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-02T15:33:57.636246  + set[   27.349699] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 965901_1.6.2.3.1>
    2023-06-02T15:33:57.636471   +x
    2023-06-02T15:33:57.748633  #
    2023-06-02T15:33:57.850638  / # #export SHELL=3D/bin/sh
    2023-06-02T15:33:57.851091  =

    2023-06-02T15:33:57.952346  / # export SHELL=3D/bin/sh. /lava-965901/en=
vironment
    2023-06-02T15:33:57.952787  =

    2023-06-02T15:33:58.054066  / # . /lava-965901/environment/lava-965901/=
bin/lava-test-runner /lava-965901/1
    2023-06-02T15:33:58.054648  =

    2023-06-02T15:33:58.057790  / # /lava-965901/bin/lava-test-runner /lava=
-965901/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647a0e283b9a3403d1f5de26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baselin=
e-nfs-kontron-kswitch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baselin=
e-nfs-kontron-kswitch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/647a0e283b9a3403d=
1f5de27
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f774e93beb62c3f5de32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f774e93beb62c3f5de3b
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:06:34.303741  [   15.810461] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10565857_1.5.2.3.1>

    2023-06-02T14:06:34.418590  / # #

    2023-06-02T14:06:34.521132  export SHELL=3D/bin/sh

    2023-06-02T14:06:34.521947  #

    2023-06-02T14:06:34.623571  / # export SHELL=3D/bin/sh. /lava-10565857/=
environment

    2023-06-02T14:06:34.624422  =


    2023-06-02T14:06:34.726006  / # . /lava-10565857/environment/lava-10565=
857/bin/lava-test-runner /lava-10565857/1

    2023-06-02T14:06:34.727198  =


    2023-06-02T14:06:34.732509  / # /lava-10565857/bin/lava-test-runner /la=
va-10565857/1

    2023-06-02T14:06:34.841969  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6479f98d1f8cf49d4ff5de38

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-02-v6.4-rc4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6479f98d1f8cf49d4ff5de41
        failing since 63 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-06-02T14:15:23.660751  <8>[   18.088095] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10565994_1.5.2.3.1>

    2023-06-02T14:15:23.766169  / # #

    2023-06-02T14:15:23.868543  export SHELL=3D/bin/sh

    2023-06-02T14:15:23.869273  #

    2023-06-02T14:15:23.970801  / # export SHELL=3D/bin/sh. /lava-10565994/=
environment

    2023-06-02T14:15:23.971480  =


    2023-06-02T14:15:24.072959  / # . /lava-10565994/environment/lava-10565=
994/bin/lava-test-runner /lava-10565994/1

    2023-06-02T14:15:24.074202  =


    2023-06-02T14:15:24.079157  / # /lava-10565994/bin/lava-test-runner /la=
va-10565994/1

    2023-06-02T14:15:24.184558  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =20
