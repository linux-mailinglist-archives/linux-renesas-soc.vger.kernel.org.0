Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B5C5659FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 17:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbiGDPgp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 11:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbiGDPgo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 11:36:44 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026C010548
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jul 2022 08:36:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id l12so3490794plk.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2022 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GloVZtATWZRXxy4Boz9MsjYlfkEKxic/SXropEjURNw=;
        b=bUTlfl2QzcO9/kPekCs7QygCSFdHaq/3j9EtJ8fPmPt8Z1TbRDuQKp2KSFpR9byoYL
         JN3GtgQ4jIXHrcxcA9ukiRLaElm2yiyEgm//qRkxDQOlXF0xJ6coBnm0FzmJtVnAl0Gq
         iBEt5Ulrqza8LqOjO6gDs2pTnuiyAfQFdfDTzg8a7IsJx/iUqpEuAtcvKwTC9fM9QKb9
         7Shennm+zh3HQwBqFddaTNOP0GAfECS4L2pFjm3FadrHLuaPaH+kZv9amhUJvRZY3z92
         tgGHeu9I658Z/voZDArEIG3KMcBOIDqda38hGw/Hpt28g9GIyhqCc8yfEkAuXYqZCxhE
         JxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GloVZtATWZRXxy4Boz9MsjYlfkEKxic/SXropEjURNw=;
        b=0wuExL5xU3GKe8XQc+epRVr3Urd0Qgjt08yicno63UxjLHiiav3NDCIDTPrLmUH+rP
         T6xKBTToT9n7Mis8Rk9+6XNXu2lVddKYhSiuMOXmNJWhLhYgKT1YgQL9Kvku2zXTR+Ik
         8Xlj5k4E1d5uJ0xozLywCWf0rqe0CTIRTE/6/PjFZjMLKQFfAkbS/Kehqa4wMas7yLl8
         628iqRQ+nK6qc+AxTD+yN2bPgF4DEhwGyDq9TTcBMwdc7DUv72x6N/oM9KgzRdxmNc1H
         B5MilRGJzPlhS/KFaZPvfT1dYzxwaX8LxqsymVsTHDrR15RlmtVfcyZCUkT1xN7HzCul
         dVQw==
X-Gm-Message-State: AJIora9IEl2T4W5q093JZ6Riz/WeSEZ5iljvO9N4FA8WuO72iYI3HzwC
        IfhKxIK46iExeFIr7xQPtgBMEv7PHuP+qVVD
X-Google-Smtp-Source: AGRyM1vUZST+mblfF+eZmwprKJiXQ8rkVQ3LuWF6AoQuz86NZc7DITHOqJxy/iUNjbvyUr2k3C1yYQ==
X-Received: by 2002:a17:902:d4c3:b0:16a:7696:971a with SMTP id o3-20020a170902d4c300b0016a7696971amr35676762plg.142.1656949001003;
        Mon, 04 Jul 2022 08:36:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902900300b0015e8d4eb1d3sm21386763plp.29.2022.07.04.08.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:36:40 -0700 (PDT)
Message-ID: <62c30908.1c69fb81.c9f2.e234@mx.google.com>
Date:   Mon, 04 Jul 2022 08:36:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-07-04-v5.19-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 201 runs,
 20 regressions (renesas-devel-2022-07-04-v5.19-rc5)
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

renesas/master baseline: 201 runs, 20 regressions (renesas-devel-2022-07-04=
-v5.19-rc5)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 1          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+debug              | 1          =

odroid-xu3                 | arm   | lab-collabora   | gcc-10   | exynos_de=
fconfig             | 1          =

odroid-xu3                 | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 2          =

odroid-xu3                 | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =

odroid-xu3                 | arm   | lab-collabora   | gcc-10   | multi_v7_=
defconfig           | 2          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-07-04-v5.19-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-07-04-v5.19-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      53f4b75e60cf6c4bedcc6638ff37f56eab20dc19 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d77279e5c55fe0a39be3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengut=
ronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengut=
ronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2d77279e5c55fe0a39=
be4
        failing since 55 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d98e04dd7ccd19a39c2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2d98e04dd7ccd19a39=
