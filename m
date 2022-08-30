Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1CF05A6108
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 12:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiH3KqL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 06:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiH3KqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 06:46:09 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928776C12D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 03:46:05 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id f4so10297731pgc.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=WnPMC9S9oly4sL6Y5qJ+NCZD17LUesFJf1gMHn0Kyzo=;
        b=WTG9LjmYuqvEM+Wd6V96gy6Ie+q/yKnMsqK9CuqJwGgpARCUP4Rqt6djn5eGk2ZHHG
         LYJ6FSm+0H2GqneljCjETISpTfentdsQn8ou0SHDUzrTP59C24MOAnpL3uqxTIgexVIk
         2oqqWadQEO7Dg4fQmeObGbxiqHzBZ/CohvZvPQ/OAOt4nvWP6s3dm+C91P++LEg1LAVb
         nUlc3TjUXHFXHUAfRVcgVjAcMgbaXW/zFae81sExHoR+3d+vHJdLxfEdhZlaatrlAKJ4
         udJTB8VPITxvB5aBMaum/oSV6X/riQ/VQfFoXsU+liSZGtsymnpyyNlzhzS33hNvUL7D
         0DSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=WnPMC9S9oly4sL6Y5qJ+NCZD17LUesFJf1gMHn0Kyzo=;
        b=4N81+htmUspd67EY6EwLLAfXkddI+x2U1njVbxAjdYiro8oL1SehGwdAVgP284IRQ2
         T4Ge61SEhXtsNFgiVOy3itt2B2g+a32F5Lsolye1sGt21+guqCrmLIvtAm3TwFL/sBum
         rBJAkqxQS1VMOfEjutgtBh5urc7h/mbF6x6fPxTL4EsD3A9+8Ma8c9HjPJFQGZsy1yXf
         RRT8VYH5ty4f7yB4bLpmfbk9KwrTz6bmkMDOKKf0tHf7tKCdsNWTj6IJMBwwfcpTz4Pt
         MCm2qxrpqHkm1Qsl5V593gq4TW6jyF5ltvaM3QI3BfutlcJJ3FvlWUy5oPSurJXBRGF6
         D9cQ==
X-Gm-Message-State: ACgBeo0fKCNCW8Bp7+/epxu2Nxgpd9CxCVb5Hq3ErNLPAP8+twNIGusk
        BF/jJudCA4Cqot/wPKMs2nObOQdKcZLwwL4DbWM=
X-Google-Smtp-Source: AA6agR7hLA8zF9KO3nNe2jEM/1vMutEa9pwWx2Kei3HhnkSzAGSp1DoiarinJ0jpMOyoMJwFMjWuQg==
X-Received: by 2002:a05:6a00:1688:b0:517:cf7b:9293 with SMTP id k8-20020a056a00168800b00517cf7b9293mr21008368pfc.7.1661856364887;
        Tue, 30 Aug 2022 03:46:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g10-20020a17090a67ca00b001fa79c1de15sm8322771pjm.24.2022.08.30.03.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 03:46:04 -0700 (PDT)
Message-ID: <630dea6c.170a0220.b9c2d.e7c6@mx.google.com>
Date:   Tue, 30 Aug 2022 03:46:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-30-v6.0-rc3
Subject: renesas/master ltp-ipc: 18 runs,
 5 regressions (renesas-devel-2022-08-30-v6.0-rc3)
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

renesas/master ltp-ipc: 18 runs, 5 regressions (renesas-devel-2022-08-30-v6=
.0-rc3)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defc...MB2_KERNEL=
=3Dy | 1          =

beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig+ima      =
 | 1          =

beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defc...CONFIG_SMP=
=3Dn | 1          =

beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig          =
 | 1          =

beaglebone-black | arm  | lab-cip | gcc-10   | omap2plus_defconfig         =
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-30-v6.0-rc3/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-30-v6.0-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      87c1cb103bc6896ad3e45e0cc1417b57696d733a

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  48cfd7a9977e6268b4aa2600608cebad7e0e42b8 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defc...MB2_KERNEL=
=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd6f47c33cd7661355664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/ltp-ipc-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/ltp-ipc-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220826.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/630dd6f47c33cd76613556=
65
        failing since 13 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig+ima      =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/630dd8a7f3ed611e44355676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/ltp-ipc-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220826.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/630dd8a7f3ed611e443556=
77
        failing since 7 days (last pass: renesas-devel-2022-08-11-v5.19, fi=
rst fail: renesas-devel-2022-08-22-v6.0-rc2) =

 =



platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defc...CONFIG_SMP=
=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/630ddc06a6fa97d175355655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/ltp=
-ipc-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/ltp=
-ipc-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220826.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/630ddc06a6fa97d1753556=
56
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig          =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/630de2984f26c1179c355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220826.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/630de2984f26c1179c3556=
43
        failing since 14 days (last pass: renesas-devel-2022-08-11-v5.19, f=
irst fail: renesas-devel-2022-08-16-v6.0-rc1) =

 =



platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | omap2plus_defconfig         =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/630dda4c305722a15f355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/omap2plus_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-30-v6.0-rc3/arm/omap2plus_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220826.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/630dda4c305722a15f3556=
43
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =20
