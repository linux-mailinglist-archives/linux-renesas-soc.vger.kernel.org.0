Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D8B4432BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Nov 2021 17:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234842AbhKBQeS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Nov 2021 12:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234685AbhKBQG6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 12:06:58 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999ECC061714
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Nov 2021 09:03:43 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id t21so16959112plr.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Nov 2021 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ruGe32uatfdZvr1usgvp0HdqEnRJmJac59f1BAHm2ac=;
        b=3GMA1WsvqyToa8cGkjjbKfrYRzZd2a1W+Br8sF1DrrhLLRlD3x0DaIKDr5Adw5Z6Qt
         f9VoEd6S18wu+pu1jYnEKxom+3BwUgs3Kx8Xhk45ou7r769ApUVilPaq8YIRG7VsKmds
         FmXYdyGjbbbXdn3nt4GMA6fvoBVfllJiW8WI3sIMG6AwNLQGtK/7S5v776H1Jd00Rkk2
         NyVO77JHP0bacIIjvw/Ro7qQL17PpVJcZFO+g8693YsDlkuRMA+dMubjBVhRZ1S+CqTF
         B3yjMsuxNtD5r1GtYs89hBeB8HJ4zFXEchtO+ymt36EcuLfKGqBSzDkwT4093ve+rQ9s
         0PWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ruGe32uatfdZvr1usgvp0HdqEnRJmJac59f1BAHm2ac=;
        b=aT4guUBorDGKp0B8Js5LPBkLqfzL/7aP7FOclNWf5FjbqtZ/CqubY4dO3CN9LJ3es2
         olLAxkrj5YPH4tYuItydjJefn3OM7FSUTOdWoTBPSc8UT2l+DDsUd6qUUAaGHfWwBHlM
         XFLn1UqRTrFMYW+A5hxfgP9f4Y1tkTeOQBRuy3CxK+XIL5VWwYDMAmtzj9eiSxndjdtV
         YtepA7Hw+HcklheIuQ5+zFR7im0egRwrx11MU10qvwmm7YSX6LHcsIgZ75Gd0zauWWh+
         GqVMITIA1K52Mo0M6zWDls83vMnAJnBM0GvOrfJnDgTWwGPco7AIt4MAaB8a5RzcYM+e
         LIBw==
X-Gm-Message-State: AOAM532IUvPWl/vjTK9a0qf5/dXXl1WPQ7soc11wgwYDvl5ICTpAq2/l
        VZq90SxXBjRVFaRI/u1rlPwv57tZ30Cf5CHg
X-Google-Smtp-Source: ABdhPJwXTNezJHlGMg9FtZJTvEx/xGSaxyH6RKBZ9ylvRkf/Uui5VmCNnDfgWWyFRPOSoJMqhwlHkg==
X-Received: by 2002:a17:90a:d192:: with SMTP id fu18mr8022941pjb.177.1635869022509;
        Tue, 02 Nov 2021 09:03:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y16sm19439709pfl.198.2021.11.02.09.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:03:41 -0700 (PDT)
Message-ID: <6181615d.1c69fb81.6523.7e47@mx.google.com>
Date:   Tue, 02 Nov 2021 09:03:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2021-11-02-v5.15
X-Kernelci-Report-Type: test
Subject: renesas/master baseline-nfs: 62 runs,
 1 regressions (renesas-devel-2021-11-02-v5.15)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 62 runs, 1 regressions (renesas-devel-2021-11-=
02-v5.15)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-02-v5.15/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-02-v5.15
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      ee746325c55436cdf9cd64a0a06a190fe72678b5 =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig          | regress=
ions
-----------+------+---------------+----------+--------------------+--------=
----
odroid-xu3 | arm  | lab-collabora | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/61812d1614fdadb3443358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-02-v5.15/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-nfs-od=
roid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-02-v5.15/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-nfs-od=
roid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
1030.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/61812d1714fdadb34=
43358dd
        new failure (last pass: renesas-devel-2021-10-26-v5.15-rc7) =

 =20
