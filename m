Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B243A382F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 02:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFKADd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 20:03:33 -0400
Received: from mail-pj1-f49.google.com ([209.85.216.49]:51123 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhFKADc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 20:03:32 -0400
Received: by mail-pj1-f49.google.com with SMTP id g4so4669070pjk.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 17:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8q7NMB+HdtXhRH4a6kCJn/C79YlxO96HAv4JpVDw7J4=;
        b=JZCmKPPfLY/wkGObBaEyPK4KVvknM7FbXTOZ5OXrYEVv3JGNQ2eV+ydvi3CmVjz79+
         hi8DHKvoB0Dq5dL535P3tmn+Cj1bYkHJdvq30bWd+frhmjsSuKT1jEmw7c6f5OiVFfbk
         vOCM+o21G8L3AXUYY3RWNbGBEa5hEvXMvycuPSqg5oMFVzZioeNrFDEhPSlceRBrNI3q
         cehnIvEoPJoSCXHRbYNYVW+JyC0rEQb95vTGIVAM+rF+o1Qudeh4S/kwFAZLwL157nVH
         9x3elZNm1KREJesWkF9lruJ5Jh64FhDbSoH/I1pQuQoeZ27+oOdfApG4aDxhdddXBusI
         zz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8q7NMB+HdtXhRH4a6kCJn/C79YlxO96HAv4JpVDw7J4=;
        b=VkbwX/8BvLfPj+dWNd98ZQKWSXdpSMMEuYCSby/mHlRUZB8qfd8E2xMNk+13rbj0y+
         JwsE2NEB0+omXhLTwIiIIZf0LKJcgej/BcwPc4a15oLPyfnL9kxSdfq5tVC6FGOpAFLc
         1c5gkyU72ME1g+CsHlLm5y31WB6T23KFgf5OroZluCPOEP7pwFyU/6sFScgIsxMXFNEl
         CRv3+F7j5Ud42tufWpMpuoA72pTbyCKQ0aBQ0FUeURlTsbgwkuDpErZA77GzJ6DuMOFZ
         xDa+sQPUnNolNpfRx6/xtj9LiM+yPP5jrjsj++Dlf62AaznidqEHkT+OF4OITpJeyGcQ
         1TQw==
X-Gm-Message-State: AOAM530FKlvAhdItBdD7dOtnUodRdqQrOcVCasSkQB3LokFn62Ilqn7i
        I2JVL8V+STqtHsmXFbi/ehIusIgqfwEM9b0k
X-Google-Smtp-Source: ABdhPJz0Z+LRn/DC2YYQHh4lZnLYZneN74DY3hvWJU+LXzJraWdAflMRNInaPUuD/9j8LRhwoexA1Q==
X-Received: by 2002:a17:902:748c:b029:103:267f:a2b3 with SMTP id h12-20020a170902748cb0290103267fa2b3mr1201672pll.23.1623369628285;
        Thu, 10 Jun 2021 17:00:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 190sm3781732pgd.1.2021.06.10.17.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 17:00:28 -0700 (PDT)
Message-ID: <60c2a79c.1c69fb81.1d482.c6ce@mx.google.com>
Date:   Thu, 10 Jun 2021 17:00:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-06-10-v5.13-rc5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master sleep: 8 runs,
 2 regressions (renesas-devel-2021-06-10-v5.13-rc5)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master sleep: 8 runs, 2 regressions (renesas-devel-2021-06-10-v5.13=
-rc5)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-06-10-v5.13-rc5/plan/sleep/

  Test:     sleep
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-06-10-v5.13-rc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6f432b447a92822b48f7e674cec725b179c1fbde =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig          | =
regressions
------------------+------+---------------+----------+--------------------+-=
-----------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | =
2          =


  Details:     https://kernelci.org/test/plan/id/60c29d81659ec355bf0c0df6

  Results:     21 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-06-10-v5.13-rc5/arm/multi_v7_defconfig/gcc-8/lab-collabora/sleep-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0520.0/armhf/rootfs.cpio.gz =



  * sleep.rtcwake-mem-2: https://kernelci.org/test/case/id/60c29d81659ec355=
bf0c0dfb
        failing since 31 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-10 23:14:52.230000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Thu Jun 10 23:14:58 2021
    2021-06-10 23:14:52.240000+00:00  <6>[   81.759956] PM: suspend entry (=
deep)
    2021-06-10 23:14:52.255000+00:00  <6>[   81.773545] Filesystems sync: 0=
.000 seconds
    2021-06-10 23:14:52.275000+00:00  <6>[   81.788416] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-06-10 23:14:52.280000+00:00  <6>[   81.799970] OOM killer disabled.
    2021-06-10 23:14:52.503000+00:00  <6>[   81.805990] Freezing remaining =
freezable tasks ... =

    2021-06-10 23:14:52.526000+00:00  <6>[   82.020423] usb 2-1: new high-s=
peed USB device number 4 using dwc2
    2021-06-10 23:14:57.825000+00:00  <3>[   87.340415] usb 2-1: device des=
criptor read/64, error -110
    2021-06-10 23:15:12.291000+00:00  <4>[  101.813062] =

    2021-06-10 23:15:12.318000+00:00  <3>[  101.831851] Freezing of tasks f=
ailed after 20.007 seconds (0 tasks refusing to freeze, wq_busy=3D1): =

    ... (20 line(s) more)  =


  * sleep.rtcwake-mem-3: https://kernelci.org/test/case/id/60c29d81659ec355=
bf0c0dfc
        failing since 31 days (last pass: v5.12-451-gae657abc971d2, first f=
ail: renesas-devel-2021-05-10-v5.13-rc1)

    2021-06-10 23:15:12.733000+00:00  rtcwake: wakeup from \"mem\" using rt=
c0 at Thu Jun 10 23:15:18 2021
    2021-06-10 23:15:12.744000+00:00  <6>[  102.263873] PM: suspend entry (=
deep)
    2021-06-10 23:15:12.767000+00:00  <6>[  102.285382] Filesystems sync: 0=
.000 seconds
    2021-06-10 23:15:12.794000+00:00  <6>[  102.308411] Freezing user space=
 processes ... (elapsed 0.001 seconds) done.
    2021-06-10 23:15:12.803000+00:00  <6>[  102.322710] OOM killer disabled.
    2021-06-10 23:15:13.342000+00:00  <6>[  102.331104] Freezing remaining =
freezable tasks ... =

    2021-06-10 23:15:13.365000+00:00  <3>[  102.860419] usb 2-1: device des=
criptor read/64, error -110
    2021-06-10 23:15:13.705000+00:00  <6>[  103.220413] usb 2-1: new high-s=
peed USB device number 5 using dwc2
    2021-06-10 23:15:19.024000+00:00  <3>[  108.540418] usb 2-1: device des=
criptor read/64, error -110
    2021-06-10 23:15:32.823000+00:00  <4>[  122.344873]  =

    ... (21 line(s) more)  =

 =20
