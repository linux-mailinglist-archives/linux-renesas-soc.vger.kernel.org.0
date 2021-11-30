Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7B54635E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 14:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241913AbhK3N6i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 08:58:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241852AbhK3N6e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 08:58:34 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790F7C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 05:55:15 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id g19so20687368pfb.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 05:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=X2ZZOUhEUheptejUlx6qMp+pSaX3UG3BdUEhJUJx280=;
        b=XISWAUnmwEEKoZ1kXPrCB00wVv/VLfhLQMrvEKdVYl+bGdD2+y/JhAwNaLYIePqdK0
         +48z+y89w+xTXWe33V/a5vkNwg2AxkT6tWBvVeBnx79FUh9MCRC1hZzt6kM6A89iVX7p
         VuGrSDKNhguFZOV4IbAuoJHMKmap37sqOgpoDoZnZfPXz5knzHsxzTmnBjvQe5AoCpeU
         FgWCf7sG7be8i3SphtCCvT+ysB/mWU7IPK1ilNrlqn4YWunRU85YrU3dLd9pe7a4Suan
         RxUbPsjvvAaNI74rSJ7MFoLcB4GyzYHgWbquEmJSeFF+CNQnj/aB7/089x6nHFNlPUWh
         lvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=X2ZZOUhEUheptejUlx6qMp+pSaX3UG3BdUEhJUJx280=;
        b=OANTIXuKrmCXBp+lOizuIRu0rM6kNu9ZGUMnTjhAITxLYqwRGn+Na4sD7CBIKeQm1P
         VxmZM/arl7yFs3a6ucTugMs/S70T8A/Qtu+8EEduwwYmJbw0qCTLyxH2qdSxAyee31QO
         glmXmI3Ql8mQoKQjhloDMNn9e7siR1IwCDJEBKCjbgAc64d1fvH1UM+tx/dF6faeahzV
         gcLLkswlyx4O4uieA1NwKsEG2ejTyqNfakfFtLHTeC2J3cg4SyI9qxhAxsHAC6cSP00a
         QYj0et9G1VR11c9BPbpwzLzzzkF6jVx3McSdC+Nwl0ZG5i3NDcGjIcbllano9TVV+fKL
         U4xA==
X-Gm-Message-State: AOAM531M3E10+8yIyroHieNpYpzejpB2/hT8B9QteS7ZRoWwyzo2TF/z
        UQ8vFnT1POR70TF5qJehlo5fNvmL004f1Pih
X-Google-Smtp-Source: ABdhPJw9HTkCifC29mCED0Tcy8lvmxQFQmKMmmIvjyqUURHYBLAPs9VkQq9gBNCpNJDZ1RM4k32EXQ==
X-Received: by 2002:a63:f654:: with SMTP id u20mr11394348pgj.233.1638280514735;
        Tue, 30 Nov 2021 05:55:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p15sm2644955pjh.1.2021.11.30.05.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 05:55:14 -0800 (PST)
Message-ID: <61a62d42.1c69fb81.cff04.7114@mx.google.com>
Date:   Tue, 30 Nov 2021 05:55:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-11-30-v5.16-rc1
Subject: renesas/next baseline-nfs: 16 runs,
 1 regressions (renesas-next-2021-11-30-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 16 runs, 1 regressions (renesas-next-2021-11-30-=
v5.16-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-11-30-v5.16-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
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


  Details:     https://kernelci.org/test/plan/id/61a5ff2773cfaccb9418f6d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-30-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/bullseye/20=
211126.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61a5ff2773cfaccb9=
418f6d5
        failing since 14 days (last pass: renesas-next-2021-10-18-v5.15-rc1=
, first fail: renesas-next-2021-11-15-v5.16-rc1) =

 =20
