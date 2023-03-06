Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7296ACC90
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Mar 2023 19:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjCFSaM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 13:30:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjCFSaA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 13:30:00 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A092E30195
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 10:29:45 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id bo22so10699373pjb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Mar 2023 10:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678127385;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz1dEo6LfRzdONAn0snReVx+mSFX/pUv7u5qFo0kXG0=;
        b=Zz+RtXmW/pUqr2wRXvEtdq1qWtuUfd/BoEATOrK4UuulBAVVNpacvUhfMDP1LKnWm0
         cn04oGXTEzTwOeMxqMCZXc0iq8zE6ldmwfk4elf5vPl+17BuLY7k561sCQayFjgphRsO
         Qn9j19DLF9Vh+0uGyMTjVfmubOA1glXaml4E3IwPepmf88ZrMODKS7Kl3iibdZtDtYlm
         ZtHNWAQylRsY2KXTECp4u2qgOvWTlbrK79B8HcZ2TAg2lhu9p2ikusgJCkD0QgENwfcu
         eTuWf/BxfNF7i1RtDCO+2kCp7MTjovCTFAiLnMOTJ7x6iIfT9Md1CeBtHM+9OWu20Mhw
         o81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678127385;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kz1dEo6LfRzdONAn0snReVx+mSFX/pUv7u5qFo0kXG0=;
        b=1QLk/lUYsvzN31pvk2jZxJZJI0JMohK2VbEBaN8uX5zIUREffVzfJT/HV2rFvTYcNT
         pIi7/yv1+2zCbi3NxFVpti5gC51jFMSNiV36zX7SdYBdzh5MCCYHOXydlsVivj4YCkW4
         fMV0jtsHcKhB/+vgtpxHWxBZRKSdcA+6LWNw8D1dvD1SYwXve1eFLBbsYi+bX7VVPh8d
         f5Ppt59N5/YIrzr0hhXqXFfdzQWlAeoBisN3POQMh6TQND7nzD0GMH2jDqOYvyWQkkM4
         Uu3Gr7FzOleMk0CWkGMWwauQ9myPV0cKFR5EIXAVVw0zPHWAKyjr4fQAqwVmunoCAqFX
         nCjA==
X-Gm-Message-State: AO0yUKW2RtvW+DHNrex+ymw8xXv+jHPUqsmXlNqbdy9uPgFoUwuQegs/
        J3tlkvfxQCzyZbXAxvnwjdt7EDvR4Vaqgi2bor61IQ==
X-Google-Smtp-Source: AK7set+X97WXDo0NQ4lJysNn333/MQA81UF1SynDR+6wg51hxqnvJYBx8j5jIpi3yeocO4v45kw+6g==
X-Received: by 2002:a17:902:b612:b0:19c:f476:4793 with SMTP id b18-20020a170902b61200b0019cf4764793mr9757808pls.51.1678127384652;
        Mon, 06 Mar 2023 10:29:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bd6-20020a170902830600b00198e397994bsm7016327plb.136.2023.03.06.10.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 10:29:44 -0800 (PST)
Message-ID: <64063118.170a0220.c2fbc.c4f1@mx.google.com>
Date:   Mon, 06 Mar 2023 10:29:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-03-06-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 121 runs,
 22 regressions (renesas-next-2023-03-06-v6.3-rc1)
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

renesas/next baseline-nfs: 121 runs, 22 regressions (renesas-next-2023-03-0=
6-v6.3-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dove-cubox                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

dove-cubox                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

dove-cubox                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

dove-cubox                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-03-06-v6.3-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-03-06-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f8f70cfd66498277779fd34bd2266ea83ce3944b =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6405f78945f343c7d88c866d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6405f78945f343c7d88c8676
        failing since 52 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1)

    2023-03-06T14:23:53.890138  + set +x

    2023-03-06T14:23:53.896388  <8>[   22.975801] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9452442_1.5.2.3.1>

    2023-03-06T14:23:54.001787  / # #

    2023-03-06T14:23:54.102837  export SHELL=3D/bin/sh

    2023-03-06T14:23:54.103149  #

    2023-03-06T14:23:54.204036  / # export SHELL=3D/bin/sh. /lava-9452442/e=
