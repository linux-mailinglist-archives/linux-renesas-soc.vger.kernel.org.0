Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A329842A3E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 14:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbhJLMJf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 08:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235922AbhJLMJa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 08:09:30 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3C9C061570
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id 21so7215551plo.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bYSiLq2SZUkHUtUxQyHmp5buQecM60eojktcEj+0e60=;
        b=Is4Mm54V0vqCfPeeUBdSpXJKX2F6lFwZ1SECFYkbKS2Js1XFQZTwFgJUEN0et4E+k9
         Dd4UZZBlgvv+9iEVkczp9WkNb2bgcuM5BGEfkdz5ybwLWVBR4/WBvZzb0EIR++C1JUlY
         w34bLH5ZaaKiJvLapqwbY4CDCwbSoUg3nmpY31vPcvK9Io71Eb++3CeU98TAClBeHqtk
         DnN2kQTnZxMbhs1gl3l4hwfHIKMdbhgunOREklxZlfVkEz4+32OJAzFk1CS1hfP1QxLu
         gyqE3rMQr4eBJy9rhsvCBfs+Tt3jCQI8Th00u9bYOA09l5JP2S89FUkb6qR83k3OU7Dn
         UyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bYSiLq2SZUkHUtUxQyHmp5buQecM60eojktcEj+0e60=;
        b=tNALKYFrKH6ah2kRe4O0S2tBKUxk/hXCIJR/7c5hpUufBWnE6JEn/cHM7EmxOm87pT
         jD0nt+48HmRO020SXNxroA4dqeTrA6OXM+c3FJzlPXtTpR8SOn8DbLe2GJGH4ipBomrl
         hM8vTGhMFINdmuykyhR0bYxzsEgc9MfidrJ4itKZymHM6/+HAog/HlKW+3GxSVOzGd0u
         eVMax3uWpfA3vYZojYaSNLtg5GgM4ehfd7eRLRZcAY6jTugLn/2h6Shl3mYnXtwqEsfE
         KD7yOUXBgtiZHoEpQMkz/tIlfAISdkgzpKCCyFUP8Map9pTNw4pDsa4/F+kRw1yEQ9ku
         uQNA==
X-Gm-Message-State: AOAM530I9cioxshtojl+a/5cMBYtZz2nZDyppqd2d9hNXuTMVznY/oAt
        REMoQTNLmKF6FsfevQgedS/KRbYPbAnO0kvc
X-Google-Smtp-Source: ABdhPJxptxSUfyErJee4D2lm4izGOxLSKZo89FzBUpBJpN3YceHXK2cEt4QTcJItk2uZOZPD9OylIw==
X-Received: by 2002:a17:902:ec83:b0:13f:551b:526d with SMTP id x3-20020a170902ec8300b0013f551b526dmr2312374plg.27.1634040448502;
        Tue, 12 Oct 2021 05:07:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y24sm10860631pfo.69.2021.10.12.05.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 05:07:28 -0700 (PDT)
Message-ID: <61657a80.1c69fb81.15b70.eaa8@mx.google.com>
Date:   Tue, 12 Oct 2021 05:07:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-10-11-v5.15-rc1
Subject: renesas/next cros-ec: 7 runs,
 1 regressions (renesas-next-2021-10-11-v5.15-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next cros-ec: 7 runs, 1 regressions (renesas-next-2021-10-11-v5.15-=
rc1)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-10-11-v5.15-rc1/plan/cros-ec/

  Test:     cros-ec
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-10-11-v5.15-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      321d106e70eb261bd55bee08d881cbd5468d9d64

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
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
1          =


  Details:     https://kernelci.org/test/plan/id/6165685b52f140382508fab6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/cros-ec-rk3288-=
veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-10-11-v5.15-rc1/arm/multi_v7_defconfig/gcc-8/lab-collabora/cros-ec-rk3288-=
veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-cros=
-ec/20211008.0/armhf/rootfs.cpio.gz =



  * cros-ec.login: https://kernelci.org/test/case/id/6165685b52f140382508fa=
b7
        failing since 20 days (last pass: renesas-next-2021-08-10-v5.14-rc1=
, first fail: renesas-next-2021-09-20-v5.15-rc1) =

 =20
