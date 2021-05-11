Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A019937ADBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 20:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbhEKSG7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 14:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbhEKSG7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 14:06:59 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54A6C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 11:05:52 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id k19so16670226pfu.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 11:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Pbe/tWan3Gix6n8IPaqMv4l6gSrmXihkvFo6HAwxof8=;
        b=QnIncJ4YCCh+jLGHRIAK056Nz4DghASpMwR0YfOCRCy1JYRbNba0gk6a7ZgJdHFaBP
         IDg/PDyNdm/jPhlPhRwR+QirtetH3KUWZcQg2xKcTQ2PeuDnSH/Yq/CbR5mE0rthY3FU
         YlaBiOxg1If4HKKqh0nPhmMpWOQTTtYMAsuYFU4dWu5uRyqIJ1xSHVgAxYOvrC5Tj1oM
         bEDrs/jGkM1aVrtlKiux43XAb7jVVZJ1HZ2xAe0Q8GvuzOOtPkPyEfMUkIEbpmmSEUQo
         FTIIciX0ng/GE9GKe8NbVIvz7V2BWuJ/BcV2kZjT3SY/7A1XfvBLBQ876YpysrLCBGxT
         DPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Pbe/tWan3Gix6n8IPaqMv4l6gSrmXihkvFo6HAwxof8=;
        b=Lzx+SSdnLHgqOC0nwPb5TgVbV3sBuSJAWVhRoUW6NAwCo8eLcQsfwtPDdSvnfYPGFW
         4LMAVXGMlqHrwqC+WxDPUH2kUOjKxSpt+GOwzRGuR7rSEkdMm/DjuZ8pnXliKv8WU97l
         oJxywO76awORVnpRafRYjnDmO9A6TIHCouiwpNxsHaXcW0hPb0ciZEEgSVmiJpls2iJn
         df01yj2QKuuqg4RR8Ur98sZq6/bjW2JZD38zCkN+F+AC1v3uyEuyEqAnss7etNGr0OsT
         o8mAkxUwi86vWfS4SrN2jaBhzoAmSqDd2/v7qkD4vHFJVh0N3H51FBnP8jcVb5WJ3aVC
         jtmA==
X-Gm-Message-State: AOAM530iCe8TzA6IYxMq4eTo4RZAynnzmaS+2wMPjjTUhUw30BGq77ON
        0Mgz3kwl9jHhQA4J9qVS2okuFinCTtQJ/dpu
X-Google-Smtp-Source: ABdhPJwirFyc+fxaaBdOPH4EYGQe3v4qF3t9d4JQKV685iWYf4rqsdCeyhwfvHAV9PbIecQBY4Lc4w==
X-Received: by 2002:a63:4d22:: with SMTP id a34mr4563572pgb.421.1620756352173;
        Tue, 11 May 2021 11:05:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f6sm13415525pfe.74.2021.05.11.11.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:05:51 -0700 (PDT)
Message-ID: <609ac77f.1c69fb81.8bd4e.95e1@mx.google.com>
Date:   Tue, 11 May 2021 11:05:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-05-11-v5.13-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 22 runs,
 3 regressions (renesas-devel-2021-05-11-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 22 runs, 3 regressions (renesas-devel-2021-05-=
11-v5.13-rc1)

Regressions Summary
-------------------

platform        | arch  | lab             | compiler | defconfig          |=
 regressions
----------------+-------+-----------------+----------+--------------------+=
------------
dove-cubox      | arm   | lab-pengutronix | gcc-8    | multi_v7_defconfig |=
 1          =

meson-gxm-q200  | arm64 | lab-baylibre    | gcc-8    | defconfig          |=
 1          =

mt8173-elm-hana | arm64 | lab-collabora   | gcc-8    | defconfig          |=
 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-11-v5.13-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-11-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      bff1b0e749d4df5f61ce46122ab7f5c522684b50 =



Test Regressions
---------------- =



platform        | arch  | lab             | compiler | defconfig          |=
 regressions
----------------+-------+-----------------+----------+--------------------+=
------------
dove-cubox      | arm   | lab-pengutronix | gcc-8    | multi_v7_defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/609a93d34be986eacf6f546f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/609a93d34be986eac=
f6f5470
        failing since 14 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =



platform        | arch  | lab             | compiler | defconfig          |=
 regressions
----------------+-------+-----------------+----------+--------------------+=
------------
meson-gxm-q200  | arm64 | lab-baylibre    | gcc-8    | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/609a993b932ca7b77d6f5467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/609a993b932ca7b77=
d6f5468
        failing since 105 days (last pass: renesas-devel-2021-01-04-v5.11-r=
c2, first fail: renesas-devel-2021-01-26-v5.11-rc5) =

 =



platform        | arch  | lab             | compiler | defconfig          |=
 regressions
----------------+-------+-----------------+----------+--------------------+=
------------
mt8173-elm-hana | arm64 | lab-collabora   | gcc-8    | defconfig          |=
 1          =


  Details:     https://kernelci.org/test/plan/id/609a9624dba4341a966f54a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-collabora/baseline-nfs-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/609a9624dba4341a9=
66f54a4
        new failure (last pass: renesas-devel-2021-05-10-v5.13-rc1) =

 =20
