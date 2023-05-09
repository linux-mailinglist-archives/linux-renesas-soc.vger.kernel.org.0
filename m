Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4612B6FC8E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 16:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235920AbjEIO0Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 10:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235908AbjEIO0U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 10:26:20 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800645246
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 07:26:03 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6436e075166so4456267b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 07:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683642362; x=1686234362;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jAD+TMHubHfOg1angMRA+JRk2wPy/IPA1CxC1aPKJ2s=;
        b=qkB1I3WT7BrjekZ7RdhUvNUQHom+czeG16rDtdwBi1nCctGHxLn2Xsl5aVW2KNLEqe
         L6xz/Np28vzKp7isFeSdFZasqh2SS8jcorje3KU/mEFH1RadcYruQua7LtU4/mlVk1Rh
         SPmY1kkngLaQ9K+/3LDGRgEtWR98o1wsIMGeuDPvugRcs10kZtWHHqjJp1kEfNCxpDMZ
         12TPACJKjAs8R6uh3xB9ILMSVoQ3op2tAWNfbpceQqnySINEaPMRHoUnrKPA6545Fp75
         V7Jx4ovstX7mnEV+ESfuP5TZ8B9T2YGYAZ/V0h6YghHVx8jbyqoFeHIdOxo8JLLweLEj
         1+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642362; x=1686234362;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAD+TMHubHfOg1angMRA+JRk2wPy/IPA1CxC1aPKJ2s=;
        b=OZ9gDm1x3oxlCCMNTV1vCnuNU0yFBbIkmBPbxhDnjvlazTKOnPuJEItIS91/yQ10dE
         yzlrB5VT5yDvi+QdonxVvX/7KjyEP3Phi8PVEPn0gNLW/hAk2yPQQ+sc3DBLZGdJAbUw
         fugLd4OA6hIHJ7KKahm9W2LnsZHNeyRxGnFQUS/qSa5/1WK1cdZ7F9IgDVPD+McM9tyo
         PTSRuy1nq7VQhT4qtvtRJXrDqbrRcnlSfvSIT2yuoBfS87S6OZKphcdlP50qem10V5r8
         e+ZSwCk3a0FnKts8aUBfEwCLSMiHwYYsRCAnbJskDb10A8DlIGu5DwytPA/89kCBv7Co
         mSpA==
X-Gm-Message-State: AC+VfDwvceZkU870w4ZRQqNb9gyrxxc9YAe70I70jLBkxrQB7Fe68t8D
        nap4jAfit/k/+vEcVJEuu4l1ApsnlJgNm5dYxaycOA==
X-Google-Smtp-Source: ACHHUZ7XhLDFL/QihiNuypPv5+xg4VaeR5fqZjpFq5LPhKmlvbIgRiGi1hBG5/yhFD0Q9DDLPw+EwA==
X-Received: by 2002:a05:6a20:a10b:b0:100:a201:83d7 with SMTP id q11-20020a056a20a10b00b00100a20183d7mr7503047pzk.1.1683642362038;
        Tue, 09 May 2023 07:26:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b30-20020a631b1e000000b0050bd4bb900csm1388357pgb.71.2023.05.09.07.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 07:26:00 -0700 (PDT)
Message-ID: <645a57f8.630a0220.98050.22dc@mx.google.com>
Date:   Tue, 09 May 2023 07:26:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2023-05-09-v6.4-rc1
X-Kernelci-Report-Type: test
Subject: renesas/master sleep: 5 runs,
 1 regressions (renesas-devel-2023-05-09-v6.4-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 5 runs, 1 regressions (renesas-devel-2023-05-09-v6.4-=
rc1)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-05-09-v6.4-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-05-09-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dce70215cdd5598b16b34f41c88d168ad124cd45 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645a49a9c0cf2ce76e2e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-05-09-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230421.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/645a49a9c0cf2ce76e2e860d
        new failure (last pass: renesas-devel-2023-04-24-v6.3) =

 =20
