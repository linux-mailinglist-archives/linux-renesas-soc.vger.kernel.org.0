Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABDF9474DF4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 23:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbhLNWhp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 17:37:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhLNWhp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 17:37:45 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775DBC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 14:37:45 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id n8so14753986plf.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Dec 2021 14:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ex6Vm8zCQwnvKbSX5InF81HveAvMvUwJ7oy0O+xArxA=;
        b=lvYRpdJ2Xf1nyehC1CdANwiRAhuKVEP6PAOeSuk5MoIWGS8F45qm88LHUXvZW66PWT
         /a0VbZ7YFt0Po0NNPcdQwtecf2OQESrbdbIWbKUesk8gjyT2p3okPb8UUyXWktVCMVvp
         r6SZpq8D7L0e9Vm4iOVqwDpNnUdOVv7u89tk2zi7PKc32chP8YRyKq/uMIAXKK9WJSDN
         Utf9Vx5d/0BIIp5qBRI1Qpc9xbmYJBeG4kWYFrw6X9Bv5qTKoipymvj///iRGRSWs5J8
         Fkz0MLBs1ncufqfWeLSlo7OuTGrpru+DglvcFckiXWaBTaSfYyCvZyeTS9rCIPo/GfWr
         2HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ex6Vm8zCQwnvKbSX5InF81HveAvMvUwJ7oy0O+xArxA=;
        b=PnnR97TdUDd1IrHA7m3PhzEHwaCFdoxwlwdVwkMKe4xVN8Y5wa8uMh/QsRs7XCdgHp
         9dga2zFl/u+/61GQf0KstK2LSgYvD2xf2L5whAv0vWR7ohVqCXNkyrq8ry02YQa74qDC
         vqLrX65oC/458OrmMayjUqd9Cs6B7QpC4a9laegtXBs1qe1J9vNffxn9SVx/VMa60Uhj
         sILan8+8EX1ADSBR0L6YYQOWlHE4Tlgzvf5RNLKMC0MYLN7oFcDsncI+EW5qXhW3vbTA
         F73eT5OwZ5ZJ7hIuuPtocIeXvL2/8GjC1+ACu3VlY3LJ2u4cPkWUINzHciWHRHFR50ec
         YxMg==
X-Gm-Message-State: AOAM532OQYrA/RwB0IwWvbhs94fK1mzuxprcx8jpdDpA9AkMH8pKq2aX
        UJ4HzyG17E6GcVJZsXBQtOLKWWGjMGA1tasV
X-Google-Smtp-Source: ABdhPJzEZSvJ0nDXloMbIyam3VErWjVJhkr8mQ4q5+JzWG7IiTiEGSiHmnmlDVwKZxgfdlRihfKgAw==
X-Received: by 2002:a17:90b:4a05:: with SMTP id kk5mr8519427pjb.232.1639521464900;
        Tue, 14 Dec 2021 14:37:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mi18sm23164pjb.13.2021.12.14.14.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 14:37:44 -0800 (PST)
Message-ID: <61b91cb8.1c69fb81.2d7a7.01e8@mx.google.com>
Date:   Tue, 14 Dec 2021 14:37:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-14-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 69 runs,
 1 regressions (renesas-devel-2021-12-14-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 69 runs, 1 regressions (renesas-devel-2021-12-=
14-v5.16-rc5)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-14-v5.16-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-14-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4061f230d33da18a476809abc03f2fa94eda6c56 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig          =
          | regressions
--------------------+-------+--------------+----------+--------------------=
----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b8e6c6317fbfde8639713f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-14-v5.16-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-14-v5.16-rc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-ba=
ylibre/baseline-nfs-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211210.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61b8e6c6317fbfde8=
6397140
        new failure (last pass: renesas-devel-2021-12-13-v5.16-rc5) =

 =20