nvironment

    2023-03-06T14:23:54.204288  =


    2023-03-06T14:23:54.305177  / # . /lava-9452442/environment/lava-945244=
2/bin/lava-test-runner /lava-9452442/1

    2023-03-06T14:23:54.305477  =


    2023-03-06T14:23:54.309967  / # /lava-9452442/bin/lava-test-runner /lav=
a-9452442/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dove-cubox                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6405faa43c8b2d4ec58c8676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-nfs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-nfs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405faa43c8b2d4ec=
58c8677
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dove-cubox                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6405fb8129d6a51a2c8c86fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
nfs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
nfs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405fb8129d6a51a2=
c8c86fe
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dove-cubox                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64060135efd8a4db128c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-nfs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-nfs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64060135efd8a4db1=
28c864e
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dove-cubox                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64060211307bcab45f8c8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64060211307bcab45=
f8c8661
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6405f9a2c9981daf6e8c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405f9a2c9981daf6=
e8c8641
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6405fa6978dbdfb3088c8670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405fa6978dbdfb30=
88c8671
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6405fb0a379abc1b688c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405fb0a379abc1b6=
88c8645
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6405fd4d491508fdd28c863c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6405fd4d491508fdd28c8645
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1)

    2023-03-06T14:48:19.001565  + set[   27.485010] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 916804_1.6.2.3.1>
    2023-03-06T14:48:19.001770   +x
    2023-03-06T14:48:19.111609  #
    2023-03-06T14:48:19.213374  / # #export SHELL=3D/bin/sh
    2023-03-06T14:48:19.213829  =

    2023-03-06T14:48:19.315163  / # export SHELL=3D/bin/sh. /lava-916804/en=
vironment
    2023-03-06T14:48:19.315550  =

    2023-03-06T14:48:19.416910  / # . /lava-916804/environment/lava-916804/=
bin/lava-test-runner /lava-916804/1
    2023-03-06T14:48:19.417430  =

    2023-03-06T14:48:19.420695  / # /lava-916804/bin/lava-test-runner /lava=
-916804/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6405fdb1af1e4dc7238c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405fdb1af1e4dc72=
38c8642
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6405fe6698d6b962748c866d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405fe6698d6b9627=
48c866e
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6405fa7d78dbdfb3088c8712

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405fa7d78dbdfb30=
88c8713
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6405fb09574037d4018c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405fb09574037d40=
18c863f
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6405fd9c604236ff948c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405fd9c604236ff9=
48c8654
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6405fe6598d6b962748c866a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-nfs-=
imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6405fe6598d6b9627=
48c866b
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6405f9f052c91937238c864e

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/6405f9f052c91937238c86a2
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1)

    2023-03-06T14:33:59.607181  /lava-9452585/1/../bin/lava-test-case

    2023-03-06T14:33:59.633588  <8>[   36.435019] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/6405f9f052c91937238c86f4
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1)

    2023-03-06T14:33:54.273776  /lava-9452585/1/../bin/lava-test-case

    2023-03-06T14:33:54.300500  <8>[   31.101918] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/6405f9f052c91937238c86f5
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1)

    2023-03-06T14:33:53.204415  /lava-9452585/1/../bin/lava-test-case

    2023-03-06T14:33:53.232340  <8>[   30.033701] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6405fa284cc7f531918c863d

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/6405fa284cc7f531918c86df
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1)

    2023-03-06T14:34:30.940400  /lava-9452569/1/../bin/lava-test-case

    2023-03-06T14:34:30.976523  <8>[   30.549288] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/6405fa284cc7f531918c86f8
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1)

    2023-03-06T14:34:33.122052  /lava-9452569/1/../bin/lava-test-case

    2023-03-06T14:34:33.156251  <8>[   32.728780] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/6405fa284cc7f531918c86f9
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1)

    2023-03-06T14:34:32.029398  /lava-9452569/1/../bin/lava-test-case

    2023-03-06T14:34:32.068248  <8>[   31.641298] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64060ba56bc199312b8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-06-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64060ba56bc199312=
b8c863e
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =20
