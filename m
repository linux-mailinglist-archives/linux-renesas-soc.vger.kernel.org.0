Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B84F353011
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 21:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhDBT7W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 15:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBT7V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 15:59:21 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83ED3C0613E6
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Apr 2021 12:59:20 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id l123so2676725pfl.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Apr 2021 12:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ts+HVKQd/Lz93uFdRAkVhhdReiVsryOZ29C0DJp+8Nk=;
        b=Xx16uIOFQBf/HpigAw6+B26DafyRrDaavT+aSdgg/vGuUaoPIGM1sqksW4K6n0Bzfr
         hEf8+0dVSqVu6cZbY/kDXXyol/94+elwwfHiybHSW+8rjQ7U4uOpx8JG76Ai+OFuBDuG
         Yw+nsX4LODYqbqGKIk7YNKKyd6TAm3MtAXGD4s9QU4ud8pOBvzsIVBpDtjoyeLWsCc8Y
         rSF5Yf10vxcc8qiTgqX1PJ6MakPY5aTuyoAK7KqttvaKNhz992bUB5eLeBwsmkj84hCs
         nmghxFei/5hx1Ju1bEE0VKfH8FcunToW+O7bcd96I/9D/qJOHoRq7/VahqZCA4BYYE0k
         QH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ts+HVKQd/Lz93uFdRAkVhhdReiVsryOZ29C0DJp+8Nk=;
        b=e3dONJdKATrmd5bI2jfWIUsSRwUuMgLbEUg+BkHz5K9xWAK9NG494mqNEm/nXdgJB3
         pDmzyj2RLSdluVMyg80rSVcx4jYPTS5lqD0r9juhF36KZFFWDCpsOApu4tdKMp8nbs9K
         G3xWmR3Nf70fS4BhNnHkoTbPYUA4+QDkbERS0vzxthbK3YBEt12I+DotkQiKdtW5gOB8
         b6PzEoh/gjZiVAogyxjyMoXzFVRrvG1aiegbIQgneBMxUVqrP+BN9/UeBThF8IFmd2/S
         86/GBG1hLm2lvoOjqyle33YMLXS83NysJ+PfogFvl02q4MVcUwPqAf0SUhsk82wvL3aW
         7ySg==
X-Gm-Message-State: AOAM5324QFdA4lHv/GjT5M+x68sDfJSeoc/wet956AyVqWkpDjnK7vBi
        0QXsVBc9J8nHcUaKILK3mzkQzNKACjrTAO5c
X-Google-Smtp-Source: ABdhPJzkhV4CvL5hdAX4m4e19OPL2f0q1KWUncdmn9lcn0lqTytp79ZsditpaJAJIGV3hLVUJ1oNJw==
X-Received: by 2002:a65:6792:: with SMTP id e18mr3480414pgr.256.1617393559878;
        Fri, 02 Apr 2021 12:59:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gz12sm8882052pjb.33.2021.04.02.12.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 12:59:19 -0700 (PDT)
Message-ID: <60677797.1c69fb81.215b2.7082@mx.google.com>
Date:   Fri, 02 Apr 2021 12:59:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-04-02-v5.12-rc5
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline-nfs: 24 runs,
 2 regressions (renesas-devel-2021-04-02-v5.12-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 24 runs, 2 regressions (renesas-devel-2021-04-=
02-v5.12-rc5)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
meson-gxm-q200      | arm64 | lab-baylibre | gcc-8    | defconfig | 1      =
    =

r8a77950-salvator-x | arm64 | lab-baylibre | gcc-8    | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-02-v5.12-rc5/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-02-v5.12-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      61f98817b996ae8435e7809a3e41d8113556f1d1 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
meson-gxm-q200      | arm64 | lab-baylibre | gcc-8    | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/606740a1ebd6b59e17dac6c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/606740a1ebd6b59e1=
7dac6c9
        failing since 66 days (last pass: renesas-devel-2021-01-04-v5.11-rc=
2, first fail: renesas-devel-2021-01-26-v5.11-rc5) =

 =



platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-8    | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/606741ff2fa00a035adac6ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-02-v5.12-rc5/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0324.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/606741ff2fa00a035=
adac6eb
        new failure (last pass: renesas-devel-2021-03-29-v5.12-rc5) =

 =20
