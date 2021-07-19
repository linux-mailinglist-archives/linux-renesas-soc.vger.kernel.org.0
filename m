Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25303CF08F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 02:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355865AbhGSX2d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 19:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442033AbhGSWdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 18:33:36 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6761C05BD0E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 15:32:49 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id b12so17966219pfv.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 15:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+LPTNIiw3whjUeJjDC2D4AcOYYNzL07Nz+0ckPNw23w=;
        b=IPh7JagIqPveFZhxYTrOkLDg8tRMkKBfY2OhcvCxqy7ipCi8FIe+EBspmQlrPRk/b/
         YGH+ZFk7I4M3p87wnvA/0LKvEnhQCATDlEGbbbUE7crruyOQKZtx+opLBfwhtNG4ftE1
         G94KMZAlF9WnjQ2Gsu6YcuD5+oCLZlLRvTXMqCGn8WQxKmrwX8wYDVltR11BPcwCyhAi
         fC93KY/6NF9SvFW3255YCGdRjLI/+rEHYIaQqC/gKfZKSKw7LQ9xmwnzVMGBJPl7S4ee
         yxkIZEVyDFDzZHqaSZVY3lQJlwb/0iwvFJYR5nz1DyN8PFQIxDrOtYH4Uo1tZi6Maiu8
         42MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+LPTNIiw3whjUeJjDC2D4AcOYYNzL07Nz+0ckPNw23w=;
        b=DREwniJrDk05B6EfgEtC2bF+RkOp4FGoWettpYZyU9V/zjp0FuIrvpOkPyDvZraNG5
         xJLpiEz+Q87s4jIT2fwPqLEte6R3yywKXSfagHTyyHaTEhvVpryhWDlQ/JIYSGe6O95d
         ieDcnazuzxr4WwSAK10KGl6tmQKLztjyLdwKAOtrdxiwPCztM/NuGmRcvM28EWT0iwRt
         fQaQDFCAOJtIZntExQVUlZ524aQlk6W45wXsIdlb94QbPKKrivjexIQ08hy5n0OjrF5p
         LlXZruYvMS0LTnA0gRfKu2ebbDz+WjCbLKxrgTtSI4pMLJ8k07garpdrGsj0alQB0tUW
         Khvw==
X-Gm-Message-State: AOAM531AdILc5zq2+enlmR1e354DW61ukuyxIISKujDqQsWx5jq5lRpu
        utwjYRlG9J7+NIm5RoOC8aHtPkj4BZ8N/GgU
X-Google-Smtp-Source: ABdhPJyBAWw0ZCMvTHbac28vgFj6GxbI3dXcjr+htxEbrQDajTPxHLfCOQyiEm+oE9ZgJa+jZMiTyw==
X-Received: by 2002:a63:b342:: with SMTP id x2mr27445052pgt.152.1626733969256;
        Mon, 19 Jul 2021 15:32:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d2sm21359450pfa.84.2021.07.19.15.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 15:32:49 -0700 (PDT)
Message-ID: <60f5fd91.1c69fb81.cd16.e74b@mx.google.com>
Date:   Mon, 19 Jul 2021 15:32:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-07-19-v5.14-rc2
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2021-07-19-v5.14-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2021-=
07-19-v5.14-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-19-v5.14-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-19-v5.14-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2f3bebb9dc31fbb1e815f63cf3f61763f7d1d8f9

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  9cef5dee3cd817728c83aeb3c2010c1954e4c402
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  cd63c83e23789eb194d38b8d272247a88122f2f6 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/60f5eddb060005701b1160fa

  Results:     80 PASS, 14 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-19-v5.14-rc2/arm64/defconfig/gcc-8/lab-collabora/igt-kms-rockchip-rk=
3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210709.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-A-ts-continuation-suspend: https://ker=
nelci.org/test/case/id/60f5eddb060005701b116182
        failing since 5 days (last pass: renesas-devel-2021-06-22-v5.13-rc7=
, first fail: renesas-devel-2021-07-13-v5.14-rc1)

    2021-07-19T21:23:59.993176  <6>[   79.401513] Console: switching to col=
our dummy device 80x25
    2021-07-19T21:23:59.997370  <14>[   79.408198] [IGT] kms_vblank: execut=
ing
    2021-07-19T21:24:00.013341  IGT-Version: 1.26-gcd63c83 (aarch64) (Linux=
: 5.14.0-rc2 aarch64)<14>[   79.414755] [IGT] kms_vblank: starting subtest =
pipe-A-ts-continuation-suspend
    2021-07-19T21:24:00.013696  =

    2021-07-19T21:24:00.018106  Starting subtest: pipe-A-ts-continuation-su=
spend
    2021-07-19T21:24:00.090233  Beginning pipe-A-ts-continuation-suspend on=
 pipe A, connector eDP-1
    2021-07-19T21:24:00.117616  [cmd] rtcwake: assuming RTC uses UTC ...
    2021-07-19T21:24:00.124226  rtcwake: wakeup from \"mem\" using /dev/rtc=
0 at Mon Jul 19 21:23:28 2021
    2021-07-19T21:24:00.137504  <6>[   79.548515] PM: suspend entry (deep)
    2021-07-19T21:24:00.142212  <6>[   79.552999] Filesystems sync: 0.000 s=
econds =

    ... (126 line(s) more)  =

 =20
