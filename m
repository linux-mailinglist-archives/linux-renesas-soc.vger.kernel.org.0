Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6759722B2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jun 2023 17:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjFEPf4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jun 2023 11:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbjFEPfy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2023 11:35:54 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A7EAD
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 08:35:53 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b04706c85fso46108275ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jun 2023 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685979352; x=1688571352;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sIBfRmML2u5vkhRcRM82ln2qI6uu63IOxj02eDtNhKY=;
        b=aPG7iaVlduJFM9Y/r08f1ZQD9qbAPApATNVeJE3qk9K+9DZUUKQZRpvjl3QX+CWZti
         waXMtpTkmY25VP/FME6f2Wygh+1qe6MPxfhf2EHA9r17YZmYRwBSS5chOUn1/hJUCL5Y
         dHXi+i0zssGk7HDdZ9UQv3mg+JGwq15R1J1D34K2JqkwhObb3bh8XtCZaPp8KQY3YmqX
         AD7stwzlH/zEDbrvxfzGacrUMTcXVl4G7ggJv//E0g/CCzQBwUTugjEt+RAcRphebrnH
         wv3zIeXiibxOLlGoZwI3hwlSKJw3sOL3hC1cv89Vj77+/Szb9T5M14NAgp/hMADpYMae
         oXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979352; x=1688571352;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIBfRmML2u5vkhRcRM82ln2qI6uu63IOxj02eDtNhKY=;
        b=mDGhL55A4ZTkEqdPx9Kkac5wFZnm0lcdvxoWzWXzWhRzMmnTDADPg9A3LtKr4XLoV/
         rpTPorO4Q798RUn/hwDSLixSX9wVD9mPg7AnGlOz1XDCSfdT57bZWuTtjIeOrBnzSMBf
         8Kf6mkSvpmImwEcMso/JATWCCfmx8uUbBgJ9tRgTaQ3h1XrC11aaXW8Xou6G07v2Q5uz
         RM7O59UOKWjhRq2/OdsY8OdPv/+X5/iSTujogHq1dIx5gLj9NxBMdHmdtNo+wygOhJzI
         80lFHuhPYnihg7GJPtWEXDWRrW9z47AinE0CVbLJGpJcNAVzK5Ic9dFe08I+ZBS9gAk6
         Tk2A==
X-Gm-Message-State: AC+VfDy8b1Ld7KMpLDM5uO/3e5UVmbsE0Bfm2yayMXbwUInaI079P7c6
        2dyJVSW+6zsAM2++lfl1MbBIzxPuPRsCHJ5f3QjlYg==
X-Google-Smtp-Source: ACHHUZ4JXKQxPQErazaLRFAbN9iOnu8qG0Axoiqzf9/bL1FnoA3/wN3J0bL9TIxdenDjXaW7gEU6pA==
X-Received: by 2002:a17:903:1211:b0:1a6:82ac:f277 with SMTP id l17-20020a170903121100b001a682acf277mr9630686plh.14.1685979352319;
        Mon, 05 Jun 2023 08:35:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709028f9300b001b02713a301sm6738627plo.181.2023.06.05.08.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
Message-ID: <647e00d7.170a0220.44e5b.b9e9@mx.google.com>
Date:   Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-05-v6.4-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master ltp-ipc: 29 runs,
 2 regressions (renesas-devel-2023-06-05-v6.4-rc5)
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

renesas/master ltp-ipc: 29 runs, 2 regressions (renesas-devel-2023-06-05-v6=
.4-rc5)

Regressions Summary
-------------------

platform         | arch | lab         | compiler | defconfig              |=
 regressions
-----------------+------+-------------+----------+------------------------+=
------------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig     |=
 1          =

beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig+ima |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-05-v6.4-rc5/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-05-v6.4-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f669ef29adafb15e4632ab82c733cdf32339a90e

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  604701dc19c5499403ae5afe48103b8e2872952b =



Test Regressions
---------------- =



platform         | arch | lab         | compiler | defconfig              |=
 regressions
-----------------+------+-------------+----------+------------------------+=
------------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig     |=
 1          =


  Details:     https://kernelci.org/test/plan/id/647dfef77092b764cbf5de43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/ltp-ipc-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig/gcc-10/lab-broonie/ltp-ipc-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/647dfef77092b764cbf5de=
44
        new failure (last pass: renesas-devel-2023-06-02-v6.4-rc4) =

 =



platform         | arch | lab         | compiler | defconfig              |=
 regressions
-----------------+------+-------------+----------+------------------------+=
------------
beaglebone-black | arm  | lab-broonie | gcc-10   | multi_v7_defconfig+ima |=
 1          =


  Details:     https://kernelci.org/test/plan/id/647e004c942464a930f5de37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/ltp-ipc-be=
aglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/ltp-ipc-be=
aglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-lt=
p/20230527.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/647e004c942464a930f5de=
38
        new failure (last pass: renesas-devel-2023-06-02-v6.4-rc4) =

 =20
