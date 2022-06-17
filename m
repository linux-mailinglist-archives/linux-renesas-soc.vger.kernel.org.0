Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5F5E54FCDB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 20:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbiFQSTj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 14:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237263AbiFQSTh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 14:19:37 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367C62F3A6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 11:19:36 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id e11so4821509pfj.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ylwtp7Zd/Zf9Yuc+aEcW/o8FP/59GDIHOQZrok/uZuY=;
        b=ekmvDD7RwJ2Nj8W6z7KqDgdtl4RLFZVVcmY9RNL96gAKZle0hHngGCkhIGnCs7JA/t
         2j+5jGjHElfZA/FOD0FwabIeY/aM9gUxEhdSTbwxrTfUs4xkPl6tvuxFdWk40iqbmptl
         N/+Jc0XsbU4F0FxFM9ibt31IjoBpzMCJTM5Ie/TEEnVW1Y48Ss6MgS2JTWMlKeWJcgzc
         5uNnm+RNjPCt+o6ozwOaHSumYM19IilGxmTOVHDl3Rlvp/Z+pAyVzTD8koPXYDXARRcj
         tOYinhbNEk/DGbqpgnzr1oWC09Nl8jpXKm8nPE4jGUWIzbwC2r1pcYOcldd7XVz8GfKL
         ouhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ylwtp7Zd/Zf9Yuc+aEcW/o8FP/59GDIHOQZrok/uZuY=;
        b=a6jq06pAvlwdaHiXTLyBiiM1U9spirYrIosW26BeiZVab3D5EvnddyKwMzlxmNTicf
         C80ASSz8ZcA2ukxNavcJiHggvDtjyk3rwJEbKVEMlLnJi0Li0hQJOkiGAk9qwkw93lMX
         NNRGpfEHze7wqOO2G+4f1G/uy6gGHc2ZCH90HFYTYh6cRVhEp7WpkOiUNwutP7Sgkf7R
         7VBTDw6fBm+gai5GsafGQOEgPEAUFB8Fj480j1h6MmaUE757WJRrJZtK4PZVLpYU0Bmb
         +JpQn86fFFOobkVkWkLzC6+iCHZXCmYSKnMQiySt/fc2NkE/OyYX6uSHJWSJ57aWVvN2
         KHrw==
X-Gm-Message-State: AJIora9/WS0iFE8hIOk3CybEgBjTluUxZBfdKADJAVvrbkDaAw+6KY8l
        KMRwGLcrqKLayFBjLzFFJsXwMJm3X85VpKWn95Y=
X-Google-Smtp-Source: AGRyM1snXsUv3lt3tabtYDGL6wbwYxns59EfKxkjyX4SfG8msluPPf9SvRqEPFNX9k14j+IiYChXiQ==
X-Received: by 2002:a63:7d49:0:b0:408:c70a:9496 with SMTP id m9-20020a637d49000000b00408c70a9496mr9781031pgn.616.1655489975555;
        Fri, 17 Jun 2022 11:19:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x7-20020a63b347000000b0040c2d7fe1a7sm3806580pgt.80.2022.06.17.11.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 11:19:35 -0700 (PDT)
Message-ID: <62acc5b7.1c69fb81.f5475.52f8@mx.google.com>
Date:   Fri, 17 Jun 2022 11:19:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-06-17-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next sleep: 8 runs,
 3 regressions (renesas-next-2022-06-17-v5.19-rc1)
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

renesas/next sleep: 8 runs, 3 regressions (renesas-next-2022-06-17-v5.19-rc=
1)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =

rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =

tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2022-06-17-v5.19-rc1/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-06-17-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      64d15244c4805618b3bfc0886094481e9ac91762 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
mt8173-elm-hana   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chro=
mebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62acb73f3a558a7ffca39bee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/slee=
p-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/slee=
p-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/arm64/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62acb73f3a558a7ffca39bef
        new failure (last pass: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62acc12692776849b2a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-v=
eyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-rk3288-v=
eyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62acc12692776849b2a39bcf
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform          | arch  | lab           | compiler | defconfig           =
       | regressions
------------------+-------+---------------+----------+---------------------=
-------+------------
tegra124-nyan-big | arm   | lab-collabora | gcc-10   | multi_v7_defconfig  =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/62acb73f0036e07c6ba39c10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra124=
-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/sleep-tegra124=
-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
220610.0/armhf/rootfs.cpio.gz =



  * sleep.login: https://kernelci.org/test/case/id/62acb73f0036e07c6ba39c11
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
