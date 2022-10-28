Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 181DA611A14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 20:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiJ1S01 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 14:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJ1S00 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 14:26:26 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA99E1DB251
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 11:26:24 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so10618898pjk.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 11:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9lhUz2Wd8Zi5RRaO//b+pHc6OvNH7lbVHEVfBQht4GU=;
        b=XUa9zUi3B29cDMh8eBKUmTMkbl6qvodaU2EvoiqHffIr48aoJ0F15+RKCl6qhVMW+z
         G+6riAaik+EjMUlfDC6IwLuOiT7T0Vilz0TKPRplnx7LL1Ndv0RAyDqJA/Us/XLayscs
         79YFeHNTfxrAisVS7ZTtLiUrlXWp0bGZlyqgG/8gjBiCfULyBVWUHNZ79VpNX2io2F8Z
         t2QM0TZ2wFO0zjJlSVeGeTKPXLCsFktwI4jhLRMUOZXlbY5j1d6tN8bAqw81vmtoI/Qc
         DDrRczCWBIheL1RKUjwB2FZOLtG7MPO+FmkYWiiTWRnPPSbKbYnkP9LPHW5PEKW1wAM2
         gVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lhUz2Wd8Zi5RRaO//b+pHc6OvNH7lbVHEVfBQht4GU=;
        b=I17LzjTnTxT6tr1uiSjLmGEK8hl6zbYoUSC6JFhXcII3A+yQYcH+01mLTPUa5p7vIp
         sjdf72vKHXUfPFTI258Ci56grgw52qvwFEEJuSKpft2fmwP5J0Bcewxn4+tCK605JJIM
         Z0RPYed3uKH7g366fJeFsPLCSp0xJbDGLhJMWxrY9HrJVI4OPKrnxvHXdxr3O6+ypC84
         PnrcIggtP+XZ0sSve7XBfuIbnncE4ag3LHqgW0rxIJQH4PboQ7C0VXBSjKE7aXoZ3CO3
         pvmU4ohkoUCs5rkVkR5hTa3MaNFt1uA6XbTas4JdaCPuABhn4R3nRutV3YRs/g4bzkhb
         wuwA==
X-Gm-Message-State: ACrzQf1ilZLz0xk54wCyH9kFxLXnUTvB/O7V1XBj3+DntpeDu56nCIha
        JGWnqI4lUNG2qzBWLjE/j45GrLaJUyt9MntM
X-Google-Smtp-Source: AMsMyM5l4K7BlozoP4hM564IyjNLPLBQSgc//1B2sHoQSa//FCNhtd/ymG3ie0QFnuLZdxKjiVhMsw==
X-Received: by 2002:a17:90a:e297:b0:212:dc30:7fed with SMTP id d23-20020a17090ae29700b00212dc307fedmr18178666pjz.90.1666981584145;
        Fri, 28 Oct 2022 11:26:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n1-20020a17090a2c8100b0021301a63e86sm4521229pjd.18.2022.10.28.11.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 11:26:23 -0700 (PDT)
Message-ID: <635c1ecf.170a0220.fc530.940c@mx.google.com>
Date:   Fri, 28 Oct 2022 11:26:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-10-28-v6.1-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 101 runs,
 4 regressions (renesas-devel-2022-10-28-v6.1-rc2)
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

renesas/master baseline-nfs: 101 runs, 4 regressions (renesas-devel-2022-10=
-28-v6.1-rc2)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig            | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-10-28-v6.1-rc2/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-10-28-v6.1-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      e3ee6a5b11b04ae5efa890cdfe9c94b77e36f136 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/635beff6eff0286721e7dbad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at=
91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/635beff6eff028672=
1e7dbae
        new failure (last pass: renesas-devel-2022-10-24-v6.1-rc2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/635bea41b8e3598f6fe7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibr=
e/baseline-nfs-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/635bea41b8e3598f6=
fe7db4f
        failing since 10 days (last pass: renesas-devel-2022-09-27-v6.0-rc7=
, first fail: renesas-devel-2022-10-17-v6.1-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/635be9985022835b32e7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ba=
seline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/635be9985022835b3=
2e7db4f
        failing since 73 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | renesas_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/635bf039d59d8b6bd8e7dcf4

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: renesas_defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-10-28-v6.1-rc2/arm64/renesas_defconfig/gcc-10/lab-cip/baseline-nfs-r8a7=
74a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221024.1/arm64/initrd.cpio.gz =



  * baseline-nfs.dmesg.emerg: https://kernelci.org/test/case/id/635bf039d59=
d8b6bd8e7dcfb
        new failure (last pass: renesas-devel-2022-10-24-v6.1-rc2)
        1 lines

    2022-10-28T15:07:08.050025  kern  :emerg : Disabling IRQ #35
    2022-10-28T15:07:08.385741  <8>[   45.438886] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =20
