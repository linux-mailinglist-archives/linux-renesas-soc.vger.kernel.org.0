Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E3630581E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jan 2021 11:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313892AbhAZXDt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 18:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392525AbhAZSIR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 13:08:17 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4950CC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jan 2021 10:07:37 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id o16so2326867pgg.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jan 2021 10:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t5hz7zIeNhAsjoIxj7YYXR6RQ5OB6/j5wYClCChC7l0=;
        b=NbfnV+gFS/SZ5Hg/V9X8D0FKHrBXyeEUwKlMP8S1PkXyHGumjcIZThFAh4vYZR+Ksr
         ggNqvq9sR1BTo5R2+9GYEfZxlFUSmIW9xTMlusXHkSf+SfoTRNWrn80NvqRbImwpy8OZ
         pTRnZkaMAhDLPLIyomD/bVZAdXNZRoeiixxYCPpVORGfifZA/U+3pSh3/VpIzLW1dVe/
         2f5chSG6VutAt+dVp7bW8wMEaH7r/Nh/A3bNoQ5LwjNMUXUYixGqOFEGFx4reSGB6Oug
         kIdFmP9JGQMDQ0MFYBZyddxAFw2h2seQyPWSd2Mi0nY781QlV/GPLdLlk+iy1EU871H4
         zXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t5hz7zIeNhAsjoIxj7YYXR6RQ5OB6/j5wYClCChC7l0=;
        b=O5f16WwEH+amSpVxb8FT0Z7cj8tgvut8QgYjCHkQ+/BbbH4Go9UvLI8QBUoXZRaNCM
         Cu8W1UYK+2fgD/acNgqxB8yq7+7q+Sa2yqoeUxoxPA6h3Tv94XbND8STCALuMtAfeLbb
         DweN7wrn7DXSe30XUOl2QxEkpni8mphaaMe4a/m4nc0qnv6nm2X58CFicoq7ATvrhbMI
         Ubs9ZBM0tEEtnjXaNdLQwORaLfPCMgI1oKXcppq2UWKfN3Ztr7+tLxl1PQmlI7iNcJ+P
         chsCKpkgbOU1hn713ADgrQQ83QfcPVf9Oso0at76VfLIjJWyHNkx3hUQ06yx/PQmEdG8
         2WHw==
X-Gm-Message-State: AOAM531f/cvLp/2hnJnSQujU7OH5bCQeO+Df1UPCiQWOQhSBk6R2izqa
        6MnB6OTXnCYdzjpDZlbWx8qmumv3aVMR895Y
X-Google-Smtp-Source: ABdhPJzh6HqpE26q5oLMdXT2GmOfYyL9iwFFoV5C8kA+SnWAuKJcnb41KT/VZl+/7N9XxyLxIB6YAA==
X-Received: by 2002:a65:6212:: with SMTP id d18mr6874585pgv.141.1611684456486;
        Tue, 26 Jan 2021 10:07:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e63sm20138428pfe.216.2021.01.26.10.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 10:07:35 -0800 (PST)
Message-ID: <60105a67.1c69fb81.673e.0c72@mx.google.com>
Date:   Tue, 26 Jan 2021 10:07:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-01-26-v5.11-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 28 runs,
 2 regressions (renesas-devel-2021-01-26-v5.11-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 28 runs, 2 regressions (renesas-devel-2021-01-=
26-v5.11-rc5)

Regressions Summary
-------------------

platform                  | arch  | lab          | compiler | defconfig    =
      | regressions
--------------------------+-------+--------------+----------+--------------=
------+------------
meson-gxm-q200            | arm64 | lab-baylibre | gcc-8    | defconfig    =
      | 1          =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-01-26-v5.11-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-01-26-v5.11-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      27061b9ede03072796190d99f00a7fad4f57f184 =



Test Regressions
---------------- =



platform                  | arch  | lab          | compiler | defconfig    =
      | regressions
--------------------------+-------+--------------+----------+--------------=
------+------------
meson-gxm-q200            | arm64 | lab-baylibre | gcc-8    | defconfig    =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/6010220c69d06c3582d3dfd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0125.1/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6010220c69d06c358=
2d3dfda
        new failure (last pass: renesas-devel-2021-01-04-v5.11-rc2) =

 =



platform                  | arch  | lab          | compiler | defconfig    =
      | regressions
--------------------------+-------+--------------+----------+--------------=
------+------------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig | 1          =


  Details:     https://kernelci.org/test/plan/id/601040781dcbe8f104d3dfc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-01-26-v5.11-rc5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-nfs-=
sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0125.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/601040781dcbe8f10=
4d3dfca
        failing since 0 day (last pass: v5.11-rc4-383-g822f1d4bfbf2, first =
fail: renesas-devel-2021-01-25-v5.11-rc5) =

 =20
