Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD848722B28
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jun 2023 17:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjFEPfy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jun 2023 11:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbjFEPfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2023 11:35:52 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1930898
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 08:35:51 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b041cceb16so42823395ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685979350; x=1688571350;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+9V/HJ4Jk7pLx/0b3FMJ2j94jV4hWi3Tv4JrfPrJORE=;
        b=eijzsdvyFltTq0OapJS2CZDAP4MgzMqU5sAQH4g6Tc1r1sKyBCDTC2qkhnvCcW6Y/i
         98cycZPFB44Gd00eoLh2lxqXfsEzt5XmNxrZ7XOGLhRxiF1d3mZjNE+TH+Td8ROr7ZXj
         B/HW5wiZ0E9AMNCfCVojNTupccRBWSgD5HhOOd+eemns0RzyKuqCcfonZ1ha5/8FtzAd
         eqDwDK9dT+nXZ/ZRa3usqh1c0bagN+3oHnviiCm51dgNNIREVK9oiskEic6+diAQYGOh
         awAahVQT+MjyEMSG03Pm4lCFBupqaPJg+yvVwrkmYulIb0UqCWc/aWdgce7V55CLvEVc
         uHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979350; x=1688571350;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9V/HJ4Jk7pLx/0b3FMJ2j94jV4hWi3Tv4JrfPrJORE=;
        b=ROv6k17nBwXDfXPbgrWjCNeDPZTlsIKIih55LWb2M2X6QD848aW8Dpjr6ZPtPdEqkR
         cFxJjJAAdCizfGB0B9yhV3GfCyGYODYAfDM5dmetBW4b2apiY6LgC8hs7yRBfSgVRdxV
         yGOIrblXeMiPL9W7ITxUboo9T1aK6SPs8ipzwvlW7doDe7eWPfGRq8UISIO9pc8jffDW
         MMmwW/aoX/rYAUCoLHJUxoFsFghsjWwf/GptIJmxwTXyH6I5VIKJnb96Cy/csLNt53rx
         SJNybfFDX7jhaP2GyJIRcip8pyKSVhjbPF/7FrBz731pVw0U4uuljOkvnl8uT8cODEEj
         C6tg==
X-Gm-Message-State: AC+VfDwi2V8c22pKey1jfuTswmeIBt+FudtpVq74PJZCDr9jOO4OmvJ+
        DQVtvgvgUAhXeObjaQztzc5lzNcRHwCLWtT2O7qccw==
X-Google-Smtp-Source: ACHHUZ42VLVo+uFW6xM5Kdu0w8GKQeMaiL92n9hMGR+FzFuRkzk0oGrTc/rKIQPcvldMwBvwXyaFYQ==
X-Received: by 2002:a17:902:d4c8:b0:1af:9b8a:9c75 with SMTP id o8-20020a170902d4c800b001af9b8a9c75mr9268010plg.7.1685979349899;
        Mon, 05 Jun 2023 08:35:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b15-20020a170902d50f00b001ab25a19cfbsm6744670plg.139.2023.06.05.08.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:35:49 -0700 (PDT)
Message-ID: <647e00d5.170a0220.8457d.b90d@mx.google.com>
Date:   Mon, 05 Jun 2023 08:35:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-05-v6.4-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-gpu-panfrost: 3 runs,
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

renesas/master igt-gpu-panfrost: 3 runs, 2 regressions (renesas-devel-2023-=
06-05-v6.4-rc5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-05-v6.4-rc5/plan/igt-gpu-panfrost/

  Test:     igt-gpu-panfrost
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-05-v6.4-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f669ef29adafb15e4632ab82c733cdf32339a90e

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98e1db501173303e58ef6a1def94ab7a2d84afc1
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  766edf96979bf13a10c9985c007f2baca5c9e308 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647dee1c73b6f9dacef5de2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/647dee1c73b6f=
9dacef5de2f
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647def7f2c57023b0df5de35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/ig=
t-gpu-panfrost-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20230527.0/arm64/rootfs.cpio.gz =



  * igt-gpu-panfrost.login: https://kernelci.org/test/case/id/647def7f2c570=
23b0df5de36
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =20
