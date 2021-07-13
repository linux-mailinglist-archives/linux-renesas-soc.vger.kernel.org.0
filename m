Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B493A3C7A40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 01:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235437AbhGMXpA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 19:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236787AbhGMXo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 19:44:58 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28CCC0613E9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:42:07 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id h4so38574pgp.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jul 2021 16:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XuTZBMIRW83tRodggMDdPQf1RVvjnkxBIdkrfVKvmgg=;
        b=Y6f3LxzOHvDRZ6hPNeFZLpzqrQwSmicz5hB5Vb2iTqpxCH24gXBm89NVuw5SoeTAZG
         HcdsYwTAF2h7hlhfgXZNYYpGRiW1TXnaqgYLnZBjfsjc+mogNfjwzq4fSd3zHawkiv2C
         mZTb7jjLDqRHzkqR5Sw2pEsDzdNgV65wbeQ7V4tV8iK9MT3usVrFVHTylOMkudhoh+XM
         5Z+ZjLdEwg10yQ3BEaPWEu/1tcx3pTJnRzzbw6HZmzlzeFADiJ8UJHRE/QO88imqXQJJ
         S5ndkzdMpSZjmoGi4GRL0ToKMg3lqSWflmB+Qsa3JGCsWDltzo3NsPkhuTYdjF36HIk7
         tX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XuTZBMIRW83tRodggMDdPQf1RVvjnkxBIdkrfVKvmgg=;
        b=tNLVLH9yzWi2wongKsfbqlx8xp7eSirYoyKrghHMaHmoQc7OVmJpvVrCVUUF5FQcvu
         0NsDMe73BOYMcbDR2YwdbG2jAVPHX5d90b0kptppHeDFFS3+rY9VMmT0T58RH0rjHcWn
         FdzmpFRruICh1qusCDYW0gc80KVnZaJRYLYJC4aFqXs+Fc2AnERcsIzBQnDhlaBtIuNc
         +CWrxgc4D8A1nnewAb7TGNgT2z3KzIQjWtMRdToIF21tAzBl0ghijF8xSaJC01YNFzx/
         4iALUy3WjDLHPJVHKSbaOuiXNA1wx9xbnH9enxRz4s+dKcm9oKZrms4Cwj4VkkrUzzXJ
         BesQ==
X-Gm-Message-State: AOAM530oEHUOiPoUJ5Nampmn+JZRJLTkACdyjkAbvRboT+HKjuKgB+1b
        OAMxGGHq7LLloElb3ZAs04qXatQbriEUCVeQ
X-Google-Smtp-Source: ABdhPJzBSIJL+c9lxNstLnqUEkxRJ34lmLJfqZmys7Km7a9OU0Tui0vuoXwHhQeDMyN5fgZRVfMQmg==
X-Received: by 2002:a62:7c52:0:b029:329:d4c2:8820 with SMTP id x79-20020a627c520000b0290329d4c28820mr6957390pfc.59.1626219727116;
        Tue, 13 Jul 2021 16:42:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w16sm217844pgi.41.2021.07.13.16.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 16:42:06 -0700 (PDT)
Message-ID: <60ee24ce.1c69fb81.4f840.1413@mx.google.com>
Date:   Tue, 13 Jul 2021 16:42:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2021-07-13-v5.14-rc1
Subject: renesas/next ltp-ipc: 10 runs,
 2 regressions (renesas-next-2021-07-13-v5.14-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next ltp-ipc: 10 runs, 2 regressions (renesas-next-2021-07-13-v5.14=
-rc1)

Regressions Summary
-------------------

platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 1          =

beaglebone-black | arm  | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-07-13-v5.14-rc1/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-07-13-v5.14-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      51832d6b6211d53dd4145b477a0b0d0fc87d84cb

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


  Details:     https://kernelci.org/test/plan/id/60ee16a3b180a844088a93a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
ltp-ipc-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
ltp-ipc-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ee16a3b180a844088a93=
aa
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =



platform         | arch | lab           | compiler | defconfig             =
       | regressions
-----------------+------+---------------+----------+-----------------------=
-------+------------
beaglebone-black | arm  | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee1818af508f4ca08a93be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/ltp-ipc-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-07-13-v5.14-rc1/arm/omap2plus_defconfig/gcc-8/lab-collabora/ltp-ipc-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20210709.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/60ee1818af508f4ca08a93=
bf
        failing since 0 day (last pass: renesas-next-2021-07-08-v5.13-rc1, =
first fail: v5.14-rc1-17-gcd117793e1ac) =

 =20
