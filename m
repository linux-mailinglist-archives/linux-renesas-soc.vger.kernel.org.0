Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEBA6EACEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 16:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbjDUOaC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 10:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbjDUOaB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 10:30:01 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119E393CA
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 07:29:47 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a6bc48aec8so18626985ad.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682087386; x=1684679386;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VrL8VAGql7CtQq6xbwJeAWUGfBqf9GCH0SUi0ZDhvVw=;
        b=v1ezFcNsEsutShbaJ5KgEsYUhp48wWwV+mGBTnm3mcrWvI33QbbbjSAqktgeYf0lpT
         8XNxmbCT9FciDOHbeTQO7kggN1ntPXKCy0RZHAhCVAVkMOW1c+zEybuYb86/ak34NDti
         ZMkdVk6xDh/526obRr8D7x7+F+601tHaRry8vfR+xmyYYtF0R7qr1JaNsQarbvo37XKb
         d47Truq8Hb/7QUaZ57WJSul71M2/d/nXyzBLo0n18iVSXgd5kc7wGt+gFx2DGGI/YifJ
         JtCTrPouNoAx7BEjbbl9GHgouyM26zhqN8wC8UqEF67GxWCBYNEY2oH0RTFr/b2q8ylb
         TI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087386; x=1684679386;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrL8VAGql7CtQq6xbwJeAWUGfBqf9GCH0SUi0ZDhvVw=;
        b=OYTx9cRqV/6GuoPgvo+swDmj3tsQvO71+2AeOzNRXczLZZL7SjCwTFHwTHG6uySFNN
         q1VSQ2e5PudAjbmEr9yFLrXXG8CD99CLdz5vFBEIWqQJUgbcgyveIfffY0p5hOMMZMtU
         rc0qEkWnXgq6h47zE+ccbLYoznVSrzQs5G2H5pNTvWJoRISMGMF5TjczmALXViaRrOSt
         tq0MhBLwRq2eWMD9hcV4wVw4aK5k+OMf1yE+GPDcqz2AacUURgYbL+LvEvDaWxjZvgeY
         8/Co6amWdbAcV/TMHGrv420GBbRTcw4BhZBCRcJ22r7Im4ljFaITpsnOVpVof/Bdsajy
         JxoQ==
X-Gm-Message-State: AAQBX9e4oP1cQQGxVEsxD+eU5x5o/o+Sh6/lXyPSdVRIsJOT/nnS4G3V
        UEBigVWA7+CUfB+9LviGBuMiz1o3/ayiIlPJB7VBydQq
X-Google-Smtp-Source: AKy350baFzCpmF5s79COvZ75+qT0mkDmlPHNMgaKnb3Ik7lePr2jK/cVB56eaxBoxfUV5WAEHxoCEg==
X-Received: by 2002:a17:902:d2c4:b0:1a6:91f0:f806 with SMTP id n4-20020a170902d2c400b001a691f0f806mr5769458plc.58.1682087385305;
        Fri, 21 Apr 2023 07:29:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bf9-20020a170902b90900b0019f9fd10f62sm2857927plb.70.2023.04.21.07.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:29:44 -0700 (PDT)
Message-ID: <64429dd8.170a0220.b5636.5ff9@mx.google.com>
Date:   Fri, 21 Apr 2023 07:29:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-04-21-v6.3-rc7
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 159 runs,
 37 regressions (renesas-devel-2023-04-21-v6.3-rc7)
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

renesas/master baseline-nfs: 159 runs, 37 regressions (renesas-devel-2023-0=
4-21-v6.3-rc7)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 2          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-04-21-v6.3-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-04-21-v6.3-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      58c481b761fe2bc4936caea1c712d28e30488ef4 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6442661f6585aa00a62e85f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6442661f6585aa00a62e85f7
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:31:49.792516  + set +x

    2023-04-21T10:31:49.799324  [   19.290960] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10073688_1.5.2.3.1>

    2023-04-21T10:31:49.909996  / # #

    2023-04-21T10:31:50.012804  export SHELL=3D/bin/sh

    2023-04-21T10:31:50.013603  #

    2023-04-21T10:31:50.115628  / # export SHELL=3D/bin/sh. /lava-10073688/=
environment

    2023-04-21T10:31:50.115957  =


    2023-04-21T10:31:50.217355  / # . /lava-10073688/environment/lava-10073=
688/bin/lava-test-runner /lava-10073688/1

    2023-04-21T10:31:50.218586  =


    2023-04-21T10:31:50.224079  / # /lava-10073688/bin/lava-test-runner /la=
