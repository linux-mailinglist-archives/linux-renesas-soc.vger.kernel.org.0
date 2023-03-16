Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E156BDAA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 22:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjCPVNj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 17:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjCPVNi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 17:13:38 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82898C48BC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 14:13:35 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so2928107pjg.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 14:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679001214;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GWCGGCce7YEE5+Am2xDYqdWvGi0h4bhGrxaTRke/vyQ=;
        b=xOvEKAiW0xiDrzQh0FjjerNCZamccvmN4LcGpnOuM55GTWnIngGHW9eYDlG1u6YrHv
         BNIKDqzqKvothWaxfZ8y4g/E2shIabPcyeCnd+mhnkr+6XRceYKYMWagFbcKzz8jjoPH
         5agioZogYN82ZfkxpKoaDhrfI25yt/GiUssc8QXa16WVkWFrrRDxST3tEUXE/WhNAKGi
         rY1W9zaAbNsGtxC5oYzs9Us9ex2VFTFkxxZCB7WVz0FF8YT46oA5Rp1YXVU2nf5sCNZW
         sssOLnYsvwV/EZy5hROarwipnJDCnD6Lqag0P5YI1Nqhxlo+R+QZ4EV4ku+sSRXeNIKl
         //sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679001214;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWCGGCce7YEE5+Am2xDYqdWvGi0h4bhGrxaTRke/vyQ=;
        b=6+11JVR320taMgLQDZpD4mlP93OC6oQnR+hFA+A+7SLhlsp2460Hk5mfGx9jUq+qkT
         H1qmLJsNfcX10vg3Ej9RFiLJhQuIdkZbfRABycSw249RyJGR6RsxTiNpmgYyPdNzyacZ
         IFrJB979moCn9+Nlyf35g7v8TryKRN3NJteifAzDoshMZCTUFGeItkSLdwy05Bor3MFd
         ApHSWdGxu11udJMXUZrhiHARwOLJkyHxGU9kqXGrWbbQi44gyclaFezkVmPooVKcaq3m
         bM99b7mCfQRZjAiOcFIaA1WyoHZ2hm/zPauDJW5pR73wbB+wghvvo13cHgQ4IEhK7EOG
         Okyw==
X-Gm-Message-State: AO0yUKU1yT/zKF4AlmvpB4/vXjPbmzoy71WkDxV+Vbt236oEwt3lSA8K
        93hHXy9wZDGyg71llIpOYKF91sryMge2e9tK9UEhy3+5
X-Google-Smtp-Source: AK7set9jE+r1kkoRZeSX6c56EvPw8NbQVxSKzGOMjJu2XB//s2Y31z+EHQAknLWKqJZZDJl2sPdvfA==
X-Received: by 2002:a17:902:db10:b0:19d:1474:2ba4 with SMTP id m16-20020a170902db1000b0019d14742ba4mr5639252plx.32.1679001214289;
        Thu, 16 Mar 2023 14:13:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902900800b0019a88c1cf63sm135284plp.180.2023.03.16.14.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:13:33 -0700 (PDT)
Message-ID: <6413867d.170a0220.54119.0727@mx.google.com>
Date:   Thu, 16 Mar 2023 14:13:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-03-16-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 155 runs,
 20 regressions (renesas-next-2023-03-16-v6.3-rc1)
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

renesas/next baseline-nfs: 155 runs, 20 regressions (renesas-next-2023-03-1=
6-v6.3-rc1)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

juno-uboot                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-03-16-v6.3-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-03-16-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8184e7e383be876199a3be519c067b40143d8ab8 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64134db1fcb7a3345d8c863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64134db1fcb7a3345d8c8643
        failing since 62 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1)

    2023-03-16T17:10:52.586669  <8>[   19.788653] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-03-16T17:10:52.589052  + set +x

    2023-03-16T17:10:52.594882  <8>[   19.799346] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9654959_1.5.2.3.1>

    2023-03-16T17:10:52.701909  / #

    2023-03-16T17:10:52.805419  # #export SHELL=3D/bin/sh

    2023-03-16T17:10:52.806378  =


    2023-03-16T17:10:52.908341  / # export SHELL=3D/bin/sh. /lava-9654959/e=
nvironment

    2023-03-16T17:10:52.908682  =


    2023-03-16T17:10:53.009569  / # . /lava-9654959/environment/lava-965495=
9/bin/lava-test-runner /lava-9654959/1

    2023-03-16T17:10:53.009931  =

 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64134bc334932fd6858c8668

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/amd64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/64134bc3349=
32fd6858c866b
        failing since 5 days (last pass: renesas-next-2023-03-06-v6.3-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1)
        3 lines

    2023-03-16T17:02:38.418999  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-03-16T17:02:38.425605  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-03-16T17:02:38.432098  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-03-16T17:02:38.464273  <8>[   26.657915] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
