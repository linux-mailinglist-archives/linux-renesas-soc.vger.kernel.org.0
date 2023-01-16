Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F31566CE88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 19:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbjAPSOI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 13:14:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234394AbjAPSN2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 13:13:28 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63853C2B3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 09:59:18 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id q23-20020a17090a065700b002290913a521so12360773pje.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 09:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WiTUDiyurN0DEOChlynmqMKFYMJH3Rfsbdx+uFbRWys=;
        b=vLsNpTYnG2CjZOc0FqCq/kn+sGsll1q1MmQ4NmeWsxbFdsxu2eyqYrUNQYUDpxgtKv
         WDYB7mzpFfcRiQ5TBiUuwXJsSE7jlxTZFoV2iJ4OO9FBaRz/FgjhI+eMsWHy1FZ1Nexc
         k/YtlNHwqIlonj4IjgThqsab2SeGgkFk7OFcPMzJHCjNNzbIX+fykgsZPDHDzH/5B7db
         WD9y4Fol6L58VPoT3fTS4SgSQQIOMB6C76AZYprNC2RKLej6+32WIIYxXd0qJRObBSNj
         80VQPdbe7IRORQyZsRZPsTgTnlQWZuwJzvjYSe7lJP6ru3ktz76laMQRBrN+LzHIxIgQ
         gwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiTUDiyurN0DEOChlynmqMKFYMJH3Rfsbdx+uFbRWys=;
        b=Hn5+N2hgeHNrLkavzDQ5xn0iXSWUBB6NTTMDwItUyqaUPjWK5dvyQAX19SwB+3IBj1
         W2ul38Lrv+v2tjlMZXq1bnP80Izbnmjb6se/73pTI+cDLMk4wq4tYYmF0+ag31WzEJTM
         xcaQeI1JgAiPxE5fi97Buui0JHwYGcmOt4XPWgd9389bnSF3DuqIs1ZH05qqfmXCTtF0
         6NbB0jWXDTDiIocX0aL1x9iRCgtpEYEC2LISOJHgxaQ+IueWVDFoa+lvEV15AKjP4DoV
         qSNEed+NEUuaGXcVc2e6u0x2pWxTyyHnLsYSHdpa1JBiOFKvEwD/d72mxCLBsCA2FeaA
         CpwA==
X-Gm-Message-State: AFqh2kqlEkbMHkBsQioJc5A6B3W5uAQSdy5cNJKZvG5aV1eUDT/TlQ+Q
        L8WCnnj0i277c6EGep6RFyjxzi+27iJHuPxyFnH+Iw==
X-Google-Smtp-Source: AMrXdXs6kmYFp1MVvTrAPXSAUsBc6fG/KT1P1BMvyzXaZMhKsq1EjlEnxwa3oz2TWeGf5NFALvLAcA==
X-Received: by 2002:a17:902:f304:b0:194:6e8d:89af with SMTP id c4-20020a170902f30400b001946e8d89afmr475523ple.27.1673891957848;
        Mon, 16 Jan 2023 09:59:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902d4c800b001948af092d0sm3378622plg.152.2023.01.16.09.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 09:59:17 -0800 (PST)
Message-ID: <63c59075.170a0220.c583c.501f@mx.google.com>
Date:   Mon, 16 Jan 2023 09:59:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-01-16-v6.2-rc4
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 77 runs,
 6 regressions (renesas-devel-2023-01-16-v6.2-rc4)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 77 runs, 6 regressions (renesas-devel-2023-01-=
16-v6.2-rc4)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+crypto    | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+ima       | 1          =

imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx6q-udoo               | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | renesas_def=
config            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-01-16-v6.2-rc4/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-01-16-v6.2-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      53f1d973ba5f7b61d0a8b15648e089f267b79e10 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c557f1733a6683241d39f6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63c557f1733a6683241d39fb
        new failure (last pass: renesas-devel-2023-01-12-v6.2-rc3)

    2023-01-16T13:57:44.069745  + set[   27.096849] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 880520_1.6.2.3.1>
    2023-01-16T13:57:44.069917   +x
    2023-01-16T13:57:44.183444  / # #
    2023-01-16T13:57:44.285023  export SHELL=3D/bin/sh
    2023-01-16T13:57:44.285489  #
    2023-01-16T13:57:44.386810  / # export SHELL=3D/bin/sh. /lava-880520/en=
vironment
    2023-01-16T13:57:44.387344  =

    2023-01-16T13:57:44.488627  / # . /lava-880520/environment/lava-880520/=
bin/lava-test-runner /lava-880520/1
    2023-01-16T13:57:44.489274  =

    2023-01-16T13:57:44.492543  / # /lava-880520/bin/lava-test-runner /lava=
-880520/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c55982cabaf5bc0f1d3a0f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63c55982cabaf5bc0f1d3a14
        new failure (last pass: renesas-devel-2023-01-12-v6.2-rc3)

    2023-01-16T14:04:27.507367  + set[   28.235704] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 880527_1.6.2.3.1>
    2023-01-16T14:04:27.507594   +x
    2023-01-16T14:04:27.615503  / # #
    2023-01-16T14:04:27.717349  export SHELL=3D/bin/sh
    2023-01-16T14:04:27.718041  #
    2023-01-16T14:04:27.819312  / # export SHELL=3D/bin/sh. /lava-880527/en=
vironment
    2023-01-16T14:04:27.819822  =

    2023-01-16T14:04:27.921075  / # . /lava-880527/environment/lava-880527/=
bin/lava-test-runner /lava-880527/1
    2023-01-16T14:04:27.921876  =

    2023-01-16T14:04:27.924576  / # /lava-880527/bin/lava-test-runner /lava=
-880527/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63c55a4a30d95243041d39d3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/63c55a4a30d95243041d39d8
        new failure (last pass: renesas-devel-2023-01-12-v6.2-rc3)

    2023-01-16T14:07:44.140482  + set[   28.432370] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 880531_1.6.2.3.1>
    2023-01-16T14:07:44.140721   +x
    2023-01-16T14:07:44.248174  / # #
    2023-01-16T14:07:44.349967  export SHELL=3D/bin/sh
    2023-01-16T14:07:44.350634  #
    2023-01-16T14:07:44.451950  / # export SHELL=3D/bin/sh. /lava-880531/en=
vironment
    2023-01-16T14:07:44.452569  =

    2023-01-16T14:07:44.554091  / # . /lava-880531/environment/lava-880531/=
bin/lava-test-runner /lava-880531/1
    2023-01-16T14:07:44.555096  =

    2023-01-16T14:07:44.558082  / # /lava-880531/bin/lava-test-runner /lava=
-880531/1 =

    ... (11 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-udoo              | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c560fa617fc985201d3a05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63c560fa617fc9852=
01d3a06
        failing since 3 days (last pass: renesas-devel-2023-01-09-v6.2-rc3,=
 first fail: renesas-devel-2023-01-12-v6.2-rc3) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-udoo               | arm   | lab-broonie     | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c561b0bc2a8fafbb1d39fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-nfs-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63c561b0bc2a8fafb=
b1d39fc
        failing since 3 days (last pass: renesas-devel-2023-01-09-v6.2-rc3,=
 first fail: renesas-devel-2023-01-12-v6.2-rc3) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-10   | renesas_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/63c5579995674fd3331d39eb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-01-16-v6.2-rc4/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230109.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/63c55799956=
74fd3331d39f4
        new failure (last pass: renesas-devel-2023-01-12-v6.2-rc3)
        1 lines

    2023-01-16T13:56:20.752508  kern  :emerg : Disabling IRQ #35
    2023-01-16T13:56:21.016603  <8>[   45.279608] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =20
