Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7333070429C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 May 2023 03:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245631AbjEPBIX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 May 2023 21:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245312AbjEPBIW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2023 21:08:22 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F685BB6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 18:08:16 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6434e65d808so14259115b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 18:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684199295; x=1686791295;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hynm1WRFR42joXOQSMnUpE0lClhef2N8E1cXgaI+cro=;
        b=uOrLEhKeuoZ7NSZc9WfqC3q0adrqzK4Nr4EOiKCVt+TFJx4MaUgX8xUZPk1rqzopvC
         C/5bTUTbRGyHWAgA4Zf1mSbV6N4Z9NZpG6/XZa7UonArsHI2rGKM6rxT05upQw+g8tpN
         /Y25LHDqWqI8Kh5GQyXyRSsLVtly+ByljtE/5WxB3pKLYb3GGHReFfIuR3lv2QkspjHy
         2RCZBF5ctWLt2U+Li3JA+axHA/K0GecyVXaBpC4wXpYdX9YbKZ//y5ULMf8sLZujFAZi
         ziHtvySP1Rr2WNZwZwJZ2xtgeh3RK70wNYkYtw3DiW4pQD+KnHrU6Wu3IZWbpZ+BuRvr
         spCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684199295; x=1686791295;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hynm1WRFR42joXOQSMnUpE0lClhef2N8E1cXgaI+cro=;
        b=Z3A7gS5Qcm36z28Bm6dOfRthZpXzEhk+UNdBtolZQC9zps7vraRsWo7zQolzUm1vgX
         OlPIIC/BtMu2Td65Ix6IHsC3FbqhqEj3rRCWzR6g6y5ZNSWQ5LvzTSS6XsI0wUTorF6n
         5DQFaFRrU/qoiS7HE/V30n/YqylcNmIxMwloQ+9hY4jqSxnF+stI3xubJVoWvkb0WvRH
         7e+p9u2h4HI6vqE+wHVM4iT0i8q7gUA7o+DbMCZqe7SQc2Ry2AkIdJNqXQJAGOovuEVv
         iG3aBBdF8nUDlub08znTtLmvKlzFYH7oGbsfXphpr/NgM5Il2/giS1C3qIml5Hs4eFll
         Lnvw==
X-Gm-Message-State: AC+VfDxmypWqUlgZEXZgyTQ1QwniqCcIJ6fK2h4gK15V3UMSraCm9a0y
        mzehldjFa1Y1Kx+tGJoOUP1w7FMPk7IRMeGqU7TyGA==
X-Google-Smtp-Source: ACHHUZ4L7KlXrq74b4TMpCkOEto8lS+MNnJHPPLGEbrKLZlNnnScmCXERUSADk9cP2I9GP7bPUkaow==
X-Received: by 2002:a05:6a00:1811:b0:63b:4313:f8c4 with SMTP id y17-20020a056a00181100b0063b4313f8c4mr48281804pfa.9.1684199295362;
        Mon, 15 May 2023 18:08:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a15-20020aa7864f000000b00639a1f7b54fsm10869329pfo.60.2023.05.15.18.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 18:08:14 -0700 (PDT)
Message-ID: <6462d77e.a70a0220.51bef.4f6a@mx.google.com>
Date:   Mon, 15 May 2023 18:08:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2023-05-15-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next ltp-ipc: 25 runs,
 4 regressions (renesas-next-2023-05-15-v6.4-rc1)
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

renesas/next ltp-ipc: 25 runs, 4 regressions (renesas-next-2023-05-15-v6.4-=
rc1)

Regressions Summary
-------------------

platform         | arch | lab         | compiler | defconfig               =
  | regressions
-----------------+------+-------------+----------+-------------------------=
--+------------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig      =
  | 1          =

beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig+ima  =
  | 1          =

beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig+crypt=
o | 1          =

beaglebone-black | arm  | lab-broonie | gcc-10   | omap2plus_defconfig     =
  | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-05-15-v6.4-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-05-15-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      21330625d0f5970080f69db3d7634441d6484a07

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  ec58cf9bfb5588e6f831ee55aa6b10ebd790a826 =



Test Regressions
---------------- =



platform         | arch | lab         | compiler | defconfig               =
  | regressions
-----------------+------+-------------+----------+-------------------------=
--+------------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig      =
  | 1          =


  Details:     https://kernelci.org/test/plan/id/64628fa82919ba19da2e8612

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/ltp-ipc-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig/gcc-10/lab-broonie/ltp-ipc-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230421.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/64628fa82919ba19da2e86=
13
        new failure (last pass: renesas-next-2023-04-04-v6.3-rc1) =

 =



platform         | arch | lab         | compiler | defconfig               =
  | regressions
-----------------+------+-------------+----------+-------------------------=
--+------------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig+ima  =
  | 1          =


  Details:     https://kernelci.org/test/plan/id/6462963ace5e6373b32e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/ltp-ipc-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/ltp-ipc-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230421.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/6462963ace5e6373b32e85=
ec
        new failure (last pass: renesas-next-2023-04-04-v6.3-rc1) =

 =



platform         | arch | lab         | compiler | defconfig               =
  | regressions
-----------------+------+-------------+----------+-------------------------=
--+------------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig+crypt=
o | 1          =


  Details:     https://kernelci.org/test/plan/id/64629a0ea0ddb5cf622e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/ltp-ipc-be=
aglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/ltp-ipc-be=
aglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230421.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/64629a0ea0ddb5cf622e85=
e7
        new failure (last pass: renesas-next-2023-03-16-v6.3-rc1) =

 =



platform         | arch | lab         | compiler | defconfig               =
  | regressions
-----------------+------+-------------+----------+-------------------------=
--+------------
beaglebone-black | arm  | lab-broonie | gcc-10   | omap2plus_defconfig     =
  | 1          =


  Details:     https://kernelci.org/test/plan/id/64628af829f5a5bbcd2e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/ltp-ipc-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-05-15-v6.4-rc1/arm/omap2plus_defconfig/gcc-10/lab-broonie/ltp-ipc-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230421.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/64628af829f5a5bbcd2e85=
ef
        new failure (last pass: renesas-next-2023-04-04-v6.3-rc1) =

 =20
