Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31B1962EACC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 02:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240874AbiKRBPW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 20:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240848AbiKRBPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 20:15:02 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED20286FC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 17:14:11 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id h193so3657823pgc.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 17:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oWn0WdA7nsoE1T66U2tqEpIDGKC02mFVpGy3JYi9G6Q=;
        b=s8C9dflXtt+Ij9TWaPj44TFuwDhHZHIJ7e3rnPvrpYlDgkMZZ5hTPoeQVpNtxRwY62
         lgeAdiLSb2BIioOe8gcPPdPvO/kIOKQuuiH+24rqGEOZOBqtYQRf5TUvnXIkODoD5LZb
         WtVlLP1VLO4yzyB01M1mf3VCURyDUdBrzsLtRSXmnYZk/N1MiAl540nHbWdYz+hkKyz9
         KH6fpLmjFwU/IKUnqtm0JOO1UC8U/BJu2GEp9rO/dIAvLokCiJ6NgANpvvTr9zZeXH/U
         T5+ves8HbKNr04nfB+4EVTwbIjl7cnFQxcTxRvPka9YOGvLkmZ/WkeKiQTUpzGxhT4kw
         YQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWn0WdA7nsoE1T66U2tqEpIDGKC02mFVpGy3JYi9G6Q=;
        b=uBWa20qvgsGNEX1662dEbI4EPbEOPM4twNuXz4YTO/DewLth+WoVVMiyxWYC8ldXbN
         30WdwMfbe+9Sj7TDKpgrplb3iNc6ytAUSCsihA8Wi5Q9FTcySW3U7FHHwdxDM5Fcy52Q
         l4jQUK6gK42gLLwp2gIF8Y7SO4NEubIStNBuzTFI8ihdgpVeuXOFFJJdaVCrRTuOf7xw
         +0yC8ZJ9iPhz6I9EJJGY12KigAV91wNSVXb3bkCB5zDWetsO4VIccT8XfH7KqvYsOnRF
         cjro5L0wxjC+dYZcxMOktBK8qvgK175ClUSd0bszew0RSOrb1evdl5yUTeEpkZt5ZHmP
         OA2g==
X-Gm-Message-State: ANoB5pnZtlv1flsQQXHrGZr3C0SHBsttCtq+UGm7vXG20t77SDQCvaTm
        qNhXZVOigEAYqpLbtjtGUH5Qt5ZUTBcdzcAEXGU=
X-Google-Smtp-Source: AA0mqf4dtP/TIHCZXbJpY1itPJYN46AoQsYKWVFPHeIjopDVtkoDb/WSfinBolgDgZCdqrEFPZIKGg==
X-Received: by 2002:a65:5b44:0:b0:477:1bf6:73b6 with SMTP id y4-20020a655b44000000b004771bf673b6mr2296827pgr.36.1668734044911;
        Thu, 17 Nov 2022 17:14:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p1-20020a170902e74100b00186b280a441sm2073154plf.239.2022.11.17.17.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 17:14:04 -0800 (PST)
Message-ID: <6376dc5c.170a0220.d0ca0.3a30@mx.google.com>
Date:   Thu, 17 Nov 2022 17:14:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Kernel: renesas-next-2022-11-17-v6.1-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
Subject: renesas/next baseline-nfs: 112 runs,
 2 regressions (renesas-next-2022-11-17-v6.1-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 112 runs, 2 regressions (renesas-next-2022-11-17=
-v6.1-rc1)

Regressions Summary
-------------------

platform                     | arch | lab         | compiler | defconfig   =
           | regressions
-----------------------------+------+-------------+----------+-------------=
-----------+------------
at91sam9g20ek                | arm  | lab-broonie | gcc-10   | at91_dt_defc=
onfig      | 1          =

kontron-kswit...0-mmt-6g-2gs | arm  | lab-kontron | gcc-10   | multi_v7_def=
config+ima | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-11-17-v6.1-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-11-17-v6.1-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      22360f65e18b2935b5e4695b868a6ef310f46a11 =



Test Regressions
---------------- =



platform                     | arch | lab         | compiler | defconfig   =
           | regressions
-----------------------------+------+-------------+----------+-------------=
-----------+------------
at91sam9g20ek                | arm  | lab-broonie | gcc-10   | at91_dt_defc=
onfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/63769f01b8f829b57d2abd12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/at91_dt_defconfig/gcc-10/lab-broonie/baseline-nfs-at91s=
am9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/armel/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/63769f01b8f829b57=
d2abd13
        new failure (last pass: renesas-next-2022-11-15-v6.1-rc1) =

 =



platform                     | arch | lab         | compiler | defconfig   =
           | regressions
-----------------------------+------+-------------+----------+-------------=
-----------+------------
kontron-kswit...0-mmt-6g-2gs | arm  | lab-kontron | gcc-10   | multi_v7_def=
config+ima | 1          =


  Details:     https://kernelci.org/test/plan/id/6376a4e911cb1cda592abd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-kontron/baseline-nfs-=
kontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-11-17-v6.1-rc1/arm/multi_v7_defconfig+ima/gcc-10/lab-kontron/baseline-nfs-=
kontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
221107.1/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/6376a4e911cb1cda5=
92abd12
        new failure (last pass: renesas-next-2022-11-10-v6.1-rc1) =

 =20
