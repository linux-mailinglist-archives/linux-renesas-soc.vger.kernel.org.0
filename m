Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72DA76ACE60
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Mar 2023 20:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjCFTp6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 14:45:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbjCFTpi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 14:45:38 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDD86546D
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 11:45:27 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id v11so11660941plz.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Mar 2023 11:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678131927;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6AxISznHwkk9/loja20fHsfpts9flu/KOM2nyERIaNU=;
        b=qUTyesRe/qjNximdBpO9FwL1lPAD2TzzbfQPmh5CRJDYkv6jO9aaGFSsD033qw5Mds
         /tUg0oncu50Pj44YKTE9GV4VPVXgQksJNT+U8caBl9PQ3FWYvR5PmSzOZeo267BnvorB
         9IVzAJ0HN5IGy/AlbNc53p+116+RtvUzlX/NTxls3vvFYHSPh1TqTSc6BFAR8cQqJRu+
         3C7Tl9nQuiZ8YLdoaiXEfxFDPMetmLMtVopmbkw2oThnPh5dmo6OHShT7eRz5RU6wUI3
         nkb9M/YBNRFjAQxNKoq+3i5fJ5nlTEdN/U+90wSjEsWnjI7vvySJdr9JDsCQKeT9sZfD
         18yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678131927;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AxISznHwkk9/loja20fHsfpts9flu/KOM2nyERIaNU=;
        b=n6jbHcpmnCHcL3DgpttBSxBwv6sPElByfsXbOOoC03GEuvsKtoEscTcbeKbVv6NREZ
         /MaU8pop9y3QNwH4Ct7oSOrcwWuIPhDhSBzjsL50sqnL2J0MxRxJ8x8cAEy5bDAqOfGZ
         xv4fwmLua1VfOh+B8pVGIqyw0JZlT1B124IgYKAPpDRwuatH7dF8dDmBN1FOebp6ruKa
         Kut4X8uwlnDKvniinRylud8cDu3cG3tEEogidrq4E7CT7AY/YOwRsm3c79ybaNVeYu8P
         h9zsQciT/I6jFAypvZLgCALatEhvtbIJ5LcpS+pwGCS/87LVNTDpKkKRwuNaAYvrJO8B
         eVHA==
X-Gm-Message-State: AO0yUKUXAum3J/cOGtWqfIWt+7gSDcuoycK5nYTtw+x9SXBUU/j4j21N
        Jh56JYisk/+TpeYjkqtV9xF6OBfh3Jonh/e2RHBHqMIH
X-Google-Smtp-Source: AK7set9H1xZmC3U8XZomfXdYpKg4Y3+XhRS1VGkEw/kbUGKZiFacshEVjvqZAmDnGNT9SLdcvKUMzg==
X-Received: by 2002:a17:903:244c:b0:19e:3b41:1828 with SMTP id l12-20020a170903244c00b0019e3b411828mr13108374pls.22.1678131926674;
        Mon, 06 Mar 2023 11:45:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kj15-20020a17090306cf00b0019aa8149cb9sm7129246plb.79.2023.03.06.11.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 11:45:26 -0800 (PST)
Message-ID: <640642d6.170a0220.66d70.cf47@mx.google.com>
Date:   Mon, 06 Mar 2023 11:45:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-03-06-v6.3-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 136 runs,
 20 regressions (renesas-devel-2023-03-06-v6.3-rc1)
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

