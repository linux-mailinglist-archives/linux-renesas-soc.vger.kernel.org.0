Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B133737AD0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 19:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhEKRZs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 13:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbhEKRZr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 13:25:47 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60EDEC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 10:24:41 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id i5so11492925pgm.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=T0lp2s6TdiYX5C23TejvSvTPxFdGBtEbSbMQAhvINMc=;
        b=BcI7Tjo0+1iSZcmTtyF7MmxhScYcVWBZT6DFUtdZ3jkFgkwXquMzeAZ8hnRaoIqY1D
         o4/lOZfcUDslEDd5Gbd90KsKgCtGR4bN5JqA0lE453CoJ6LBPdibUsodl8WLeRMVCpuw
         FnbzMyyTDsldX5TPK51dTA44KGUR/WqA09umtbxGEPu+LplDV1u8IyplWsHId47aYW1g
         n1Ir45yHTVIh3+3U7gXcjaacqDC4RPdhIfgcpjwUoFyom7zqZDiuy7jyDR8dpnxjoMHY
         QYD6cAklXcianbHCkjCP2QVADVHsmRlMmxtCUoDNSxF0wBq3/QVU5FN0lJRXobzM8VY7
         k04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=T0lp2s6TdiYX5C23TejvSvTPxFdGBtEbSbMQAhvINMc=;
        b=QCDSMKQvj08IXeio22juVJglBr+Aq0kbxCSIzjN1yYoTF9Sl5O/Ju2NyIDgA2LLrD2
         FYHf56VTly6QP7XRuw385VomAkHKhWLy+N4SRlZ+aw6+1i9CW5bOYIsG5f5eOlXyI3BI
         UXrY6RsOt0GqSSq3JvtXs5BRzN79Vrajb+esaiwPF/ToYN3sUROyzQ5W3B+yeeQOyAs0
         qEV//o/9rP18ZL4uIeWF0e7lDgh4Psy1eD1LsBH7cau2p+8gaX8ZKa97PbpG/iIvaZyK
         umKK5e6iXR47KrJcifeUQrS7av9/b8Cwp9f5oiK7n+mvlwCmWSIDHfE6RO/4p0K17QfG
         hOaA==
X-Gm-Message-State: AOAM531ImLM4UWwv97gT86MWKfxMvgZ1GSmTK7kv7mIXrYX70MVrsOGG
        zF9V7M1L5PCEnwo9XnqWzgCkNHiblbl/FiHt
X-Google-Smtp-Source: ABdhPJzWaU+ceQU8bhQtNJDNbtMgImTFOs5eqnV5uK0d9taLIhxbb2tRHcTRHJH0k7IG3EySzn/CIQ==
X-Received: by 2002:a62:b415:0:b029:2cc:61be:6db4 with SMTP id h21-20020a62b4150000b02902cc61be6db4mr1739525pfn.50.1620753880680;
        Tue, 11 May 2021 10:24:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o4sm2578459pjs.38.2021.05.11.10.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 10:24:40 -0700 (PDT)
Message-ID: <609abdd8.1c69fb81.a759f.84a7@mx.google.com>
Date:   Tue, 11 May 2021 10:24:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-05-11-v5.13-rc1
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
Subject: renesas/next baseline-nfs: 23 runs,
 3 regressions (renesas-next-2021-05-11-v5.13-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 23 runs, 3 regressions (renesas-next-2021-05-11-=
v5.13-rc1)

Regressions Summary
-------------------

platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
dove-cubox          | arm   | lab-pengutronix | gcc-8    | multi_v7_defconf=
ig | 1          =

meson-gxm-q200      | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-05-11-v5.13-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-05-11-v5.13-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      81ca6c161d39b686d380f0bd5b34e6782451703f =



Test Regressions
---------------- =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
dove-cubox          | arm   | lab-pengutronix | gcc-8    | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/609a8bcf039c5744736f5485

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm/multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-nfs-=
dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/609a8bcf039c57447=
36f5486
        failing since 14 days (last pass: renesas-next-2021-04-02-v5.12-rc2=
, first fail: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276) =

 =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
meson-gxm-q200      | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/609a8ca22c4c0713f56f5474

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-=
q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/609a8ca22c4c0713f=
56f5475
        failing since 38 days (last pass: renesas-next-2020-10-26-v5.10-rc1=
, first fail: renesas-next-2021-04-02-v5.12-rc2) =

 =



platform            | arch  | lab             | compiler | defconfig       =
   | regressions
--------------------+-------+-----------------+----------+-----------------=
---+------------
r8a77950-salvator-x | arm64 | lab-baylibre    | gcc-8    | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/609a8bda04c05e88686f547a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-s=
alvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-05-11-v5.13-rc1/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a77950-s=
alvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0503.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/609a8bda04c05e886=
86f547b
        new failure (last pass: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4=
d3d276) =

 =20
