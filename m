Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8806563B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Dec 2022 16:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbiLZPID (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 10:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiLZPIA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 10:08:00 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74771E43
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 07:07:58 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id jn22so10866058plb.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xHO+GkVtsykLJpee5eD91d4CgKnwGBsjin0263PpJ7Q=;
        b=mIA4EWaKw2xhPRWfIXH7ZwXQS4TvB7j/lgOrTrGDsla3kVTG4PE1ytJthvDj2JOkLX
         Kyx90XVKUmnoRExPUjNl5w0+KgdsD1qo70PIL2yXlEJ3UO2EfN2Ou0uB0GatJqdyJ2pu
         bUkHCETCDkunbBSrdzhq1VV7raL21SbLiMXNt+WJA62910mYNR7SG8V/+jCSUZ4jAfmC
         LabhgZvMelsw/OTK9YmXTw+CsMWIL/QEhRSLHo+mruxTvjqsHvsoMNmnawll18VEXuwt
         1HtZck/fJQAiocBYEzklCC+NOwMviFjUsYDN7a0NI6G+JYzr5+53ZOLKZOa0L6maCBkJ
         ikyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHO+GkVtsykLJpee5eD91d4CgKnwGBsjin0263PpJ7Q=;
        b=SJwL+IPy66cgThZBXy20Fhel/Rc+4GMtfifJWV4KvbF8j5fQuHEYFkEmzDMaLaJkqZ
         eoxlgNpeWoSvr49m5TnhNZ4xq1A+3iOyDII2O/gqwK3EsIU2wSwOiUk6Yhl9CYalbYKr
         7Yc1U5ecmArW6PTqGqVucMe9gYWttTW2THxeOTH/YTvObkFD6rLwiHYlCslcTD1C2oBU
         RO3gc5n9gIfHLE5MyzMV9aPsEPL9cw3ztE5LO/MtDGEF1EPUKvYI39eJ8Rbsdc30GRFO
         pOGpD9ThWYqi6BLb3G26fGo8NO8kWAnzDQxISdBT/FRUgBJdtlEcDCPC+QCv+L5djsJC
         JjwQ==
X-Gm-Message-State: AFqh2kqM7oSRZj4FHTBgoN63zk1kpExIO0kTzj6mekDyR1DZ9oiwPLKq
        yucGFHbQ6pZu0+ZOJeUZXHnO3lLYJZObnroCkUQ=
X-Google-Smtp-Source: AMrXdXtXDKDWa2S5oeECX13CRrk9Bgb0HXkdOVaVnyMsJ+oJyQN5uWwlRaR2AzOkXAkzSvBaqfyejA==
X-Received: by 2002:a17:902:e9ca:b0:188:fc0c:cdb1 with SMTP id 10-20020a170902e9ca00b00188fc0ccdb1mr20074828plk.16.1672067277385;
        Mon, 26 Dec 2022 07:07:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h17-20020a170902f55100b00186cd4a8aedsm7223883plf.252.2022.12.26.07.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 07:07:56 -0800 (PST)
Message-ID: <63a9b8cc.170a0220.636c5.d0a6@mx.google.com>
Date:   Mon, 26 Dec 2022 07:07:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-12-26-v6.2-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 137 runs,
 7 regressions (renesas-next-2022-12-26-v6.2-rc1)
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

renesas/next baseline-nfs: 137 runs, 7 regressions (renesas-next-2022-12-26=
-v6.2-rc1)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91sam9g20ek                | arm   | lab-broonie  | gcc-10   | at91_dt_de=
fconfig            | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron  | gcc-10   | defconfig+=
crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
                   | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
videodec           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-12-26-v6.2-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-12-26-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7cf590dd42358e54ad3fa80910b9589add2b74a2 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91sam9g20ek                | arm   | lab-broonie  | gcc-10   | at91_dt_de=
fconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63a97e35de7cfb9c3c4eee21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221216.0/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63a97e35de7cfb9c3=
c4eee22
        failing since 38 days (last pass: renesas-next-2022-11-15-v6.1-rc1,=
 first fail: renesas-next-2022-11-17-v6.1-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron  | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63a9802fdfa49ecd164eee3a

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-kont=
ron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-nfs-kont=
ron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221216.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/63a9802fdfa=
49ecd164eee3f
        new failure (last pass: renesas-next-2022-11-21-v6.1-rc1)
        2 lines

    2022-12-26T11:06:15.201044  kern  :emerg : Internal error: synchronous =
external abort: 0000000096000210 [#1] PREEMPT SMP
    2022-12-26T11:06:15.203856  kern  :emerg : Code: d503201f f9400000 d503=
233f 8b214000 (b9400000) =

    2022-12-26T11:06:15.308679  [  158.727419] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63a98088bbeb12d78f4eee29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221216.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63a98088bbeb12d78=
f4eee2a
        failing since 98 days (last pass: renesas-next-2022-08-30-v6.0-rc1,=
 first fail: renesas-next-2022-09-18-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63a9833af7fd0ae53a4eee31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-nfs-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221216.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63a9833af7fd0ae53=
a4eee32
        failing since 118 days (last pass: renesas-next-2022-08-29-v6.0-rc1=
, first fail: renesas-next-2022-08-30-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63a984cb8b0f7af1a34eee56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-nfs-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221216.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63a984cb8b0f7af1a=
34eee57
        failing since 133 days (last pass: renesas-next-2022-07-05-v5.19-rc=
1, first fail: renesas-next-2022-08-15-v6.0-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/63a989efac8e2a30fd4eee25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221216.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63a989efac8e2a30f=
d4eee26
        failing since 63 days (last pass: renesas-next-2022-09-26-v6.0-rc1,=
 first fail: renesas-next-2022-10-24-v6.1-rc1) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+=
videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63a99378f32e41721d4eee1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-m=
eson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-12-26-v6.2-rc1/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-nfs-m=
eson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221216.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63a99378f32e41721=
d4eee1f
        new failure (last pass: renesas-next-2022-11-10-v6.1-rc1) =

 =20
