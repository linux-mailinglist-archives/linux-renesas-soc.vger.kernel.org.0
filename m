Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50AB5B5D67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Sep 2022 17:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiILPkw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Sep 2022 11:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiILPkt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2022 11:40:49 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7CC911162
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 08:40:48 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id s206so8667004pgs.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 08:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=w8lWGANtUxtLkuRna7JrQwN3ILmZhrIQrRhDk4DxJMw=;
        b=VBrQSiqC1BBZ8luDTgKbZNr87lLWSkoVG/d4kOLvwAk+vo4T080tnaidMKfc4P0XRT
         u6NnaKspmEVvjHRv4a5DXzY04s8CIZUB4yes2UVByh1arbd+Q7apjc6WTN/ieWdLAYky
         T9sO2eFziNtCmmS+VviGGihT+P1062TQm6f/OOLKIO47esJdkMnKqdxeLks4wINZeyWJ
         mPALnEh+2Xh4uRhxprYL4l84XxdOr/87mMPe4togpv0U4qoEfv9adM/W9GAXcTUBFbnx
         ttl5a/Zzy5zWDc7nd0k0ORijRGIZcFmcfpHwEZ1qiexv6Sde3Riy2GLgiHDi9BKciE8J
         rDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=w8lWGANtUxtLkuRna7JrQwN3ILmZhrIQrRhDk4DxJMw=;
        b=ebn0K8aaBkLBFAC1rtK9q1tVDI+WIRuZbkmPKGduD8k+KtJE0awimZ8grwKsMBB5H0
         G49plT30EgRfLbW2mPy4fQR6oEMqaQMSmZAL4cPasN2T2lIBxLQ47E7YucE+zLzEBN47
         kbqlmIQeYGGvL23bymm+wj2cYtkDMjI0EYsdafPG9Ble+4heP7WoWMn2736VKgmxK8qq
         tLfODYrVm72JD05kmtGMhb8+LZkn0FAark1+TOYIvcbMLXDu/IfqKEj7nSoZqc4a7Heb
         PBQpeRG/z/Gpnwbbq+uBbYewtvcnZ5G6ad3j6sMmYsV7KpSjLL6ZMSI8nWAxWbvTiep8
         Xzhw==
X-Gm-Message-State: ACgBeo2yuWvNXiaPogd+wRR9n0qEnUcJtw5ABqbNTMueb/ZWHrL0nUcg
        KtTgNhXpiGG4p1c2RtsSzeitMyKX7Pig9JTplfE=
X-Google-Smtp-Source: AA6agR4H1M//ucY65Jz498N240xuvpytafuHb4L8W8fuVBjgcnkDiMcfJntXq5BAf8llS0q8CRHGUQ==
X-Received: by 2002:a65:5501:0:b0:438:ebbe:4a6c with SMTP id f1-20020a655501000000b00438ebbe4a6cmr5712745pgr.384.1662997248017;
        Mon, 12 Sep 2022 08:40:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a6a0300b002002fb120d7sm5439544pjj.8.2022.09.12.08.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 08:40:46 -0700 (PDT)
Message-ID: <631f52fe.170a0220.606f7.87d2@mx.google.com>
Date:   Mon, 12 Sep 2022 08:40:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc5-843-g94f27a9ea269
Subject: renesas/master baseline-nfs: 88 runs,
 3 regressions (v6.0-rc5-843-g94f27a9ea269)
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

renesas/master baseline-nfs: 88 runs, 3 regressions (v6.0-rc5-843-g94f27a9e=
a269)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/v6.0=
-rc5-843-g94f27a9ea269/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: v6.0-rc5-843-g94f27a9ea269
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      94f27a9ea2691030ed8a87c33e1e6a0badc3bde9 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1bf4ce7abb29cf355652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/b=
aseline-nfs-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/b=
aseline-nfs-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/631f1bf4ce7abb29c=
f355653
        failing since 32 days (last pass: renesas-devel-2021-12-14-v5.16-rc=
5, first fail: renesas-devel-2022-08-11-v5.19-rc8) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/631f1e2090b9aaf7e0355680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-=
nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-=
nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/631f1e2090b9aaf7e=
0355681
        failing since 27 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/631f2c6542f25dba0d35565c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hi=
hope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/v6.0-rc5-843-g9=
4f27a9ea269/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hi=
hope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220826.0/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/631f2c6542f=
25dba0d355661
        failing since 7 days (last pass: renesas-devel-2022-09-02-v6.0-rc3,=
 first fail: renesas-devel-2022-09-05-v6.0-rc4)
        1 lines

    2022-09-12T12:55:36.829886  kern  :emerg : Disabling IRQ #33
    2022-09-12T12:55:37.091243  [   43.295605] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =20
