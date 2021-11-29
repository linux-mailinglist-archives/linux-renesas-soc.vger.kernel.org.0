Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4605D4627DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 00:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236161AbhK2XMp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 18:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232730AbhK2XMZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 18:12:25 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D92C0800D8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Nov 2021 14:34:33 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so16730599pju.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Nov 2021 14:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=j0f3efyYCR0Suhks/6DFVO0Gq8KGIqAXzawNjBZbNcc=;
        b=k/XdU9TWMoKfXJqTIzOvESsTk/SeT10Z98dZDUvgBGaD3K/CeRUEcD7PcbvhXW3W3X
         TyxKxy7bbw/VZ9Vxxqv6wtZw3EpefsGQQdiIynj97vNOcL3JetUXgFnX6Q8yBTyxuE8o
         ozLALiHKqSIi22ef14P27/Kev/5DqEu7u5I1vppnkFoHbEE+MsBqQ3ruJJrLdcJZV0Xa
         CYdSI0L8EvoCzhtX4osXosvvHJR2E4IVxL1wPKXsELIyg7cyi6WKrwrXMitEhEj/EX6O
         v3ZFvRG8gOjo504sRVfwnTHJ6ujB1OQwjJ+Fnf/MLbvONZRUg5elsbTgeKiuZpFToQxx
         sStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=j0f3efyYCR0Suhks/6DFVO0Gq8KGIqAXzawNjBZbNcc=;
        b=rwY9u7AdXw3hUsWLQOccfE8OwgVjZvGHhVx7YqURKfyV8Pob9931u+yBfoy31nGhXv
         VOB1lrIrHcThZoNoPK/8A3ET3TWyJ8Lck1zltkUdAKboUZsKpJOPmc9IC/6aDJGrdLHe
         CrtYTIFdmto7P08VAuxrc0yfTSIKNFViYwjtOlNvW0rOMHOtna1Wlsn5+0mJ1CKgjHGy
         mKWapNM+AV2yx3e4sT9v46aDzDyZwZom+NlbP+m4OwjcwAhgW7v8ohiI/j9SKCk5fvT1
         K6QDGu2w0JbmfoDqXd71OvDU/db6CINI0KwUYl8PRdOtXoo+uHNCM06J6gtmt9gwk56M
         yBRw==
X-Gm-Message-State: AOAM530qpBm3nKeEp75vgCHtNm8Q5nxFBj1GRikmJdk5aVGYx3p0xt8I
        3HdThdrEUMbIeIzql0PFISPMFDMCmN3M34iR
X-Google-Smtp-Source: ABdhPJySliMHoYRUFvr0QPsfGV4gZIU4p4g47HywQAhJ827KJcqC8J13Qqg0hhQ+mgfOKLOGqi7HWg==
X-Received: by 2002:a17:90b:1d0e:: with SMTP id on14mr1114892pjb.3.1638225273308;
        Mon, 29 Nov 2021 14:34:33 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f3sm17613630pfg.167.2021.11.29.14.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 14:34:33 -0800 (PST)
Message-ID: <61a55579.1c69fb81.9d939.0fc0@mx.google.com>
Date:   Mon, 29 Nov 2021 14:34:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: renesas-devel-2021-11-29-v5.16-rc3
Subject: renesas/master baseline: 248 runs,
 2 regressions (renesas-devel-2021-11-29-v5.16-rc3)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline: 248 runs, 2 regressions (renesas-devel-2021-11-29-=
v5.16-rc3)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-11-29-v5.16-rc3/plan/baseline/

  Test:     baseline
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-11-29-v5.16-rc3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      6a9c878a0d6706f56258f8a8b084df215b5bda0e =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a5224b68fdb49ac118f6de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-29-v5.16-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-29-v5.16-rc3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/=
lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a5224b68fdb49ac118f=
6df
        failing since 13 days (last pass: renesas-devel-2021-11-02-v5.15, f=
irst fail: renesas-devel-2021-11-15-v5.16-rc1) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a51a6762ffe0ee9218f6d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-29-v5.16-rc3/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collab=
ora/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-11-29-v5.16-rc3/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collab=
ora/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a51a6762ffe0ee9218f=
6d8
        new failure (last pass: renesas-devel-2021-10-26-v5.15-rc7) =

 =20
