Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601BD722B2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jun 2023 17:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjFEPfz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jun 2023 11:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbjFEPfy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2023 11:35:54 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E679094
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 08:35:52 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-65299178ac5so4411126b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jun 2023 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685979352; x=1688571352;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mFOr1SZobYFpCaIVvMTzMKxBB0A3UxFn9fer9cPZgHg=;
        b=It+RTQsNssfYtKTI0q6GAaCTfxU+/ud0bTHbiNl65+IaY0sz2F6+CTt8v7h2QtyQ36
         KWGnGHTWSdYo4/s0XLKJG4S+mBL98YvPXQ6sj9D7TSm6gHUCrxQxgAZpqbexkIJEZANf
         H3fhtEv4CYLP0D4eSKUKOF340g0+R3hzOX3zLK7v5p3AAf8ppwJ2jaQaNZ3pY5AMYS+/
         pRoZyqngmGqnZ1EnGG1d1gFQLWuL2AdN0PtyLw5QPfEJS+t+MTmgDRJucmm86S3/uUKD
         7WufEviWQHdZAeAg3Mx9VqJLljqXNRpZvc2fShnfaHWkFW4gaSDddTy0m+0ktzvI89Nj
         qR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979352; x=1688571352;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFOr1SZobYFpCaIVvMTzMKxBB0A3UxFn9fer9cPZgHg=;
        b=MEDVe2kHPgcoRiauMLb5WnaMOV1HH+2ygvPgzaWGDUOjUN1floajiWoqNdvbyf8nLU
         aTKvjDOjGJsjT6cTsbIbdZOPb/mbHQE1zn7rGmS3b2jXKzZZuSb9d0/8StlYlJkAqodj
         /Le+z0zfgXT2SmdJc54lMIE7vrSI9s1yXNnd45eXjw/zdb2OLZR+hN5JBWhVGvutzmJO
         MxkFtm7iID8hXBOf/DCVg2tobUxcfut38vxBBvB6WCTpgMroaCM4p4C1HyTnkONT5H53
         UdmlPAHKm3UENMhj3tceoLLxJcKhV13BXYDriha6UUly+veg4jktNe+kOqOPNS916T+x
         KC2w==
X-Gm-Message-State: AC+VfDx/mKbZR9K5bbpjPqMe4DImCMs/lxGer8yotfUFAv/y/4dYMOQp
        k3FE+alDsmOPHX+5NvlJZ3aJU9ZWCIlRrkIEO4LAOA==
X-Google-Smtp-Source: ACHHUZ7BxYyIJmCpBYEAYcINJHSgIXhxmqJBoMtH1oU77yAKUH6UN06iIU6Rb6vLHg6KDxXLAr3qUg==
X-Received: by 2002:a17:903:2783:b0:1b1:a7d8:a3a1 with SMTP id jw3-20020a170903278300b001b1a7d8a3a1mr7673796plb.21.1685979351835;
        Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001ac94b33ab1sm6697178pli.304.2023.06.05.08.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
Message-ID: <647e00d7.170a0220.65252.b68e@mx.google.com>
Date:   Mon, 05 Jun 2023 08:35:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2023-06-05-v6.4-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master sleep: 8 runs,
 3 regressions (renesas-devel-2023-06-05-v6.4-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 8 runs, 3 regressions (renesas-devel-2023-06-05-v6.4-=
rc5)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2023-06-05-v6.4-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2023-06-05-v6.4-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      f669ef29adafb15e4632ab82c733cdf32339a90e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647dee96762b127343f5de61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/647dee96762b127343f5de62
        failing since 14 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-22-v6.4-rc3) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647dee1773b6f9dacef5de28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/647dee1773b6f9dacef5de29
        failing since 27 days (last pass: renesas-devel-2023-04-24-v6.3, fi=
rst fail: renesas-devel-2023-05-09-v6.4-rc1) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647dee501e6f17e8cdf5ded5

  Results:     12 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
023-06-05-v6.4-rc5/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/sl=
eep-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
230527.0/arm64/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/647dee501e6f17e8=
cdf5dedf
        new failure (last pass: renesas-devel-2023-05-30-v6.4-rc4)

    2023-06-05T14:11:28.674892  rtcwake: assuming RTC uses UTC ...

    2023-06-05T14:11:28.681226  rtcwake: wakeup from "mem" using rtc0 at Mo=
n Jun  5 14:09:26 2023

    2023-06-05T14:11:28.689215  <6>[   22.514261] PM: suspend entry (deep)

    2023-06-05T14:11:28.695017  <6>[   22.518853] Filesystems sync: 0.000 s=
econds

    2023-06-05T14:11:28.700278  <6>[   22.524305] Freezing user space proce=
sses

    2023-06-05T14:11:28.709832  <6>[   22.530746] Freezing user space proce=
sses completed (elapsed 0.001 seconds)

    2023-06-05T14:11:28.714429  <6>[   22.538889] OOM killer disabled.

    2023-06-05T14:11:28.718700  <6>[   22.542807] Freezing remaining freeza=
ble tasks

    2023-06-05T14:11:28.728895  <6>[   22.549580] Freezing remaining freeza=
ble tasks completed (elapsed 0.001 seconds)

    2023-06-05T14:11:28.737074  <6>[   22.558194] printk: Suspending consol=
e(s) (use no_console_suspend to debug)
 =

    ... (389 line(s) more)  =

 =20