renesas/master baseline-nfs: 136 runs, 20 regressions (renesas-devel-2023-0=
3-06-v6.3-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 3          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 3          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-03-06-v6.3-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-03-06-v6.3-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      8b20ccdf60a58fb8e57af56ff0fb030a25a59871 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64060fa9d3314c475e8c8639

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-pengutronix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64060fa9d3314c475e8c8642
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-06T16:06:40.298735  + set +x
    2023-03-06T16:06:40.299181  [   28.195358] <LAVA_SIGNAL_ENDRUN 0_dmesg =
916889_1.6.2.3.1>
    2023-03-06T16:06:40.409268  #
    2023-03-06T16:06:40.511386  / # #export SHELL=3D/bin/sh
    2023-03-06T16:06:40.512057  =

    2023-03-06T16:06:40.613426  / # export SHELL=3D/bin/sh. /lava-916889/en=
vironment
    2023-03-06T16:06:40.614118  =

    2023-03-06T16:06:40.715418  / # . /lava-916889/environment/lava-916889/=
bin/lava-test-runner /lava-916889/1
    2023-03-06T16:06:40.716328  =

    2023-03-06T16:06:40.718951  / # /lava-916889/bin/lava-test-runner /lava=
-916889/1 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6406100d07e25824ec8c868b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseli=
ne-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6406100d07e25824ec8c8694
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-06T16:08:38.251771  + set +x
    2023-03-06T16:08:38.251932  [   29.280147] <LAVA_SIGNAL_ENDRUN 0_dmesg =
916899_1.6.2.3.1>
    2023-03-06T16:08:38.362378  #
    2023-03-06T16:08:38.464740  / # #export SHELL=3D/bin/sh
    2023-03-06T16:08:38.465384  =

    2023-03-06T16:08:38.566711  / # export SHELL=3D/bin/sh. /lava-916899/en=
vironment
    2023-03-06T16:08:38.567379  =

    2023-03-06T16:08:38.668805  / # . /lava-916899/environment/lava-916899/=
bin/lava-test-runner /lava-916899/1
    2023-03-06T16:08:38.669539  =

    2023-03-06T16:08:38.672556  / # /lava-916899/bin/lava-test-runner /lava=
-916899/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6406108550d281c77e8c869a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/6406108550d281c77e8c86a3
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-06T16:10:22.800319  + set +x
    2023-03-06T16:10:22.800621  [   27.608022] <LAVA_SIGNAL_ENDRUN 0_dmesg =
916908_1.6.2.3.1>
    2023-03-06T16:10:22.916234  #
    2023-03-06T16:10:23.018233  / # #export SHELL=3D/bin/sh
    2023-03-06T16:10:23.018673  =

    2023-03-06T16:10:23.119990  / # export SHELL=3D/bin/sh. /lava-916908/en=
vironment
    2023-03-06T16:10:23.120424  =

    2023-03-06T16:10:23.221694  / # . /lava-916908/environment/lava-916908/=
bin/lava-test-runner /lava-916908/1
    2023-03-06T16:10:23.222273  =

    2023-03-06T16:10:23.225147  / # /lava-916908/bin/lava-test-runner /lava=
-916908/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/640610fd65e3106aef8c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/bas=
eline-nfs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/640610fd65e3106aef8c8638
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-06T16:12:23.288451  + set +x
    2023-03-06T16:12:23.288643  [   32.747428] <LAVA_SIGNAL_ENDRUN 0_dmesg =
916915_1.6.2.3.1>
    2023-03-06T16:12:23.397810  #
    2023-03-06T16:12:23.499581  / # #export SHELL=3D/bin/sh
    2023-03-06T16:12:23.499976  =

    2023-03-06T16:12:23.601150  / # export SHELL=3D/bin/sh. /lava-916915/en=
vironment
    2023-03-06T16:12:23.601567  =

    2023-03-06T16:12:23.702821  / # . /lava-916915/environment/lava-916915/=
bin/lava-test-runner /lava-916915/1
    2023-03-06T16:12:23.703368  =

    2023-03-06T16:12:23.706517  / # /lava-916915/bin/lava-test-runner /lava=
-916915/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/640612f13a6c0719838c8671

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-n=
fs-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/640612f13a6c0719838c867a
        new failure (last pass: renesas-devel-2023-02-21-v6.2)

    2023-03-06T16:20:38.861112  + set +x
    2023-03-06T16:20:38.861326  [   29.278725] <LAVA_SIGNAL_ENDRUN 0_dmesg =
916929_1.6.2.3.1>
    2023-03-06T16:20:38.976379  #
    2023-03-06T16:20:39.078767  / # #export SHELL=3D/bin/sh
    2023-03-06T16:20:39.079148  =

    2023-03-06T16:20:39.180434  / # export SHELL=3D/bin/sh. /lava-916929/en=
vironment
    2023-03-06T16:20:39.180863  =

    2023-03-06T16:20:39.281997  / # . /lava-916929/environment/lava-916929/=
bin/lava-test-runner /lava-916929/1
    2023-03-06T16:20:39.282494  =

    2023-03-06T16:20:39.285913  / # /lava-916929/bin/lava-test-runner /lava=
-916929/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64061071d77d50ceae8c86e1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutr=
onix/baseline-nfs-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/armhf/initrd.cpio.gz =



  * baseline-nfs.bootrr.deferred-probe-empty: https://kernelci.org/test/cas=
e/id/64061071d77d50ceae8c86ea
        failing since 13 days (last pass: renesas-devel-2023-02-20-v6.2, fi=
rst fail: renesas-devel-2023-02-21-v6.2)

    2023-03-06T16:10:16.331049  + set[   26.413976] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 916905_1.6.2.3.1>
    2023-03-06T16:10:16.331215   +x
    2023-03-06T16:10:16.437072  #
    2023-03-06T16:10:16.539024  / # #export SHELL=3D/bin/sh
    2023-03-06T16:10:16.539401  =

    2023-03-06T16:10:16.640590  / # export SHELL=3D/bin/sh. /lava-916905/en=
vironment
    2023-03-06T16:10:16.641017  =

    2023-03-06T16:10:16.742224  / # . /lava-916905/environment/lava-916905/=
bin/lava-test-runner /lava-916905/1
    2023-03-06T16:10:16.742819  =

    2023-03-06T16:10:16.745778  / # /lava-916905/bin/lava-test-runner /lava=
-916905/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64061073bb3e233a1b8c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-m=
eson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-nfs-m=
eson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64061073bb3e233a1=
b8c8640
        new failure (last pass: renesas-devel-2023-02-21-v6.2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/64060f4715478d53a58c863c

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/64060f4815478d53a58c8690
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:05:09.448643  /lava-9454802/1/../bin/lava-test-case

    2023-03-06T16:05:09.472003  [   37.336071] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/64060f4815478d53a58c86e2
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:05:04.056540  /lava-9454802/1/../bin/lava-test-case

    2023-03-06T16:05:04.087524  [   31.950853] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/64060f4815478d53a58c86e3
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:05:02.975286  /lava-9454802/1/../bin/lava-test-case

    2023-03-06T16:05:03.005152  [   30.868971] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/640610293bc7514a058c8630

  Results:     165 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.panel-edp-probed: https://kernelci.org/test/case/id=
/640610293bc7514a058c8684
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:08:58.928079  /lava-9454856/1/../bin/lava-test-case

    2023-03-06T16:08:58.951383  <8>[   35.936293] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/tes=
t/case/id/640610293bc7514a058c86d6
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:08:54.018299  /lava-9454856/1/../bin/lava-test-case

    2023-03-06T16:08:54.041496  <8>[   31.027019] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/te=
st/case/id/640610293bc7514a058c86d7
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:08:52.976658  /lava-9454856/1/../bin/lava-test-case

    2023-03-06T16:08:53.000029  <8>[   29.985536] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/64060f7ec6eabb69138c864e

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-col=
labora/baseline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/64060f7ec6eabb69138c8704
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:05:45.697806  /lava-9454805/1/../bin/lava-test-case

    2023-03-06T16:05:45.734253  <8>[   32.023354] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/64060f7ec6eabb69138c8705
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:05:44.596180  /lava-9454805/1/../bin/lava-test-case

    2023-03-06T16:05:44.632935  <8>[   30.922088] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/64060f7ec6eabb69138c8706
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:05:43.486943  /lava-9454805/1/../bin/lava-test-case

    2023-03-06T16:05:43.524614  <8>[   29.813654] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64061056ceceb8707e8c8786

  Results:     176 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/tes=
t/case/id/64061056ceceb8707e8c883c
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:09:20.669865  /lava-9454917/1/../bin/lava-test-case

    2023-03-06T16:09:20.696280  <8>[   31.091082] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/te=
st/case/id/64061056ceceb8707e8c883d
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:09:19.583893  /lava-9454917/1/../bin/lava-test-case

    2023-03-06T16:09:19.610807  <8>[   30.005763] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline-nfs.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/te=
st/case/id/64061056ceceb8707e8c883e
        new failure (last pass: renesas-devel-2023-02-20-v6.2)

    2023-03-06T16:09:18.490495  /lava-9454917/1/../bin/lava-test-case

    2023-03-06T16:09:18.520545  <8>[   28.915398] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64064058f2e044530d8c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-03-06-v6.3-rc1/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-nfs-su=
n50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230224.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/64064058f2e044530=
d8c8635
        failing since 70 days (last pass: v6.1-rc8-929-g112502470f50, first=
 fail: renesas-devel-2022-12-26-v6.2-rc1) =

 =20
