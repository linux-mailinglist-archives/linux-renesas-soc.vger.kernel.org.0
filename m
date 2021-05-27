Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C2E39366C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 21:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhE0Tk4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 15:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhE0Tkz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 15:40:55 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED5DC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 12:39:21 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id v13-20020a17090abb8db029015f9f7d7290so5978957pjr.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 12:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7yvaqUbHp8I/Ur+TjJ/7pscN30i7vdyds9aCGboFGg8=;
        b=SMgVoopWwMS2RLmYodGOJCL9F8I7x9+W/XErHvwbie9DbLRrX1uukMwZwbkuPqShyR
         mVm/RkXn6iRvviH2AXGA3ofuS3EM8eafgeftM6XbUbGGRm8jyA/46iAGboJZgttVWIyT
         DuICnPo2rzgM64bry9hqcNQA7HD3kgKz74c292FY/EtH2li5MMpkM6v3BFojFB5s4v67
         9L8DjC+KEGQcFeTB78AVliaJsK4VkEUAfsM1PlrYA6hfWT9hDbQd8yAN8qkGO0QVlEhr
         1nR2tg5cKVhqlTDX0PjuI0SMoB2GJGPjyaxK/iyj7zD1aZzi9B6SK9HXxjuepQewnNqX
         8cYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7yvaqUbHp8I/Ur+TjJ/7pscN30i7vdyds9aCGboFGg8=;
        b=XT6cEWIUFHVOyw7cMQ4tUEU57/Kyyb36S9rxhUHaFnv5StAK9rBu+eWnLzqJDddmkf
         aHMRCjMBFsCH+unig/+FaifARdcdBBQT2buOG2zrD4HjORjwam4H4nPzW7/l0QmF3Wmv
         MRwD2iS9q3jSHItn/XeM9cn84WMKSJLn6oQwg9hHT/7JwGxoSZHj90i9ZhCahX025Cl6
         Xa1U2SmwiheUCDLS9SVUohRSQVp4iU0hYosSGUL+8yJi7GCOhVvJtR9eY4iXOT+ey4xQ
         Ly/f0CkHgT0grm5BOMKo5X7QSu1vAHQj0mUV3UMkcr8G/PdbMn1xngNAerBzPU/O6hkt
         4nqA==
X-Gm-Message-State: AOAM530ipORyyK/mENHzh0/7dWnwb+jQjp0iT7hZwq4aQaVOYcRmsqk6
        7SGioXOau7h9OFHe6YTZD0nKi3By5L5Xgg==
X-Google-Smtp-Source: ABdhPJxCCJ5ciASZSuveXQmEUcN3UmyAEwuvH225xwW0dnsbFpweNLp7Ke6w1lmFiNEkC55j01U6XA==
X-Received: by 2002:a17:90b:30cb:: with SMTP id hi11mr41251pjb.204.1622144360834;
        Thu, 27 May 2021 12:39:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z6sm2559652pgp.89.2021.05.27.12.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 12:39:20 -0700 (PDT)
Message-ID: <60aff568.1c69fb81.d2147.89c4@mx.google.com>
Date:   Thu, 27 May 2021 12:39:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-next-2021-05-27-v5.13-rc1
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 19 runs,
 4 regressions (renesas-next-2021-05-27-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 19 runs, 4 regressions (renesas-next-2021-05-27-=
v5.13-rc1)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig | 1          =

meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
         | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-27-v5.13-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-27-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      dcd770bc1114f44a93814b5bc691439efa6b080a =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60afbf61963ed1508db3af9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-27-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-27-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60afbf61963ed1508=
db3af9b
        failing since 30 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/60afe9aa4bf4831b05b3afa1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-27-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-27-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60afe9aa4bf4831b0=
5b3afa2
        failing since 55 days (last pass: renesas-next-2020-10-26-v5.10-rc1=
, first fail: renesas-next-2021-04-02-v5.12-rc2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60afd48cd682176f5bb3afb4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-27-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-27-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60afd48cd682176f5=
bb3afb5
        failing since 66 days (last pass: v5.12-rc2-14-g6f56f6c26099, first=
 fail: renesas-next-2021-03-22-v5.12-rc2) =

 =



platform                  | arch  | lab             | compiler | defconfig =
         | regressions
--------------------------+-------+-----------------+----------+-----------=
---------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60afc614880e5bf6deb3afa1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-27-v5.13-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-27-v5.13-rc1/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun7i-=
a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60afc614880e5bf6d=
eb3afa2
        failing since 26 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =20
