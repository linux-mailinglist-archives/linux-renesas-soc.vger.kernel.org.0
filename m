Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3803C4C0ACC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 05:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237328AbiBWEHj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Feb 2022 23:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbiBWEHi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 23:07:38 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0536E4BFC3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 20:07:12 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id h125so18786776pgc.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 20:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0I5P2eSDQVq7aqDG4I0TNtB5PciS8zJo+3KmwW3Pg1U=;
        b=PqLWhErdrBKD5N6nwxFrn2htN/wBPipQFvPpovV19uJd6jrD3KhcdMHbnVP7u/NE8Q
         5ZGckjW/vhDwwu9bW0oAuT9/m07ALCnlFAWRvw4NYG2zFevYHg1KeY8yuXbRDijwuRbE
         iO+n+VUHBS3Nl+DNfOcF2Dh0jCch1Gisu7Kg6vB9xcy3Ps5VfkdilmPPlTUhxGJ7sMRl
         uH5AEIEST3XbNdhI1UG9XyLp+mj2vyNJ2l/nwoCAdE+n9YITzk1QpGz+9j/mIAO/aHUH
         kGgakOAD3HHWDfvzNuQTxKxUSBEJG1z7ECwqrV7g2r55AVMHbiXqAfADMtGJUPjf1nCN
         OHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0I5P2eSDQVq7aqDG4I0TNtB5PciS8zJo+3KmwW3Pg1U=;
        b=qKQX6J1Np8VxnNYXtK5oAt3ogdx70af1pLaSlnBJ0VBNRvkQuve2egJz8GAl2IpaMU
         CVumW/SdNvgGxTZXMDbuz+mEx3Tms8Hg6LZmjv9akRmeMrJ+NKeJ7qaMMzTp2RLZDLff
         ZAr98pQCSwJ+KZKzUGnSYK0t28ulxzgfNxtQ3Un38AwjEq7Yrrfw52NUGrBg7iXs5tUF
         1Av0ScgMHsezNSTk7PcYSdOHNnJjwYvLs57IHeCh/HIEwgEYvx4gaa8DwPtWJyUebRA4
         lx45kVYlnAK3pYn8tLUEcLmTjBdgpi5kcfehCogWU7CCe5gmXbFvp1jxxX3OChJMOUIO
         55tQ==
X-Gm-Message-State: AOAM531nBDg/qwJbbxpYQhAFuChIA0xE+4d8+pycYfxKTki7FS52fAYy
        TeV8AqP1+UA/EeckgSWZZ1xQXw5g/4zcHU+I
X-Google-Smtp-Source: ABdhPJznZ1J81a49CJIKbFkRJE7/RNwXmLfSAmjlqoohQhwKpOgkQ0OrRgBWulRGeS3zdEwEkChFEg==
X-Received: by 2002:a63:e84b:0:b0:372:a079:302 with SMTP id a11-20020a63e84b000000b00372a0790302mr22068742pgk.272.1645589231331;
        Tue, 22 Feb 2022 20:07:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m37sm1999674pgb.59.2022.02.22.20.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 20:07:11 -0800 (PST)
Message-ID: <6215b2ef.1c69fb81.a1e7a.59f3@mx.google.com>
Date:   Tue, 22 Feb 2022 20:07:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-02-22-v5.17-rc5
Subject: renesas/master baseline: 374 runs,
 2 regressions (renesas-devel-2022-02-22-v5.17-rc5)
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

renesas/master baseline: 374 runs, 2 regressions (renesas-devel-2022-02-22-=
v5.17-rc5)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig         =
           | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-02-22-v5.17-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-02-22-v5.17-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      764d9473182a7a0e7d0fd7f57c5157204abc9dba =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621581a49d6b650c40c62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621581a49d6b650c40c62=
97a
        failing since 99 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/62157c020e9bfa1452c62988

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-02-22-v5.17-rc5/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62157c020e9bfa1452c62=
989
        new failure (last pass: renesas-devel-2022-02-21-v5.17-rc5) =

 =20
