Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953AC2DFF27
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 19:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgLUSCK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 13:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgLUSCK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 13:02:10 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E7BC0613D6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 10:01:29 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id y5so9627000iow.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Dec 2020 10:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ea6JqtKjw7OzUUoWlF84vMDFAAdkRzZmOGZ52DF68G0=;
        b=KRBZRLSjotuT/r6BoTPkKAP74Srd4F43y0TreLYeGwzbypBjSROrA/E5Dao8fNFIXo
         5soVI0IVkp7zqeq0LRQkORxM0gIs1T7kcVYDoC+M/fF7KP3fFV0a1zUujF3wxWALMa6A
         dP6piS0NRgMbll6pXNULLkVOr0SLsHdpiQ2+R7rEAiaInbsAroL+L8gRkQG0xJfDh65N
         m1WBcwy9XHng4uNWfLeA09tA7Zb3WNlhcqySxzUSgMxYSbXVayj6V4FJvsD8bmMfJLX3
         a++BG4yxnsu9Dg2wRR8vflZ+/0orlXPsjr4ZbIFKyA1jgy3w9u4SCyHcUbiAS8X1IvwS
         Qx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ea6JqtKjw7OzUUoWlF84vMDFAAdkRzZmOGZ52DF68G0=;
        b=aRlCYjj9tjKAQWfuCDXgRuFeoz84qzy5JLnh3bMC3g2+BqZt5g8szfhPS9mzLt/Lv0
         kr1W1OGgete7dqUFZ1KV0rnNOfOQL+esUjvtWZRUzMSxQh+CN9qhNmcNgAZk8ndRTAbF
         yjvOmIlbiX10hLGJ/hs0QHxYDvATBogDK8dyVsh9KcUgdZ9Kl9MisP69gHKvsQen49wS
         zBEIaB2gzvPbiLi40jxw3fE0eNu55n1fhYFxsOAeG6wD53GM5dGa8q9VHKq932i8d901
         2aUMmQ5xdn2FIhq5XL4SyiNy2cEeBN1uaQFRnZhFCXeOX7Sn7hJEmdJMb+FMT438eJUB
         KsWw==
X-Gm-Message-State: AOAM531+8Q+U1H0TpIyk8gOOVpTr8oI18lKM0mPskgQ+xiNzuDbV1zTK
        XaklMCGFhnJxbK6r8PaUviLZhVhxAT9EPw==
X-Google-Smtp-Source: ABdhPJygrx9R6p3qmdKjTB3rlvGhe7h6cxEK/ui/lCcheG26r2Ogdk5m1bs/jnx6gWOKIQJmVol6DA==
X-Received: by 2002:a63:597:: with SMTP id 145mr15400347pgf.252.1608559163681;
        Mon, 21 Dec 2020 05:59:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 198sm16650128pfw.29.2020.12.21.05.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 05:59:22 -0800 (PST)
Message-ID: <5fe0aa3a.1c69fb81.57add.076d@mx.google.com>
Date:   Mon, 21 Dec 2020 05:59:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2020-12-21-v5.10
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 29 runs,
 3 regressions (renesas-devel-2020-12-21-v5.10)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 29 runs, 3 regressions (renesas-devel-2020-12-=
21-v5.10)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre  | gcc-8    | defconfig       =
   | 1          =

meson-gxm-q200        | arm64 | lab-baylibre  | gcc-8    | defconfig       =
   | 1          =

odroid-xu3            | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2020-12-21-v5.10/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2020-12-21-v5.10
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a0d9f5cfe680c9afb8a9bb2d57b6a1c707da9c3a =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre  | gcc-8    | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe07834012ba79d10c94ce2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-k=
hadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-k=
hadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1214.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fe07834012ba79d1=
0c94ce3
        new failure (last pass: renesas-devel-2020-12-07-v5.10-rc7) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
meson-gxm-q200        | arm64 | lab-baylibre  | gcc-8    | defconfig       =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe0716fe88f7dfe97c94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-q=
200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-gxm-q=
200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1214.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fe0716fe88f7dfe9=
7c94cc8
        failing since 24 days (last pass: renesas-devel-2020-10-23-v5.9, fi=
rst fail: renesas-devel-2020-11-27-v5.10-rc5) =

 =



platform              | arch  | lab           | compiler | defconfig       =
   | regressions
----------------------+-------+---------------+----------+-----------------=
---+------------
odroid-xu3            | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fe077ecb8521df1e0c94cdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-odr=
oid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-12-21-v5.10/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-nfs-odr=
oid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2020=
1214.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/5fe077ecb8521df1e=
0c94cdd
        failing since 20 days (last pass: renesas-devel-2020-11-27-v5.10-rc=
5, first fail: renesas-devel-2020-11-30-v5.10-rc6) =

 =20