va-10073688/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644267c6608c2165612e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644267c6608c2165612e85eb
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:38:46.468016  + set +x

    2023-04-21T10:38:46.474969  <8>[   19.987974] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10073923_1.5.2.3.1>

    2023-04-21T10:38:46.585267  / ##

    2023-04-21T10:38:46.688108  export SHELL=3D/bin/sh

    2023-04-21T10:38:46.688907   #

    2023-04-21T10:38:46.790709  / # export SHELL=3D/bin/sh. /lava-10073923/=
environment

    2023-04-21T10:38:46.791062  =


    2023-04-21T10:38:46.892173  / # . /lava-10073923/environment/lava-10073=
923/bin/lava-test-runner /lava-10073923/1

    2023-04-21T10:38:46.892560  =


    2023-04-21T10:38:46.898546  / # /lava-10073923/bin/lava-test-runner /la=
va-10073923/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6442667f4cbb35900a2e85f9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6442667f4cbb35900a2e85fe
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:33:19.034384  + set +x

    2023-04-21T10:33:19.041090  <8>[   20.729770] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10073689_1.5.2.3.1>

    2023-04-21T10:33:19.155887  / # #

    2023-04-21T10:33:19.257001  export SHELL=3D/bin/sh

    2023-04-21T10:33:19.257210  #

    2023-04-21T10:33:19.358201  / # export SHELL=3D/bin/sh. /lava-10073689/=
environment

    2023-04-21T10:33:19.358425  =


    2023-04-21T10:33:19.459385  / # . /lava-10073689/environment/lava-10073=
689/bin/lava-test-runner /lava-10073689/1

    2023-04-21T10:33:19.459729  =


    2023-04-21T10:33:19.464728  / # /lava-10073689/bin/lava-test-runner /la=
va-10073689/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6442662002b2371a662e8665

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6442662002b2371a662e866a
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:31:35.455049  + set +x<8>[   19.167107] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10073682_1.5.2.3.1>

    2023-04-21T10:31:35.455221  =


    2023-04-21T10:31:35.567758  / # #

    2023-04-21T10:31:35.670328  export SHELL=3D/bin/sh

    2023-04-21T10:31:35.671060  #

    2023-04-21T10:31:35.772591  / # export SHELL=3D/bin/sh. /lava-10073682/=
environment

    2023-04-21T10:31:35.773241  =


    2023-04-21T10:31:35.874996  / # . /lava-10073682/environment/lava-10073=
682/bin/lava-test-runner /lava-10073682/1

    2023-04-21T10:31:35.876172  =


    2023-04-21T10:31:35.880851  / # /lava-10073682/bin/lava-test-runner /la=
va-10073682/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6442680c34d90d84be2e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6442680c34d90d84be2e85eb
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:40:03.272546  + set +x[   19.178064] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10073959_1.5.2.3.1>

    2023-04-21T10:40:03.272709  =


    2023-04-21T10:40:03.379007  / # #

    2023-04-21T10:40:03.479989  export SHELL=3D/bin/sh

    2023-04-21T10:40:03.480260  #

    2023-04-21T10:40:03.581244  / # export SHELL=3D/bin/sh. /lava-10073959/=
environment

    2023-04-21T10:40:03.581489  =


    2023-04-21T10:40:03.682335  / # . /lava-10073959/environment/lava-10073=
959/bin/lava-test-runner /lava-10073959/1

    2023-04-21T10:40:03.682641  =


    2023-04-21T10:40:03.687027  / # /lava-10073959/bin/lava-test-runner /la=
va-10073959/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6442662d247fc870482e861f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6442662d247fc870482e8624
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:31:46.957001  + set +x

    2023-04-21T10:31:46.963747  <8>[   18.198726] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10073676_1.5.2.3.1>

    2023-04-21T10:31:47.071993  / # #

    2023-04-21T10:31:47.174643  export SHELL=3D/bin/sh

    2023-04-21T10:31:47.175377  #

    2023-04-21T10:31:47.277221  / # export SHELL=3D/bin/sh. /lava-10073676/=
environment

    2023-04-21T10:31:47.278033  =


    2023-04-21T10:31:47.379945  / # . /lava-10073676/environment/lava-10073=
676/bin/lava-test-runner /lava-10073676/1

    2023-04-21T10:31:47.381104  =


    2023-04-21T10:31:47.386242  / # /lava-10073676/bin/lava-test-runner /la=
