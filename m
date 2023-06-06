Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138AC723FAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 12:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236778AbjFFKf3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 06:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236975AbjFFKe4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 06:34:56 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BB310C3
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 03:34:45 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-652426346bbso2975227b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jun 2023 03:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686047684; x=1688639684;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o03Zlq7n7bQdHARkSIUajjTzOb2jCKESvYzc4x45s58=;
        b=lXs1xvtICYbGEiJvffUIlQYg2/L1Rin74K6/aIgfMumGdCH1MawBRxj4LSOssQodkc
         HZrNm9oL4f98um4xMgvv+kFbIUg3pykRLthbUB+7GPLC03Jok2tFC44/I7t9sgB+/h6G
         IbyY/RWnyXWF9pkSHfaUyHiyPuExcI3tR5lrBo3DN/Re2EuuoCAHNQleSCwp9TTCmka4
         37+PiLCjSDcJ3qn071jqY5fXDmU9tsXEwsarcrmEwVLb5z80qQI05iI2wY93+xWKMxka
         +82ACBvD221PIFy9SFPvSJZ1n24BSyn9ZYngNYcKVRlO5UIr+KeV4sYYipi1zqIAk+4i
         zE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686047684; x=1688639684;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o03Zlq7n7bQdHARkSIUajjTzOb2jCKESvYzc4x45s58=;
        b=GKlAPN4GRATNDxZnoXOs1Nl1Rvzf4ckXsEjCCLGGcN+tEVnF0ynwK0678F0TkW2ocG
         uge5M6Y2x4aZx0d7PjezYy3xU0HyomkNYBdJo8GrOhv+nDd1D921VKN8E/UmLmlmGqUD
         AW90FWW9IBukD/3xuSDJa558qE10kUwvGpKWz/lumkqfUCcUzH0LB+/roaaQR/zC3RnD
         qfSRSUsiIiRSMLZRMcn0lH6IR+KIsKoCA18sVOC0BD/QYr5vO6h+1W4LSvbMnVYeKwn0
         2XWfxBVj33ivzLBrP+0HlECUiGFLHQNwEpapl7tC1xMLAv8qkN5U2KskeOrlOrY6UGiG
         Srtg==
X-Gm-Message-State: AC+VfDzrsLWMl1fVJVPoF+7bV/ykHHvpVmlT4XHMyTBooNghGJpfDdjE
        jyWxxhHaYfhDimg7TPHdzlwyq9VMFLuHUjMp1wtwLw==
X-Google-Smtp-Source: ACHHUZ7wL7RAvm2Ls7YUhQ14YiGZY26AnmGVYespUKVesAOv+sUYUvOMb0xcA8J95DdaZGF7jks/yQ==
X-Received: by 2002:a05:6a20:3953:b0:10f:13bb:5d4f with SMTP id r19-20020a056a20395300b0010f13bb5d4fmr1001789pzg.2.1686047684292;
        Tue, 06 Jun 2023 03:34:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902c3cd00b001b034d2e71csm8207034plj.34.2023.06.06.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:34:43 -0700 (PDT)
Message-ID: <647f0bc3.170a0220.654eb.f065@mx.google.com>
Date:   Tue, 06 Jun 2023 03:34:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2023-06-06-v6.4-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next sleep: 5 runs,
 2 regressions (renesas-next-2023-06-06-v6.4-rc1)
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

renesas/next sleep: 5 runs, 2 regressions (renesas-next-2023-06-06-v6.4-rc1)

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


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-06-06-v6.4-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-06-06-v6.4-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7762defcdaf029da668d5af3304d3d940d43199e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef893c995f9b4b0f5de98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep=
-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep=
-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/647ef893c995f9b4b0f5de99
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647ef895c995f9b4b0f5de9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep=
-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-06-06-v6.4-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sleep=
-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/647ef895c995f9b4b0f5de9c
        failing since 3 days (last pass: renesas-next-2023-03-30-v6.3-rc1, =
first fail: renesas-next-2023-06-02-v6.4-rc1) =

 =20
