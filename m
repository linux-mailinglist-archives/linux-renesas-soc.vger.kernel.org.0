Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC9C45FC4E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Nov 2021 04:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbhK0DWD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 22:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233492AbhK0DUC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 22:20:02 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E06C09CE44
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 18:08:19 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so8726515pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 18:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HvqXiPW7kcHuWtQsk1jv9zhgJgQI7z/HebMimcDCJV4=;
        b=X3VQqQuy/b4a6fJnpsUOf2TbEgdDwX7O9D8mjD/TERE2GLWlMTriL2OstpH1xNktX2
         noRBims2G8x5MtgCZP7WZpvvH6hoXglqFbokiPST4wSchRnJ3wyCsNqPJtRokyiKohK5
         pyk8fIVskgstlElNmgokGJ2t6YHW22VFKTRjJin4Vk7qIYRNh0p1pSsveK40QoQ0yhzQ
         MClwwTEENTlnOav5Z2RRMfW9R/tEi5XJh//fFyanybsjAhvrpcKUwAEvyhFpSXuvgebI
         tnmZIMY3yYX7fQIwHpzCJoO/3UaRwfUG1uecigubWdutefdEowa5D+1iNtsobPtYRKez
         ku0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HvqXiPW7kcHuWtQsk1jv9zhgJgQI7z/HebMimcDCJV4=;
        b=GR1NB/YhSX5eKSxLJvpaPTbbageHW4phCJPpKJcOFjGp9nUh2IjpJVovDzrSOD5Hnq
         decV4TjlnztxMqO5ILTsVd/jU483rRt+qlMdR3h5F/1+tDPSkKwHz+1z1m7sN0B66MTq
         mdVG7O6zGWfxRnc1QxI9PoNtXpRtR6IcKP4F19V9Ct3Btoj7xPJkqu6owQatK85XXys+
         rcypNprqJKZrNnOVzhydV8/4zTOREssNw9Lu1FbILKhS1Oa+cQljskD+rldRi1Akbe1Y
         71d1ZTvUjrk8bUQldwpx+BLUKHCU6eT7afuFIQE6UA2xhirt0tJpUlRFYTuIwUs9MdBU
         AqkA==
X-Gm-Message-State: AOAM533WBDcjhEx7WaH0YtnprB9wmlDiKtX/0BIzvJqqs4lsveHVLfhv
        iqO2A5w4LCIvqxtIwTC0dxRgwuz07fmbaWJc
X-Google-Smtp-Source: ABdhPJwTytuTNkxFFlVnkmMU6p6BN2VNxFiMOVIvz5Aa8kO59gyzS0Dzu9PYrBBkok7bduFGYnK74A==
X-Received: by 2002:a17:90a:df01:: with SMTP id gp1mr20084980pjb.28.1637978898637;
        Fri, 26 Nov 2021 18:08:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j8sm8302360pfc.8.2021.11.26.18.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 18:08:18 -0800 (PST)
Message-ID: <61a19312.1c69fb81.4ba52.7c72@mx.google.com>
Date:   Fri, 26 Nov 2021 18:08:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-next-2021-11-26-v5.16-rc1
Subject: renesas/next baseline-nfs: 64 runs,
 1 regressions (renesas-next-2021-11-26-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 64 runs, 1 regressions (renesas-next-2021-11-26-=
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
s-next-2021-11-26-v5.16-rc1/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-11-26-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      aeb0ae2627f78fca02f76bf5cb64d0ea94ff31b1 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a15fab18e1c6de7b18f6c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-26-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-11-26-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-nfs-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1118.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61a15fab18e1c6de7=
b18f6c8
        failing since 10 days (last pass: renesas-next-2021-10-18-v5.15-rc1=
, first fail: renesas-next-2021-11-15-v5.16-rc1) =

 =20
