Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD0B679C37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 15:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbjAXOm1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 09:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233895AbjAXOm0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 09:42:26 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AD44A1E2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 06:42:00 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id j5so1459833pjn.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 06:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8NfZ5BgrQ2c+zMYQv52QvAVdlktK2AfWvayMxTTFyAk=;
        b=Sy66usoyDCTPGvz6uEy/PBPlsT1vP+OvWWQ1ryw0UsHsGxIn9WfafcURXepBhtiuZ5
         ZbOvrf95s+9ERK3J9OfzyqSUcI5OYGlhxBPuCyDefUAUtuWJi+F3Qzi3p1kInrYAM3lX
         GdvGRHwLKs5eVuIgG2NdkZ+e7gfdFilTHLi8UHxpjh5Wf9QgCx93P7Xx0Abpy/u6zq6j
         /usZMx8dmOD1ZaGaO0kgLatF8gU/Q4vcIUHOGDeS2hoQJi9JnvxQgVb+NByjJRzIX0M2
         y37r1isXEF6ITE3u2crqd/o/q1y0AX94aoP6JhI85S4IdpBP+dPplsCO2uHKhbiSCTDH
         G2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NfZ5BgrQ2c+zMYQv52QvAVdlktK2AfWvayMxTTFyAk=;
        b=sDbZ7xVPOd/Pfdln0qZsGzUINvUF1lcaTxtitaKv2X3RW9o7E45jyvKaGfSebo1lfh
         P6PhZv1p6fsz5zKXm8+1KMHuC8Y3/VRccMf4ZYTBXaXSfRiaZ3bEMK5I72N9SL4lWwZb
         4RllchzmvTVY/Ktj3FQWIUdyTr5PxiE+jsMywM4Zhd1keb3vPQjgCY5AUVkB2PrSnHk2
         7P/opNowlaYCSulQyqWqKkV/0PHTh7UFpksonqotOiFI90CoYMpfyS4SE4bUNcSIDc5I
         AoAj1oAwMuMmwcJa1GuOIPlLIM8hTTvMwHe0YjE/MzJ29WNlTcXbGQ6yhiCDsh2WZr6B
         jwTw==
X-Gm-Message-State: AFqh2krE4L4qmcVW+LjGGxmh1/NWiB0zY2u4JBODZNmX+R3qDTrKBLI/
        /rqSLwJXWpOgjGWVYfboBnlQwQrhX/lnbJCu4co=
X-Google-Smtp-Source: AMrXdXtIu+boehm2V+KxCgJEd8kxzbY/9ouL5wtlBg7aAcnfL16Ah30l1Qu/hmoproTDnziTnmIs8g==
X-Received: by 2002:a05:6a20:c6c9:b0:b8:8a19:d6ad with SMTP id gw9-20020a056a20c6c900b000b88a19d6admr26486867pzb.24.1674571319579;
        Tue, 24 Jan 2023 06:41:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y89-20020a17090a53e200b00226156cf039sm8464760pjh.44.2023.01.24.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:41:59 -0800 (PST)
Message-ID: <63cfee37.170a0220.6e45a.c504@mx.google.com>
Date:   Tue, 24 Jan 2023 06:41:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2023-01-24-v6.2-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next v4l2-compliance on uvcvideo: 2 runs,
 1 regressions (renesas-next-2023-01-24-v6.2-rc1)
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

renesas/next v4l2-compliance on uvcvideo: 2 runs, 1 regressions (renesas-ne=
xt-2023-01-24-v6.2-rc1)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2023-01-24-v6.2-rc1/plan/v4l2-compliance-uvc/

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2023-01-24-v6.2-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      29fea68a8aaad7d0cab07f538d02aa03ad75fb48

  Test suite revisions:
    v4l2-compliance
      URL:  git://linuxtv.org/v4l-utils.git
      SHA:  2a982f825cb772419a7fe122c277d461cef346f8 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
     | regressions
----------------+-------+---------------+----------+-----------------------=
-----+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrome=
book | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfddc6e3ccab4e1c915eee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2023=
-01-24-v6.2-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/v4l2-=
compliance-uvc-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-v4=
l2/20221216.0/arm64/rootfs.cpio.gz =



  * v4l2-compliance-uvc.login: https://kernelci.org/test/case/id/63cfddc6e3=
ccab4e1c915eef
        new failure (last pass: renesas-next-2022-12-26-v6.2-rc1) =

 =20
