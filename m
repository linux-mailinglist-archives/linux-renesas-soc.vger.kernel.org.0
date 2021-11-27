Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB9645FC4D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Nov 2021 04:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351888AbhK0DWC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 22:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233355AbhK0DUC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 22:20:02 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BABC09CE45
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 18:08:21 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id n26so10510497pff.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 18:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0hUpkk2bVLMlWbUm6FAXqYcsXcRQDfAu3do09rdMvQU=;
        b=5hJow46YvRg9KynMaoLmRj620TjvX4/nvJv0JnMqOom+GtBc72VGF6DXRhSzqInvXR
         GNdFQcm1DU3mm6fIXW9Mz/OuguH8uxUvbZpw6guTJEkdjWwvoTFA0iJg7Jw87zN+MW//
         qVkqu05yBNKAl9SK/OzNjEN4XwLR5+nqDiUhowkqgF0bl5tuB5SMyaDLGcXRJJC27mRt
         BKim+NwTyy6TN98cQqmw59pdUMo34/eBABSGggZ9nxJAf1/8l8Uvl3u4N0jmBjBPZhzm
         grmB2PMuYFPLhcFMEojVuVSopcpC01ks1UjIDnZGDL95zXUQeOyYfdEDdL3znnGBRfjy
         nCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0hUpkk2bVLMlWbUm6FAXqYcsXcRQDfAu3do09rdMvQU=;
        b=YXI/Bcs/hBdiGAd/060eKk6ZYhlwyMPDTmvmpryWLNWT7pRpgi85fA86yACL+GcNQ2
         oohDN19oaEdV2IrBenyB+F9m0ecJb5gCDFh0wkvm85HODtME0lkLKqIVySNcKgjjHWdC
         3xCxfNyrCLtu+n47xad26PjBAU/b2Xq3IzFKbWE9w4zAMZTAHi7btOX7T49LoLDZE7x0
         zT1hSjDJJ2gyuX0fAPCtCxo34rz2Z7QcqeHOJcpsizMAQdjXntlFWkbBr0zEZiz6vjg1
         4K6U+9gc7+/NRVCFVWIWa8lLkBQfZyaxPMOuacgpYcYL3wmbIVckmwyuINeGo3slbypN
         bDnA==
X-Gm-Message-State: AOAM533PZIOrDEErTEtJhhtit97OhXmx9t26MDnqsFStZrQP1vhwUdFl
        WJlGBeCTmkZntEgAXT1kQGvgAxcp3LOQqwd0
X-Google-Smtp-Source: ABdhPJwftbOlaLnY9Drk7+YIuGcIWC1sY+8FpUFbJlvNobPwTMktkCLOHAyB0tUBfQ835JqPZYV/9Q==
X-Received: by 2002:a63:894a:: with SMTP id v71mr24119849pgd.337.1637978901123;
        Fri, 26 Nov 2021 18:08:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id il13sm13009252pjb.52.2021.11.26.18.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 18:08:20 -0800 (PST)
Message-ID: <61a19314.1c69fb81.c850f.149f@mx.google.com>
Date:   Fri, 26 Nov 2021 18:08:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-11-26-v5.16-rc1
Subject: renesas/next baseline: 436 runs,
 3 regressions (renesas-next-2021-11-26-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 436 runs, 3 regressions (renesas-next-2021-11-26-v5.=
16-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =

rk3288-veyron-jaq   | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =

rk3288-veyron-jaq   | arm  | lab-collabora | gcc-10   | multi_v7_defconfig+=
crypto    | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-11-26-v5.16-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-11-26-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      aeb0ae2627f78fca02f76bf5cb64d0ea94ff31b1 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a16024c07ec6f12518f6d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-26-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-26-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a16024c07ec6f12518f=
6da
        failing since 10 days (last pass: renesas-next-2021-10-18-v5.15-rc1=
, first fail: renesas-next-2021-11-15-v5.16-rc1) =

 =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-veyron-jaq   | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a15e95eb50956d5318f71a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-26-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-26-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a15e95eb50956d5318f=
71b
        new failure (last pass: renesas-next-2021-11-15-v5.16-rc1) =

 =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-veyron-jaq   | arm  | lab-collabora | gcc-10   | multi_v7_defconfig+=
crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a16407ac8c83300118f6f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-26-v5.16-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-26-v5.16-rc1/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a16407ac8c83300118f=
6f3
        new failure (last pass: renesas-next-2021-11-19-v5.16-rc1) =

 =20
