Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E6D4635E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 14:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241865AbhK3N6j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 08:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241875AbhK3N6f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 08:58:35 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18BDC061746
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 05:55:15 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id cq22-20020a17090af99600b001a9550a17a5so18341578pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 05:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DyKu/iU78inPply2fyApMxttuEup4DNIQ8L7bUlS4as=;
        b=OfExUaoAZgfHtRqGmsujOJNh1iAwpqot9kMFqLQKA4TsCUFbb0qg+046watDqTLcqn
         GaFVVGfyPNlz9xLriZhkkGxbAsVaVv5V5W0KYuXCf58e/rUXUPAEIWt1UHbzP1Ueal00
         +JiixBtZ5k6Ws4Wd5iSw3qQJ2sPg3shpsVV9JzQaHNBIeooSInjEp2BrxSIJup9j0i5H
         TIfRKxnOcfTrpUSZoUHia6U7OOmTJFT2v1In1Iw6iKTEduTAB89j24HJZt0rGT+h36Sk
         7SWzqFEuftHxDEhORHpICrPdcFxzbJ2kojXe7zgsa/BJcjJ+u5B1z/YzimFJhVu7WeoE
         pmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DyKu/iU78inPply2fyApMxttuEup4DNIQ8L7bUlS4as=;
        b=IlzZlCoW05GHGpTZuenJizjL6lml42hlzPgYlKCepRLy+v+DeeIla9wkJIqGeg8RKJ
         GVuxerSiUSw2xxcXqiyPmhZaeM4opvpAnOncFHduBzCjPnvErvqBYn0tnq1VfPhxJqmd
         6Q85teuXSNWePTzRk3vYADJr0OM/0t8uIxEWNFqavYa8Jw3BQTGRb19WHcp4UyQsdLmD
         Go8gcVkpAANhvdoGhJkGz1jEePpobl1Nk5QcwrxBNc5Z8NcmNhLquT+Et/T00IKuiGMz
         7mub4opT2u9PDp3Gy+E2fwjYW1WP6liW/hNnITITMRBbMPjG5wPHQ/RKDDYz1F5shyQn
         stdQ==
X-Gm-Message-State: AOAM5317TmSFFvBiJFvKM2pTm3LqQFXJJqfuFTSIEyuuuvPRCT//f4lK
        NXbV3ifmW+BJNmYsUa7a8HaMzeTrUmSZcmJ4
X-Google-Smtp-Source: ABdhPJx348zkOhuMNeXZwuyUqUmIEMGRDHkmuAEj+VWlyrNDaWP/GEypRkk8S7PsHHRU20KTh90+jQ==
X-Received: by 2002:a17:903:120a:b0:143:e4e9:4cdb with SMTP id l10-20020a170903120a00b00143e4e94cdbmr67829177plh.89.1638280515173;
        Tue, 30 Nov 2021 05:55:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q11sm21266129pfk.192.2021.11.30.05.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 05:55:14 -0800 (PST)
Message-ID: <61a62d42.1c69fb81.64de6.943c@mx.google.com>
Date:   Tue, 30 Nov 2021 05:55:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-11-30-v5.16-rc1
Subject: renesas/next baseline: 132 runs,
 1 regressions (renesas-next-2021-11-30-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 132 runs, 1 regressions (renesas-next-2021-11-30-v5.=
16-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-11-30-v5.16-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-11-30-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      168c85dfca1716272b5f75f1fd0e4361cf869546 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a5feadea92522cd318f6fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a5feadea92522cd318f=
6fd
        failing since 14 days (last pass: renesas-next-2021-10-18-v5.15-rc1=
, first fail: renesas-next-2021-11-15-v5.16-rc1) =

 =20
