Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B0F463683
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 15:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233556AbhK3OYC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 09:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbhK3OYB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 09:24:01 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72477C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 06:20:42 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso18437030pji.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 06:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+V+x0z9m3PeiK97e8BurhVullKyOeIgib/d/+oAY/uc=;
        b=isLeBCKg+x7r518ocopcZjGo2kFdmYVD/LMgEBWk5TDf4T8fwcvneb/TZ4tp/tmW5y
         H2GnsedqDHewV7Oi62x9BIe9HicrisIRD+hGW+MFrgPEDQDWaPaBwcMYJpT1q/k64uqU
         94RrGnt21C+D0FiLnkSWO2D7nWKbMyxxXDexCKd25CdBkDRrFkT164YUe6F2nfrxL2kN
         ty7eCM0aIgvSZotwmeLJG3UwWqedxNhgLCTlPwhXXLvBcLZScZDSZ/g0g50dcVrOTR9Z
         RDmd2ohAg5DNgQu4emOh5kYqHFqyYCV4K2yoFJBT/7n2jMlU+el/SGClgverEPc3V9AQ
         LHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+V+x0z9m3PeiK97e8BurhVullKyOeIgib/d/+oAY/uc=;
        b=gIlKQYJ/LvFc0zSDtwXIHzrPBSmybVghya6iUgPQdmNAbXgOmc393BuaOZUBVyNciI
         dEbBZ+Zp7Q3olMbnOCAcB9iFO/0b3XtbYaLhXiOTfsIpPtYyH0S+C0EXaUziIOZ7P+DB
         QPv4r8W4tcsmXZ2HJJ0VjcmU7q+350MEFrPGlGfA2b7aR0c4Ty27PDqyt4WbH2oMz7OW
         gnuqtLzUWqpwniu7pMZR8aH+NN0BTIQW2zX+uSAL462KIHphQCm1oUpIp9pGeLeq/C+4
         X2+rQ2LHkkVlPe9k7ijN+IOKxN1UnfStK+wQatdD9xNMaua+gLDk6SE7oiB+d14KW9fj
         ZMOQ==
X-Gm-Message-State: AOAM530/5MQC2nOT/60RF2mcqTcyQQuK2zB1odtPUlpZG61JtFb9+0yF
        noSObbrWv/PSlyk+2WPRcJzbu4/lY640n6kE
X-Google-Smtp-Source: ABdhPJzl/tT7XsrAnYJX8sz8V4bJqjGAer8XcHY7pt9MOQz211HrrWIXrbFjMO/6wVtJOR3sszK6zQ==
X-Received: by 2002:a17:902:c7c4:b0:141:deb4:1b2f with SMTP id r4-20020a170902c7c400b00141deb41b2fmr68165710pla.44.1638282041784;
        Tue, 30 Nov 2021 06:20:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f4sm22680488pfj.61.2021.11.30.06.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 06:20:41 -0800 (PST)
Message-ID: <61a63339.1c69fb81.526bf.beb5@mx.google.com>
Date:   Tue, 30 Nov 2021 06:20:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-11-30-v5.16-rc3
Subject: renesas/master baseline-nfs: 33 runs,
 1 regressions (renesas-devel-2021-11-30-v5.16-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 33 runs, 1 regressions (renesas-devel-2021-11-=
30-v5.16-rc3)

Regressions Summary
-------------------

platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-30-v5.16-rc3/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-30-v5.16-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      4a8e6127a65a43320486091f9448d869aedb1dc8 =



Test Regressions
---------------- =



platform            | arch  | lab          | compiler | defconfig | regress=
ions
--------------------+-------+--------------+----------+-----------+--------=
----
r8a77950-salvator-x | arm64 | lab-baylibre | gcc-10   | defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/61a5fd34aa5635465a18f6d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-30-v5.16-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-30-v5.16-rc3/arm64/defconfig/gcc-10/lab-baylibre/baseline-nfs-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211126.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61a5fd34aa5635465=
a18f6d1
        new failure (last pass: renesas-devel-2021-11-29-v5.16-rc3) =

 =20