va-10073676/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644267ca96d385b6512e869e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644267ca96d385b6512e86a3
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:38:43.251569  [   19.029175] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10073953_1.5.2.3.1>

    2023-04-21T10:38:43.254848  + set +x

    2023-04-21T10:38:43.363228  / # #

    2023-04-21T10:38:43.465932  export SHELL=3D/bin/sh

    2023-04-21T10:38:43.466779  #

    2023-04-21T10:38:43.568927  / # export SHELL=3D/bin/sh. /lava-10073953/=
environment

    2023-04-21T10:38:43.569721  =


    2023-04-21T10:38:43.671789  / # . /lava-10073953/environment/lava-10073=
953/bin/lava-test-runner /lava-10073953/1

    2023-04-21T10:38:43.673049  =


    2023-04-21T10:38:43.678320  / # /lava-10073953/bin/lava-test-runner /la=
va-10073953/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/644266374e887920c52e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/644266374e887920c=
52e85fc
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64426634e1bd240b9f2e8664

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64426634e1bd240b9f2e8669
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:31:48.209424  + <8>[   18.481746] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10073715_1.5.2.3.1>

    2023-04-21T10:31:48.210025  set +x

    2023-04-21T10:31:48.317442  / # #

    2023-04-21T10:31:48.420357  export SHELL=3D/bin/sh

    2023-04-21T10:31:48.421219  #

    2023-04-21T10:31:48.523097  / # export SHELL=3D/bin/sh. /lava-10073715/=
environment

    2023-04-21T10:31:48.523883  =


    2023-04-21T10:31:48.625878  / # . /lava-10073715/environment/lava-10073=
715/bin/lava-test-runner /lava-10073715/1

    2023-04-21T10:31:48.627458  =


    2023-04-21T10:31:48.632278  / # /lava-10073715/bin/lava-test-runner /la=
va-10073715/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64426d71a255315d342e8656

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64426d71a255315d342e865b
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T11:02:54.475882  + set +x

    2023-04-21T11:02:54.482595  [   18.479768] <LAVA_SIGNAL_ENDRUN 0_dmesg =
10073941_1.5.2.3.1>

    2023-04-21T11:02:54.587216  / # #

    2023-04-21T11:02:54.689785  export SHELL=3D/bin/sh

    2023-04-21T11:02:54.690603  #

    2023-04-21T11:02:54.792722  / # export SHELL=3D/bin/sh. /lava-10073941/=
environment

    2023-04-21T11:02:54.793521  =


    2023-04-21T11:02:54.895479  / # . /lava-10073941/environment/lava-10073=
941/bin/lava-test-runner /lava-10073941/1

    2023-04-21T11:02:54.896817  =


    2023-04-21T11:02:54.902130  / # /lava-10073941/bin/lava-test-runner /la=
va-10073941/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6442662f247fc870482e862a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6442662f247fc870482e862f
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:31:51.532514  + set +x

    2023-04-21T10:31:51.538707  <8>[   17.318096] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10073669_1.5.2.3.1>

    2023-04-21T10:31:51.643801  / # #

    2023-04-21T10:31:51.744839  export SHELL=3D/bin/sh

    2023-04-21T10:31:51.745026  #

    2023-04-21T10:31:51.845901  / # export SHELL=3D/bin/sh. /lava-10073669/=
environment

    2023-04-21T10:31:51.846148  =


    2023-04-21T10:31:51.947105  / # . /lava-10073669/environment/lava-10073=
669/bin/lava-test-runner /lava-10073669/1

    2023-04-21T10:31:51.947454  =


    2023-04-21T10:31:51.953000  / # /lava-10073669/bin/lava-test-runner /la=
va-10073669/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644269b1cf89fb061c2e861d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644269b1cf89fb061c2e8622
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:46:48.961945  + set +x

    2023-04-21T10:46:48.968566  <8>[   17.841826] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10073958_1.5.2.3.1>

    2023-04-21T10:46:49.076786  / # #

    2023-04-21T10:46:49.178100  export SHELL=3D/bin/sh

    2023-04-21T10:46:49.178750  #

    2023-04-21T10:46:49.280484  / # export SHELL=3D/bin/sh. /lava-10073958/=
environment

    2023-04-21T10:46:49.281120  =


    2023-04-21T10:46:49.382905  / # . /lava-10073958/environment/lava-10073=
