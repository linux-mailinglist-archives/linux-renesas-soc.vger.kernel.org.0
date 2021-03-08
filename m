Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3283312BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 17:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhCHQBA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 11:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbhCHQAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 11:00:37 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B48C06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 08:00:36 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id t9so3258494pjl.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Mar 2021 08:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Lp68pgXwMae3a8iLwgCXRMXcujmO4wyLeN9epCMZVjs=;
        b=hy7Yg1Ye1OkTtq9xk0FXbbRRTZomZLDVXr55BvwVeRg2igPgyhFmn9mUUxscH+JK9m
         pLrgFLHUp3kqYcieC5IIJ9wxCNz3CUqeq21pbm4vYGv0Cwh1dIQ4dbgZ62jTGdeFFDRm
         4WGnmmMwqgR/NXjmal8obk5b0DwqumKgNXTSP5JjS7TIFasMUR92Foegv+pn1f+FaD5n
         S2wNFSZIVhCR6uvwJKsiEYDCrpG3BaWr6Nzo3iXxS2+Ofq+yy4t1qjzeqZlJhetNvUGf
         jUpL3InHMYZDhdWRu8yaJwKMkElUuZFdrXIiDbRoTg6nOOYPD4HI9eL0BKac4QPX1ADC
         ZDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Lp68pgXwMae3a8iLwgCXRMXcujmO4wyLeN9epCMZVjs=;
        b=k2+jGwXRN0FW3+r4xzgJof4h5ypvA8bq61s/Z4tDOQ+iDyDQC0KClNzZDwr//LdMNg
         weZ9Jc7fpdZWGWUtetZjmU5F5V1PK8s7f105T1FDrZWEmrvIoXeo3OG8g0PXFPPxGFix
         77zxmhIEmtMD4L/RySisKyQOGdNVJ4rPTG9Wc1+Cy/rIQtLXtuCloA9wO8aHFOkN+9t9
         uahqpLYiCarFhqYucwDIqovS1ImMUB5hmOFBomnoXNPxGACOO6F/96gDQQnS1BFQd5i3
         QtNwPYpZwQs4b6D7v2RC1RQCeTUZWHy0KUuofIRSIj70QPH6ChfgOEUAa87KG//J64p4
         FPpw==
X-Gm-Message-State: AOAM530pY+akY9hCSHtWcJYUj9CQmlhnhX7ikgfKelxWFtYM2WmsFmUA
        jGwpt3TSx1MZq5n68qboCg0d0chw3Jh9jgL8
X-Google-Smtp-Source: ABdhPJyCAFMURFWmGgeS5VxRa48z6CvUNJC2B5lol/YPDm+H8UNQt04DzCmo5J0DzqIGKErdEtSjNg==
X-Received: by 2002:a17:902:d113:b029:e4:9cda:dbd with SMTP id w19-20020a170902d113b02900e49cda0dbdmr21588764plw.85.1615219235583;
        Mon, 08 Mar 2021 08:00:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a1sm10780167pff.156.2021.03.08.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 08:00:35 -0800 (PST)
Message-ID: <60464a23.1c69fb81.e65d6.ad1b@mx.google.com>
Date:   Mon, 08 Mar 2021 08:00:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-14-g6f56f6c26099
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 21 runs,
 2 regressions (v5.12-rc2-14-g6f56f6c26099)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 21 runs, 2 regressions (v5.12-rc2-14-g6f56f6c260=
99)

Regressions Summary
-------------------

platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
kontron-sl28-var3-ads2 | arm64 | lab-kontron  | gcc-8    | defconfig | 1   =
       =

r8a77950-salvator-x    | arm64 | lab-baylibre | gcc-8    | defconfig | 1   =
       =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/v5.12-=
rc2-14-g6f56f6c26099/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: v5.12-rc2-14-g6f56f6c26099
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f56f6c260995c9bcecd0b8a520d80b0d6c11007 =



Test Regressions
---------------- =



platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
kontron-sl28-var3-ads2 | arm64 | lab-kontron  | gcc-8    | defconfig | 1   =
       =


  Details:     https://kernelci.org/test/plan/id/604614242365f5f3d8addccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm64/defconfig/gcc-8/lab-kontron/baseline-nfs-kontron-sl28-var3-=
ads2.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm64/defconfig/gcc-8/lab-kontron/baseline-nfs-kontron-sl28-var3-=
ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0301.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/604614242365f5f3d=
8addccd
        new failure (last pass: v5.12-rc1-12-g3158164f1526) =

 =



platform               | arch  | lab          | compiler | defconfig | regr=
essions
-----------------------+-------+--------------+----------+-----------+-----=
-------
r8a77950-salvator-x    | arm64 | lab-baylibre | gcc-8    | defconfig | 1   =
       =


  Details:     https://kernelci.org/test/plan/id/6046147390c2ad743eaddcc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-salvator=
-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/v5.12-rc2-14-g6f5=
6f6c26099/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-salvator=
-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0301.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6046147390c2ad743=
eaddcc7
        new failure (last pass: v5.12-rc1-12-g3158164f1526) =

 =20
