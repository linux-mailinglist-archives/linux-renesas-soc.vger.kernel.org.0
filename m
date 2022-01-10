Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A8948A2B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 23:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345401AbiAJWZV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 17:25:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345397AbiAJWZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 17:25:19 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7613BC06173F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jan 2022 14:25:19 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id g5so5074607plo.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jan 2022 14:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+YCgqfMMW8NtxCei2+G1W4sG/bJ72dX02Csg7BW+J+8=;
        b=MoTdTfAFd1Qx3PtUxogJxDoKV8no7k13HsLPtIFLC4SCJCD1B70eKTnpAUD845Zxm/
         beSEGWpf9YjUueTjMM+5O2RwdEgCK/mIMZCP805Z0hn0hlEyfdnoGls5U3zi7uAU9xmL
         e2cnwscJiEl3vJm537mFHr0kgtoSipmwu5SFXR/N3vCPrBWEUUBV35t4JcwTgnfllsto
         s2+k4QZd7cfb95k8ay6HUT7Gr933QWwJYnn2HWG7lv20p+sr85urzqDzhYuttdL2LoBk
         oO+XgyCCHshf7aVdSrfEqSnDgi/xK8ifwv5AbMGbmp1MMFzGug/UgkmBgctuXYEUFqC8
         YL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+YCgqfMMW8NtxCei2+G1W4sG/bJ72dX02Csg7BW+J+8=;
        b=Thb6SZ2lkyG01WCW8T2WgZUf+7rCqBK4q9PjAGVbvquQydSvmr8cY84WFEwt1UfqgK
         bFzmF37a9FnEJeN/06HyuoVFHHagZ3kleMU6Wdql3RFQkASQxS3IsluRds6JcRscur87
         /eQQBX4VpRgE2JQyf8PQ+wD8kHVR1TOp47kT2T1JewxFzUTLdHXmSV49FWiVYc2XK8q3
         Nhejq4y/nHnVOBgF/JwclIAiKy9BXbjDT34bo31ohs0iinyYcU9IHHJ9uQpxR4mPW5og
         A9MhvDZ2th3akaZRoDkNSq4FDjLRtKvUm6GNCZilYSM0zCWbbV5skCfS4Oyv6lcTBikf
         VSQA==
X-Gm-Message-State: AOAM532S6i8YCZ30ueJSXiDwwEiYHjJANKTxIR8Ux0oJ0gltyTpTLtLb
        w5f492Uwid0CyLS4d3FPMwhHhTumDs0CoY0J
X-Google-Smtp-Source: ABdhPJx+5/FXJlVJq03fZJuPMJyKUzimZxxAHixgi1BN4iFze7C/8sNHWQOL/UpfbPazMQRTmVhfsw==
X-Received: by 2002:a63:9d86:: with SMTP id i128mr1586540pgd.526.1641853518850;
        Mon, 10 Jan 2022 14:25:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o184sm7808631pfb.90.2022.01.10.14.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 14:25:18 -0800 (PST)
Message-ID: <61dcb24e.1c69fb81.5f14a.3621@mx.google.com>
Date:   Mon, 10 Jan 2022 14:25:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2022-01-10-v5.16
X-Kernelci-Branch: master
Subject: renesas/master baseline: 313 runs,
 1 regressions (renesas-devel-2022-01-10-v5.16)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 313 runs, 1 regressions (renesas-devel-2022-01-10-=
v5.16)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-01-10-v5.16/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-01-10-v5.16
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      20430dcf04d1ee6f9b5af4b2b23fe6e097006565 =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dc7d848682916202ef6758

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-10-v5.16/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-01-10-v5.16/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dc7d848682916202ef6=
759
        failing since 55 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =20
