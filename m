Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7112C5A4775
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 12:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiH2Kpr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 06:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiH2Kpp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 06:45:45 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D28228726
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 03:45:44 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id c16-20020a17090aa61000b001fb3286d9f7so12209217pjq.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 03:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=zBWFW9qKjNrNejIF8ZklwWxyx2lAcyYLvU6jTaGkIhA=;
        b=H6U3Km1c3u6cHBSB9skN8now3J1lkFMWOUr8VWhJFWW0rOeksYfIHFY/yWnhemsnDt
         BnU3yFV3CkxbPdaFcUKRkAoDojw7iHe1h1D2oXd52CRDMLHlNuhqGRIINYLEG2uzhUh/
         6zkS+M0YOmYdx7gy8yGqeCzIbB8XctSJce6YHmx9Uuof+g5+VIxMf+zVOERvbCTZPs5z
         3TY4f5XbzRkHUyqaPwfOIGPl31tPh3Ec+l1HNOBxaWfR/48OuE1wdAkRfv7CQPs+myFb
         Lakqxwj8HpBZfv+5rDbEQZ03f8syxV9cktfw+uCJK3p4iEIKdhmYqWTCwLFFsjdYOCOD
         gv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=zBWFW9qKjNrNejIF8ZklwWxyx2lAcyYLvU6jTaGkIhA=;
        b=w6TRVOdwRusw2ePuK8fBDfF1gnG45yOgo2IOku4lNLZkjsC9PATuNGqwiWzXUGBfxO
         Aoe2rU9Wt+n7ZiUQc+ELUzu9v/SYVBpb5MBxWNHNqR8Hlz4qsPIuq8IV3LR0witKlzR9
         PJMoYwi4jMQJFU2Y2RkX9Jq/ve6/2QDrAJ1aXfeLWR7CdYTkl5qwTvDuwCP8u+QGJqSs
         2cT/Pzx/DxMT7h0yh+luk+4tdtoK9lCjNucJdeJb9/YUfg48AUv08gRZxaSmBnAoGasS
         qrQU9MTg7KXGdkoA57Uq+HNEdx5RYk9QSZ/ZJMSQxPiIiefgpoprlk95HNN8dghfo+ol
         xYbg==
X-Gm-Message-State: ACgBeo1Adku+yc1g62+JJQ7g13ODhovgk+MJIa7k5dHhiHix3gOlzpUX
        McG4lXH3ypwE8cJJLAOoF+uxIOCkg9ma3mp0g5Y=
X-Google-Smtp-Source: AA6agR5m4iFyWo/YiJsiuuf2i7HcTVbNjwSTGvITGDBYPk6l1yOW4ishC6cwNHZL3tOO2n2p+apIMw==
X-Received: by 2002:a17:90b:3e82:b0:1f7:3792:d33c with SMTP id rj2-20020a17090b3e8200b001f73792d33cmr17454743pjb.222.1661769943572;
        Mon, 29 Aug 2022 03:45:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p186-20020a62d0c3000000b005367c28fd32sm6904583pfg.185.2022.08.29.03.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 03:45:43 -0700 (PDT)
Message-ID: <630c98d7.620a0220.16fc4.b793@mx.google.com>
Date:   Mon, 29 Aug 2022 03:45:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-08-29-v6.0-rc1
Subject: renesas/next igt-kms-exynos: 1 runs,
 1 regressions (renesas-next-2022-08-29-v6.0-rc1)
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

renesas/next igt-kms-exynos: 1 runs, 1 regressions (renesas-next-2022-08-29=
-v6.0-rc1)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-08-29-v6.0-rc1/plan/igt-kms-exynos/

  Test:     igt-kms-exynos
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-08-29-v6.0-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      43507165562bd8bcf2ce73ba7706033127363710

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  98794e2a0d537f3376970918bf955361191720c7
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  c8edfca649da71b296d882bb0319181d94e619eb =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/630c8f40798af3dd17355645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-29-v6.0-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-exynos-=
odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-08-29-v6.0-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/igt-kms-exynos-=
odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220812.0/armhf/rootfs.cpio.gz =



  * igt-kms-exynos.login: https://kernelci.org/test/case/id/630c8f40798af3d=
d17355646
        new failure (last pass: renesas-next-2022-08-22-v6.0-rc1) =

 =20
