Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F136B5823
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 05:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjCKEMA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 23:12:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjCKEL7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 23:11:59 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7E11CAFB
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 20:11:57 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id ce8-20020a17090aff0800b0023a61cff2c6so9383713pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 20:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678507916;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D4OiKJbxhYP2RGnvf2A2+7/TLN9/ZlODbQ7W26uK4t8=;
        b=UvOMeuQuhiW14EUtS93Tn8TxySWFlDRdcBIbvgY75pNNqukrnIxlfoi5nRNsNmkm1R
         /doqt32zYay3ziYkbXPfSwy3qMI5Nwqbg6+KmfJI8nfur2z6E/Ecxwm65ZOQMx4Dkobs
         IW0jbNgRQrMcl2MdBLu0QoOf5Cee/qRQaDAjKjf55WFSvldz6ps57keKJBJWHesdXqrN
         gBgIxvjBsEBUnP3MLqPfhN2hdZWLyJ7ileuz5POoSJI2It9WCq/tVmK7VBr7VGcVDndv
         QvtbKNnKpGB20dGelZlDsXIcnAtxp1kGQSuEAjti6DKZpJZHlAHcW/Wa3QAqeKvNw2ML
         oNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678507916;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4OiKJbxhYP2RGnvf2A2+7/TLN9/ZlODbQ7W26uK4t8=;
        b=e+e3/bTAar7w6LINij+mZAgiU9mSONiOJidO/nGCXQQq5qhEeD6zvJ61LQ5Uoxo0jo
         9I1zdpI9E36PY86sLfLuCIauUe0qdT1gPOXifrvAisJXDTkvClm4UTu0srmR68/iU4HG
         ySlwecXqkGgSwu4Ibwylc1lybjK1sbgf0PmUNCBaKyV31zAIQ5Yo+/5x9+01MUq3JEhw
         EFiIcPhLGaG/x4yt3/LRpeggzc/4TTlIzBMwVlTCz8B84DFPaAFYint+bqujhvuLlGZp
         5bj9ouhmqI63kV2hnQv6vEH05HesC4FAZYqTbfjL1rEHX1nKCBLSrxpvGJhkyeoNfuBj
         rd5w==
X-Gm-Message-State: AO0yUKVhdHBVmMBEyxFnPu7umheLYkdz7Jgna+Qw78dCl6sz9is92yYW
        mt+TBQbFK0m5egyifDGE9Vfvjtkdq8JvkHdn3l0JIYQ9
X-Google-Smtp-Source: AK7set8tK65mZ8DZt/R1Rw4oMHa94FSah0yWdNeWhE51m+1t2hAiHZBdD+MELpDm1G6rGiUq15j4rg==
X-Received: by 2002:a05:6a21:33a2:b0:cd:97f3:25e1 with SMTP id yy34-20020a056a2133a200b000cd97f325e1mr36438327pzb.51.1678507915720;
        Fri, 10 Mar 2023 20:11:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s26-20020a65645a000000b00503828cc73fsm633541pgv.13.2023.03.10.20.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 20:11:55 -0800 (PST)
