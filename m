Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9F554FCD8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 20:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbiFQSTh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 14:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234434AbiFQSTg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 14:19:36 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2882EA3C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 11:19:34 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y196so4813257pfb.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wan/ZjxtGpP7Mg7PmROWD/zTsIUcB85ZAhUCP8iZWH8=;
        b=KDbT7kGNu/UschEo3CpnDDmg0W+/N9DyDUKSkkqUzicsdbaA3T945w3vFXAFIsv7Fo
         RrnRIrA1ampuRSCVqhJOFrwjKpatBBmIRcKN9f4qawIxmgc36BNUHZRu7i0+uIVpaD6H
         DxDdilujHl49CKGp7K8tPDPBsJMoaxg3s0y2LilGr/maYVmPdaeRGnRmj8GLMxm76xgH
         Fm5/SvyUTl16irTWrjjk14rkH/mWPh5y2M2vFSXUN7dvXtEJbvC4L86WQrluRc/Saq3/
         QN1QfBSpAzi5VfTFQCJ7raQE9zSKK9ZTbZIKHpndw/ceeVkfGJIR7GHVnlxTnl7d60P3
         fnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wan/ZjxtGpP7Mg7PmROWD/zTsIUcB85ZAhUCP8iZWH8=;
        b=KEo1K7z5tDlXCV1k78pUoc/Qc6EhvI4qdKk3PWfWg18VFYtZ16Z0KglVaUtiJlv2Tz
         OEqRoAU+2Qjs7hnU+pSPDbWMEoWyoF8E8C6vzhidYI9eqMAd4b7RnavTaUIjGN4uAZtK
         A9TlXrZ3TeLhzYIjuWKzJfgXJoZl0QfVcRp4dhcV6oHe88nmOzgir7IzNW5bFcEu2YH4
         k/62DBFjdsKVTmO9vNEqlceGXgBFY+7O0vhmmRmSm/PxRFINz8olEKF0dK+lQVKRmY7Q
         antwSBKsCBFSsxlBYxFkgGK1g/TilQVJ+jEjh227IfCOqkDdkcn5oeSyBPiSg9fxJzZu
         OfDQ==
X-Gm-Message-State: AJIora+LBzxOwY+sR0sWnkdD4wpmQTYYv5nPh7W2nGRmlHVLcZmuX3c9
        qdPhlo5y0yd7vTAXxmdy/SB978lxwiwa6ds8hnI=
X-Google-Smtp-Source: AGRyM1vIFFNDfVyFbI5kIK0TWGhW/WfSgl9YVzExC5b1j8AS0hjvafmBfcLcaYnpanHjLz0C0RoF3Q==
X-Received: by 2002:a05:6a00:16d2:b0:522:81c0:a635 with SMTP id l18-20020a056a0016d200b0052281c0a635mr11569415pfc.0.1655489973929;
        Fri, 17 Jun 2022 11:19:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jj21-20020a170903049500b001616e19537esm3847255plb.213.2022.06.17.11.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 11:19:33 -0700 (PDT)
Message-ID: <62acc5b5.1c69fb81.3b4ba.6084@mx.google.com>
Date:   Fri, 17 Jun 2022 11:19:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2022-06-17-v5.19-rc1
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next cros-ec: 10 runs,
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

renesas/next cros-ec: 10 runs, 2 regressions (renesas-next-2022-06-17-v5.19=
-rc1)

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
s-next-2022-06-17-v5.19-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2022-06-17-v5.19-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      64d15244c4805618b3bfc0886094481e9ac91762

  Test suite revisions:
    cros-ec-tests
      URL:  https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/cros-ec-tests.git
      SHA:  86181a7fbd379fc42314c450740d2cea8cdf04c1 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62acc41314522f1b12a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220610.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62acc41314522f1b12a39b=
cf
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
tegra124-nyan-big | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/62acbd193cc0408c87a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra1=
24-nyan-big.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2022=
-06-17-v5.19-rc1/arm/multi_v7_defconfig/gcc-10/lab-collabora/cros-ec-tegra1=
24-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-cr=
os-ec/20220610.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/62acbd193cc0408c87a39b=
ce
        failing since 10 days (last pass: renesas-next-2022-05-05-v5.18-rc1=
, first fail: renesas-next-2022-06-07-v5.19-rc1) =

 =20
