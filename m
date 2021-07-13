Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BD33C79EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 01:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbhGMXFT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 19:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236072AbhGMXFS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 19:05:18 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029ADC0613EE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:02:26 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id q10so122610pfj.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3VvkGvFUOJasZhfJ60lckT/eLZfxXyTaEIFtJsSiKY0=;
        b=QnnMSPJrl1XMaPSD4GZ6QdxfNWyGnDD4ixf2fVH23hEOYclTjORpsUlHgzCAVz9+Nt
         tNb1C9gltmaX3BJcKkyUuBXSEtCXiHIYkBZEDdB/BBeOp0uKZ3Msvfnhj9hf47KU+yHB
         fvqPrPYzySj0eQPVcYglTYydfAVG3dPqU9BJarHz/ZR+KQj3OCa8KlswHKEl3CuYT+VK
         daKzEtSOV06i+4DFx49kHdp4mvbrX/a0IKpBGuFoSY/5VFvdR+BFLHHIJ22eZUjcZF3M
         Z5K9xNjfxyNbN2i808m68Y2jumQRSkpAl8QZ6LSqPg77dq4ngGzVUfNBhsAUKi7wuYTo
         VMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3VvkGvFUOJasZhfJ60lckT/eLZfxXyTaEIFtJsSiKY0=;
        b=Mmk8A/4DdL0eJXIitb02m0DbfpSY9gPa67ekr+A3a7kJP5TyQ/ikllq5hSCAkvHQZZ
         g+7OH6AoGlU6Eyl6BQd2ze3CtXB/5LG3XKC6nj2eKON6Bj22jYFnrwCYNMZSzATJdI6s
         yKkpgd2piKFQDzxpTIOURKJgVh/y7bkdWV4NU2Atl+fQp/hGX/JyYF751Wi5XSumah2h
         GSFvOxqmHMgUFpxrS6B176b6C+wM7g1cjzUpXOJpAYpaE6g2omHQG9HrKjiVt/IfZ4Fy
         Srl15fSci69TZ7S/+klvBV/hzY2Pg8St/BckH9EePWPOaxdQ34YZNoWme7nunXIy3wqo
         OY+g==
X-Gm-Message-State: AOAM530LMitQlEsxJzLtSzgqkTwm0PNKCjy+sYFO/d+3rggOzNlXbHND
        /jdBDVsUqkfZNIIcAOdInc9QaeR/b5R+QObt
X-Google-Smtp-Source: ABdhPJxKm0eKE1GCCq7UbVM1omplDZ8e1hFwkt1XiQ7w4tIFYfOekQmGM9fdKfGsSSGv64sQbuUXtw==
X-Received: by 2002:a63:4e4c:: with SMTP id o12mr6501156pgl.95.1626217346420;
        Tue, 13 Jul 2021 16:02:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u125sm230898pfu.95.2021.07.13.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 16:02:25 -0700 (PDT)
Message-ID: <60ee1b81.1c69fb81.b7f5e.14a6@mx.google.com>
Date:   Tue, 13 Jul 2021 16:02:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2021-07-13-v5.14-rc1
Subject: renesas/master ltp-ipc: 12 runs,
 3 regressions (renesas-devel-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 12 runs, 3 regressions (renesas-devel-2021-07-13-v5=
.14-rc1)

Regressions Summary
-------------------

platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 1          =

beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defconfig    =
       | 1          =

beaglebone-black | arm  | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-07-13-v5.14-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      81b7948a0be3dc48ef04d01b16c08dc3b460bce2

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  f631c87593cc624848c5b9521727d912a0b00b4c =



Test Regressions
---------------- =



platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee06bc89d54701ad8a93e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/ltp-ipc-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/ltp-ipc-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ee06bc89d54701ad8a93=
e5
        failing since 0 day (last pass: renesas-devel-2021-06-14-v5.13-rc6,=
 first fail: v5.14-rc1-477-g3c037963715c) =

 =



platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defconfig    =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee0a7c67321387a38a93ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/ltp-ipc-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ee0a7c67321387a38a93=
ae
        failing since 0 day (last pass: renesas-devel-2021-06-14-v5.13-rc6,=
 first fail: v5.14-rc1-477-g3c037963715c) =

 =



platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee08d9627a83a7558a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/ltp-ipc-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/ltp-ipc-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ee08d9627a83a7558a93=
9c
        failing since 0 day (last pass: renesas-devel-2021-06-14-v5.13-rc6,=
 first fail: v5.14-rc1-477-g3c037963715c) =

 =20
