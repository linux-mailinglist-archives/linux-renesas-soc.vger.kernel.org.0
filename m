Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33BAF7D3775
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 15:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbjJWNJI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 09:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjJWNJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 09:09:06 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E640FD73
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 06:09:04 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c9e95aa02dso23361325ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698066544; x=1698671344; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7/YuZgMdEUTlEl9hFiTG+jzJQfuCNxRj6WY45szLxs8=;
        b=y/Lf5xnaEuTRoyndtTvMMivpoXCgifbNhESznYG24MwvQmbwWyG5uXrz60CFDESD6G
         57yr39gv60UnMdvfX7qhzwyIXCjwY22LkfjHc7t0c0g3exTCS5GjL65JBPrlqCncA6Dn
         MoHpZ3BYGFKKGFWRFuLz01YLvVCs1ZaroaxFJSGQIfXTrjcvd2XxSQy52JXPWSo+0iMR
         a5yk7ptSbmRItZC+M/TYeijWwFLgbgo1a+WOO0WZsBRgxHDiFb7C507EpeYVx+cyH2kE
         tG7yV5KnlyxOPOA1/PkRZcO7dZnIQr69dF1yDzBZj+ASUnz+fnTnzztig65bzg9LtLMh
         esZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698066544; x=1698671344;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/YuZgMdEUTlEl9hFiTG+jzJQfuCNxRj6WY45szLxs8=;
        b=Zx+m66m3at9yPpHSCZtZWQzCjTApS2vUhp4f7pPykFIZyXfPqxqPoDqa9YnAtttreF
         IqDvN6ezspU3HNThS5752dU9pCwoWfVbhcrBFjwVM0dU+6BGKp8nCzoPQT7Y8otFB+Uz
         9pz7pV299QqPim4C5b2NJA6Y6q/rmbo8LMZPl46Yi4+t8PkNlTz8AawwvoDnY1LfI2kZ
         N2waL5etoL83PatlGniP+G2WS3bHPjxWYZkgzzCVbg0rJ53UYszvZOr1+w8OP23+XzPj
         LFxinqPuu3rMBIO8CtETSfTQDF1Uul0q/N10sjINl7uHG39Rl5DSlUlFafCpSv93eJa4
         xz1g==
X-Gm-Message-State: AOJu0YyvpXpq/4QjkMW74XAkT8ffoFgDp7BrzG9YiJFzcsPj7yN5f57d
        a2ZoOOpPsbKFmZR2Ppn2cn/9NaHVsordep0Z9gr3Nw==
X-Google-Smtp-Source: AGHT+IGsIVX0otGfh2lIMlNkUg3Z8SrVKRo1MFvorpG0+5TQsCB3frEUNIuB9qwttWoRDgHem0bF1A==
X-Received: by 2002:a17:903:22d0:b0:1ca:e16f:a713 with SMTP id y16-20020a17090322d000b001cae16fa713mr5853544plg.2.1698066543917;
        Mon, 23 Oct 2023 06:09:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ij23-20020a170902ab5700b001c582de968dsm6049739plb.72.2023.10.23.06.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 06:09:02 -0700 (PDT)
Message-ID: <6536706e.170a0220.23887.1a0b@mx.google.com>
Date:   Mon, 23 Oct 2023 06:09:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-10-23-v6.6-rc7
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 13 runs,
 1 regressions (renesas-devel-2023-10-23-v6.6-rc7)
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

renesas/master baseline-nfs: 13 runs, 1 regressions (renesas-devel-2023-10-=
23-v6.6-rc7)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-10-23-v6.6-rc7/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-10-23-v6.6-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      810ad90f451c3b5c359bdd01e1b029ee3e23a532 =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig | regress=
ions
-------------------------+-------+---------+----------+-----------+--------=
----
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/65363fca65429b0957efceff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-10-23-v6.6-rc7/arm64/defconfig/gcc-10/lab-cip/baseline-nfs-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230623.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/65363fca65429b095=
7efcf00
        failing since 69 days (last pass: renesas-devel-2023-07-11-v6.5-rc1=
, first fail: renesas-devel-2023-08-14-v6.5-rc4) =

 =20
