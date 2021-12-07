Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 086F046C7A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 23:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbhLGWos (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 17:44:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242289AbhLGWos (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 17:44:48 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA427C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Dec 2021 14:41:16 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id gx15-20020a17090b124f00b001a695f3734aso652899pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Dec 2021 14:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jQBG5E0weSL4A2/S/xI0tSQ+PlRRZUuElYFCXC0w7mo=;
        b=EVOACGLA4r/viEu1vQM+OLl9CW2vYeVIMyzDXtPYfBPsklCDlPAkhrpeTdJfr8jSn1
         d416rOa2+8vc0OXtyIFUD5cKbGAvFxqgH7giNtyUwPG1aHFKG8N4SBSU0fWVpvwuBQLP
         JGz2DN+osPb/sbyxXjvZPKwLua5CdkJX3glqxwbWsKWH9HYqYLKB2M9+nz5Qj8+rZM6a
         WGET1kA4e/srS4DSFqi8mb41QBYJSdNMG0Rl7wgovLAmultRwoztMZ6DM8RuFyiZ1q42
         lXMsb2+4sHXQCfatYiMfkPmiyjZ3L41qarOq5J4E9VKS9pslTUpEYFpRD5kBHS4qVj4j
         q6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jQBG5E0weSL4A2/S/xI0tSQ+PlRRZUuElYFCXC0w7mo=;
        b=Rh4oQwslqihExWoAAMfskrjMWJjuCiaWtxcLVoi0N9PemEy79FrCcXYczzsPoC0Bpu
         s0oUhea3g0+b97HkceOPilBybcu9KASk5BJU0NmVYuCvHnMH5ZKhYEfnbPp5tjSQpo2o
         8MqkOD8chBV2kx9+OIp8CAwxt8ValWS1ijzvEw/w1ys+93xtqtyqb+sYhAbmA4e3Qpfz
         Nt7BTCVpg7xqY6SlqGr/OwUqlfi5axSqp0goJHRohiMBgRbWqhNbueB/JcMSI7ce9v45
         K8NQDG/98niw5dxiQxd2z0Azggh0m2b0bVxPcRd97OmdXCf3ScdnF5u9rWUdj2ZYjdKf
         g2PQ==
X-Gm-Message-State: AOAM532X1W2QKD0hCHbJLlyDvGPHRL5WwosFA/kKrL62Ym7cnnicVqAE
        oPAW/oD+u8c+MVW5uqUCAL8E2dgB0P87w+tl
X-Google-Smtp-Source: ABdhPJzBLx45WaJJGPSnseT5yH1ZpxDknCrEY9lB1zwOroLPdRjPpUrLHO559JnOUeP10UTrX1IM3A==
X-Received: by 2002:a17:90b:1e4f:: with SMTP id pi15mr2482176pjb.181.1638916876315;
        Tue, 07 Dec 2021 14:41:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j6sm756103pfu.205.2021.12.07.14.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 14:41:15 -0800 (PST)
Message-ID: <61afe30b.1c69fb81.72019.33bc@mx.google.com>
Date:   Tue, 07 Dec 2021 14:41:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-12-06-v5.16-rc4-15-g9f95ae4ce1f1
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 411 runs,
 1 regressions (renesas-devel-2021-12-06-v5.16-rc4-15-g9f95ae4ce1f1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 411 runs, 1 regressions (renesas-devel-2021-12-06-=
v5.16-rc4-15-g9f95ae4ce1f1)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-06-v5.16-rc4-15-g9f95ae4ce1f1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-06-v5.16-rc4-15-g9f95ae4ce1f1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9f95ae4ce1f163e55c94e37d23681c1d0dc0c3da =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61afacd265fb0133e51a94a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4-15-g9f95ae4ce1f1/arm/multi_v7_defconfig+CONFIG_THUMB2_K=
ERNEL=3Dy/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-06-v5.16-rc4-15-g9f95ae4ce1f1/arm/multi_v7_defconfig+CONFIG_THUMB2_K=
ERNEL=3Dy/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61afacd265fb0133e51a9=
4a7
        failing since 21 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =20
