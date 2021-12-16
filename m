Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1958A477CC2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 20:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbhLPTrN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 14:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhLPTrK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 14:47:10 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87743C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 11:47:10 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so373210pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 11:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=J75Xy/o4T7CucAKi/v7uT5XRrc6Ee4x4/A6WeJf2tEM=;
        b=uvC6CCs2YT19BJY5mZfKmK2o5yabzqc3Sx5L3LVfDeHDjMFkJQ16PcmneHC1uOY4Fr
         v5a3dzdrMFqco03SkmaGfO6yU9XUQ/RD8NS2RoAiWYHnnp5xDtJjsomvu+FQuQ+c2VXm
         Y5rPGxfCbNfRV1+coHESqbc9PPEl+g9OUoAk7YFsDBX6KQpWErbuzrZw33XP0+8c4HB1
         76/fqkDgcP/f7JnKFesL1zLcknxLtDzXwm4UhpJXpO9uv/xfXVf8xKtZVMy16VXa8Mde
         /bG+tkCv9QcrxY4efDDniX3/4us5DsjoVgqr3YZ6wAFeuB8LmE6DbltFoGY0bbqTwRPe
         URQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=J75Xy/o4T7CucAKi/v7uT5XRrc6Ee4x4/A6WeJf2tEM=;
        b=LIwJL2P9eC/FCfm7MWn+5CLtrxSh695OLhzfUJ4fJSjP2wCXXMC7T6LVs6raYFLTIp
         02hAEBtH3vPLxyY9afQ+443j6N4Oir2OWS/lGY64R3opTcPbqKIsu8V6DYMJwaerTJdF
         lTg7H/IbbZ7oSoR6VrFZU+0xl4fh55cLCdDJmyRAs+6BiRG2LcqxUoWPN+kYBoq7L5HT
         bgD5GQPOB9NcZZZiwM7A0oEosAxE1lGrV3beNbye2bDndpJS/DkKXa7dYHiJ+/SE99eJ
         PkUAkNEwiISJKUcwbwnzlmPaPtiXSLqdawl5f0+RptE/M7kNinFPZrV0do2FBunorQl+
         iU4A==
X-Gm-Message-State: AOAM533iTL29OBf6JcwnEXbo+CfnMK9rnhn/0lKOHQvC3YxRAuzdFVwh
        1Rk5Fi4glH9QKMAp/Cfi2Ba7LrxGWti/TBNl
X-Google-Smtp-Source: ABdhPJx08Vgx+I6EO/3LcCyH+BDZz7S0fEwA25BOrsVECInPYlfQWjqXtRVe59erQN2x6XB7UeVC8w==
X-Received: by 2002:a17:902:e747:b0:148:a18e:75be with SMTP id p7-20020a170902e74700b00148a18e75bemr12016283plf.73.1639684029916;
        Thu, 16 Dec 2021 11:47:09 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h13sm6559110pfv.37.2021.12.16.11.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 11:47:09 -0800 (PST)
Message-ID: <61bb97bd.1c69fb81.8b456.2457@mx.google.com>
Date:   Thu, 16 Dec 2021 11:47:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-12-16-v5.16-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 491 runs,
 3 regressions (renesas-next-2021-12-16-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 491 runs, 3 regressions (renesas-next-2021-12-16-v5.=
16-rc1)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+amdgpu      | 1          =

rk3288-rock2-square      | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-12-16-v5.16-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-12-16-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a155038f641134b0272d26f75d1ab4a805013e48 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61bb5f74645ed6958239713f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bb5f74645ed69582397=
140
        new failure (last pass: renesas-next-2021-11-26-v5.16-rc1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/61bb60ee517ee0ebe5397149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bb60ee517ee0ebe5397=
14a
        new failure (last pass: renesas-next-2021-11-30-v5.16-rc1-14-g09403=
00f8e1d) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3288-rock2-square      | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bb67ab6ee38f587b397133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-16-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bb67ab6ee38f587b397=
134
        failing since 30 days (last pass: renesas-next-2021-10-18-v5.15-rc1=
, first fail: renesas-next-2021-11-15-v5.16-rc1) =

 =20
