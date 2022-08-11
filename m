Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57DD558FC39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Aug 2022 14:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbiHKM3n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 08:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233955AbiHKM3h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 08:29:37 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAC289807
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 05:29:36 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id 17so16779873plj.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=KmVVS+F+ndFBIyTy+qd3JvmBBNpzTyQR4JXgxGGoD44=;
        b=QdDfa+Hefs2Tuptl1g7D95xUIKoK+y1zNjkZzbuhMFEpJFSjhof7a95k63z8aCqFDF
         a1sm8Y0KMXZEVyD+hHyLYPOlcW/uJhxYCkgiDsUyHXhfEXtAoHPJbBAYfq7O3jCGe5Y0
         7xIiu+R2cYj3kLITBEZcryfa+1p58r4Jr0FW8NQuI+x/DA3QD1uXdyBJiqSP7EhGVgsY
         j/04XphxwHsVTqobJPAG5NS00QDlyy7dUTe/uTRPKBqfPQd+umFgoju3F3hHVKNrPZjk
         naw8//emYyhzBIoBzrJSMTQGHd3um40bfSUe3mqfefXApLS4/LJZFnplH04uoOU4Xa2B
         zMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=KmVVS+F+ndFBIyTy+qd3JvmBBNpzTyQR4JXgxGGoD44=;
        b=5HLvuAI5G6E67iYgaxCLQTy8jEPbTZaoJp0Fjg47YcnO86QrVvDPYMmk153vFoX/Lb
         rfjcEeaB4VvdkvEiBbTVdQc3o1n1vnc1QE3PJVqxEc98OCoI8Qlu2VufDlaxNwQ5VVeB
         +Jgy1KifjM2UYQqd0QF5af8/1CPis3Dd+5gCiCFLewG9U1+bDaIm18BKc0/DpFr1oSyk
         MiefPKVnPE7ue5lSxi/MLYrwLZp+X0k/EWcMBTcH/q7njhs9QOFbKcxPhbF+N87Jc1BP
         19Ub3ZmdqpotWM7PnzTEgxIyg7d0exWI/oLJCebbDdYnq8FJ7/iXgxZAupf57de6a7f8
         yWfA==
X-Gm-Message-State: ACgBeo3eTIoo58t0CxsYPVlPpgGlxeQrpgBITldUoaozjmifgeP9fZQ9
        wBfUMmJ449CUp0yoXk9fMPGSnKy/5jEgiHb4FLI=
X-Google-Smtp-Source: AA6agR7bShQGrV3aftWIogKfNOpKhn2/Zgfy8svWNSYe1naH3Jiu0B/E7mXgDf6Kr/zCS3uXux1FOg==
X-Received: by 2002:a17:902:e154:b0:171:4e75:a282 with SMTP id d20-20020a170902e15400b001714e75a282mr1368730pla.90.1660220976304;
        Thu, 11 Aug 2022 05:29:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x14-20020aa79ace000000b0052d7606d144sm3909173pfp.74.2022.08.11.05.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 05:29:35 -0700 (PDT)
Message-ID: <62f4f62f.a70a0220.5dae2.6f17@mx.google.com>
Date:   Thu, 11 Aug 2022 05:29:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2022-08-11-v5.19-rc8
Subject: renesas/master sleep: 9 runs,
 1 regressions (renesas-devel-2022-08-11-v5.19-rc8)
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

renesas/master sleep: 9 runs, 1 regressions (renesas-devel-2022-08-11-v5.19=
-rc8)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-08-11-v5.19-rc8/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-08-11-v5.19-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2a245a07d9664fde5a92478ad52da19ba8962926 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/62f4e69d4bb9cc726bdaf065

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-08-11-v5.19-rc8/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/s=
leep-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220805.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62f4e69d4bb9cc726bdaf066
        new failure (last pass: renesas-devel-2022-07-22-v5.19-rc7) =

 =20