juno-uboot                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64135e844a3fe3fc6f8c8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-juno=
-uboot.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-juno=
-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64135e844a3fe3fc6=
f8c8639
        failing since 50 days (last pass: renesas-next-2022-12-26-v6.2-rc1,=
 first fail: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64134e16f8648be3e08c8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-nfs-ko=
ntron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-nfs-ko=
ntron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64134e16f8648be3e=
08c8661
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/641350d237a8341e9e8c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/641350d237a8341e9=
e8c8652
        failing since 5 days (last pass: renesas-next-2023-01-24-v6.2-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64135260db6b0650428c86c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-nfs-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-nfs-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64135260db6b06504=
28c86c6
        failing since 5 days (last pass: renesas-next-2023-01-30-v6.2-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/641353d8875fb0de168c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-kont=
ron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-kont=
ron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/641353d8875fb0de1=
68c8630
        failing since 5 days (last pass: renesas-next-2023-01-24-v6.2-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64135c21e72db9c76b8c866b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-nfs-k=
ontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-nfs-k=
ontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64135c21e72db9c76=
b8c866c
        failing since 5 days (last pass: renesas-next-2023-01-30-v6.2-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/64134e190ec11746578c862f

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/64134e190ec11746578c867d
        failing since 5 days (last pass: renesas-next-2023-01-30-v6.2-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-16T17:12:46.876082  /lava-9654868/1/../bin/lava-test-case

    2023-03-16T17:12:46.898887  [   36.761012] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/64134e1a0ec11746578c86cd
        failing since 5 days (last pass: renesas-next-2023-01-30-v6.2-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-16T17:12:41.702947  /lava-9654868/1/../bin/lava-test-case

    2023-03-16T17:12:41.730043  [   31.592154] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/64134e1a0ec11746578c86ce
        failing since 5 days (last pass: renesas-next-2023-01-30-v6.2-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-16T17:12:40.610097  /lava-9654868/1/../bin/lava-test-case

    2023-03-16T17:12:40.636694  [   30.498419] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64134fba458b9a1cbf8c8631

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/64134fba458b9a1cbf8c867c
        failing since 10 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-16T17:19:28.200719  /lava-9655389/1/../bin/lava-test-case

    2023-03-16T17:19:28.224917  <8>[   36.268915] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/64134fba458b9a1cbf8c86cc
        failing since 10 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-16T17:19:23.011148  /lava-9655389/1/../bin/lava-test-case

    2023-03-16T17:19:23.033719  <8>[   31.078049] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/64134fba458b9a1cbf8c86cd
        failing since 10 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-16T17:19:21.956288  /lava-9655389/1/../bin/lava-test-case

    2023-03-16T17:19:21.982507  <8>[   30.026829] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/64134d8fcbcd5fb3ea8c8686

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/64134d8fcbcd5fb3ea8c86ff
        failing since 5 days (last pass: renesas-next-2023-01-30-v6.2-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-16T17:09:54.031338  /lava-9654858/1/../bin/lava-test-case

    2023-03-16T17:09:54.059466  [   30.141856] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/64134d8fcbcd5fb3ea8c872d
        failing since 5 days (last pass: renesas-next-2023-01-30-v6.2-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-16T17:09:56.180807  /lava-9654858/1/../bin/lava-test-case

    2023-03-16T17:09:56.208516  [   32.290852] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/64134d8fcbcd5fb3ea8c872e
        failing since 5 days (last pass: renesas-next-2023-01-30-v6.2-rc1, =
first fail: renesas-next-2023-03-10-v6.3-rc1)

    2023-03-16T17:09:55.104364  /lava-9654858/1/../bin/lava-test-case

    2023-03-16T17:09:55.133821  [   31.215858] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64134fe7363e6634998c863a

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-16-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230310.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/64134fe7363e6634998c86f0
        failing since 10 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-16T17:19:57.834437  /lava-9655351/1/../bin/lava-test-case

    2023-03-16T17:19:57.861497  [   32.287138] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/64134fe7363e6634998c86f1
        failing since 10 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-16T17:19:56.765576  /lava-9655351/1/../bin/lava-test-case

    2023-03-16T17:19:56.790336  [   31.215655] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/64134fe7363e6634998c86f2
        failing since 10 days (last pass: renesas-next-2023-01-24-v6.2-rc1,=
 first fail: renesas-next-2023-03-06-v6.3-rc1)

    2023-03-16T17:19:55.691771  /lava-9655351/1/../bin/lava-test-case

    2023-03-16T17:19:55.721071  [   30.146433] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =20
