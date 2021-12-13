Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9131B473643
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Dec 2021 21:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242489AbhLMUsR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Dec 2021 15:48:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236136AbhLMUsR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 15:48:17 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEB1C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 12:48:17 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 200so6762275pgg.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 12:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Hox9NkczKpCbEYYZegZ/NMDNAcRQ3KIJ5cRJTQ32wDM=;
        b=yoNqnrnq2Te5dv3Wzrocv98y05JIT+7J77Xqx5vbyjKqi8ESc9DMIth4rEDLlG2Uio
         CgVzRD23dVavulNmDKc0xOKwydaSzqFVdWDkJoL6eslxu1b8+piKe5ybMQNpL6h6QQ1L
         wBl2GS/b8U2zOoKVB7GNpdm1Sp6telse+vz7NnFlpOorFG3XfIlDPk0bh5pQqqUsRL6P
         axqLOaR+hrX0RUqkNgP0KxRBzQbPqYkkFjUFkFIAd2zn9JH5alojlZ5cKm/L1l5ZBeNZ
         Zbz1sTOLIhReyUoaAubmn74bKnYxJvRI1XD4lZcd/Id38j/jTKWtodTo/5FQWX/BRst7
         7sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Hox9NkczKpCbEYYZegZ/NMDNAcRQ3KIJ5cRJTQ32wDM=;
        b=1N1mRRGUFhN+tebSvqe84Vg1huZyMtYlHxV4vqadPiynBWry5StHh+zNITCQOq18I8
         IiJ1ab9fycXJ3czRCbXewJUn9xNtwAlgbxEP7D+VyH7ucFsYkHYk6GLYa+7VcJB1xcOZ
         aQ7BNcNXcRf6706VkQO732B1HGBnCQayJOhvuR1HfxkIOr+09MlWKbbCuWBL7azJ01RO
         2lnPXPFBg5yWJAR7Hf6bvq7pyN8bEfdz7+O0uSSmKNl0JhJ4FqIqsGoJPOkVaTjU5UIM
         vyXVOUKfnvT5Q/I9CAc5H1UavhZJGy0IqrETSdgp7bbJW7DyW/hTPtZVr36LO2FvyxBq
         vzbA==
X-Gm-Message-State: AOAM5339pp3tyLhb4JDMvewqkJc3yZF3iy5oCLAwGc9uvJVw/nSLViCf
        eesezmWHzFJAjnp0HwdI9W3HS3ooZIVTzPgX
X-Google-Smtp-Source: ABdhPJx+NgvsrjRwNnO/kkXd0aBnXFY2Gaf2wf//ajJGOGm2vuiBxUemfXzN1pwVSAFvzcGda1Jz9A==
X-Received: by 2002:a63:f150:: with SMTP id o16mr704294pgk.21.1639428496657;
        Mon, 13 Dec 2021 12:48:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t2sm13776032pfd.36.2021.12.13.12.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 12:48:16 -0800 (PST)
Message-ID: <61b7b190.1c69fb81.9114c.6a2b@mx.google.com>
Date:   Mon, 13 Dec 2021 12:48:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-13-v5.16-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 471 runs,
 2 regressions (renesas-devel-2021-12-13-v5.16-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 471 runs, 2 regressions (renesas-devel-2021-12-13-=
v5.16-rc5)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-13-v5.16-rc5/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-13-v5.16-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2d93a61c003c8e6bbc9e44c5ffc3eb00242028ef =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b792bb55b10a5c3b39722f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-13-v5.16-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-13-v5.16-rc5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b792bb55b10a5c3b397=
230
        failing since 27 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b77a88e51775d49939718c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-13-v5.16-rc5/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-m=
innowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-13-v5.16-rc5/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-m=
innowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b77a88e51775d499397=
18d
        new failure (last pass: renesas-devel-2021-12-06-v5.16-rc4) =

 =20
