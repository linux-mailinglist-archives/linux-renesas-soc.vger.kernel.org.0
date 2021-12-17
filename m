Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A310479429
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 19:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbhLQSj1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 13:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhLQSj1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 13:39:27 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2ADC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 10:39:27 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id u17so2580078plg.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 10:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sQf021koY4kIqJD0fv3RfYWIUsFTnE1tmIcL7sSAolc=;
        b=B3+D8bn1dHiZ+amzIG+yZachh55Qjj99g/fmw0hDufzjabrRsteESVcshs9ShHiELU
         WJPLDAysyRcHRfyiOfiufWRtcLyKBEPRSX0AeClJ4GBxvfKb11qT5DrpACDW5N3tPZI6
         0mGuTNYkHko362JwejjNSSsmgNx96ODFjHn275XJI2oS7WWFdsMLXeYKqd1QjqUcxnk7
         sF+uucDMVkYBxZmpBLeA8eHCTOgZQrJ/6sKWfiJDpsidmIQo9SJcqAjnIiDmLqOqdPW7
         4JXCGYPwZ4hg1nk94fZxHmckvsin+P2+cUyBd2DcN0YkI1y5p6T/ssMljw93Nb0J31z1
         JU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sQf021koY4kIqJD0fv3RfYWIUsFTnE1tmIcL7sSAolc=;
        b=IzZPhrRa4uZ+wB9fOp/KPqH8o1rCvNoEKiuv8KzSbTp6fqH/vnWfpwGfL0URMr+NKJ
         Zx6kvNOPZxsmuXZkGdWKVolpMALZir30XQ2snx1CiimOAeieiP7Ny2s9wPPaNxZN/H+W
         9NSi8UARYu75LAwpHdrZPPBmnnvAFtXq8KPRvT6IADHr6Th2B/9qCqsaVQBhzXD0A0Mf
         9BDW2XwwVEXHdtXkSLniFpB/wBI5swtCJZwobFMeFlwyJlZUEPpnBuJYHLBWTtWIrxAR
         GFTK/PaJjmSNc7jxXatEFmiQufQX6VyogmztCtapYX4/0mx6f2pwSLYfy2JhwE5MtMwY
         O2/A==
X-Gm-Message-State: AOAM532m/Ol2/F3Ps/PvuwvInLeqyVbpXsHKcQJG+3Jf55PpIItAVPqY
        oYvsp3EjgFB+7uM8SDMeUAiWjCo0kZoPPQ9n
X-Google-Smtp-Source: ABdhPJyPLvKeCtSZK+0tLQK63qb6jCR4KXNb3wJXB+LKMyTixlIqq/2FGFUJP4NKhEK1O95Td7ktQg==
X-Received: by 2002:a17:90a:3d42:: with SMTP id o2mr5311272pjf.150.1639766366995;
        Fri, 17 Dec 2021 10:39:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j22sm10847491pfj.130.2021.12.17.10.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 10:39:26 -0800 (PST)
Message-ID: <61bcd95e.1c69fb81.715cd.d414@mx.google.com>
Date:   Fri, 17 Dec 2021 10:39:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-12-17-v5.16-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: next
X-Kernelci-Tree: renesas
Subject: renesas/next baseline: 332 runs,
 2 regressions (renesas-next-2021-12-17-v5.16-rc1)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline: 332 runs, 2 regressions (renesas-next-2021-12-17-v5.=
16-rc1)

Regressions Summary
-------------------

platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
am57xx-beagle-x15   | arm  | lab-baylibre  | gcc-10   | omap2plus_defconfig=
          | 1          =

rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-12-17-v5.16-rc1/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-12-17-v5.16-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      7430027307374f7d8cdec708f61b1bc22d95b913 =



Test Regressions
---------------- =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
am57xx-beagle-x15   | arm  | lab-baylibre  | gcc-10   | omap2plus_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc9fbc539b5ddedf397122

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-17-v5.16-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-am57x=
x-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-17-v5.16-rc1/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-am57x=
x-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bc9fbc539b5ddedf397=
123
        new failure (last pass: renesas-next-2021-12-16-v5.16-rc1) =

 =



platform            | arch | lab           | compiler | defconfig          =
          | regressions
--------------------+------+---------------+----------+--------------------=
----------+------------
rk3288-rock2-square | arm  | lab-collabora | gcc-10   | multi_v7_defc...G_A=
RM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bcabd3a706e1948939711f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-17-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-12-17-v5.16-rc1/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bcabd3a706e19489397=
120
        failing since 31 days (last pass: renesas-next-2021-10-18-v5.15-rc1=
, first fail: renesas-next-2021-11-15-v5.16-rc1) =

 =20
