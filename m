Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4219754FCD9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 20:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbiFQSTi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 14:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234555AbiFQSTh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 14:19:37 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE4C3054F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 11:19:36 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id g8so4532434plt.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YT2ENEn7SbarBVfSzjtqRnOlQB2FCYuNi/NAOzcZIHU=;
        b=uyi7crk2Xl51IFsIpuuS6TRNpKfCIJiGRrY9dOAwD6fItGgiY5qD8TOSMPjf8ciC4G
         82dkp/t67ODAbczV8oZO3sP6g11qr+ebA1eyqbos3Fhk6fZsxe5Qoy8FJQxhEnDcG5tG
         Jd2kg8uu9TcfOs5fB11TFN1bN0qpoWZCSlAMdOU4+tkdbEN2tsuyXa0fT9/LQRthCYiW
         BaXBIKZFaSRIOJeHYz8ehwigS+ScX3UOVnP06GL3HkPU3HbsCfXk8a7qJ5hxnAPiquIB
         LEXKanDmP31cllOtfHPRCWFwfWmdGAd3SU17mZOBw+O0NavRs08/AwD6QLkWmxypygxW
         +bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YT2ENEn7SbarBVfSzjtqRnOlQB2FCYuNi/NAOzcZIHU=;
        b=KFptFZCZJT55izGuoaP87mdGnWR+hyTHg14jLvyxqwDKQ3D9gQ01kcXWmJQcMU/99A
         EfFMrLOZW9HRanvpU/O4wB3xRxhzurLJmfQCbkWFNp+ij/N/Rp6q4rzVrLvno9vDRmoX
         KOsKz9kg+IwhPZ1ZUexcWEss7bFWkvSX1vxF+cUcHHNM3oeoTh/7ASca4iaO4Ad7g+qT
         por+ThBDdjIOYSVqw0gI6Bpz7RQe4TVAYvFdGEyuBoapb7xtnbDuPHXyAkeFbDX6ryPD
         cGtadHpwMjZeZI7sd9+PcbSBPVE0RxZbTZ76qYTe8Pt7wbMxM8lTRWaULcQG9UzoFbkd
         Srdg==
X-Gm-Message-State: AJIora/YFh2x4XaRbdUfzmFzoSr8i7lz2LMrzAvjg7kjrW57VMN5YPb5
        r9L0g84pzvzHqqiNtLyk9QYuzrzcm30t2KphrFY=
X-Google-Smtp-Source: AGRyM1uY+GnGM9GmbUaTvv3AeVT4eNcAZb/YV1DvGj7045CEQnYdrcbfK+51Bg53mPMjk1R1+f4/dQ==
X-Received: by 2002:a17:902:8bc2:b0:167:7645:e76a with SMTP id r2-20020a1709028bc200b001677645e76amr11058725plo.115.1655489975899;
        Fri, 17 Jun 2022 11:19:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y6-20020aa79ae6000000b00524e640e9a4sm843695pfp.185.2022.06.17.11.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 11:19:35 -0700 (PDT)
Message-ID: <62acc5b7.1c69fb81.6e338.117b@mx.google.com>
Date:   Fri, 17 Jun 2022 11:19:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-06-17-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next usb: 4 runs,
 2 regressions (renesas-next-2022-06-17-v5.19-rc1)
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

renesas/next usb: 4 runs, 2 regressions (renesas-next-2022-06-17-v5.19-rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =

tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-06-17-v5.19-rc1/plan/usb/

  Test:     usb
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-06-17-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      64d15244c4805618b3bfc0886094481e9ac91762 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62acc29de0f44509faa39bee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-vey=
ron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-rk3288-vey=
ron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62acc29de0f44509faa39bef
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62acb8a85ce5cec09ea39bec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra124-n=
yan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/usb-tegra124-n=
yan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/rootfs.cpio.gz =



  * usb.login: https://kernelci.org/test/case/id/62acb8a85ce5cec09ea39bed
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
