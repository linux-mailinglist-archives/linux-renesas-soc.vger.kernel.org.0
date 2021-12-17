Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0DE4790FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 17:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238162AbhLQQJ1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 11:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235181AbhLQQJ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 11:09:26 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0631C061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 08:09:26 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id y7so2285052plp.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 08:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dplm4vZqBANSO8zMvCICfj3x3KRoCDQW2actIiOjBDs=;
        b=xt7TnKy/r1/o+g8bGPHaM/5DetaIVs8AMI4Fvms3sfVU5874Y1h0IuLWkEx/Wz2g7e
         srI1LHzCv349AKGHsPR0CG65YYytdn/ziNbDuBdynVNOiv+d4dFgk29ymhavU/jTj6by
         8ALp7mD52MitoTrIWBHIGyuxscABK52RmH2JjPWVy1qoiUrrM2l3GRLjWc7FMu1yyrYS
         yglgXZuQgowx/rP3wnL21Qf3dwxAT0SRA2rtT6440naVYQ/QDPvVbasojMowpAi7qA50
         T0uepn7BsGq2G8WnLGldYo9zc8Trzxwl+9AmiW7FRIIzp111fq9/cXtBkXGKu3TlaMPm
         rVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dplm4vZqBANSO8zMvCICfj3x3KRoCDQW2actIiOjBDs=;
        b=5YVuSyrUiGSHL/8hQDLg5X4WDAb8Q5sl3zu678gz7L2U+fqytqe3hrv9nLygu823O3
         sQYXU867CLligODN3lHyt8yXT/VRDmk4L0LQ+bOPyxdx1qIf5KGGaaE4S0d2+d2AMPW9
         xBmifHnN+VBf0CyiqTVilTFN+q2FhTy9k2+z3U/D4o8Rjo8WGrXw51BgyAKBRuppGacF
         NtiZ0KeE/QXs9YH7+Na7wAXQXscgbGDU1o5fmn7rMvAhASLux6d+zrhjsi9xBtzJawfe
         Z5A4s1oq496kOOeBP9PMSI9g2k3wtQUPlxLETaa4f0ngDbOJZ/Atw4QAZcgvReXdA4VW
         eIzA==
X-Gm-Message-State: AOAM531/YKRXlYDFlJ+H84ichg8mBrjosLj+RaMHJZRul7o0jIr9nfx3
        xUk7GjsgquiV4T1vzlgNnm5myqxdn8woc0zq
X-Google-Smtp-Source: ABdhPJxC0Fp5JJ+4exbUqzaikN36JLNieMY1vQVfxVR8AgjQtVYTHgjkTinEJQ/Ul9SntR6/l7XbFA==
X-Received: by 2002:a17:90b:1d09:: with SMTP id on9mr4468997pjb.191.1639757366008;
        Fri, 17 Dec 2021 08:09:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j13sm11070395pfc.151.2021.12.17.08.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:09:25 -0800 (PST)
Message-ID: <61bcb635.1c69fb81.db4f4.e08f@mx.google.com>
Date:   Fri, 17 Dec 2021 08:09:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-12-17-v5.16-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next igt-kms-rockchip: 1 runs,
 1 regressions (renesas-next-2021-12-17-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next igt-kms-rockchip: 1 runs, 1 regressions (renesas-next-2021-12-=
17-v5.16-rc1)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-12-17-v5.16-rc1/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-12-17-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7430027307374f7d8cdec708f61b1bc22d95b913

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  8d0fb9b3f225183fb3276a0e4ae1f8354a3519e8
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  136258e86a093fdb50a7a341de1c09ac9a076fea =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig | regressio=
ns
-----------------+-------+---------------+----------+-----------+----------=
--
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61bcaa23b54c5a064b39712c

  Results:     79 PASS, 15 FAIL, 141 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-17-v5.16-rc1/arm64/defconfig/gcc-10/lab-collabora/igt-kms-rockchip-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-17-v5.16-rc1/arm64/defconfig/gcc-10/lab-collabora/igt-kms-rockchip-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20211210.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_setmode.basic: https://kernelci.org/test/case/id/6=
1bcaa23b54c5a064b3971d2
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1)

    2021-12-17T15:15:27.611579  <8>[   44.765690] <LAVA_SIGNAL_TESTSET STOP>
    2021-12-17T15:15:27.647777  <8>[   44.801514] <LAVA_SIGNAL_TESTSET STAR=
T kms_setmode>
    2021-12-17T15:15:27.680426  <6>[   44.832802] Console: switching to col=
our dummy device 80x25
    2021-12-17T15:15:27.684951  <14>[   44.839523] [IGT] kms_setmode: execu=
ting
    2021-12-17T15:15:27.698016  IGT-Version: 1.26-g136258e (aarch64) (Linux=
: 5.16.0-rc1 aarch64)<14>[   44.845641] [IGT] kms_setmode: starting subtest=
 basic
    2021-12-17T15:15:27.698747  =

    2021-12-17T15:15:27.700755  Starting subtest: basic
    2021-12-17T15:15:27.704151  Testing: basic 1 connector combinations
    2021-12-17T15:15:27.791321    Test id#1 CRTC count 1
    2021-12-17T15:15:27.797778      CRTC[37] [Pipe A] Mode: 2400x1600@60Hz =
Connectors: eDP-1[49] =

    ... (149 line(s) more)  =

 =20
