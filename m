Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C91684C5464
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Feb 2022 08:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiBZH3B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 26 Feb 2022 02:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiBZH3A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Feb 2022 02:29:00 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D6313D28
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 23:28:25 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id bd1so6568313plb.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 23:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ixDBOhzoDTL74IK9nbzqwvrLHDnkaZNeerZ7MxxfEhY=;
        b=HWw+/lT6LNy4vUO16esAnRINpzkL/vnPjIseCDoi6uYyGOMad5Y/5zACkENJh3mvB2
         ddf76RqgFsTPtAuR3SNRFGhMuOnithJwur4TfjgHPF99R4UvT5bcahvqJ1v9tporhAys
         4sutvNtUtLC/+46+4u0z/TKKNlk9L+SmP4kG/lgBD9NVR4PvQZzf27B/d/XNvRVlslmo
         vOd9Mq+tGcMTmvdPwP8o8m9FEwRQQfQtpDz3VJgcgZenVq1cJapSQew/QoCnJ5KDs96t
         0C1kvXUw0+qjokakdl/MKfSxlegEA8CloqiiLHViZoWGb1g2chMslmAaJebi49xe9ueY
         WHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ixDBOhzoDTL74IK9nbzqwvrLHDnkaZNeerZ7MxxfEhY=;
        b=wR3PIzpgsD/SOt1ZMzYwagQNMdC1A7JugR+NSU8tbZEUcPAs5NQiEO+2gx99LYvqa1
         H5HwhTIvf9VSEMsGfHFeSyOO/rvSzaA5MpzEF8WYswlqN6Z0817eHhSVUStOgHu3sRXe
         KD1KxklfaOarzlJlTEre8rASeTTLh7V8owhpWkGkJcAyl210S9mjaSdocVn9/bEfkAO3
         X43+sGtXJk28gPcfqvBKhNv3B8UE0+Wme9KOjTZ8+tY5PQGcEqFGNxQvpH8xT3hwH7Uq
         cfjz3L3K+xLHgjW7i0wKhJ1J/1ETltJZQgXQyz3zUHnKCt2SyDfouBk9aRJFc2yO5OSk
         n2OA==
X-Gm-Message-State: AOAM5301iwZ91HFRYm7k1IZSxh6GxzYp/DMbEPi3F3I9paKWPo0gjBfL
        pjBcbRp45rbEyahrY4ULW2JBuc0yzu6UciByIog=
X-Google-Smtp-Source: ABdhPJwO2ft1uXKJcu09X09d0JO5FYEpLAn8UaOS/9lVmA+UpGcvNskOrlOPhJzo37DX9SrxRx6gBA==
X-Received: by 2002:a17:90a:2e04:b0:1bc:a5db:bcdb with SMTP id q4-20020a17090a2e0400b001bca5dbbcdbmr6888615pjd.116.1645860504566;
        Fri, 25 Feb 2022 23:28:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090acd0500b001b9c05b075dsm11204138pju.44.2022.02.25.23.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 23:28:24 -0800 (PST)
Message-ID: <6219d698.1c69fb81.3d14.cbce@mx.google.com>
Date:   Fri, 25 Feb 2022 23:28:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-02-25-v5.17-rc1
Subject: renesas/next baseline-nfs: 46 runs,
 2 regressions (renesas-next-2022-02-25-v5.17-rc1)
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

renesas/next baseline-nfs: 46 runs, 2 regressions (renesas-next-2022-02-25-=
v5.17-rc1)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto   =
          | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-02-25-v5.17-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-02-25-v5.17-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dff7b84b4d2a5df4fb98714257adbb539807d7b9 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+crypto   =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6219a48c350445f213c62989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-nfs-r8=
a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6219a48c350445f21=
3c6298a
        new failure (last pass: renesas-next-2022-02-22-v5.17-rc1) =

 =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6219a839ee4335ed60c6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-02-25-v5.17-rc1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220218.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6219a839ee4335ed6=
0c6298f
        new failure (last pass: renesas-next-2022-02-22-v5.17-rc1) =

 =20
