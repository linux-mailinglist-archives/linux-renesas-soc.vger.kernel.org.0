Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87132F341B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 16:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387660AbhALPY7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 10:24:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbhALPY6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 10:24:58 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BC1C061794
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 07:24:18 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d4so752470plh.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jan 2021 07:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Xs/u3OvuVXae62YANoTmSRSonau+uoR4UvIkulLNLX4=;
        b=TVmUhdKeOAbWXgti6DwfnR37o8ifzD+/VeL7H3rCnDnizWLAB45Kkzs6d/zTLxKRLP
         tw3i4zFPhpuHu+fNBILkZeh7kj5E3n+5YpwbTS7nSLNGUMuxawlANqOLoWLH4AkQZbCK
         UQdACTqGtetbiUGfEADlpuoQu62vKekv8zSU+bHYQNlHkTkIaiQeLGX2bpWy19HvtopF
         1VkcmJCxWGfdqKrzw5qBqas2KdTBijb2sFvHqGV8t8imTVotytW5TOQja3yqy2v2fb+0
         u413Ib4tFd8p2qzUhsg7MeTiFQEg+9cIvyWGg31gmWYbntAuyFMSN7h8pBRo/K9lVyFr
         EptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Xs/u3OvuVXae62YANoTmSRSonau+uoR4UvIkulLNLX4=;
        b=cuINzO98DFTmeTtbs8mvb7FjUm2EdPyPx6psgO2RunxjD8Hp2CvqSODe7dL2SN9OWE
         nddTuDe8Z5kq9Uqaa7+zXT1V+Ppu/KzRN9INsdHOhCOcpvw/aIukbVNADJ1eR3e8YV2y
         vJ6JKh+z8ujQQ+qIoRUk+ik+aUIvLJdZjxygZE+lcxMo9oAh2t7bdoGGnam9IlnoH8Q2
         kz8t6V0V8KEFZbgGVeuEO2bdX1O07/LzCvYnFFdWpFfAg9OwMb6Nclm6B9tw+iZ8jTv4
         FxbyGlbZ8av9UuQIGEcT/Ox1wU2cQjqz+NYyngbb4sfcCjdI80aLH2tY8Du73GK7pH4K
         uXeA==
X-Gm-Message-State: AOAM533eHDenHba0XwRK8DY3JATY1JGIQdN9/ODuYIEaSRG7Mj5c/Zc5
        HWAKbhONLQPyHWZoGIMy/WPbzzQ8KGlpMA==
X-Google-Smtp-Source: ABdhPJyEij3VXYBNlYlCRnNwtc56IL0so4vbwP1bp78cOaLKIK+Om9KlKU8bdXmd+ErfwefA5mmp8Q==
X-Received: by 2002:a17:90a:4096:: with SMTP id l22mr5118465pjg.114.1610465058068;
        Tue, 12 Jan 2021 07:24:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ds24sm3776837pjb.30.2021.01.12.07.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 07:24:17 -0800 (PST)
Message-ID: <5ffdbf21.1c69fb81.cda9b.739b@mx.google.com>
Date:   Tue, 12 Jan 2021 07:24:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-01-11-v5.11-rc3
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 23 runs,
 1 regressions (renesas-devel-2021-01-11-v5.11-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 23 runs, 1 regressions (renesas-devel-2021-01-=
11-v5.11-rc3)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-01-11-v5.11-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-01-11-v5.11-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      c3703437e37f2e38e831c893dda362271f836100 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/5ffd970a11badc1b0dc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-11-v5.11-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-11-v5.11-rc3/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs=
-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1221.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5ffd970a11badc1b0=
dc94cba
        failing since 42 days (last pass: renesas-devel-2020-11-27-v5.10-rc=
5, first fail: renesas-devel-2020-11-30-v5.10-rc6) =

 =20
