Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E35418123
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Sep 2021 12:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235805AbhIYK60 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 25 Sep 2021 06:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243920AbhIYK60 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Sep 2021 06:58:26 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EC1C061570
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 03:56:51 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id k17so11168921pff.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Sep 2021 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Oq5aSugnY7FGJZH+VMCKZxiM0zZfYpuvpJIO3m3LFGo=;
        b=ApukwApHsS0LrDKv8EsnfdH1uiZ6GP29bmchrbM+ba/c79W/Kec2797QX62WedO4MC
         7evV1aO3JuHPE6qEbuclknr2ngsasbeuC7xAlQtK5Qs2ISyjq7LRBal0FX9/RH77sxuJ
         jpDBxRiMIHZrqUjfirw7BYlQESQjipIoWICFTKPQsoTmKL3LDTLcj3PmsJmC+eIPZrAp
         bfQSJfaYP31U1PEZb50FYOhkmRAYdocFeg8jPesKTTD2KX6rbKFh9jiZmvceKzZfV5GU
         2/+Z+Z0cGHzbea1gQu4KSblZ7e1HctI8t52vJK9T5B7fvd9Se6a+qWggkT76NFOu4Fc6
         hWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Oq5aSugnY7FGJZH+VMCKZxiM0zZfYpuvpJIO3m3LFGo=;
        b=wcjXkrA2KeZGKIglr1ZDj8YCPjnZKdSrYhuK8T1geKbmRmcInmp+4BKZ/aCoTYvWwM
         UbpY0Cbga/i9MH9Lp4D5i3zDOLrAGPXNWnOy6RoTs2R+Ez9ZLpbt1DhL87XYzSDcnSlX
         qx9GIV0yhoNcohhLDMhVA0Y4XJBdd3shYvWUaOzTDSFgkiv2jCW+sl2NasY9pys6/m5k
         lVpgni4RCaAJI62FGbMdqR6ybfjsy/3LIkNBhP72g4Uc7EROvoXU9RO/kbeZkC7kX4zQ
         sUCRIHetoT8qRPsfoyk9DUI3Qfci3TcTKIcmCto3PjKmMmVC31i3nIMNLp1ozh58X0Zd
         OXAg==
X-Gm-Message-State: AOAM530nLVwzQQXSQE74cED3YmV4dloi+sLQ6Gar3YvHZ/iq8SCo81B9
        dWisutLjFx41eWIu3kXA8vdGU5h4QuDPQrtj
X-Google-Smtp-Source: ABdhPJyffGfS4s/WHr0AIW/AT5HlQEjrZ9fi39SMmUOKEvBIZlOW5MWEPSV4tSxTA4C9Q8/hMOKDfg==
X-Received: by 2002:a65:620d:: with SMTP id d13mr7847831pgv.36.1632567411181;
        Sat, 25 Sep 2021 03:56:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k127sm11810219pfd.1.2021.09.25.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 03:56:50 -0700 (PDT)
Message-ID: <614f0072.1c69fb81.b4713.441f@mx.google.com>
Date:   Sat, 25 Sep 2021 03:56:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-09-24-v5.15-rc2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2021-09-24-v5.15-rc2)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2021-=
09-24-v5.15-rc2)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-09-24-v5.15-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-09-24-v5.15-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      2c0b11dd6f8ce5c74e91b71a38505ae9088bf68c

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  1084c5eb74fd0daf8c9b8e83e85f5208c396579b =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/614ee99be6ee620f9e99a2f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-09-24-v5.15-rc2/arm/multi_v7_defconfig/gcc-8/lab-collabora/igt-kms-rock=
chip-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-igt/=
20210913.0/armhf/rootfs.cpio.gz =



  * igt-kms-rockchip.login: https://kernelci.org/test/case/id/614ee99be6ee6=
20f9e99a2f9
        failing since 11 days (last pass: renesas-devel-2021-08-23-v5.14-rc=
7, first fail: v5.15-rc1-564-ge23d26d2dc9a) =

 =20