958/bin/lava-test-runner /lava-10073958/1

    2023-04-21T10:46:49.384027  =


    2023-04-21T10:46:49.389484  / # /lava-10073958/bin/lava-test-runner /la=
va-10073958/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6442661e02b2371a662e8657

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6442661e02b2371a662e865c
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:31:44.542869  <8>[   17.506227] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10073733_1.5.2.3.1>

    2023-04-21T10:31:44.648377  / # #

    2023-04-21T10:31:44.749508  export SHELL=3D/bin/sh

    2023-04-21T10:31:44.749747  #

    2023-04-21T10:31:44.850719  / # export SHELL=3D/bin/sh. /lava-10073733/=
environment

    2023-04-21T10:31:44.850949  =


    2023-04-21T10:31:44.951928  / # . /lava-10073733/environment/lava-10073=
733/bin/lava-test-runner /lava-10073733/1

    2023-04-21T10:31:44.952248  =


    2023-04-21T10:31:44.956956  / # /lava-10073733/bin/lava-test-runner /la=
va-10073733/1

    2023-04-21T10:31:45.043199  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644267ae5f137e620e2e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644267ae5f137e620e2e85eb
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:38:31.376654  <8>[   15.630883] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10073925_1.5.2.3.1>

    2023-04-21T10:38:31.486437  / # #

    2023-04-21T10:38:31.589455  export SHELL=3D/bin/sh

    2023-04-21T10:38:31.590254  #

    2023-04-21T10:38:31.692165  / # export SHELL=3D/bin/sh. /lava-10073925/=
environment

    2023-04-21T10:38:31.692965  =


    2023-04-21T10:38:31.794882  / # . /lava-10073925/environment/lava-10073=
925/bin/lava-test-runner /lava-10073925/1

    2023-04-21T10:38:31.796157  =


    2023-04-21T10:38:31.801742  / # /lava-10073925/bin/lava-test-runner /la=
va-10073925/1

    2023-04-21T10:38:31.907886  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644266525db13bc0912e861a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/644266525db13bc0912e861f
        failing since 45 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:32:25.799943  + set +x
    2023-04-21T10:32:25.800153  [   27.344087] <LAVA_SIGNAL_ENDRUN 0_dmesg =
933218_1.6.2.3.1>
    2023-04-21T10:32:25.909736  #
    2023-04-21T10:32:26.011724  / # #export SHELL=3D/bin/sh
    2023-04-21T10:32:26.012230  =

    2023-04-21T10:32:26.113543  / # export SHELL=3D/bin/sh. /lava-933218/en=
vironment
    2023-04-21T10:32:26.113987  =

    2023-04-21T10:32:26.215209  / # . /lava-933218/environment/lava-933218/=
bin/lava-test-runner /lava-933218/1
    2023-04-21T10:32:26.215833  =

    2023-04-21T10:32:26.218711  / # /lava-933218/bin/lava-test-runner /lava=
-933218/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64426bca0ecba823352e8615

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64426bca0ecba823352e861a
        failing since 45 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:55:58.411429  + set +x
    2023-04-21T10:55:58.411645  [   29.218366] <LAVA_SIGNAL_ENDRUN 0_dmesg =
933231_1.6.2.3.1>
    2023-04-21T10:55:58.523677  #
    2023-04-21T10:55:58.625619  / # #export SHELL=3D/bin/sh
    2023-04-21T10:55:58.626018  =

    2023-04-21T10:55:58.727182  / # export SHELL=3D/bin/sh. /lava-933231/en=
vironment
    2023-04-21T10:55:58.727626  =

    2023-04-21T10:55:58.828842  / # . /lava-933231/environment/lava-933231/=
bin/lava-test-runner /lava-933231/1
    2023-04-21T10:55:58.829430  =

    2023-04-21T10:55:58.832517  / # /lava-933231/bin/lava-test-runner /lava=
-933231/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64426c420b298afbd82e8716

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64426c420b298afbd82e871b
        failing since 45 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:58:00.011018  + set +x
    2023-04-21T10:58:00.011480  [   28.592847] <LAVA_SIGNAL_ENDRUN 0_dmesg =
933240_1.6.2.3.1>
    2023-04-21T10:58:00.120647  #
    2023-04-21T10:58:00.222721  / # #export SHELL=3D/bin/sh
    2023-04-21T10:58:00.223287  =

    2023-04-21T10:58:00.324635  / # export SHELL=3D/bin/sh. /lava-933240/en=
vironment
    2023-04-21T10:58:00.325139  =

    2023-04-21T10:58:00.426422  / # . /lava-933240/environment/lava-933240/=
