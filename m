Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CEA36BE45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Apr 2021 06:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhD0EXJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Apr 2021 00:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhD0EXI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 00:23:08 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CF0C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 21:22:26 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t2-20020a17090a0242b0290155433387beso696932pje.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 21:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/9+OpfCD5Xt7aT8/QO9IS9scU72B1S90zBclH1J1jdo=;
        b=ArJ+mQiF1rYG7yEtElTEwCY2lJk2t4RcTczDWxv4a2w8EUhfsQvEddK2hW7RHiEhRH
         JDpmBtIWAgu6Da2hl0TwtXnf2KBZyIZ3splplcSZ7XGA59htTHWh7T20+Y8l2GEga/0a
         ijsMyBr07m1+TFXA/X0ZB+8C6rcAnDWquTt1WPqmQneZetYscprO6+B2XuRuN86qhkRJ
         7p50VPd5XDyAWuGJIUFD7e21IPKD6XS8oYZyJECFo5Z0EP1jNt22rpkV226IhESPXUlD
         dStvTYkMAy6KqGdcu0jXUwMP1l87u+K5k1enhDrcEuOCo5Tne+ivtTqpMhWaIAmVjCwj
         kUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/9+OpfCD5Xt7aT8/QO9IS9scU72B1S90zBclH1J1jdo=;
        b=hh1oKpamoMgz9aSVpql1IHYy1KQjWpJYe5tjQNHbLvhcHu0xJ3SogDH70RNYvOPAl5
         Cjht8d+RlMU/ZJ3KcsdmJH9Nc8g3VdRp/wf6qsdMHl6CJW500MoIr8pFauNvXDGXY1PX
         SeBohkrSoCxUaZDYnm+12PfU5SRhgsF3AGu4TGiEfGA4w7gG5/SrnZa1eyjI5n6vn8rZ
         ndSI4s1E3ixoI2+kaCfE31jFzmtAPeZvl18EWoeDRHk1k+MeEJqPkbeLMrw/vAw5X+gL
         DZhP/O37tGrCXx16c0kjmwTRcqZh2eYrpyyR4RQk9cwENRGpuTdJwT/hWqmDCpHvL7K4
         sIXQ==
X-Gm-Message-State: AOAM533lGMFQaG2dhkeO1boPwa2TuE15Vs5t8jCafJfmIT5Zvi1J6/R2
        ybsuh2tQH5+wnLuJ3qxwpDKElFC68UXDopm6
X-Google-Smtp-Source: ABdhPJwEEhu8sM9+KjTJZbWt8hy89usAwvFBU81q9q3IpBWi5un0tbF1dy205Qoatmtge9R8O+oRIw==
X-Received: by 2002:a17:902:7081:b029:ed:5f:20af with SMTP id z1-20020a1709027081b02900ed005f20afmr14749827plk.60.1619497345632;
        Mon, 26 Apr 2021 21:22:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x90sm768004pjj.55.2021.04.26.21.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 21:22:25 -0700 (PDT)
Message-ID: <60879181.1c69fb81.1b66c.39fe@mx.google.com>
Date:   Mon, 26 Apr 2021 21:22:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: next
Subject: renesas/next baseline-nfs: 22 runs,
 2 regressions (renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/next baseline-nfs: 22 runs, 2 regressions (renesas-next-2021-04-02-=
v5.12-rc2-3-g0bacf4d3d276)

Regressions Summary
-------------------

platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-8    | multi_v7_defconfig | 1    =
      =

odroid-xu3 | arm  | lab-collabora   | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesa=
s-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   next
  Describe: renesas-next-2021-04-02-v5.12-rc2-3-g0bacf4d3d276
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      0bacf4d3d27649e90a1223b1bc0a128316138030 =



Test Regressions
---------------- =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
dove-cubox | arm  | lab-pengutronix | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/60875e29d570b339319b77ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/multi_v7_defconfig/gcc-8/lab-pengutron=
ix/baseline-nfs-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/multi_v7_defconfig/gcc-8/lab-pengutron=
ix/baseline-nfs-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0426.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60875e29d570b3393=
19b77bb
        new failure (last pass: renesas-next-2021-04-02-v5.12-rc2) =

 =



platform   | arch | lab             | compiler | defconfig          | regre=
ssions
-----------+------+-----------------+----------+--------------------+------=
------
odroid-xu3 | arm  | lab-collabora   | gcc-8    | multi_v7_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/60876df0b3e12f131a9b7796

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/multi_v7_defconfig/gcc-8/lab-collabora=
/baseline-nfs-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//renesas/next/renesas-next-2021=
-04-02-v5.12-rc2-3-g0bacf4d3d276/arm/multi_v7_defconfig/gcc-8/lab-collabora=
/baseline-nfs-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0426.0/armhf/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/60876df0b3e12f131=
a9b7797
        failing since 41 days (last pass: v5.12-rc2-21-g604bd2d4786e9, firs=
t fail: renesas-next-2021-03-16-v5.12-rc2) =

 =20
