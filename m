Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0245390455
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 16:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbhEYOzB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 10:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232939AbhEYOzB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 10:55:01 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2B6C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 07:53:31 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id t21so16486434plo.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 May 2021 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MAyGcbFUqsKYqLpz8ovD5BxzhQyoCFNgKXyZf4dZ5Uw=;
        b=hbZYJ/gwVsL8i8pg/mH3EW12NHLH1c5J67VXTgcZoy5pELPlEqUa88/wK4Xpy1GPbS
         p0NobwgAWRt1ZJXJUw3mejkA240wOld7sZsqLQipQd1WuA/H5P2gQASbHKO0AFZ9T2vG
         V6tUqJap27B29yZT4kiAglS7nlJLeGmM+9cWy9N04nmbhjEJiwUPPBeLPpV7J1CfI80N
         qIXj59zSoUQzrsiUkMH5f0/XJYfZQB0rM1XPcHwVmA4onQ+pQ8xmwEH9vuQL6ej2VowP
         2Rt2F5hkOetTqDMltLuikaD6RZKKjmSGAngghSJZj30YgZ/eR/supjFhKiubPzh5ZTC/
         vikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MAyGcbFUqsKYqLpz8ovD5BxzhQyoCFNgKXyZf4dZ5Uw=;
        b=He5hZT0HzUOcnkl13BaLjyTmEfWpUaqnPeq0hS+aGpn9j0G/J5Wt+fu/FKFT+rs1qn
         5cr6qDhPhHX8RvvV/0tRluClLk7iOCfQ9FEfsHWQuRZNa8L4QwSkmVywAojFrpfjFOLa
         GhGDVH4yDS+ywenOBrtE98uXbQ8+C11TW1H8cs0lvMxsAe411jUBJHWrdSrw2mnOV5rP
         e9tZrPEfWbmNADWgIglhotx1zWNdWUUjmrlzZ5K9qWCWvtDfqp3tXdGQ+R72423q1pys
         QudglMAzSNAVuCyyhDMO4TtAbGV0txi8V+wuQi5zt5iKVAVdGRjO3gQYe9Db2n+5HeAS
         3gCg==
X-Gm-Message-State: AOAM533ZlNqL+OJqNrohF7+myxO+3wYfAbaUDCRz715TGMMksQPQ07FC
        8rJLg/9hT9lZlnS+01MlfNxRN6XC9+Hqmqk2
X-Google-Smtp-Source: ABdhPJwf5OuYA3kaP8ENFeQx+9H6sKaE3Gt/zKhudCCMVRXo6rAPaQINISFUTWOx1tuEFGGSD6/kqQ==
X-Received: by 2002:a17:90a:a25:: with SMTP id o34mr28132139pjo.221.1621954410834;
        Tue, 25 May 2021 07:53:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v24sm13358361pfn.101.2021.05.25.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 07:53:30 -0700 (PDT)
Message-ID: <60ad0f6a.1c69fb81.b33bd.c5aa@mx.google.com>
Date:   Tue, 25 May 2021 07:53:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-05-25-v5.13-rc3
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 16 runs,
 1 regressions (renesas-devel-2021-05-25-v5.13-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 16 runs, 1 regressions (renesas-devel-2021-05-=
25-v5.13-rc3)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-05-25-v5.13-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-05-25-v5.13-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      d6e14d563167f1d9eb028bfec40b214368fc5c82 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/60acd7219e24a0a306b3afb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-25-v5.13-rc3/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-05-25-v5.13-rc3/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-n=
fs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60acd7219e24a0a30=
6b3afb6
        failing since 28 days (last pass: renesas-devel-2021-04-12-v5.12-rc=
7, first fail: v5.12-451-gae657abc971d2) =

 =20
