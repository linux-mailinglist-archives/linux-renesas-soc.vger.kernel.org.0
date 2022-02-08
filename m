Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17F14AD967
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 14:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbiBHNP2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 08:15:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348201AbiBHMZ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 07:25:58 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611ABC03FEC0
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 04:25:58 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id z35so1516756pfw.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Feb 2022 04:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2Cj0XR69XjLuaJSbCPnxCoss1WvOh57UDdXj2d6XOc4=;
        b=T1c+YmX7fnk9pnv/BMmcfiqlqw7AGYlB+4n+UVsWyIfnbUZIWj6bceVPV51RRthcM7
         klqtOmvlKdBYN+QsQ41oceXd2jhlKmTxElNmCkzPqLwwjI4/yCwuXrTHzSAHtX7qWWcN
         x67fJrDGPp0kv9hMbHakf/IFk8Ly4fOPrUgH19tyqIHaCc+9DRrgSOcjBDnnP48X8RzE
         yD6Ytwe+feFnAKZscN5TKHdyVTuZCacGHpIYhlB2FfvhwL8n4TgLaQkl2QvbOlSKjzl/
         IWiywa/qM3ZBjdeavEidLmo+reHB9zbce2z41+vmQn59pr3ghxuLe0m1amBq3jsJNzl0
         52jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2Cj0XR69XjLuaJSbCPnxCoss1WvOh57UDdXj2d6XOc4=;
        b=GpLeYzBbOznKjJNIpWo4fascUc/lJENin3KYefe+owuTCHHMgc0rSleIHjrsDSEOvU
         5jBIQ1orFSpF2N4Z4F62/E5w9oYMiYEHsd+J+2t8SVtRpb4UU95Ru5Z35hidm78YhAVn
         WvxUQJp3LzoosyoDVgNmYlgaYL3cn+aOI5OTvyqkNA39WInwHT0Pz6HQz92+gA56egKP
         xZFNy0E3eBqITCEzKBMWeZbebQJ5viqkC5gZDSFU7G16plYVEOE8ihdnkh9WmAuOx7rC
         IsAzctNT/SuCtPzZ64bTvuV/tHxPMnzIMkiOV5B9hl2h0N8Hxb5Xi4/2bzqY6O9Po8kG
         Bq7A==
X-Gm-Message-State: AOAM533Uk9o9Bo2Ug54Ks8/hLsI8SYCrFK3kax8f5ovNcLoheS96JXiJ
        YYqqVzZWsWh2khd8zgrZI+zKhdgeI3hQ8QC8
X-Google-Smtp-Source: ABdhPJzgqXhy/AFTQKuwTa25EOrCKLP1ajKjgLOB4AXHQDwdaXbURqdecrqsIz6E+EGbB6GX0Hzr8g==
X-Received: by 2002:a63:f50f:: with SMTP id w15mr3297269pgh.113.1644323157717;
        Tue, 08 Feb 2022 04:25:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s15sm15512892pfg.145.2022.02.08.04.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:25:57 -0800 (PST)
Message-ID: <62026155.1c69fb81.a5118.7578@mx.google.com>
Date:   Tue, 08 Feb 2022 04:25:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2022-02-08-v5.17-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2022-02-08-v5.17-rc1)
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

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2022-02-=
08-v5.17-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-08-v5.17-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-08-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      65a3b7e5807616a88f3c6a25ce47cbc706676b63

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  ae2eb9e18bc58a4c45f28cfd80962938198dec3c =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62024b64aa0e537d495d6f1c

  Results:     79 PASS, 15 FAIL, 142 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-08-v5.17-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/igt-=
kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220128.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
2024b64aa0e537d495d6fc2
        new failure (last pass: renesas-next-2022-01-28-v5.17-rc1)

    2022-02-08T10:49:45.926071  <8>[   44.669717] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dinvalid-set-prop RESULT=3Dpass>
    2022-02-08T10:49:45.931930  <8>[   44.681219] <LAVA_SIGNAL_TESTSET STOP>
    2022-02-08T10:49:45.969461  <8>[   44.717606] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2022-02-08T10:49:46.003285  <6>[   44.750505] Console: switching to col=
our dummy device 80x25
    2022-02-08T10:49:46.008113  <14>[   44.757243] [IGT] kms_setmode: execu=
ting
    2022-02-08T10:49:46.021007  IGT-Version: 1.26-gae2eb9e (aarch64) (Linux=
: 5.17.0-rc1 aarch64)<14>[   44.763296] [IGT] kms_setmode: starting subtest=
 basic
    2022-02-08T10:49:46.021812  =

    2022-02-08T10:49:46.024126  Starting subtest: basic
    2022-02-08T10:49:46.027981  Testing: basic 1 connector combinations
    2022-02-08T10:49:46.135065    Test id#1 CRTC count 1 =

    ... (143 line(s) more)  =

 =20