bin/lava-test-runner /lava-933240/1
    2023-04-21T10:58:00.427048  =

    2023-04-21T10:58:00.430097  / # /lava-933240/bin/lava-test-runner /lava=
-933240/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64426cbae3de0128e72e864c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64426cbae3de0128e72e8651
        failing since 45 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T11:00:00.669540  + set +x
    2023-04-21T11:00:00.669973  [   30.177974] <LAVA_SIGNAL_ENDRUN 0_dmesg =
933249_1.6.2.3.1>
    2023-04-21T11:00:00.779203  #
    2023-04-21T11:00:00.881162  / # #export SHELL=3D/bin/sh
    2023-04-21T11:00:00.881679  =

    2023-04-21T11:00:00.983013  / # export SHELL=3D/bin/sh. /lava-933249/en=
vironment
    2023-04-21T11:00:00.983577  =

    2023-04-21T11:00:01.084901  / # . /lava-933249/environment/lava-933249/=
bin/lava-test-runner /lava-933249/1
    2023-04-21T11:00:01.085590  =

    2023-04-21T11:00:01.088371  / # /lava-933249/bin/lava-test-runner /lava=
-933249/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64426f1261d8df45fc2e8631

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64426f1261d8df45fc2e8636
        failing since 45 days (last pass: renesas-devel-2023-02-21-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T11:09:57.937370  + set +x
    2023-04-21T11:09:57.937619  [   34.083702] <LAVA_SIGNAL_ENDRUN 0_dmesg =
933267_1.6.2.3.1>
    2023-04-21T11:09:58.048068  #
    2023-04-21T11:09:58.149959  / # #export SHELL=3D/bin/sh
    2023-04-21T11:09:58.150395  =

    2023-04-21T11:09:58.251643  / # export SHELL=3D/bin/sh. /lava-933267/en=
vironment
    2023-04-21T11:09:58.252151  =

    2023-04-21T11:09:58.353444  / # . /lava-933267/environment/lava-933267/=
bin/lava-test-runner /lava-933267/1
    2023-04-21T11:09:58.354184  =

    2023-04-21T11:09:58.357179  / # /lava-933267/bin/lava-test-runner /lava=
-933267/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64426ca6e3de0128e72e85f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64426ca6e3de0128e72e85f9
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7)

    2023-04-21T10:59:32.563540  + set[   28.270910] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 933250_1.6.2.3.1>
    2023-04-21T10:59:32.563720   +x
    2023-04-21T10:59:32.685281  / # #
    2023-04-21T10:59:32.786780  export SHELL=3D/bin/sh
    2023-04-21T10:59:32.787173  #
    2023-04-21T10:59:32.888327  / # export SHELL=3D/bin/sh. /lava-933250/en=
vironment
    2023-04-21T10:59:32.888732  =

    2023-04-21T10:59:32.989986  / # . /lava-933250/environment/lava-933250/=
bin/lava-test-runner /lava-933250/1
    2023-04-21T10:59:32.990553  =

    2023-04-21T10:59:32.993461  / # /lava-933250/bin/lava-test-runner /lava=
-933250/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6442667a312cdc5d582e85f9

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/baseline-nfs-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie=
/baseline-nfs-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.sound-card: https://kernelci.org/test/case/id/64426=
67a312cdc5d582e8602
        failing since 3 days (last pass: renesas-devel-2023-04-10-v6.3-rc6,=
 first fail: renesas-devel-2023-04-17-v6.3-rc7)

    2023-04-21T10:33:13.647704  /lava-366028/1/../bin/lava-test-case
    2023-04-21T10:33:13.685272  <8>[   38.496307] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline-nfs.bootrr.sound-card-probed: https://kernelci.org/test/case/i=
d/6442667a312cdc5d582e8603
        failing since 3 days (last pass: renesas-devel-2023-04-10-v6.3-rc6,=
 first fail: renesas-devel-2023-04-17-v6.3-rc7)

    2023-04-21T10:33:12.580943  /lava-366028/1/../bin/lava-test-case
    2023-04-21T10:33:12.616960  <8>[   37.425836] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64426c8ce3de0128e72e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-kontron/baseline-nfs-kontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-kontron/baseline-nfs-kontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64426c8ce3de0128e=
