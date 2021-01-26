Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F869303454
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 06:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730971AbhAZFXI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 00:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728524AbhAZDFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 22:05:09 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D3AC061573
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 19:04:29 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id e9so9011788plh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 19:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HRAOtoD7GdTkR2JjauMBqFX45Z38LN7zdXLcnPv/Uo4=;
        b=pBsordxiafZUOIy1cYjGumCqGYBUqyxo5dCnBAXWZnO3UrGQfNXi26+/CL6+yguXnl
         BqfBxnYp/spER66q2D2q1m3eHfToA3jDlOJkFOwBsp27Uhcby7TnpAU015PMjPDPI8wn
         fmnFQPDgxyd/zP+ivgZHVHpkAL1meHBc5e4ZSNVKY4S3dWbarUtJHRviqzo6rHiv/eiv
         cjF9oL5kfBBast9PtwwIi05cHhWfWqvalytrZ30iywhs7pToBYBiDw3iuk8EiQ4hcFN/
         Rv6OWNHXAEUxsOuFNuVVR0/5/SXIy2XLxW4KJ1JRl/8mdr0seACwTggBrqZ5KG+DOkFO
         Elyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HRAOtoD7GdTkR2JjauMBqFX45Z38LN7zdXLcnPv/Uo4=;
        b=WfBONsl5cG5clqw2tUxjzRZemxbYqi6HCJu9bMW/+GPvtp+j+TkXyt+Gm1xqIo8hEf
         xVlRq5EbQ+UEOim6DFRvq+oDOeZXUOI9zq3i6V/0rIc/jnKMkbPXT0ePixuHNBriynAT
         yivbUVEHfE/tUXLMD0AYv3OWL9HS1EKf9EArPIlgXKcNeaxDKYVC0iylyJgDuYv6ImWe
         u3stNhk7uyJnN/KMga0RnvuZIMoXQ4VEFLrVsGLPo2LzP/RjyKuM3AA4wD1NeM/iM8oz
         ZvAwk8r2Fx9rCWpJhad15Y7/s+daIrEZGJKFe+xz0oYoFkZFW/O3i0C9OYkD0bP/CvNQ
         dNbg==
X-Gm-Message-State: AOAM532AS33dOpmlEIs/j9McKeqPSw9bhlQST6cM2Qz44LzWRSw+mOXi
        COh39/MZuWUnw5k1I/K1fLI/kFhFTIjQtde5
X-Google-Smtp-Source: ABdhPJyQfHCvvwHmiHxieVbWSKCJ6kyrkk300EnhP0I4TL8amOENiFKiEcHY8+f8zZH0NpeQRVgieA==
X-Received: by 2002:a17:902:9349:b029:df:fab3:64b8 with SMTP id g9-20020a1709029349b02900dffab364b8mr3604691plp.72.1611630268865;
        Mon, 25 Jan 2021 19:04:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f15sm653103pja.24.2021.01.25.19.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 19:04:28 -0800 (PST)
Message-ID: <600f86bc.1c69fb81.1b90e.2d67@mx.google.com>
Date:   Mon, 25 Jan 2021 19:04:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-01-25-v5.11-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 17 runs,
 2 regressions (renesas-devel-2021-01-25-v5.11-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 17 runs, 2 regressions (renesas-devel-2021-01-=
25-v5.11-rc5)

Regressions Summary
-------------------

platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =

sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | sunxi_defconfi=
g    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-01-25-v5.11-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-01-25-v5.11-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      70d43ed7025970798f753542ddce0e4eda7abcbf =



Test Regressions
---------------- =



platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/600f7f541675df9f74d3dfd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0125.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/600f7f541675df9f7=
4d3dfd8
        new failure (last pass: v5.11-rc4-383-g822f1d4bfbf2) =

 =



platform                  | arch | lab          | compiler | defconfig     =
     | regressions
--------------------------+------+--------------+----------+---------------=
-----+------------
sun7i-a20-olinuxino-lime2 | arm  | lab-baylibre | gcc-8    | sunxi_defconfi=
g    | 1          =


  Details:     https://kernelci.org/test/plan/id/600f7b74e468485e5ed3dfc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-25-v5.11-rc5/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-nfs-sun=
7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0125.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/600f7b74e468485e5=
ed3dfca
        new failure (last pass: renesas-devel-2021-01-14-v5.11-rc3) =

 =20
