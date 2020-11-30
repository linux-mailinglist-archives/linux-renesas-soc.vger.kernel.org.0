Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6286D2C91DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Dec 2020 00:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388914AbgK3W7a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 17:59:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388849AbgK3W72 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 17:59:28 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8ADC08E85F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 14:58:08 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id p6so7358841plr.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 14:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=x4Al5OxbcpB9UzfodIw+lZfnJgs3mhnw4ttWWxJOiyM=;
        b=PdHyFQo4R6SRqrCEEOQJOOM7JGewSfL6G61ltg7IQ8bxlz/N+yOP5xW31HxEpbdFId
         vpZ0I36lAKZ1CPr6P3CGATUcVA6etddgxI8dOLTIzLV9Z8fmq2HhSz9iyInTQfO2sZv8
         Cx5BgcjOBfuuwF97tzZnjoLVNJUTXR+DH9A/a/mZ6ETHbjR0lhqvID94JC+g1baRB5Dn
         lBEYfsdLQNEpyc2ev2X239axFoa29MCv82V9slxza240eV2wK+8g6sVosYqPMbsFgpip
         Dsb017znJeSYF9sGcQtjXY+tyJbucrKsrk9QWnrwwK5ZEaENVKmrj3MR0v9GjwNKoT7J
         TPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=x4Al5OxbcpB9UzfodIw+lZfnJgs3mhnw4ttWWxJOiyM=;
        b=AJp2hLgNCyR58EtAB8+AscTeemNjkWtigJ0bBYQV5RCBF47KWrUmmLRMrKYi0UniUu
         GhBKvnZ+GUtaSn80xmqOOsuTaMocv2NRxwH4vAZ4zBf8us7Acth6Pfdb7pmhgpXg5AFM
         buFL2p/r8QYmRMyPJ72kMtzxck5ZuP2J9qE8zZwkmMyKL45S6D3O0j7t64gD7GtXC3Re
         q6UpAVJ+ZfX3jR8wLOrJM1gA9zZetDgp+aV+BsCHTQJqBKBAPWZG87/WtKPVKgwe5lms
         2br0afV1lw4Y3A1wN+u2igaOLjEV1h/8adw0OCeAPDkpe/9siUUMoK2R2fcfwhoPgMbU
         aO+w==
X-Gm-Message-State: AOAM533t3HIfvDSOrZ+sHB+A1Vx3rzAfMnlvR4Kmrr7ugFjCi1H/NP1s
        9fOTwg3httUI/+ilrZ3ZYPRwtHjTp6CdiA==
X-Google-Smtp-Source: ABdhPJx+SNIPyanmZnhwp52zW7XB9fVPf10y3JviuIAAJJRY8c+8Hafy20rCC8rFo+HGJKAk2U3d3Q==
X-Received: by 2002:a17:902:e901:b029:d8:e727:2595 with SMTP id k1-20020a170902e901b02900d8e7272595mr75720pld.56.1606777087634;
        Mon, 30 Nov 2020 14:58:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s15sm1512pfd.33.2020.11.30.14.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 14:58:06 -0800 (PST)
Message-ID: <5fc578fe.1c69fb81.6c3e0.000d@mx.google.com>
Date:   Mon, 30 Nov 2020 14:58:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: renesas
X-Kernelci-Kernel: renesas-devel-2020-11-30-v5.10-rc6
X-Kernelci-Report-Type: test
Subject: renesas/master ltp-ipc: 19 runs,
 2 regressions (renesas-devel-2020-11-30-v5.10-rc6)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master ltp-ipc: 19 runs, 2 regressions (renesas-devel-2020-11-30-v5=
.10-rc6)

Regressions Summary
-------------------

platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
jetson-tk1 | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG_SMP=
=3Dn | 1          =

jetson-tk1 | arm  | lab-collabora | gcc-8    | tegra_defconfig             =
 | 1          =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2020-11-30-v5.10-rc6/plan/ltp-ipc/

  Test:     ltp-ipc
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2020-11-30-v5.10-rc6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      9b01f862523844081e7700b57633784e4ebbece8

  Test suite revisions:
    ltp-tests
      URL:  https://github.com/linux-test-project/ltp.git
      SHA:  2b0834e1f5d738d24f3e5576edf826e18e983d7a =



Test Regressions
---------------- =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
jetson-tk1 | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG_SMP=
=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc56dc7f2aecfd054c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/ltp-ipc-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabo=
ra/ltp-ipc-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20201130.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/5fc56dc7f2aecfd054c94c=
bb
        new failure (last pass: renesas-devel-2020-11-27-v5.10-rc5) =

 =



platform   | arch | lab           | compiler | defconfig                   =
 | regressions
-----------+------+---------------+----------+-----------------------------=
-+------------
jetson-tk1 | arm  | lab-collabora | gcc-8    | tegra_defconfig             =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/5fc56f8f05e86c806fc94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/tegra_defconfig/gcc-8/lab-collabora/ltp-ipc-jetson-=
tk1.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
020-11-30-v5.10-rc6/arm/tegra_defconfig/gcc-8/lab-collabora/ltp-ipc-jetson-=
tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster-ltp/=
20201130.0/armhf/initrd.cpio.gz =



  * ltp-ipc.login: https://kernelci.org/test/case/id/5fc56f8f05e86c806fc94c=
c9
        new failure (last pass: renesas-devel-2020-11-27-v5.10-rc5) =

 =20
