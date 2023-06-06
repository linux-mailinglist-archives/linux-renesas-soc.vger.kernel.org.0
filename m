Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68D0724036
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 12:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236809AbjFFK5U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 06:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237392AbjFFK4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 06:56:51 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A207E10DB
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 03:54:08 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6b1576c2f6eso2520193a34.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 03:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686048847; x=1688640847;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cTfBSANIvpGYXpM4Wdiln7Jtp4JUaF0rxo8c+YhI5ho=;
        b=23wPRkxCHkBe9VgwyRLgzdXghfEjdBPbHwJs0+ZfkaIxTxNwAagcAwKpeZ0LFh46BI
         lW1uchbFRmjh4BCTQXorcKxQndm73uzb/qZb+um3AjjeNvvegFWYNJABmwfbQnkddktV
         /DGoIluv4jH56yZELNBLUr0vpIJsSY8qJZC0Z3jPx6eSO6HS0hjgOer92b+yIAY9kOd3
         GmRDhuy1tyP4U3Vhrdi/0Ce3Ox7+rbSQtDAVGN6uHe8j9C7DGYF8x9mopUQxpMJiKnzO
         c18EIEqacwXFd1wf+atNZG+/fEzKfcde9zCNvkUidB0hAR2i4TNOPWi10OUdHs5cVmP5
         WUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686048847; x=1688640847;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTfBSANIvpGYXpM4Wdiln7Jtp4JUaF0rxo8c+YhI5ho=;
        b=gdVhFmmlnks1LwYzF+ly3HJ5Uo3kBC43NDu4EZy+0keb52owI2nOaHzQz8qej9JZat
         o93/1QgoH9VORDYF1OY0fi9+wz1oLzoYYSD9GMAXU61izUgftBPwNsO198kVRm4moPM6
         DS1lFdxeztoCkKaR7WVj67CjCHg5jyO/8ZS3zzgxDkV/w9eDOYmioXNz2z4kP5nfi4+U
         MZl2CVV6/zBlR7ZhmPkLIqf4YxbtGR2zAljR/ZaGCk6+ifnkhOvkfhPyFEZRLvwyPiga
         vq4flaEq93jq1qquunD8wjdOSEVMD/Pbd/LPFacEzkwlZ0Tm+XEBuUFMOcpx6cPybeRm
         7JpQ==
X-Gm-Message-State: AC+VfDyRldihRTRaO/TDXflaMXMpVi+dEC9PBuVs6h68gALUJnrIShn+
        n7Xj9Ls/or4DyrsFDfpEPD/cD49rbJ1TbiUw0WvRrg==
X-Google-Smtp-Source: ACHHUZ7Kr5pXn4KRc35gDeaJ+e0MfhW3wDwmFJeau8xK259F5nsDgUhVQFsseIA4XPBmn2gUECSVqg==
X-Received: by 2002:a05:6359:383:b0:129:c905:27ec with SMTP id eg3-20020a056359038300b00129c90527ecmr2648882rwb.13.1686048847457;
        Tue, 06 Jun 2023 03:54:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o23-20020a17090ac09700b0025900a4b86esm6007020pjs.34.2023.06.06.03.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:54:06 -0700 (PDT)
Message-ID: <647f104e.170a0220.66938.acd7@mx.google.com>
Date:   Tue, 06 Jun 2023 03:54:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-06-v6.4-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 25 runs,
 2 regressions (renesas-devel-2023-06-06-v6.4-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 25 runs, 2 regressions (renesas-devel-2023-06-06-v6=
.4-rc5)

Regressions Summary
-------------------

platform         | arch | lab         | compiler | defconfig               =
     | regressions
-----------------+------+-------------+----------+-------------------------=
-----+------------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig+crypt=
o    | 1          =

beaglebone-black | arm  | lab-cip     | gcc-10   | multi_v7_defc...MB2_KERN=
EL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-06-v6.4-rc5/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-06-v6.4-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      06b45cc7ec76298d4d2f6d4da1550f05fa1beefd

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  604701dc19c5499403ae5afe48103b8e2872952b =



Test Regressions
---------------- =



platform         | arch | lab         | compiler | defconfig               =
     | regressions
-----------------+------+-------------+----------+-------------------------=
-----+------------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig+crypt=
o    | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0da6521e3ad915f5de34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/ltp-ipc=
-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/ltp-ipc=
-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/647f0da6521e3ad915f5de=
35
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =



platform         | arch | lab         | compiler | defconfig               =
     | regressions
-----------------+------+-------------+----------+-------------------------=
-----+------------
beaglebone-black | arm  | lab-cip     | gcc-10   | multi_v7_defc...MB2_KERN=
EL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647f0324b1729963c3f5de27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/ltp-ipc-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-06-v6.4-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/l=
ab-cip/ltp-ipc-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/647f0324b1729963c3f5de=
28
        new failure (last pass: renesas-devel-2023-06-05-v6.4-rc5) =

 =20
