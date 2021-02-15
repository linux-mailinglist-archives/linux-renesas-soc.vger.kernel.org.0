Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79B131C411
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 23:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhBOWbm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 17:31:42 -0500
Received: from mail-pl1-f173.google.com ([209.85.214.173]:34491 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbhBOWbl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 17:31:41 -0500
Received: by mail-pl1-f173.google.com with SMTP id ba1so4472959plb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 14:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WQ16UnRCDUIjvND6CKpKPUpdjc6FyOE7zuEu5uww7oc=;
        b=YcB3JS423G37FY/LbHtXW4rMC4I/0jSMriJk2XKkV3+yObbhtIJ4UEZ+fyg62hQ2/G
         BFzUMswW5kRmngOyJpBcTGosurErkp77zsLFaTh461qDibm/WPvSBj+N3Kb8pss9gpHk
         Y0w6Tzibd3T+t8on4UZJcPpIX2P4Usjy/dm1PgnTId7pWUQVeWP12M347irFjfBWz7Xy
         txGYuGYV2HPXPET1PhhjrCni+LFzWu1xrLLxzcz1SuNNYejnrlc6EkUMwx3TQ4ekdV9F
         ncYyo8Iv3w8sNE5he/7IAXmfu011cRmXIUMhLXM60soYk5W9SjmX9MWncs/dX1QWkSV0
         garg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WQ16UnRCDUIjvND6CKpKPUpdjc6FyOE7zuEu5uww7oc=;
        b=eY04DT6OzGb9oh3LegNLHe8ohG6G5yn098u74s1/TpDilqSoINQAecDRMRNZWETWk+
         IwRln2jMoU9UbZ7nPSc3Bc1aTL98cyDjfxwZoOtwXphy6JFr7VAtbbIqrt6cSvfxMsZp
         YGf+hv5GLRG5TRGRKQo1umplY3PmeBioTq+qu6d6ZcI+qRvxwftsTZBMFyvm68EB1ykp
         q3mRY0d+YIv9n29fDT3LNCOsFs2OXK+L0PLDYHB3+Gu2juksSqL8/MNLmqf2zmtD00YT
         pee8LTnVe6iNcqwtbmrH4H+S5ukkGvuqDrDoX46OsXhOoy2Z8iSD8wMGu86mCvaC+0U+
         z/ig==
X-Gm-Message-State: AOAM530AMy5Gbp2+XsfXaG8u7Fdn4yIstu1IF8Ltq4tnZdv4mFq0kt96
        2ZDHhFLVPhCWXIusTSN/xX8T5XMsrn2ePw==
X-Google-Smtp-Source: ABdhPJzU0XmZsIhkzWaFspGdtjuD+EQ3dPFVi4S0N6Y9ePI3O/foiq3RvR6ITaJ8bkfLkv7nBitk6g==
X-Received: by 2002:a17:90a:4092:: with SMTP id l18mr953309pjg.1.1613428200623;
        Mon, 15 Feb 2021 14:30:00 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k5sm450477pjl.50.2021.02.15.14.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 14:30:00 -0800 (PST)
Message-ID: <602af5e8.1c69fb81.76149.144c@mx.google.com>
Date:   Mon, 15 Feb 2021 14:30:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-02-15-v5.11
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline: 167 runs,
 2 regressions (renesas-devel-2021-02-15-v5.11)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 167 runs, 2 regressions (renesas-devel-2021-02-15-=
v5.11)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

meson-gxl-s805x-p241     | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-02-15-v5.11/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-02-15-v5.11
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      33c184d73b47952c64d3d29e808fb4b5379d5046 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602ac3c7428c262025addd7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-15-v5.11/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-15-v5.11/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602ac3c7428c262025add=
d80
        failing since 14 days (last pass: renesas-devel-2021-01-29-v5.11-rc=
5, first fail: renesas-devel-2021-02-01-v5.11-rc6) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
meson-gxl-s805x-p241     | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602ac0cc0beb9b774faddcca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-15-v5.11/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-02-15-v5.11/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602ac0cc0beb9b774fadd=
ccb
        new failure (last pass: renesas-devel-2021-02-08-v5.11-rc7) =

 =20