c2c
        failing since 55 days (last pass: renesas-devel-2021-12-06-v5.16-rc=
4-15-g9f95ae4ce1f1, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d558a57b1eb0b4a39c47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2d558a57b1eb0b4a39=
c48
        failing since 65 days (last pass: renesas-devel-2022-04-13-v5.18-rc=
2, first fail: renesas-devel-2022-04-29-v5.18-rc4) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
jetson-tk1                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d8714e8fc57af5a39c07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jet=
son-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jet=
son-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2d8714e8fc57af5a39=
c08
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d93dde6a32ed05a39be5

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
c2d93dde6a32ed05a39bf2
        new failure (last pass: renesas-devel-2022-05-17-v5.18-rc7)

    2022-07-04T12:12:15.995713  /lava-136327/1/../bin/lava-test-case
    2022-07-04T12:12:16.075574  <8>[   38.693595][  T317] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
odroid-xu3                 | arm   | lab-collabora   | gcc-10   | exynos_de=
fconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d8a41acad2d618a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odro=
id-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odro=
id-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2d8a41acad2d618a39=
bcf
        new failure (last pass: renesas-devel-2022-06-20-v5.19-rc3) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
odroid-xu3                 | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62c2dacc307173614ba39bef

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=
=3Dy/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c2dacc3071736=
14ba39bf6
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        43 lines

    2022-07-04T12:19:07.618349  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-04T12:19:07.618846  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c4735480 pointer offset 64 size 128
    2022-07-04T12:19:07.619218  kern  :alert : Register r6 information: non=
-paged memory
    2022-07-04T12:19:07.639336  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c300a000 pointer offset 0 size 1024
    2022-07-04T12:19:07.639917  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c300a000 pointer offset 16 size 1024
    2022-07-04T12:19:07.640422  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-04T12:19:07.662442  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c300a000 pointer offset 16 size 1024
    2022-07-04T12:19:07.663000  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start c4735500 pointer offset 64 size 128
    2022-07-04T12:19:07.663436  kern  :alert : Register r12 information: NU=
LL pointer
    2022-07-04T12:19:07.684437  kern  :emerg : Internal error: Oops: 207 [#=
1] SMP ARM =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c2dacc3071736=
14ba39bf7
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        16 lines

    2022-07-04T12:19:07.574144  kern  :alert : 8<--- cut here ---
    2022-07-04T12:19:07.574645  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-04T12:19:07.595391  kern  :alert : [00000000] *pgd=3D42136003, =
*pm<8>[   51.978649] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfa=
il UNITS=3Dlines MEASUREMENT=3D16>
    2022-07-04T12:19:07.595892  d=3Da8d2a003
    2022-07-04T12:19:07.596320  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-04T12:19:07.596840  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-04T12:19:07.597316  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-04T12:19:07.597723  kern  :alert : Register r3 information: non=
-paged memory   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
odroid-xu3                 | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/62c2db8b51449257f3a39beb

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collab=
ora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collab=
ora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c2db8b5144925=
7f3a39bf2
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        43 lines

    2022-07-04T12:22:14.653853  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-04T12:22:14.654118  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c41d0580 pointer offset 64 size 128
    2022-07-04T12:22:14.654349  kern  :alert : Register r6 information: non=
-paged memory
    2022-07-04T12:22:14.675472  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c20ef000 pointer offset 0 size 1024
    2022-07-04T12:22:14.675743  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c20ef000 pointer offset 16 size 1024
    2022-07-04T12:22:14.675994  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-04T12:22:14.697438  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c20ef000 pointer offset 16 size 1024
    2022-07-04T12:22:14.697706  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start c41d0600 pointer offset 64 size 128
    2022-07-04T12:22:14.697955  kern  :alert : Register r12 information: sl=
ab task_struct start c3153480 pointer offset 0
    2022-07-04T12:22:14.719639  kern  :emerg : Internal error: Oops: 17 [#1=
] ARM =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c2db8b5144925=
7f3a39bf3
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        16 lines

    2022-07-04T12:22:14.608898  kern  :alert : 8<--- cut here ---
    2022-07-04T12:22:14.609192  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-04T12:22:14.609449  kern  :alert : [00000000] *pgd=3Da8a48835
    2022-07-04T12:22:14.609695  kern  :alert : Register r0 information: NUL=
L pointer
    2022-07-04T12:22:14.631412  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-04T12:22:14.631679  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-04T12:22:14.631909  kern  :alert<8>[   53.348854] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-07-04T12:22:14.632149   : Register r3 information: non-paged memor=
y   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
odroid-xu3                 | arm   | lab-collabora   | gcc-10   | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/62c2df031d6c23cbaca39bf0

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62c2df031d6c23c=
baca39bf7
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        43 lines

    2022-07-04T12:37:13.410295  kern  :alert : Register r4 information: NUL=
L pointer
    2022-07-04T12:37:13.410772  kern  :alert : Register r5 information: sla=
b kmalloc-128 start cf555080 pointer offset 64 size 128
    2022-07-04T12:37:13.411184  kern  :alert : Register r6 information: non=
-paged memory
    2022-07-04T12:37:13.431919  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c3049800 pointer offset 0 size 1024
    2022-07-04T12:37:13.432401  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c3049800 pointer offset 16 size 1024
    2022-07-04T12:37:13.432876  kern  :alert : Register r9 information: NUL=
L pointer
    2022-07-04T12:37:13.454126  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c3049800 pointer offset 16 size 1024
    2022-07-04T12:37:13.454608  kern  :alert : Register r11 information: sl=
ab kmalloc-128 start cf555100
    2022-07-04T12:37:13.455018  kern  :alert : Register r12 information: NU=
LL pointer
    2022-07-04T12:37:13.455410  kern  :emerg : Internal error: Oops: 17 [#1=
] SMP ARM =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62c2df031d6c23c=
baca39bf8
        new failure (last pass: renesas-devel-2022-06-29-v5.19-rc4)
        16 lines

    2022-07-04T12:37:13.366180  kern  :alert : 8<--- cut here ---
    2022-07-04T12:37:13.366662  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-07-04T12:37:13.367076  kern  :alert : [00000000] *pgd=3Da8d7a835
    2022-07-04T12:37:13.387929  kern  :alert : Regi<8>[   51.657737] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D16>
    2022-07-04T12:37:13.388412  ster r0 information: NULL pointer
    2022-07-04T12:37:13.388894  kern  :alert : Register r1 information: NUL=
L pointer
    2022-07-04T12:37:13.389363  kern  :alert : Register r2 information: non=
-paged memory
    2022-07-04T12:37:13.389771  kern  :alert : Register r3 information: non=
-paged memory   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2da0c14f71b9f67a39bfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2da0c14f71b9f67a39=
bfd
        new failure (last pass: renesas-devel-2022-05-17-v5.18-rc7) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d9ce34e9612557a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2d9ce34e9612557a39=
bd9
        new failure (last pass: renesas-devel-2022-05-17-v5.18-rc7) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d9fd9277ab381aa39bf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2d9fd9277ab381aa39=
bf3
        failing since 55 days (last pass: renesas-devel-2022-05-05-v5.18-rc=
5, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62c2d9cdcbc670e412a39bfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62c2d9cdcbc670e412a39=
bff
        failing since 55 days (last pass: renesas-devel-2022-05-05-v5.18-rc=
5, first fail: renesas-devel-2022-05-09-v5.18-rc6) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62c2d561a57b1eb0b4a39c58

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-07-04-v5.19-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220624.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62c2d561a57b1eb0b4a39c7e
        failing since 117 days (last pass: renesas-devel-2022-02-28-v5.17-r=
c6, first fail: renesas-devel-2022-03-08-v5.17-rc7)

    2022-07-04T11:55:55.362331  /lava-6745106/1/../bin/lava-test-case
    2022-07-04T11:55:55.373583  <8>[   55.286444] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62c2d561a57b1eb0b4a39ca1
        failing since 27 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-07-04T11:55:52.109453  <8>[   52.021636] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-07-04T11:55:53.141545  /lava-6745106/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62c2d561a57b1eb0b4a39ca2
        failing since 27 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-07-04T11:55:52.097841  /lava-6745106/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62c2d561a57b1eb0b4a39ca3
        failing since 27 days (last pass: renesas-devel-2022-05-23-v5.18, f=
irst fail: renesas-devel-2022-06-06-v5.19-rc1)

    2022-07-04T11:55:51.055513  /lava-6745106/1/../bin/lava-test-case
    2022-07-04T11:55:51.066603  <8>[   50.979062] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
