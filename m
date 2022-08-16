Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3215595A3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 13:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbiHPLe3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 07:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234257AbiHPLeA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 07:34:00 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7982D923D0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 03:56:06 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id r22so8902227pgm.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 03:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=9aBAHCS4SqPSw3288M3cB7KUQE0uvwjeUNuzkG2uR1I=;
        b=HOgkOvEWcaBvCzU+qUTO8/iFKoyowG6kE/Tb3UrCC5wAF0HjxKdnyV7TJ+jqwHP/Rv
         7+7bwT+3o/RPgax++cChVOxZ2eH36DOcwBW9muDeGr1X9xRGfO2QJ4KMS4bV+ScA7O3x
         p+0DJnLDdAdfTLIwpOyWDpkbj8i/r6/ppd+Hnk5vTCx/1buV9VYZh/HTVJMg8UKEJTSa
         yL0yNv72wjKrTuyXuT5QUrtSl4XT7TRogiCeRI3tSgCWbnIs9ipNkMpwJHLpqT6c2lG7
         k4t3/j0do2FEJSG7j9AglYCI255ZDD7eg+NJdeVVCAfZlXUb43ven5BZ2NiKgXz92n6J
         qAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=9aBAHCS4SqPSw3288M3cB7KUQE0uvwjeUNuzkG2uR1I=;
        b=0LvQR5Pf6iieXK6W2IaAp7ltFvSpfJ1RkAaVRdA2xt8XC6zNl7RX5a+/V4+yifQDen
         C54vfYNoFkC4hs5rzUr2mdblFdwvU4ceyUBUqSy7nBrtLpOMIanqDCV1oD1v0GlBItfK
         7JUmKZvxai/0of98O1JfHrWU2nxPRJyxLDVQ2AAn62mo32oiybPk1PZZnbjYQE+W3gTS
         /oeBiEofxTZ7b9dtyXn9ybfnad6R7YM4VFCFIQmC3EIdXDjJmPn6N6tI6/8E0MGgN4Qp
         kl3h6YntoQKWVbNzCDtbECjau3sug96M7PzY508mxoMFmBtSfOod9aPAv7SiDeeZpOrQ
         XlYg==
X-Gm-Message-State: ACgBeo19j4D119NF10TDWI1YynTwbBxohjfGqxUDQAxHOHlLamYVW+F0
        qJPmrpbl+t3S8ymuxJPnhmCoSu8bjykxEsai
X-Google-Smtp-Source: AA6agR4pv6JH91zGAnfAz2UOMev9oEd/KGG33oAe6U82J552FxuHfEd34Ubnkq+2xUWvIi3h9pbgzw==
X-Received: by 2002:a63:4566:0:b0:41d:353:46b4 with SMTP id u38-20020a634566000000b0041d035346b4mr17570377pgk.316.1660647365708;
        Tue, 16 Aug 2022 03:56:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x1-20020a17090300c100b00170a8973137sm8709027plc.17.2022.08.16.03.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 03:56:05 -0700 (PDT)
Message-ID: <62fb77c5.170a0220.a9acb.eb26@mx.google.com>
Date:   Tue, 16 Aug 2022 03:56:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-16-v6.0-rc1
Subject: renesas/master ltp-ipc: 18 runs,
 4 regressions (renesas-devel-2022-08-16-v6.0-rc1)
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

renesas/master ltp-ipc: 18 runs, 4 regressions (renesas-devel-2022-08-16-v6=
.0-rc1)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig+crypto   =
 | 1          =

beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defc...CONFIG_SMP=
=3Dn | 1          =

beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig          =
 | 1          =

beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defc...MB2_KERNEL=
=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-16-v6.0-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-16-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a9c4a500b27ef2b4904a076bc44eb14dfefdff68

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  bccfa7395fce4accfd30cbf7196c0a6e8db37728 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig+crypto   =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb648ef3c06071213556ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/ltp-ipc-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/ltp-ipc-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220812.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62fb648ef3c06071213556=
ac
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =



platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defc...CONFIG_SMP=
=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb654473c5c88af5355676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/ltp=
-ipc-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/ltp=
-ipc-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220812.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62fb654473c5c88af53556=
77
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =



platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig          =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb66f3e2d5d522ed355647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm/multi_v7_defconfig/gcc-10/lab-cip/ltp-ipc-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220812.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62fb66f3e2d5d522ed3556=
48
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =



platform         | arch | lab     | compiler | defconfig                   =
 | regressions
-----------------+------+---------+----------+-----------------------------=
-+------------
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defc...MB2_KERNEL=
=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb6fa65ecbfd0a1835566a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/ltp-ipc-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-16-v6.0-rc1/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/ltp-ipc-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20220812.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/62fb6fa65ecbfd0a183556=
6b
        new failure (last pass: renesas-devel-2022-08-11-v5.19) =

 =20
