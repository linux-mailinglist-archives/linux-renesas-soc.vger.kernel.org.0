Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46C384FCF21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 07:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348413AbiDLFyq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 01:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiDLFyq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 01:54:46 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5452E0A2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 22:52:29 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id ll10so8949046pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 22:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0mm3FbW+Hf7rYmYyY/GIWPeZrYNQq0WyTkW2nLpZdlU=;
        b=4P1h4KsKWkVgWbDAE3JGe0oXUJECCXqejODNy7afOXWBHWav/dL7frzoWIAIpZ/Tzm
         O741u9k5W9Aaza0sDUPd/UUV1eWgtAOgA5wmHs/5wRiJCO6V7AtyIXThAPiIgE52f1gq
         NO79DGA0wcrDF8LZWmhM7UMXv/1tulba2Mr2jultxq4qGBiR+V92mm3VXVM9Pglf/f62
         y/iaacpzljNywbrH+iPgQPlU9r+PShPJRCzEqxsaKNNJlmSQ6eGGSsOMs4T2/Ov1Lqzr
         IwekjoDNRmVtwJ5jYkNZI3KJSAYlxqfgTnBI7BvBGEMckcK+vDXPVXUdiZtV3skVZE1P
         wcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0mm3FbW+Hf7rYmYyY/GIWPeZrYNQq0WyTkW2nLpZdlU=;
        b=1YWirlpXnQXfcRwtjuNQ/sGcNMCoNolnT4Sw4cdKeVbPdpwkxA4fqki1THoMgd148f
         1MquZr2/8WCyVd+BQmIJpUdsHdRnr6D3dJHNcOp8CtRs6EPjaRQbhQUCC/nIXWG6/ASM
         HdVaegAtWixPIwV+55Nm+rLVe+L/HReLTGFSFlS7ZSNth1rm74FU/9sLYjCDhB3iibZo
         6wsYwyRsu4mWgfOCvZU3gfevOsXzfppNR1VLsqNU2y7NdY1dlB5yVSWjEn5gFbvRO2uM
         HkVMPQHFq99qAwE3WssUuN4sZAeGTpzuBgXhPT3cl5nGi6Sp+oxDqJ6F9WYidU2Ho1au
         WXjQ==
X-Gm-Message-State: AOAM531XgesKhdwHZcuAnA38Mw6yti16REchHEFVUKzZJZVUmKM4fjUi
        jE/myN/hLwLWXdUmYpKf7GNus58FEqdx9Z7b
X-Google-Smtp-Source: ABdhPJwLa4a3Zse1tpLnw6L4LMCUf7zxmzaT9PGfW5eOaQCrUTkBWCLpjK2YbQ1Ccu72/7RZ56/zgA==
X-Received: by 2002:a17:902:e889:b0:151:a56d:eb8f with SMTP id w9-20020a170902e88900b00151a56deb8fmr34921222plg.142.1649742748573;
        Mon, 11 Apr 2022 22:52:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y30-20020a056a001c9e00b004fa9246adcbsm35697879pfw.144.2022.04.11.22.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 22:52:28 -0700 (PDT)
Message-ID: <6255139c.1c69fb81.f1d7f.049d@mx.google.com>
Date:   Mon, 11 Apr 2022 22:52:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Kernel: renesas-devel-2022-04-11-v5.18-rc2
X-Kernelci-Report-Type: test
Subject: renesas/master igt-kms-rockchip: 1 runs,
 1 regressions (renesas-devel-2022-04-11-v5.18-rc2)
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

renesas/master igt-kms-rockchip: 1 runs, 1 regressions (renesas-devel-2022-=
04-11-v5.18-rc2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2022-04-11-v5.18-rc2/plan/igt-kms-rockchip/

  Test:     igt-kms-rockchip
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2022-04-11-v5.18-rc2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ea5bee24e7143e88663f6497f6f9defd9ae0f77a

  Test suite revisions:
    drm
      URL:  git://anongit.freedesktop.org/mesa/drm
      SHA:  85393adb12ad6277b21b885f11a3b94ef2d531db
    igt-gpu-tools
      URL:  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
      SHA:  50f7bc405cc1411f57855ed23322c6c4d2510b58 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6254f1c4cc4b69970dae0687

  Results:     74 PASS, 15 FAIL, 148 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
022-04-11-v5.18-rc2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/i=
gt-kms-rockchip-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye-ig=
t/20220401.0/arm64/rootfs.cpio.gz =



  * igt-kms-rockchip.kms_vblank.pipe-B-ts-continuation-dpms-suspend: https:=
//kernelci.org/test/case/id/6254f1c4cc4b69970dae06f7
        new failure (last pass: renesas-devel-2022-04-04-v5.18-rc1)

    2022-04-12T03:27:10.064761  <8>[  102.785916] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpipe-B-ts-continuation-dpms-rpm RESULT=3Dskip>
    2022-04-12T03:27:10.094857  <6>[  102.819133] Console: switching to col=
our dummy device 80x25
    2022-04-12T03:27:10.099626  <14>[  102.825940] [IGT] kms_vblank: execut=
ing
    2022-04-12T03:27:10.115670  IGT-Version: 1.26-g50f7bc4 (aarch64) (Linux=
: 5.18.0-rc2 aarch64)<14>[  102.833057] [IGT] kms_vblank: starting subtest =
pipe-B-ts-continuation-dpms-suspend
    2022-04-12T03:27:10.115969  =

    2022-04-12T03:27:10.121419  Starting subtest: pipe-B-ts-continuation-dp=
ms-suspend
    2022-04-12T03:27:10.372663  (kms_vblank:817) igt_kms-CRITICAL: Test ass=
ertion failure function igt_wait_for_vblank, file ../lib/igt_kms.c:4587:
    2022-04-12T03:27:10.382568  (kms_vblank:817) igt_kms-CRITICAL: Failed a=
ssertion: __igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0
    2022-04-12T03:27:10.389053  (kms_vblank:817) igt_kms-CRITICAL: Last err=
no: 22, Invalid argument
    2022-04-12T03:27:10.390573  Stack trace: =

    ... (76 line(s) more)  =

 =20