Message-ID: <640bff8b.650a0220.954ef.1cc1@mx.google.com>
Date:   Fri, 10 Mar 2023 20:11:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-03-10-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 125 runs,
 16 regressions (renesas-next-2023-03-10-v6.3-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 125 runs, 16 regressions (renesas-next-2023-03-1=
0-v6.3-rc1)

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

at91sam9g20ek                | arm    | lab-broonie   | gcc-10   | at91_dt_=
defconfig            | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+debug              | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+ima                | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-03-10-v6.3-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-03-10-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      cc8231630ee44792603a05386e094432f7415af4 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640bc6fa821863ad968c864e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-nfs-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/amd64/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/640bc6fa821863ad968c8657
        failing since 57 days (last pass: renesas-next-2022-11-21-v6.1-rc1,=
 first fail: renesas-next-2023-01-12-v6.2-rc1)

    2023-03-11T00:10:14.958710  + set +x

    2023-03-11T00:10:14.963342  <8>[   19.861454] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9548531_1.5.2.3.1>

    2023-03-11T00:10:15.069460  =


    2023-03-11T00:10:15.170223  / # #export SHELL=3D/bin/sh

    2023-03-11T00:10:15.170416  =


    2023-03-11T00:10:15.271370  / # export SHELL=3D/bin/sh. /lava-9548531/e=
nvironment

    2023-03-11T00:10:15.271673  =


    2023-03-11T00:10:15.372938  / # . /lava-9548531/environment/lava-954853=
1/bin/lava-test-runner /lava-9548531/1

    2023-03-11T00:10:15.374177  =


    2023-03-11T00:10:15.376952  / # /lava-9548531/bin/lava-test-runner /lav=
a-9548531/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/640bcb5dc3369644018c868e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-nfs-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/amd64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/640bcb5dc33=
69644018c8691
        new failure (last pass: renesas-next-2023-03-06-v6.3-rc1)
        3 lines

    2023-03-11T00:29:01.822498  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-03-11T00:29:01.829088  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-03-11T00:29:01.835262  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-03-11T00:29:01.875244  <8>[  112.221740] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91sam9g20ek                | arm    | lab-broonie   | gcc-10   | at91_dt_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/640bc84e2c9b84d6318c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bc84e2c9b84d63=
18c8641
        new failure (last pass: renesas-next-2023-03-06-v6.3-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/640bd83081508e85fd8c86b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-kont=
ron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-kont=
ron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bd83081508e85f=
d8c86b9
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640bd9bef09b833aba8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-nfs-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-nfs-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bd9bef09b833ab=
a8c8631
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640bdbc62565a5c5f98c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-nfs-k=
ontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-nfs-k=
ontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bdbc62565a5c5f=
98c8637
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640bdde23a009f9c028c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-nfs-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-nfs-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bdde23a009f9c0=
28c8646
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/640bdf4ce4364df07b8c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-nfs-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bdf4ce4364df07=
b8c863b
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/640bdffe5dd54413778c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig/gcc-10/lab-kontron/baseline-nfs-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bdffe5dd544137=
78c8631
        new failure (last pass: renesas-next-2023-01-24-v6.2-rc1) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/640bcb1ed36e5dddb28c863e

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/640bcb1ed36e5dddb28c8692
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1)

    2023-03-11T00:27:46.211710  /lava-9548830/1/../bin/lava-test-case

    2023-03-11T00:27:46.234709  <8>[   37.162209] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/640bcb1ed36e5dddb28c86e4
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1)

    2023-03-11T00:27:40.421140  /lava-9548830/1/../bin/lava-test-case

    2023-03-11T00:27:40.447693  <8>[   31.375071] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/640bcb1ed36e5dddb28c86e5
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1)

    2023-03-11T00:27:39.377766  /lava-9548830/1/../bin/lava-test-case

    2023-03-11T00:27:39.403014  <8>[   30.331006] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/640bcb34623967d5fa8c864e

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/640bcb34623967d5fa8c8704
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1)

    2023-03-11T00:28:08.565772  /lava-9548819/1/../bin/lava-test-case

    2023-03-11T00:28:08.585125  <8>[   31.423303] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/640bcb34623967d5fa8c8705
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1)

    2023-03-11T00:28:07.511284  /lava-9548819/1/../bin/lava-test-case

    2023-03-11T00:28:07.534098  <8>[   30.371983] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/640bcb34623967d5fa8c8706
        new failure (last pass: renesas-next-2023-01-30-v6.2-rc1)

    2023-03-11T00:28:06.452308  /lava-9548819/1/../bin/lava-test-case

    2023-03-11T00:28:06.472296  <8>[   29.310489] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640bce8367eaf416f18c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-03-10-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230303.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/640bce8367eaf416f=
18c8643
        failing since 4 days (last pass: renesas-next-2022-11-21-v6.1-rc1, =
first fail: renesas-next-2023-03-06-v6.3-rc1) =

 =20
