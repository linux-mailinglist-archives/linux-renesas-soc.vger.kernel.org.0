Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEAF4F54FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Apr 2022 07:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245681AbiDFFXt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Apr 2022 01:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1587752AbiDFAKQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 20:10:16 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8C314FBA8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Apr 2022 15:34:40 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id d185so577867pgc.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Apr 2022 15:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7jg0Lt4RzOLdP4vva0SaQ4EORRb3nM5UhWTwYWC2jGE=;
        b=vm8amBB7cwklyrInuiuG0wE0rMongLw8cwsqSeuPYZHdEdbt7/lH/Yyv0vBYZojDYS
         ivgWFUBccOEipZekRDB/UBXH78AtsgES2dqu3OvcXBl1vGh2ExCUZbGV+u9YZKb+fFlo
         bsZfOl6w3Ij/z3qnHlrA1Pcy8Z3e9T+skzC4jZDc2Cc5NndCt+RjsQdxYOAwsM9WE4Xz
         Xfk702gE89gq6/HWg6lq+XME5lXEVQfNBsm6tPFbxg3ItIwtnTKRFsd5hBG2BqoJPR56
         Ev+N0VAdFa+V2hE/mjh5OAGc1lntc461TibOeb89kUHQsJFYpPjq2toxpf72xjzqnT2J
         +30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7jg0Lt4RzOLdP4vva0SaQ4EORRb3nM5UhWTwYWC2jGE=;
        b=kwGtgdE6deENm6scWe1E7P90sUpLfrm8UtsXu1LqItDrPPA4fD0+jUZ6N1iLCyzhc0
         d/jTgGUiVuqxN7hysCzFSEGsXBBTJROguokmuYY/UsnTZWBQ4teYYRXL4GUILABPUWcP
         55w4ZjkOi8kMReCGSHiGeUD2isklRRGYQc6plIWBBS3jE2ad1Di0YCH4urtKtMGF2jPQ
         nxvJuG09PTjU3rt7hx/pvotYQlshMtHEHU+p8d5iqTVIgLcDaE21o2amhsLTZQdn40/R
         7yLktDtpcZjTYiLWpVz7V8KHL720aSHC3HCh3HYKYoFJnNJx91J35+/X5yhuTNgfS+r8
         SYFQ==
X-Gm-Message-State: AOAM5328kwjITSeA0XnuUutfBPybx7Yu7aiiVLThNbjRkU7HbeKUyf69
        sSclY7zEq6gxYJG2TjHMT0uc6LyUbL3UP0XyG24=
X-Google-Smtp-Source: ABdhPJyEWxY6AvqPAIrYfRg7P+okH/BSjfpPpCpBuMiGxbrtefnY+BHLc79iMNGKesMBxXfK73PwiQ==
X-Received: by 2002:a63:cf12:0:b0:399:38a7:5063 with SMTP id j18-20020a63cf12000000b0039938a75063mr4585336pgg.311.1649198079814;
        Tue, 05 Apr 2022 15:34:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o1-20020a637e41000000b003804d0e2c9esm14094898pgn.35.2022.04.05.15.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 15:34:39 -0700 (PDT)
Message-ID: <624cc3ff.1c69fb81.8d0b6.53e4@mx.google.com>
Date:   Tue, 05 Apr 2022 15:34:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-04-04-v5.18-rc1
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 39 runs,
 1 regressions (renesas-next-2022-04-04-v5.18-rc1)
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

renesas/next baseline-nfs: 39 runs, 1 regressions (renesas-next-2022-04-04-=
v5.18-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-04-04-v5.18-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-04-04-v5.18-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      eee41de7440d0f559567f48dd5920f8155247174 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624c8cf6557d5324a7ae068e

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-04-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-04-04-v5.18-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-nfs-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220401.0/arm64/initrd.cpio.gz =



  * baseline-nfs.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/cas=
e/id/624c8cf6557d5324a7ae06b0
        new failure (last pass: renesas-next-2022-02-25-v5.17-rc1)

    2022-04-05T18:39:30.762908  /lava-6030975/1/../bin/lava-test-case
    2022-04-05T18:39:30.799851  <8>[   37.835959] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