72e85e7
        new failure (last pass: renesas-devel-2023-04-17-v6.3-rc7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6442662e6585aa00a62e8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collab=
ora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6442662e6585aa00a62e8635
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:31:53.624742  <8>[   18.589346] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10073666_1.5.2.3.1>

    2023-04-21T10:31:53.730088  / # #

    2023-04-21T10:31:53.830939  export SHELL=3D/bin/sh

    2023-04-21T10:31:53.831151  #

    2023-04-21T10:31:53.931899  / # export SHELL=3D/bin/sh. /lava-10073666/=
environment

    2023-04-21T10:31:53.932145  =


    2023-04-21T10:31:54.033092  / # . /lava-10073666/environment/lava-10073=
666/bin/lava-test-runner /lava-10073666/1

    2023-04-21T10:31:54.033373  =


    2023-04-21T10:31:54.038548  / # /lava-10073666/bin/lava-test-runner /la=
va-10073666/1

    2023-04-21T10:31:54.081941  + export TESTRUN_ID=3D1_bootrr
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6442680f34d90d84be2e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab=
-collabora/baseline-nfs-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6442680f34d90d84be2e85f8
        failing since 21 days (last pass: renesas-devel-2023-03-27-v6.3-rc4=
, first fail: renesas-devel-2023-03-30-v6.3-rc4)

    2023-04-21T10:40:02.973815  + set[   18.706410] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10073921_1.5.2.3.1>

    2023-04-21T10:40:02.973931   +x

    2023-04-21T10:40:03.077894  / # #

    2023-04-21T10:40:03.178959  export SHELL=3D/bin/sh

    2023-04-21T10:40:03.179155  #

    2023-04-21T10:40:03.279925  / # export SHELL=3D/bin/sh. /lava-10073921/=
environment

    2023-04-21T10:40:03.280126  =


    2023-04-21T10:40:03.381073  / # . /lava-10073921/environment/lava-10073=
921/bin/lava-test-runner /lava-10073921/1

    2023-04-21T10:40:03.381356  =


    2023-04-21T10:40:03.386329  / # /lava-10073921/bin/lava-test-runner /la=
va-10073921/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/64426910d007a580042e86ab

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/64426910d007a580042e86fb
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:44:18.782024  /lava-10074036/1/../bin/lava-test-case

    2023-04-21T10:44:18.810857  [   37.741737] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/64426910d007a580042e874d
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:44:13.391157  /lava-10074036/1/../bin/lava-test-case

    2023-04-21T10:44:13.413070  [   32.344277] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/64426910d007a580042e874e
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:44:12.303543  /lava-10074036/1/../bin/lava-test-case

    2023-04-21T10:44:12.331536  [   31.262808] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64426c4a58f00f32d82e85ea

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/64426c4a58f00f32d82e867c
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:57:46.264531  /lava-10074256/1/../bin/lava-test-case

    2023-04-21T10:57:46.290129  <8>[   35.943129] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/64426c4a58f00f32d82e8692
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:57:41.079383  /lava-10074256/1/../bin/lava-test-case

    2023-04-21T10:57:41.109942  <8>[   30.762469] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/64426c4a58f00f32d82e8693
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:57:39.988401  /lava-10074256/1/../bin/lava-test-case

    2023-04-21T10:57:40.013301  <8>[   29.666093] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6442693919d7b652b22e8603

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/6442693919d7b652b22e86b4
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:44:44.066815  /lava-10074033/1/../bin/lava-test-case

    2023-04-21T10:44:44.089143  [   30.454076] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/6442693919d7b652b22e86b5
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:44:43.004871  /lava-10074033/1/../bin/lava-test-case

    2023-04-21T10:44:43.032826  [   29.397806] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/6442693919d7b652b22e86bb
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:44:45.134316  /lava-10074033/1/../bin/lava-test-case

    2023-04-21T10:44:45.163594  [   31.528682] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64426c0b0b298afbd82e85e6

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-04-21-v6.3-rc7/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230414.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/64426c0b0b298afbd82e8698
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:56:42.577740  /lava-10074242/1/../bin/lava-test-case

    2023-04-21T10:56:42.605325  <8>[   31.892363] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/64426c0b0b298afbd82e8699
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:56:41.500916  /lava-10074242/1/../bin/lava-test-case

    2023-04-21T10:56:41.529711  <8>[   30.816204] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/64426c0b0b298afbd82e869a
        failing since 45 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-03-06-v6.3-rc1)

    2023-04-21T10:56:40.432461  /lava-10074242/1/../bin/lava-test-case

    2023-04-21T10:56:40.457928  <8>[   29.744789] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =20
