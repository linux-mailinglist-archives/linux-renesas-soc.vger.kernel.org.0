Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0783A480538
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Dec 2021 00:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhL0XFd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Dec 2021 18:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbhL0XFc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Dec 2021 18:05:32 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFB4C06173E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Dec 2021 15:05:32 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id v19so12316973plo.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Dec 2021 15:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OcKGIkCa3NDdRpsZLylaCjA1K8OD40HoMqAMs7R1CQQ=;
        b=qEB+nwRcqYX3Vp1i1APYl3jbTCavJzw45oXLS265RZ9sRtS5oxef9JT7rP5ZEAkPyU
         QI+lCZYN4qxaMY1hjwafgLABqEerio0Bna1XRSFMuiVMFEwjP38QD6wHz9tHuWyQyKa1
         zxnx8DPH+3XQ7ZZeByZ09b57EjJkXTVli5Y7lslOMWrEthBJ88GQWk4JyE/yTo8AF72H
         qBb1UDDoh72UT++gxktSvnmZ3shUEvDjbrjDU//t4ySH8D9M0rj8P0qYy30kn72O4EKd
         463YCu0zm8/MGCP0fPtiT++VhPxy689G07gZCBobp5HJkK1T+pRnwEbZfI5Tua/n861o
         Kpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OcKGIkCa3NDdRpsZLylaCjA1K8OD40HoMqAMs7R1CQQ=;
        b=ZzVeuMJrqim66JOzMfjwGTUeRnZEHNbZ8fwi1F1DwpSNIpZJOstaC2HoMLhmp1KoCF
         n1a2YU19NOUmGx+cCKtKwTQlLPYrs40qtbn7WARblLHHAYzO4e3fl9t+K+Ats86XkQnD
         hgr42kIlkBzdu1aXa1YL2JhkOZmxrPmCXbXGf0zJ/jlsgr2/ZR2PLTuhweNOkZSCH1YY
         4EzezKMNWPESm8Kl+ujvYTADY4v3EP5PiILVCBclsJeeg7Pyu2hXyH0eN86B9cgoajsa
         K3UGYk0mdLUI/J3Gy4U+zToZ10bU6w+inCLwLJi6+iWfTeahNGPMFjHJHt3JeTucoWoU
         suEQ==
X-Gm-Message-State: AOAM531Padm0LqFhMZ8EwVDPeNshG0W+NrdMMUQ+ZJ4lNyjDWZ2wKsFr
        PlHO4Roasmfr2vb/MH6glC9xhsLqSmlnm454
X-Google-Smtp-Source: ABdhPJzDE4YZr/OaYEJVFn8gO6YLmpsMvmaeahdRthWuHbv5bSSUVQ+jajZDbSI7XWBBD+SFkcnXkg==
X-Received: by 2002:a17:902:c94f:b0:148:d23a:c88e with SMTP id i15-20020a170902c94f00b00148d23ac88emr19800460pla.26.1640646331923;
        Mon, 27 Dec 2021 15:05:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e15sm15484217pga.53.2021.12.27.15.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 15:05:31 -0800 (PST)
Message-ID: <61ca46bb.1c69fb81.c5f41.d347@mx.google.com>
Date:   Mon, 27 Dec 2021 15:05:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-12-27-v5.16-rc7
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
Subject: renesas/master baseline: 421 runs,
 1 regressions (renesas-devel-2021-12-27-v5.16-rc7)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 421 runs, 1 regressions (renesas-devel-2021-12-27-=
v5.16-rc7)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-12-27-v5.16-rc7/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-12-27-v5.16-rc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      70c9b40ad59ce28a6c668a48cc12f21ebf81aeba =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ca1769faeb1477ca39712b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-27-v5.16-rc7/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-12-27-v5.16-rc7/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ca1769faeb1477ca397=
12c
        failing since 42 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =20
